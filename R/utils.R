#' @keywords internal
#' @noRd
#' @importFrom dplyr mutate
#' @importFrom tibble as_tibble

token_env <- new.env(parent = emptyenv())

get_token <- function() {
  get0("token", envir = token_env)
}

set_token <- function(value) {
  token_env$token <- value
}

reset_token <- function() {
  suppressWarnings(rm("token", envir = token_env))
}
