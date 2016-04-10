project(alembic-tree)
cmake_minimum_required(VERSION 2.8)

include(ExternalProject)

set(alembic_tree_install_directory ${CMAKE_BINARY_DIR}/install CACHE INTERNAL "")

# build ilmbase
include("ilmbase.cmake")

# build alembic
ExternalProject_Add(alembic
                    DEPENDS ilmbase
                    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/alembic
                    CMAKE_ARGS
                        -DCMAKE_INSTALL_PREFIX=${alembic_tree_install_directory}
                        -DCMAKE_CXXFLAGS=-Wno-deprecated-declarations
                        -DILMBASE_ROOT=${alembic_tree_install_directory}
                        -DUSE_ARNOLD=OFF
                        -DUSE_EXAMPLES=OFF
                        -DUSE_HDF5=OFF
                        -DUSE_MAYA=OFF
                        -DUSE_OPENGL=OFF
                        -DUSE_PRMAN=OFF
                        -DUSE_PYALEMBIC=OFF
                        -DUSE_TESTS=OFF
                        -DALEMBIC_ILMBASE_LINK_STATIC=ON
                        -DALEMBIC_GLEW_LINK_STATIC=ON
                        -DALEMBIC_SHARED_LIBS=OFF
                        -DALEMBIC_LIB_USES_BOOST=OFF
                        -DALEMBIC_LIB_USES_TR1=ON
                    LOG_DOWNLOAD 1
                    LOG_INSTALL 1)

get_directory_property(has_parent_scope PARENT_DIRECTORY)
if (has_parent_scope)
    # propagate link and include flags to parent scope
    set(ALEMBIC_TREE_INCLUDE
            ${alembic_tree_install_directory}/include
            ${alembic_tree_install_directory}/include/OpenEXR
        PARENT_SCOPE)
    set(ALEMBIC_TREE_LINK_LIBS
            ${alembic_tree_install_directory}/lib/libAlembic.a
            ${alembic_tree_install_directory}/lib/libHalf.a
            ${alembic_tree_install_directory}/lib/libIex-2_2.a
            ${alembic_tree_install_directory}/lib/libIexMath-2_2.a
            ${alembic_tree_install_directory}/lib/libIlmThread-2_2.a
            ${alembic_tree_install_directory}/lib/libImath-2_2.a
        PARENT_SCOPE)
endif()
