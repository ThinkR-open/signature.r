
<!-- README.md is generated from README.Rmd. Please edit that file -->

# signature.r <img src="man/figures/hex.png" align="right" alt="Signature.r logo" style="height: 140px;"></a>

![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
[![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white)](https://www.figma.com/proto/u95KvEqgWLB8arxt7saZcJ/%7Bsignature%7D?node-id=705-5&t=xevegkmzONTrRyR3-8&scaling=contain&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=705%3A5&hide-ui=1)

<!-- badges: start -->

[![R-CMD-check](https://github.com/ThinkR-open/signature.r/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ThinkR-open/signature.r/actions/workflows/R-CMD-check.yaml)
[![Playwright
Tests](https://github.com/ThinkR-open/signature.r/actions/workflows/playwright.yaml/badge.svg)](https://github.com/ThinkR-open/signature.r/actions/workflows/playwright.yaml)
<!-- badges: end -->

This is the R version of the
[`{signature.py}`](https://github.com/ThinkR-open/signature.py) and
[`{signature.js}`](https://github.com/ThinkR-open/signature.js)
application.

This application provides a graphical interface to streamline the
creation and maintenance of your email signature.

No more wrestling with images or getting tangled up in HTML code; the
application offers a set of fields to update your signature easily.

Simply enter your name, first name, email, and other necessary
information to populate your signature.

Additionally, the application allows you to copy the HTML code with a
single button click, making it easy to paste into your email client
settings.

Lastly, updating the banner (the image at the bottom of the signature)
and the associated link for redirection is straightforward. You no
longer need to request everyone to update their signature individually
for these changes.

## Demo

🕹️ Try the app at:
[signature-r-psi.vercel.app/](https://signature-r-psi.vercel.app/)

## Try locally

1.  Install the package from GitHub:

``` r
remotes::install_github("ThinkR-open/signature.r")
```

2.  Run the app:

``` r
signature.r::run_app()
```

or clone the repository and run the app:

1.  Clone the repository

2.  Run the app:

``` r
renv::restore()
pkgload::load_all()
golem::run_dev()
```

## Modify the theme

This app uses Bootstrap `5.3.3`.

To modify the theme, edit the `inst/app/signature.scss` file.

Every time you run `golem::run_dev()`, the `signature.scss` file is
compiled into `inst/app/www/signature.css`.

## How the redirection banner works?

The redirection banner is a JavaScript function that redirects the user
to the specified URL.

To modify the redirection URL, creeate a `index.html` file at the root
of the project.

See : [signature](https://github.com/ThinkR-open/signature/)

## Deployment

This application is deployed on Connect.

But also serverless directly with ShinyLive :

``` r
shinylive::export(".", "site")
httpuv::runStaticServer("site/")
```

## You love this project?

You love this project and would like to reuse it for your own needs?

You can fork this repository and adapt it to your needs.

What you can do:

-   fork this repository

-   adapt the signature template to your needs.

-   modify the app to add or remove fields from the signature form to
    edit the signature.

-   modify the redirection banner to redirect to your own URL.

-   modify the theme by editing the `inst/app/signature.scss` file.

-   Remove google analytics from tag script in the `app.py` file.

-   deploy the app on your own server.

-   share the app with your colleagues.

-   enjoy the app!

## Code of Conduct

Please note that the signature.py project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
