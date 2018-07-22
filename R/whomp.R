#' Whomp Zengine API lists into tibbles
#'
#' @name whomp
#' @aliases whomp
#' @export whomp
#'
#' @description
#' `whomp()` transforms lists obtained from the Zengine API into analysis-ready tibbles.
#' @usage
#' whomp(.list, ...)
#'
#' @param .list A list of class `zengine` created by `get_zen()`.
#' @param ... A comma separated list of unquoted variable names. [Select helpers](https://dplyr.tidyverse.org/reference/select_helpers.html) from dplyr are supported.
#'
#' @return
#' A tibble.
whomp <- function(.list, ...) {
  vars <- names(.list[[1]])
  quos <- rlang::quos(...)
  quos <- lapply(quos, rlang::env_bury, !!!helpers)
  selected <- tidyselect::vars_select(vars, !!!quos)
  ret <- purrr::map(.list, `[`, selected)
  for (i in seq_along(ret)) {
    ret[[i]] <- purrr::modify_if(ret[[i]], is.list, unlist)
    ret[[i]] <- purrr::modify_if(ret[[i]], is.null, ~NA)
  }
  ret <- tibble::as_tibble(purrr::transpose(ret))
  max_length <<- vector(length = length(ret))
  tmp <- list()
  for (i in seq_along(ret)) {
    max_length[i] <- max(lengths(ret[[i]]))
    if (max_length[i] == 1L) {
      ret[i] <- tidyr::unnest(ret[i])
    }
  }
  ret <- unnest_wide(ret)
  return(ret)
}

helpers <- tidyselect::vars_select_helpers
