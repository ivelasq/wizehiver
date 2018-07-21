#' Unnest all list-cols in a data frame into columns
#'
#' @name unnest_wide
#' @aliases unnest_wide
#' @export unnest_wide
#'
#' @description
#' `unnest_wide()` unnests all list-cols in a data frame into atomic columns for each unique element in a list-col. Unnested columns are appended to the end of the dataset, and are distinguished by concatenating an underscore and a sequential number to the original list-col name.
#' @usage
#' unnest_wide(.data)
#'
#' @param .data A data frame.
#'
#' @return
#' A tibble.
unnest_wide <- function(.data) {
  stopifnot(is.data.frame(.data))
  .data <- tibble::rowid_to_column(.data)
  lst_index <- purrr::map_int(.data, is.list)
  lst_cols <- names(lst_index)[lst_index == 1L]
  lst_vals <- paste0(lst_cols, ".")
  unique_vals <- list()
  df_lst <- list()
  for (i in seq_along(lst_cols)) {
    unique_vals[[i]] <- stats::na.omit(unique(unlist(df[[lst_cols[i]]])))
    df_lst[[i]] <- dplyr::select(.data, rowid, lst_cols[i])
    df_lst[[i]] <- dplyr::mutate(df_lst[[i]], !! lst_vals[i] := df[[lst_cols[i]]])
    df_lst[[i]] <- tidyr::unnest(df_lst[[i]])
    df_lst[[i]] <- dplyr::mutate(df_lst[[i]], !! lst_cols[i] := match(df_lst[[i]][[lst_cols[i]]], unique_vals[[i]]))
    df_lst[[i]] <- tidyr::spread(df_lst[[i]], !! lst_cols[i], !! lst_vals[i], convert = TRUE, sep = "_")
    df_lst[[i]] <- dplyr::select_if(df_lst[[i]], !grepl(paste0(lst_cols[i], "_NA"), colnames(df_lst[[i]])))
    .data <- dplyr::select(.data, -(!! lst_cols[i]))
    .data <- dplyr::left_join(.data, df_lst[[i]], by = "rowid")
  }
  .data <- dplyr::select(.data, -rowid)
  return(.data)
}