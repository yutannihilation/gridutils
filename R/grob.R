#' List gPath
#'
#' @export
gu_list_gpath <- function(vp = gu_get_vp(), ...) {
  grid.ls(x = vp, ...)$name
}
