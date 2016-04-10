project(alembic-tree)
cmake_minimum_required(VERSION 2.8)

include(ExternalProject)

include("ilmbase.cmake")

ExternalProject_Add(alembic
                    DEPENDS ilmbase
                    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/alembic
                    CMAKE_ARGS
                        -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/install
                        -DCMAKE_CXXFLAGS=-Wno-deprecated-declarations
                        -DILMBASE_ROOT=${ilmbase_INSTALL}
                        -DUSE_OPENGL=ON
                        -DUSE_EXAMPLES=ON
                        -DUSE_STATIC_BOOST=ON
                        -DUSE_TESTS=ON
                        -DALEMBIC_ILMBASE_LINK_STATIC=ON
                        -DALEMBIC_SHARED_LIBS=OFF
                    LOG_DOWNLOAD 1
                    LOG_INSTALL 1)
