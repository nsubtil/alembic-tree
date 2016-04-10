set(openexr_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/openexr)

# install ilmbase from openexr
ExternalProject_Add(ilmbase
                    DOWNLOAD_COMMAND ""
                    SOURCE_DIR ${openexr_SOURCE}
                    INSTALL_DIR ${alembic_tree_install_directory}
                    CONFIGURE_COMMAND
                        env CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER} ${CMAKE_COMMAND}
                        -DCMAKE_INSTALL_PREFIX=${alembic_tree_install_directory}
                        -DBUILD_SHARED_LIBS=OFF
                        ${openexr_SOURCE}/IlmBase
                    LOG_DOWNLOAD 1
                    LOG_INSTALL 1)

# ExternalProject_Add(pyilmbase
#                     DEPENDS ilmbase
#                     DOWNLOAD_COMMAND ""
#                     SOURCE_DIR ${openexr_SOURCE}
#                     INSTALL_DIR ${ilmbase_INSTALL}
#                     CONFIGURE_COMMAND
#                         env ILMBASE_PACKAGE_PREFIX=${ilmbase_INSTALL}
#                         ${CMAKE_COMMAND}
#                         -DCMAKE_INSTALL_PREFIX=${ilmbase_INSTALL}
#                         ${openexr_SOURCE}/PyIlmBase
#                     LOG_DOWNLOAD 1
#                     LOG_INSTALL 1)
