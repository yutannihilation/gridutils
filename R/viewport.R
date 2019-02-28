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
gu_print_vp <- function(vp = grid::current.vpTree()) {
  cat(as_tree(vp), sep = "\n")
}

#' @export
as_tree <- function(x, ...) UseMethod("as_tree")

#' @export
as_tree.viewport <- function(x, ...) x$name

#' @export
as_tree.vpTree <- function(x, ...) {
  sub_trees <- as_tree(x$children)

  sub_trees <- purrr::map2(sub_trees, seq_along(sub_trees) == length(sub_trees),
    function(x, is_last) {
      left <- rlang::rep_along(x, ifelse(is_last, " ", "\u2502"))
      left[1] <- ifelse(is_last, "\u2514", "\u251C")
      paste0(left, x)
    }
  )

  c(
    x$parent$name,
    purrr::flatten_chr(sub_trees)
  )
}

#' @export
as_tree.vpList <- function(x, ...) {
  purrr::map(x, as_tree)
}

as_tree.list <- as_tree.vpList
