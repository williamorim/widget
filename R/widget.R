#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
widget <- function(x, y, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    x = x,
    y = y
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'widget',
    x,
    width = width,
    height = height,
    package = 'widget',
    elementId = elementId
  )
}

#' Shiny bindings for widget
#'
#' Output and render functions for using widget within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a widget
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name widget-shiny
#'
#' @export
widgetOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'widget', width, height, package = 'widget')
}

#' @rdname widget-shiny
#' @export
renderWidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, widgetOutput, env, quoted = TRUE)
}
