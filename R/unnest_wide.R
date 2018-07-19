#' Unnest all list-cols in a data frame into columns
#'
#' @name unnest_wide
#' @aliases unnest_wide
#' @export unnest_wide
#'
#' @description
#' `unnest_wide()` unnests all list-cols in a data frame into atomic columns for each unique element in a list-col. Unnested columns are appended to the end of the dataset, and are distinguished by concatenating an underscore and a sequential number to the original list-col name.
#' @usage
#' unnest_wide(df)
#'
#' @param df A data frame.
#'
#' @return
#' A tibble.
unnest_wide <- function(df) {
  stopifnot(is.data.frame(df))
  df <- tibble::rowid_to_column(df)
  lst_index <- purrr::map_int(df, is.list)
  lst_cols <- names(lst_index)[lst_index == 1L]
  lst_vals <- paste0(lst_cols, ".")
  unique_vals <- list()
  df_lst <- list()
  for (i in seq_along(lst_cols)) {
    unique_vals[[i]] <- stats::na.omit(unique(unlist(df[[lst_cols[i]]])))
    df_lst[[i]] <- dplyr::select(df, rowid, lst_cols[i])
    df_lst[[i]] <- dplyr::mutate(df_lst[[i]], !! lst_vals[i] := df[[lst_cols[i]]])
    df_lst[[i]] <- tidyr::unnest(df_lst[[i]])
    df_lst[[i]] <- dplyr::mutate(df_lst[[i]], !! lst_cols[i] := match(df_lst[[i]][[lst_cols[i]]], unique_vals[[i]]))
    df_lst[[i]] <- tidyr::spread(df_lst[[i]], !! lst_cols[i], !! lst_vals[i], convert = TRUE, sep = "_")
    df_lst[[i]] <- dplyr::select_if(df_lst[[i]], !grepl(paste0(lst_cols[i], "_NA"), colnames(df_lst[[i]])))
    df <- dplyr::select(df, -(!! lst_cols[i]))
    df <- dplyr::left_join(df, df_lst[[i]], by = "rowid")
  }
  df <- dplyr::select(df, -rowid)
  return(df)
}
