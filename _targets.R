library(targets)
library(targets)
library(tarchetypes)

tar_option_set()

list(
  # Packages-----
  tar_target(envImport
             , 1
             )
  , tar_target(envClean
               , 1
               )
  , tar_target(envSDM
               , 1
               )
  , tar_target(envRange
               , 1
               )
  # Workflows------
  , tar_target(envOcc
               , envImport
               )
  , tar_target(envRas
               , 1
               )
  , tar_target(envCleaned
               , envOcc + envClean + envRange + envRas
               )
  , tar_target(envRegCont
               , envCleaned + envRange
               )
  , tar_target(envSDMs
               , envCleaned + envSDM + envRas
               )
  , tar_target(envPIA
               , envSDMs + envRegCont
               )
  )
