
set_property(GLOBAL PROPERTY CTEST_TARGETS_ADDED 1) # Do not add CTest default targets
include(CTest)
include(SlicerBlockUploadExtensionPrerequisites)

slicer_setting_variable_message("EXTENSION_SOURCE_DIR" SKIP_TRUNCATE)
slicer_setting_variable_message("EXTENSION_SUPERBUILD_BINARY_DIR" SKIP_TRUNCATE)
slicer_setting_variable_message("EXTENSION_BUILD_SUBDIRECTORY" SKIP_TRUNCATE)

include(SlicerBlockModuleToExtensionMetadata)
include(SlicerBlockAdditionalLauncherSettings)

set(CTEST_MODEL "Experimental")
include(SlicerBlockUploadExtension)
add_custom_target(Experimental
  COMMAND ${EXTENSION_TEST_COMMAND}
  COMMENT "Build and test extension"
  )
add_custom_target(ExperimentalUpload
  COMMAND ${EXTENSION_UPLOAD_COMMAND}
  COMMENT "Build, test, package and upload extension"
  )

set(CTEST_MODEL "Nightly")
include(SlicerBlockUploadExtension)
add_custom_target(Nightly
  COMMAND ${EXTENSION_TEST_COMMAND}
  COMMENT "Build and test extension"
  )
add_custom_target(NightlyUpload
  COMMAND ${EXTENSION_UPLOAD_COMMAND}
  COMMENT "Build, test, package and upload extension"
  )
