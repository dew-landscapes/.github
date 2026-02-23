library(targets)
library(targets)
library(tarchetypes)

tar_option_set()

list(
  # Packages-----
  tar_target(envImport
             , 1
             , description = "package"
             )
  , tar_target(envClean
               , 1
               , description = "package"
               )
  , tar_target(envSDM
               , 1
               , description = "package"
               )
  , tar_target(envRange
               , 1
               , description = "package"
               )
  # Workflows------
  , tar_target(envOcc
               , envImport
               , description = "workflow"
               )
  , tar_target(envRas
               , 1
               , description = "workflow"
               )
  , tar_target(envCleaned
               , envOcc + envClean + envRange + envRas
               , description = "workflow"
               )
  , tar_target(envRegCont
               , envCleaned + envRange
               , description = "workflow"
               )
  , tar_target(envSDMs
               , envCleaned + envSDM + envRas
               , description = "workflow"
               )
  , tar_target(envPIA
               , envSDMs + envRegCont
               , description = "workflow"
               )
  )
