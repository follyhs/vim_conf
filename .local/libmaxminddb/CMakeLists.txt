# GeoLite2++ (C) 2016-2018 Stephane Charette <stephanecharette@gmail.com>
# $Id: CMakeLists.txt 2549 2018-06-08 18:48:31Z stephane $

cmake_minimum_required(VERSION 3.5)

CONFIGURE_FILE ( ${CMAKE_CURRENT_SOURCE_DIR}/GeoLite2PP_version.hpp.in ${CMAKE_CURRENT_SOURCE_DIR}/GeoLite2PP_version.hpp )

FILE ( GLOB LIB_SOURCE	*.cpp	)
FILE ( GLOB LIB_HEADERS	*.hpp	)
LIST ( SORT LIB_SOURCE			)
LIST ( SORT LIB_HEADERS			)

# this creates the static link library (.a)
ADD_LIBRARY				( geolite2++ STATIC ${LIB_SOURCE} )
TARGET_LINK_LIBRARIES	( geolite2++ ${CMAKE_THREAD_LIBS_INIT} ${GeoLite2PP_EXTERNAL_LIBS} )

# this creates the shared library (.so)
ADD_LIBRARY				( geolite2++s SHARED ${LIB_SOURCE} )
SET_TARGET_PROPERTIES	( geolite2++s PROPERTIES OUTPUT_NAME "geolite2++" )
SET_TARGET_PROPERTIES	( geolite2++s PROPERTIES PREFIX "lib" )

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
set(LIBS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libmaxminddb.a)
#target_link_libraries(geolite2++s ${CMAKE_CURRENT_SOURCE_DIR}/lib/libmaxminddb.a)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/)

INSTALL ( TARGETS geolite2++ geolite2++s ARCHIVE DESTINATION lib LIBRARY DESTINATION lib )
INSTALL ( FILES ${LIB_HEADERS} DESTINATION include/ )

SET(CMAKE_CXX_COMPILER "/opt/bin/gcc")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

