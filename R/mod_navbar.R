#' navbar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom bslib input_dark_mode
#' @importFrom pw with_test_id
mod_navbar_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$nav(
      class = "navbar navbar-light bg-transparent",
      div(
        class = "container-fluid",
        a(
          class = "navbar-brand",
          href = "/",
          "Signature.r"
        ) |>
          shiny::tagAppendAttributes(
            `data-testid` = "appName"
          ),
        input_dark_mode()
      )
    )
  )
}

#' navbar Server Functions
#'
#' @noRd
mod_navbar_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
  })
}

## To be copied in the UI
# mod_navbar_ui("navbar")

## To be copied in the server
# mod_navbar_server("navbar)
