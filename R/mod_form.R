#' form UI Function
#'
#' @description A shiny Module.
#'
#' @importFrom bslib accordion accordion_panel
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_form_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      class = "col-lg-5 col-md-12 p-3",
      div(
        class = "row",
        accordion(
          id = "form-accordion",
          multiple = FALSE,
          accordion_panel(
            title = "Personal information",
            tagList(
              textInput(
                inputId = ns("firstname"),
                label = "First name",
                placeholder = "John",
                width = "100%"
              ) |>
                with_test_id(test_id = "firstname"),
              textInput(
                inputId = ns("lastname"),
                label = "Last name",
                placeholder = "Doe",
                width = "100%"
              ) |>
                with_test_id(test_id = "lastname")
            )
          ),
          accordion_panel(
            title = "Business information",
            tagList(
              textInput(
                inputId = ns("job_title"),
                label = "Job title",
                placeholder = "Data Scientist",
                width = "100%"
              ),
              textInput(
                inputId = ns("email"),
                label = "Email",
                placeholder = "you@thinkr.fr",
                width = "100%"
              ),
              textInput(
                inputId = ns("phone"),
                label = "Phone number",
                value = NULL,
                placeholder = "+33(0) xx xx xx xx",
                width = "100%"
              )
            )
          ),
          accordion_panel(
            title = "Details about this application",
            tagList(
              p(
                "This application is a demonstration of the use of the shiny library with R."
              ),
              p(
                "You can enter your personal and professional information in the form on the left. Then you can preview the rendering of your signature on the right."
              ),
              p("Then you can copy the signature to your clipboard."),
              p("You love this application and you would like to reuse it?"),
              p("Discover how to do it on the GitHub repository."),
              a(
                "Explore the code of this application on GitHub.",
                href = "https://github.com/ThinkR-open/signature.r/",
                target = "_blank",
              )
            )
          )
        )
      )
    )
  )
}

#' form Server Functions
#'
#' @importFrom whereami whereami cat_where
#'
#' @noRd
mod_form_server <- function(id, global) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observeEvent(
      c(
        input$firstname,
        input$lastname,
        input$job_title,
        input$email,
        input$phone
      ),
      ignoreInit = FALSE,
      {
        cat_where(whereami())

        lapply(
          c("firstname", "lastname", "job_title", "email", "phone"),
          function(x) {
            global[[x]] <- if (is.null(input[[x]]) | input[[x]] == "") {
              sprintf("{{%s}}", x)
            } else {
              input[[x]]
            }
          }
        )

        global$phone_url <- sprintf("tel:%s", global$phone)
        global$email_url <- sprintf("mailto:%s", global$email)
      }
    )
  })
}

## To be copied in the UI
# mod_form_ui("form")

## To be copied in the server
# mod_form_server("form")
