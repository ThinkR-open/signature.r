#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  global <- reactiveValues()

  mod_navbar_server("navbar")
  mod_form_server("form", global = global)
  mod_preview_server("preview", global = global)
}
