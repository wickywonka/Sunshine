# windows specific target definitions
set_target_properties(sunshine PROPERTIES
        CXX_STANDARD 20
        LINK_SEARCH_START_STATIC 1)
set(CMAKE_FIND_LIBRARY_SUFFIXES ".dll")
find_library(ZLIB ZLIB1)
list(APPEND SUNSHINE_EXTERNAL_LIBRARIES
        Windowsapp.lib
        Wtsapi32.lib)

#WebUI build
add_custom_target(web-ui ALL
        WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
        COMMENT "Installing NPM Dependencies and Building the Web UI"
        COMMAND cmd /C "npm install && set \"SUNSHINE_SOURCE_ASSETS_DIR=${NPM_SOURCE_ASSETS_DIR}\" && set \"SUNSHINE_ASSETS_DIR=${NPM_ASSETS_DIR}\" && npm run build")   # cmake-lint: disable=C0301
#GUI build
add_custom_target(sunshine-control-panel ALL
        WORKING_DIRECTORY "${SUNSHINE_SOURCE_ASSETS_DIR}/common/sunshine-control-panel"
        COMMENT "Installing NPM Dependencies and Building the gui"
        COMMAND bash -c \"npm install && npm run build:win\") # cmake-lint: disable=C0301