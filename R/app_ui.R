#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fixedPage(
      theme = signature_theme(),
      mod_navbar_ui("navbar"),
      div(
        class = "container",
        div(
          class = "row",
          mod_form_ui("form"),
          mod_preview_ui("preview")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(ext = "png"),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "signature.r"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

#' signature_theme
#'
#' @importFrom bslib bs_theme bs_add_rules
#' @importFrom sass sass_file
#'
#' @noRd
signature_theme <- function() {
  bs_theme(
    version = 5,
    primary = "#b8b8dc",
    secondary = "#f15522",
    info = "#494955"
  ) |>
    bs_add_rules(
      sass_file(app_sys("app", "www", "signature.scss"))
    )
}
