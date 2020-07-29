cmake_minimum_required(VERSION 3.15)
project(mysql_with_cpp)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)

add_executable(mysql_with_cpp
        database-detail.h
        database-main.cpp
        database.cc
        database.h
        header.h book_store_adaptor.h book_store_queries.h)
