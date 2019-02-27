#' Highlight the current viewport
#'
#' Unlike [grid::showViewport()], `gu_show_vp()` soon remove the highlight after
#' a second
#'
#' @name you-are-here
#' @export
gu_you_are_here <- function() {
  x <- grid::grid.rect(
    gp = grid::gpar(col = rgb(1, 0, 0, .7),
                    fill = rgb(1, 0, 0, .3))
  )

  Sys.sleep(.5)
  grid::grid.remove(x$name)
}


#' Get the current viewport
#'
#' @export
gu_get_vp <- function(vp = NULL) {
  if (is.null(vp)) {
    return(grid::current.viewport())
  }

  stop("not implemented")
}

#' @export
str.vpTree <- function(x) {

}

cat_vptree <- function(x, indent = 0) {

}
