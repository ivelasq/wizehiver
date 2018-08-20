#' @keywords internal
#' @noRd
#' @importFrom rlang :=

globalVariables("rowid")

token_env <- new.env(parent = emptyenv())

get_local_token <- function() {
  get0("token", envir = token_env)
}

set_local_token <- function(value) {
  token_env$token <- value
}

reset_local_token <- function() {
  suppressWarnings(rm("token", envir = token_env))
}

get_local_key <- function() {
  get0("key", envir = token_env)
}

set_local_key <- function(value) {
  token_env$key <- value
}

reset_local_key <- function() {
  suppressWarnings(rm("key", envir = token_env))
}

color_blue <- function(x) {
  crayon::blue(x)
}

color_grey <- function(x) {
  crayon::make_style("darkgrey")(x)
}

color_red <- function(x) {
  crayon::red(x)
}
