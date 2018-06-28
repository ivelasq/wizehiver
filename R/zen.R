#' Get Zengine API data
#'
#' @name get_zen
#' @aliases get_zen
#' @export get_zen
#'
#' @description
#' `get_zen()` gets data from the Zengine API.
#' @usage
#' get_zen(resource, id = NULL, record = NULL, limit = NULL)
#'
#' @param resource A character vector specifying a Zengine API resource. Common choices include `"forms"` and `"workspaces"`. A full list of resources is available [here](https://zenginehq.github.io/developers/rest-api/resources/). Defaults to `"forms"`.
#' @param id A character vector specifying a resource ID. Defaults to `NULL`.
#' @param record A character or numeric vector specifying a record linked to a resource ID. The `id` argument must be provided if `record` is used. Defaults to `NULL`.
#' @param limit An integer vector of the number of results returned on a `get_zen()` query. Defaults to `NULL`.
#'
#' @return
#' A list of class `zengine`.
get_zen <- function(resource, id = NULL, record = NULL, limit = NULL) {
  path <- paste0("/v1/", resource)
  if (is.null(id) && !is.null(record)) {
    stop("Zengine API requires a non-null id when calling record")
  }
  if (!is.null(id)) {
    path <- paste0(path, "/", id, "records")
    if (!is.null(record)) {
      path <- paste0(path, "/", record)
    }
  }
  path <- paste0(path, ".json?access_token=", wizehiver::get_token())
  if (!is.null(limit)) {
    path <- paste0(path, "&limit=", limit)
  }
  url <- httr::modify_url("https://api.zenginehq.com/", path = path)
  resp <- httr::GET(url)
  if (httr::http_type(resp) != "application/json") {
    stop("Zengine API did not return a json object", call. = FALSE)
  }

  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

  if (httr::status_code(resp) != 200) {
    stop(
      sprintf(
        "Zengine API request failed [%s]\n%s\n<%s>",
        httr::status_code(resp),
        parsed$message,
        parsed$documentation_url
      ),
      call. = FALSE
    )
  }

  structure(list(
    content = parsed,
    path = path,
    response = resp
  ),
  class = "zengine")
}
