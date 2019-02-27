#' Highlight the current viewport
#'
#' @export
gu_you_are_here <- function() {
  x <- grid.rect(gp = gpar(col = rgb(1, 0, 0, .7), fill = rgb(1, 0, 0, .3)))
  Sys.sleep(.5)
  grid.remove(x$name)
}
