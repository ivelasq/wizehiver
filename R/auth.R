#' Manage Zengine API key and PAT
#'
#' @name auth
#' @aliases get_token set_token get_key set_key
#' @export get_token set_token get_key set_key
#'
#' @description
#' These functions manage your Zengine API key and personal access token (PAT) in \code{.Renviron}.
#' @usage
#' get_key()
#' set_key()
#' get_token()
#' set_token()
#'
#' @return
#' `get_key()` and `get_token()` return a character vector with the Zengine API key and PAT stored in `.Renviron`, respectively. If these values are not stored in `.Renviron`, the functions return `NULL`.
#'
#' `set_key()` and `set_token()` invisibly return `NULL`.
get_token <- function() {
  if (is.null(get_local_token())) {
    set_local_token(Sys.getenv("ZENGINE_PAT"))
  }
  if (identical(get_local_token(), "")) {
    message("ZENGINE_PAT has not been set")
    answer <- utils::askYesNo("Do you want to set ZENGINE_PAT?")
    if (isTRUE(answer)) {
      set_token()
    }
    else {
      invisible(NULL)
    }
  }
  else {
    cli::cat_bullet(paste0("ZENGINE_PAT was found in ", color_blue("'.Renviron'"), " and was invisibly returned"), bullet = "tick", bullet_col = "green")
    invisible(get_local_token())
  }
}

set_token <- function() {
  cli::cat_bullet(paste0("Calling ", color_grey("`usethis::edit_r_environ()`"), " to open ", color_blue("'.Renviron'")), bullet = "tick", bullet_col = "green")
  usethis::edit_r_environ()
  cli::cat_bullet(paste0(color_blue("'.Renviron'"), " must end with a newline"), bullet_col = "red")
  cli::cat_bullet("Store your Zengine personal access token (PAT), see example below:", bullet_col = "red")
  message("ZENGINE_PAT=ABC123XYZ")
  invisible(NULL)
}

get_key <- function() {
  if (is.null(get_local_key())) {
    set_local_key(Sys.getenv("ZENGINE_KEY"))
  }
  if (identical(get_local_key(), "")) {
    message("ZENGINE_KEY has not been set")
    answer <- utils::askYesNo("Do you want to set ZENGINE_KEY?")
    if (isTRUE(answer)) {
      set_key()
    }
    else {
      invisible(NULL)
    }
  }
  else {
    cli::cat_bullet(paste0("ZENGINE_KEY was found in ", color_blue("'.Renviron'"), " and was invisibly returned"), bullet = "tick", bullet_col = "green")
    invisible(get_local_key())
  }
}

set_key <- function() {
  cli::cat_bullet(paste0("Calling ", color_grey("`usethis::edit_r_environ()`"), " to open ", color_blue("'.Renviron'")), bullet = "tick", bullet_col = "green")
  usethis::edit_r_environ()
  cli::cat_bullet(paste0(color_blue("'.Renviron'"), " must end with a newline"), bullet_col = "red")
  cli::cat_bullet("Store your Zengine API key, see example below:", bullet_col = "red")
  message("ZENGINE_KEY=ABC123XYZ")
  invisible(NULL)
}
