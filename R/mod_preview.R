#' preview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_preview_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "col-lg-7 col-md-12 p-3",
      div(
        class = "card",
        div(
          class = "card-header bg-ligth",
          div(
            class = "buttons",
            div(class = "close"),
            div(class = "minimize"),
            div(class = "zoom"),
          )
        ),
        div(
          class = "card-body row gy-4",
          div(
            id = "intro",
            p("Hello the team!"),
            p("You can edit your signature from this interface."),
            p("Then you'll just have to insert it as your signature."),
            HTML("Thank you &#128513")
          ),
          div(
            id = "signature",
            uiOutput(ns("preview"))
          )
        )
      )
    )
  )
}

#' preview Server Functions
#'
#' @noRd
mod_preview_server <- function(id, global) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$preview <- renderUI({
      htmlTemplate(
        filename = app_sys(
          "app", "www", "template", "template.html"
        ),
        firstname = global$firstname,
        lastname = global$lastname,
        job_title = global$job_title,
        email = global$email,
        email_url = global$email_url,
        phone = global$phone,
        phone_url = global$phone_url
      )
    })
  })
}

## To be copied in the UI
# mod_preview_ui("preview")

## To be copied in the server
# mod_preview_server("preview")
