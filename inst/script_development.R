
#usethis::use_build_ignore("inst/mystuff")
usethis::use_build_ignore("inst/script_development.R")
usethis::use_build_ignore(".travis.yml")
#usethis::use_git_ignore("inst/mystuff")
#usethis::use_cran_comments()

devtools::document()
devtools::load_all()
devtools::install(quick=TRUE)
#devtools::install()

#devtools::check()

# devtools::check_win_devel()
# rhub::check_for_cran()
# devtools::build_manual()


# git remote add origin https://github.com/fndemarqui/bellreg.git
