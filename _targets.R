library(targets)
library(targets)
library(tarchetypes)

tar_option_set()

list(
  # Support -----
  tar_target(envFunc
             , 1
             , description = "package"
             )
  , tar_target(envTargets
               , 1
               , description = "package"
               )
  # Packages-----
  , tar_target(envImport
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
  , tar_target(envDistribution
               , 1
               , description = "package"
               )
  , tar_target(envCluster
               , 1
               , description = "package"
               )
  , tar_target(envModel
               , 1
               , description = "package"
               )
  , tar_target(envEcosystems
               , 1
               , description = "package"
               )
  # projects------
  ## assemble --------
  , tar_target(envOcc
               , envImport
               , description = "project"
               )
  , tar_target(envRas
               , 1
               , description = "project"
               )
  , tar_target(envRange
               , 1
               , description = "project"
               )
  ## clean --------
  , tar_target(envCleaned
               , envOcc + envClean + envRange + envRas + envDistribution
               , description = "project"
               )
  , tar_target(envStatus
               , envCleaned
               , description = "project"
               )
  , tar_target(envRegCont
               , envCleaned + envRange
               , description = "project"
               )
  ## main projects --------
  , tar_target(envSDMs
               , envCleaned + envSDM + envRas + envRange
               , description = "project"
               )
  , tar_target(envPIA
               , envCleaned + envSDMs + envRegCont + envStatus
               , description = "project"
               )
  , tar_target(envEco
               , envCleaned + envCluster + envModel + envEcosystems + envRas
               )
  )
