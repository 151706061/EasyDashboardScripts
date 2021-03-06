CMAKE_MINIMUM_REQUIRED(VERSION 2.8 FATAL_ERROR)

GET_FILENAME_COMPONENT(ED_script_EasyDashboardVariables "${CMAKE_CURRENT_LIST_FILE}" ABSOLUTE)
GET_FILENAME_COMPONENT(ED_dir_EasyDashboardVariables "${CMAKE_CURRENT_LIST_FILE}" PATH)
GET_FILENAME_COMPONENT(ED_cwd "." ABSOLUTE)

SET(ED_revision_EasyDashboardVariables "35")
SET(ED_date_EasyDashboardVariables "2013/01/19")
SET(ED_author_EasyDashboardVariables "david.cole")

IF(COMMAND CMAKE_POLICY)
  IF(POLICY CMP0011)
    CMAKE_POLICY(SET CMP0011 NEW)
  ENDIF(POLICY CMP0011)
ENDIF(COMMAND CMAKE_POLICY)


MACRO(ED_MESSAGE em_msg)
  MESSAGE("${em_msg}")
ENDMACRO(ED_MESSAGE)


SET(ED_elapsed_time_previous ${CTEST_ELAPSED_TIME})


MACRO(ED_ECHO_ELAPSED_TIME eeet_context)
  MATH(EXPR ED_delta "${CTEST_ELAPSED_TIME} - ${ED_elapsed_time_previous}")
  ED_MESSAGE("ElapsedTime='${CTEST_ELAPSED_TIME}' delta='${ED_delta}' context='${eeet_context}'")
  SET(ED_elapsed_time_previous ${CTEST_ELAPSED_TIME})
ENDMACRO(ED_ECHO_ELAPSED_TIME)


ED_ECHO_ELAPSED_TIME("EasyDashboardVariables-TopOfScript")

EXECUTE_PROCESS(COMMAND ${CMAKE_EXECUTABLE_NAME} "--version"
  OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE ED_cmake_version)

EXECUTE_PROCESS(COMMAND ${CTEST_EXECUTABLE_NAME} "--version"
  OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE ED_ctest_version)


MACRO(ED_APPEND dac_var dac_line)
  SET(${dac_var} "${${dac_var}}${dac_line}\n")
ENDMACRO(ED_APPEND)


MACRO(ED_GET_EasyDashboardInfo var)
  SET(${var} "")

  ED_APPEND(${var} "<!--")
  ED_APPEND(${var} "# Command line to run this dashboard again on ${ED_site}:")
  ED_APPEND(${var} "#")
  ED_APPEND(${var} "cd \"${ED_cwd}\" && \"${CTEST_EXECUTABLE_NAME}\" -VV -S \"${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME},${CTEST_SCRIPT_ARG}\"")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "# The following is pseudo-xml.")
  ED_APPEND(${var} "# It may or may not parse as well-formed xml...")
  ED_APPEND(${var} "-->")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "<EasyDashboardInfo")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "  ED_cache='${ED_cache}'")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "  CTEST_SOURCE_DIRECTORY='${CTEST_SOURCE_DIRECTORY}'")
  ED_APPEND(${var} "  CTEST_BINARY_DIRECTORY='${CTEST_BINARY_DIRECTORY}'")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "  CMAKE_EXECUTABLE_NAME='${CMAKE_EXECUTABLE_NAME}'")
  ED_APPEND(${var} "  ED_cmake_version='${ED_cmake_version}'")
  ED_APPEND(${var} "  CTEST_EXECUTABLE_NAME='${CTEST_EXECUTABLE_NAME}'")
  ED_APPEND(${var} "  ED_ctest_version='${ED_ctest_version}'")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "  CTEST_SCRIPT_NAME='${CTEST_SCRIPT_NAME}'")
  ED_APPEND(${var} "  CTEST_SCRIPT_ARG='${CTEST_SCRIPT_ARG}'")
  ED_APPEND(${var} "  CTEST_SCRIPT_DIRECTORY='${CTEST_SCRIPT_DIRECTORY}'")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "  CTEST_PROJECT_NAME='${CTEST_PROJECT_NAME}'")
  ED_APPEND(${var} "  CTEST_DROP_LOCATION='${CTEST_DROP_LOCATION}'")
  ED_APPEND(${var} "  CTEST_DROP_METHOD='${CTEST_DROP_METHOD}'")
  ED_APPEND(${var} "  CTEST_DROP_SITE='${CTEST_DROP_SITE}'")
  ED_APPEND(${var} "  CTEST_NIGHTLY_START_TIME='${CTEST_NIGHTLY_START_TIME}'")
  ED_APPEND(${var} "  CTEST_TRIGGER_SITE='${CTEST_TRIGGER_SITE}'")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "  CTEST_BUILD_COMMAND='${CTEST_BUILD_COMMAND}'")
  ED_APPEND(${var} "  CTEST_BUILD_CONFIGURATION='${CTEST_BUILD_CONFIGURATION}'")
  ED_APPEND(${var} "  CTEST_BUILD_NAME='${CTEST_BUILD_NAME}'")
  ED_APPEND(${var} "  CTEST_CONFIGURATION_TYPE='${CTEST_CONFIGURATION_TYPE}'")
  ED_APPEND(${var} "  CTEST_CMAKE_GENERATOR='${CTEST_CMAKE_GENERATOR}'")
  ED_APPEND(${var} "  CTEST_COVERAGE_COMMAND='${CTEST_COVERAGE_COMMAND}'")
  ED_APPEND(${var} "  CTEST_DATA_DIRECTORY='${CTEST_DATA_DIRECTORY}'")
  ED_APPEND(${var} "  CTEST_NOTES_FILES='${CTEST_NOTES_FILES}'")
  ED_APPEND(${var} "  CTEST_RUN_CURRENT_SCRIPT='${CTEST_RUN_CURRENT_SCRIPT}'")
  ED_APPEND(${var} "  CTEST_SITE='${CTEST_SITE}'")
  ED_APPEND(${var} "  CTEST_TEST_TIMEOUT='${CTEST_TEST_TIMEOUT}'")
  ED_APPEND(${var} "  CTEST_UPDATE_COMMAND='${CTEST_UPDATE_COMMAND}'")
  ED_APPEND(${var} "  CTEST_UPDATE_OPTIONS='${CTEST_UPDATE_OPTIONS}'")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "  ED_args='${ED_args}'")
  ED_APPEND(${var} "  ED_build='${ED_build}'")
  ED_APPEND(${var} "  ED_buildname='${ED_buildname}'")
  ED_APPEND(${var} "  ED_buildtarget='${ED_buildtarget}'")
  ED_APPEND(${var} "  ED_clean='${ED_clean}'")
  ED_APPEND(${var} "  ED_cmd_coverage_switch='${ED_cmd_coverage_switch}'")
  ED_APPEND(${var} "  ED_cmd_KWStyle='${ED_cmd_KWStyle}'")
  ED_APPEND(${var} "  ED_cmd_KWStyle_args='${ED_cmd_KWStyle_args}'")
  ED_APPEND(${var} "  ED_cmd_qmake='${ED_cmd_qmake}'")
  ED_APPEND(${var} "  ED_config='${ED_config}'")
  ED_APPEND(${var} "  ED_configure='${ED_configure}'")
  ED_APPEND(${var} "  ED_contact='${ED_contact}'")
  ED_APPEND(${var} "  ED_coverage='${ED_coverage}'")
  ED_APPEND(${var} "  ED_cwd='${ED_cwd}'")
  ED_APPEND(${var} "  ED_data='${ED_data}'")
  ED_APPEND(${var} "  ED_data_repository='${ED_data_repository}'")
  ED_APPEND(${var} "  ED_dir_logs='${ED_dir_logs}'")
  ED_APPEND(${var} "  ED_dir_mytests='${ED_dir_mytests}'")
  ED_APPEND(${var} "  ED_dir_support='${ED_dir_support}'")
  ED_APPEND(${var} "  ED_duration='${ED_duration}'")
  ED_APPEND(${var} "  ED_gen='${ED_gen}'")
  ED_APPEND(${var} "  ED_generator='${ED_generator}'")
  ED_APPEND(${var} "  ED_interval='${ED_interval}'")
  ED_APPEND(${var} "  ED_kwstyle='${ED_kwstyle}'")
  ED_APPEND(${var} "  ED_model='${ED_model}'")
  ED_APPEND(${var} "  ED_notes='${ED_notes}'")
  ED_APPEND(${var} "  ED_projectcachescript='${ED_projectcachescript}'")
  ED_APPEND(${var} "  ED_site='${ED_site}'")
  ED_APPEND(${var} "  ED_source='${ED_source}'")
  ED_APPEND(${var} "  ED_sourcename='${ED_sourcename}'")
  ED_APPEND(${var} "  ED_source_repository='${ED_source_repository}'")
  ED_APPEND(${var} "  ED_source_repository_type='${ED_source_repository_type}'")
  ED_APPEND(${var} "  ED_start='${ED_start}'")
  ED_APPEND(${var} "  ED_start_append='${ED_start_append}'")
  ED_APPEND(${var} "  ED_submit='${ED_submit}'")
  ED_APPEND(${var} "  ED_system='${ED_system}'")
  ED_APPEND(${var} "  ED_tag='${ED_tag}'")
  ED_APPEND(${var} "  ED_tag_dir='${ED_tag_dir}'")
  ED_APPEND(${var} "  ED_tag_buildname='${ED_tag_buildname}'")
  ED_APPEND(${var} "  ED_test='${ED_test}'")
  ED_APPEND(${var} "  ED_test_dir='${ED_test_dir}'")
  ED_APPEND(${var} "  ED_test_exclude='${ED_test_exclude}'")
  ED_APPEND(${var} "  ED_test_parallel_level='${ED_test_parallel_level}'")
  ED_APPEND(${var} "  ED_test_subdir='${ED_test_subdir}'")
  ED_APPEND(${var} "  ED_update='${ED_update}'")
  ED_APPEND(${var} "  ED_update_dir='${ED_update_dir}'")
  ED_APPEND(${var} "  ED_upload='${ED_upload}'")
  ED_APPEND(${var} "  ED_upload_destination='${ED_upload_destination}'")
  ED_APPEND(${var} "  ED_upload_files='${ED_upload_files}'")
  ED_APPEND(${var} "  ED_verbose='${ED_verbose}'")
  ED_APPEND(${var} "  ED_wrappers='${ED_wrappers}'")
  ED_APPEND(${var} "  ED_write_ED_info='${ED_write_ED_info}'")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "  ED_script_EasyDashboard='${ED_script_EasyDashboard}'")
  ED_APPEND(${var} "  ED_revision_EasyDashboard='${ED_revision_EasyDashboard}'")
  ED_APPEND(${var} "  ED_date_EasyDashboard='${ED_date_EasyDashboard}'")
  ED_APPEND(${var} "  ED_author_EasyDashboard='${ED_author_EasyDashboard}'")
  ED_APPEND(${var} "  ED_dir_EasyDashboard='${ED_dir_EasyDashboard}'")
  ED_APPEND(${var} "")
  ED_APPEND(${var} "  ED_script_EasyDashboardVariables='${ED_script_EasyDashboardVariables}'")
  ED_APPEND(${var} "  ED_revision_EasyDashboardVariables='${ED_revision_EasyDashboardVariables}'")
  ED_APPEND(${var} "  ED_date_EasyDashboardVariables='${ED_date_EasyDashboardVariables}'")
  ED_APPEND(${var} "  ED_author_EasyDashboardVariables='${ED_author_EasyDashboardVariables}'")
  ED_APPEND(${var} "  ED_dir_EasyDashboardVariables='${ED_dir_EasyDashboardVariables}'")
  ED_APPEND(${var} ">")

#  EXECUTE_PROCESS(COMMAND ${CMAKE_EXECUTABLE_NAME}
#    -E environment
#    OUTPUT_VARIABLE ED_environment
#    )
  SET(ED_environment "")

  IF(NOT "${ED_environment}" STREQUAL "")
    ED_APPEND(${var} "  <Environment>")

    IF("${ED_environment}" MATCHES "&#x0A|&#x3B|&#x5C")
      ED_MESSAGE("${CMAKE_CURRENT_LIST_FILE}(${CMAKE_CURRENT_LIST_LINE}): warning: ED_environment contains encoding strings")

      ED_APPEND(${var} "    -------------------------------------------------------------------------------------")
      ED_APPEND(${var} "    warning: ED_environment contains encoding strings, extracted data may be transformed.")
      ED_APPEND(${var} "             Inspect the environment on the machine itself to validate...")
      ED_APPEND(${var} "    -------------------------------------------------------------------------------------")
      ED_APPEND(${var} "")
    ENDIF("${ED_environment}" MATCHES "&#x0A|&#x3B|&#x5C")

    # Inplace replacement of special characters with encoding sequences.
    # Ending with the "\n" to ";" to transform into a FOREACH-able CMake list
    # of encoded lines. Then decoded for use inside the FOREACH loop.
    #
    STRING(REGEX REPLACE ";" "&#x3B" ED_environment "${ED_environment}")
    STRING(REGEX REPLACE "\\\\" "&#x5C" ED_environment "${ED_environment}")
    STRING(REGEX REPLACE "\n" "&#x0A;" ED_environment "${ED_environment}")

    FOREACH(encoded_line ${ED_environment})
      STRING(REGEX REPLACE "&#x0A" "" line "${encoded_line}")
      STRING(REGEX REPLACE "&#x3B" ";" line "${line}")
      STRING(REGEX REPLACE "&#x5C" "\\\\" line "${line}")

      ED_APPEND(${var} "    ${line}")
    ENDFOREACH(encoded_line)

    ED_APPEND(${var} "  </Environment>")
  ENDIF(NOT "${ED_environment}" STREQUAL "")

  ED_APPEND(${var} "</EasyDashboardInfo>")
ENDMACRO(ED_GET_EasyDashboardInfo)


MACRO(ED_DUMP_EasyDashboardInfo)
  ED_GET_EasyDashboardInfo(ED_info)
  ED_MESSAGE("${ED_info}")
ENDMACRO(ED_DUMP_EasyDashboardInfo)


# Computes a directory name at or under the "My Tests" folder,
# using the model as a naming element.
#
MACRO(ED_GET_BASE_DIR basedir_var)
  SET(${basedir_var} "${ED_dir_mytests}")
  IF(NOT "${ED_model}" STREQUAL "Experimental")
    SET(${basedir_var} "${ED_dir_mytests}/${ED_model}")
  ENDIF(NOT "${ED_model}" STREQUAL "Experimental")
ENDMACRO(ED_GET_BASE_DIR)


# Computes a directory name under the "My Tests" folder,
# using model, tag and ${dirname_var} as naming elements.
#
# Arguments name two existing variables in the calling scope.
#
# Sets ${dir_var} based on computed subdirectories and
# present value of ${${dirname_var}}.
#
MACRO(ED_COMPUTE_DIR dir_var dirname_var)
  IF(NOT "${${dirname_var}}" STREQUAL "")
    ED_GET_BASE_DIR(ecd_dir)

    IF("${ED_tag_dir}" STREQUAL "")
      SET(${dir_var} "${ecd_dir}/${${dirname_var}}")
    ELSE("${ED_tag_dir}" STREQUAL "")
      SET(${dir_var} "${ecd_dir}/${ED_tag_dir}/${${dirname_var}}")
    ENDIF("${ED_tag_dir}" STREQUAL "")
  ENDIF(NOT "${${dirname_var}}" STREQUAL "")
ENDMACRO(ED_COMPUTE_DIR)


IF(NOT DEFINED ED_dir_support)
  GET_FILENAME_COMPONENT(ED_dir_support "${CTEST_SCRIPT_DIRECTORY}/../Support" ABSOLUTE)
ENDIF(NOT DEFINED ED_dir_support)

IF(NOT DEFINED ED_cache)
  SET(ED_cache "\n")
ENDIF(NOT DEFINED ED_cache)


INCLUDE("${ED_dir_support}/EasyDashboardDefaults.cmake" OPTIONAL)


IF(NOT DEFINED ED_dir_logs)
  GET_FILENAME_COMPONENT(ED_dir_logs "${CTEST_SCRIPT_DIRECTORY}/../Logs" ABSOLUTE)
ENDIF(NOT DEFINED ED_dir_logs)

IF(NOT DEFINED ED_dir_mytests)
  GET_FILENAME_COMPONENT(ED_dir_mytests "${CTEST_SCRIPT_DIRECTORY}/../My Tests" ABSOLUTE)
ENDIF(NOT DEFINED ED_dir_mytests)

IF(NOT DEFINED ED_source)
  IF(DEFINED CTEST_SOURCE_DIRECTORY)
    GET_FILENAME_COMPONENT(ED_source "${CTEST_SOURCE_DIRECTORY}" NAME)
  ELSE(DEFINED CTEST_SOURCE_DIRECTORY)
    IF("${ED_script_EasyDashboard}" STREQUAL "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}")
      #
      # If running EasyDashboard.cmake directly and not via some wrapper script, allow
      # for configure/build/test cycles on a local directory ("." by default) that are not
      # "official project" source trees... Use the full path of the current working directory
      # as the default values of ED_source and CTEST_SOURCE_DIRECTORY:
      #
      GET_FILENAME_COMPONENT(ED_source "${ED_cwd}" ABSOLUTE)
      SET(CTEST_SOURCE_DIRECTORY "${ED_source}")
    ELSE("${ED_script_EasyDashboard}" STREQUAL "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}")
      #
      # Otherwise, wrapper script is calling EasyDashboard.cmake - use base name of that
      # script as the default value for ED_source:
      #
      STRING(REGEX REPLACE "(.*).cmake" "\\1" ED_source "${CTEST_SCRIPT_NAME}")
    ENDIF("${ED_script_EasyDashboard}" STREQUAL "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}")
  ENDIF(DEFINED CTEST_SOURCE_DIRECTORY)
ENDIF(NOT DEFINED ED_source)
IF("${ED_source}" STREQUAL "")
  MESSAGE(FATAL_ERROR "ERROR: ED_source must be set -or- derivable from CTEST_SOURCE_DIRECTORY or CTEST_SCRIPT_NAME...")
ENDIF("${ED_source}" STREQUAL "")

GET_FILENAME_COMPONENT(ED_sourcename "${ED_source}" NAME)

SET(ED_args ${ED_args} "${CTEST_SCRIPT_ARG}")

IF(NOT DEFINED ED_config)
  IF("${ED_args}" MATCHES "Debug")
    SET(ED_config "Debug")
  ENDIF("${ED_args}" MATCHES "Debug")
  IF("${ED_args}" MATCHES "Release")
    SET(ED_config "Release")
  ENDIF("${ED_args}" MATCHES "Release")
  IF("${ED_args}" MATCHES "RelWithDebInfo")
    SET(ED_config "RelWithDebInfo")
  ENDIF("${ED_args}" MATCHES "RelWithDebInfo")
  IF("${ED_args}" MATCHES "MinSizeRel")
    SET(ED_config "MinSizeRel")
  ENDIF("${ED_args}" MATCHES "MinSizeRel")
ENDIF(NOT DEFINED ED_config)
IF(NOT DEFINED ED_config)
  SET(ED_config "Release")
ENDIF(NOT DEFINED ED_config)

IF(NOT DEFINED ED_model)
  IF("${ED_args}" MATCHES "Continuous")
    SET(ED_model "Continuous")
  ENDIF("${ED_args}" MATCHES "Continuous")
  IF("${ED_args}" MATCHES "Nightly")
    SET(ED_model "Nightly")
  ENDIF("${ED_args}" MATCHES "Nightly")
  IF("${ED_args}" MATCHES "Weekly")
    SET(ED_model "Weekly")
  ENDIF("${ED_args}" MATCHES "Weekly")
  IF("${ED_args}" MATCHES "Experimental")
    SET(ED_model "Experimental")
  ENDIF("${ED_args}" MATCHES "Experimental")
ENDIF(NOT DEFINED ED_model)
IF(NOT DEFINED ED_model)
  SET(ED_model "Experimental")
ENDIF(NOT DEFINED ED_model)

IF(NOT DEFINED ED_gen_default)
  IF(UNIX)
    SET(ED_gen_default "unix")
  ENDIF(UNIX)
  IF(APPLE)
    SET(ED_gen_default "unix")
  ENDIF(APPLE)
  IF(WIN32)
    SET(ED_gen_default "vs9")
  ENDIF(WIN32)
ENDIF(NOT DEFINED ED_gen_default)
IF(NOT DEFINED ED_gen_default)
  SET(ED_gen_default "unix")
ENDIF(NOT DEFINED ED_gen_default)

IF(NOT DEFINED ED_gen)
  IF("${ED_args}" MATCHES "bcb")
    SET(ED_gen "borland")
  ENDIF("${ED_args}" MATCHES "bcb")
  IF("${ED_args}" MATCHES "bcc")
    SET(ED_gen "borland")
  ENDIF("${ED_args}" MATCHES "bcc")
  IF("${ED_args}" MATCHES "borland")
    SET(ED_gen "borland")
  ENDIF("${ED_args}" MATCHES "borland")
  IF("${ED_args}" MATCHES "cygwin")
    SET(ED_gen "cygwin")
  ENDIF("${ED_args}" MATCHES "cygwin")
  IF("${ED_args}" MATCHES "kd3")
    SET(ED_gen "kd3")
  ENDIF("${ED_args}" MATCHES "kd3")
  IF("${ED_args}" MATCHES "msys")
    SET(ED_gen "msys")
  ENDIF("${ED_args}" MATCHES "msys")
  IF("${ED_args}" MATCHES "clmsys")
    SET(ED_gen "clmsys")
  ENDIF("${ED_args}" MATCHES "clmsys")
  IF("${ED_args}" MATCHES "cl6msys")
    SET(ED_gen "cl6msys")
  ENDIF("${ED_args}" MATCHES "cl6msys")
  IF("${ED_args}" MATCHES "cl7msys")
    SET(ED_gen "cl7msys")
  ENDIF("${ED_args}" MATCHES "cl7msys")
  IF("${ED_args}" MATCHES "cl71msys")
    SET(ED_gen "cl71msys")
  ENDIF("${ED_args}" MATCHES "cl71msys")
  IF("${ED_args}" MATCHES "cl8msys")
    SET(ED_gen "cl8msys")
  ENDIF("${ED_args}" MATCHES "cl8msys")
  IF("${ED_args}" MATCHES "cl9msys")
    SET(ED_gen "cl9msys")
  ENDIF("${ED_args}" MATCHES "cl9msys")
  IF("${ED_args}" MATCHES "mingw")
    SET(ED_gen "mingw")
  ENDIF("${ED_args}" MATCHES "mingw")
  IF("${ED_args}" MATCHES "clmingw")
    SET(ED_gen "clmingw")
  ENDIF("${ED_args}" MATCHES "clmingw")
  IF("${ED_args}" MATCHES "cl6mingw")
    SET(ED_gen "cl6mingw")
  ENDIF("${ED_args}" MATCHES "cl6mingw")
  IF("${ED_args}" MATCHES "cl7mingw")
    SET(ED_gen "cl7mingw")
  ENDIF("${ED_args}" MATCHES "cl7mingw")
  IF("${ED_args}" MATCHES "cl71mingw")
    SET(ED_gen "cl71mingw")
  ENDIF("${ED_args}" MATCHES "cl71mingw")
  IF("${ED_args}" MATCHES "cl8mingw")
    SET(ED_gen "cl8mingw")
  ENDIF("${ED_args}" MATCHES "cl8mingw")
  IF("${ED_args}" MATCHES "cl9mingw")
    SET(ED_gen "cl9mingw")
  ENDIF("${ED_args}" MATCHES "cl9mingw")
  IF("${ED_args}" MATCHES "jom")
    SET(ED_gen "jom")
  ENDIF("${ED_args}" MATCHES "jom")
  IF("${ED_args}" MATCHES "jom-cl8")
    SET(ED_gen "jom-cl8")
  ENDIF("${ED_args}" MATCHES "jom-cl8")
  IF("${ED_args}" MATCHES "jom-cl9")
    SET(ED_gen "jom-cl9")
  ENDIF("${ED_args}" MATCHES "jom-cl9")
  IF("${ED_args}" MATCHES "jom-cl10")
    SET(ED_gen "jom-cl10")
  ENDIF("${ED_args}" MATCHES "jom-cl10")
  IF("${ED_args}" MATCHES "ninja")
    SET(ED_gen "ninja")
  ENDIF("${ED_args}" MATCHES "ninja")
  IF("${ED_args}" MATCHES "ninja-cl8")
    SET(ED_gen "ninja-cl8")
  ENDIF("${ED_args}" MATCHES "ninja-cl8")
  IF("${ED_args}" MATCHES "ninja-cl9")
    SET(ED_gen "ninja-cl9")
  ENDIF("${ED_args}" MATCHES "ninja-cl9")
  IF("${ED_args}" MATCHES "ninja-cl9x64")
    SET(ED_gen "ninja-cl9x64")
  ENDIF("${ED_args}" MATCHES "ninja-cl9x64")
  IF("${ED_args}" MATCHES "ninja-cl10")
    SET(ED_gen "ninja-cl10")
  ENDIF("${ED_args}" MATCHES "ninja-cl10")
  IF("${ED_args}" MATCHES "ninja-cl10x64")
    SET(ED_gen "ninja-cl10x64")
  ENDIF("${ED_args}" MATCHES "ninja-cl10x64")
  IF("${ED_args}" MATCHES "nmake")
    SET(ED_gen "nmake")
  ENDIF("${ED_args}" MATCHES "nmake")
  IF("${ED_args}" MATCHES "nmake6")
    SET(ED_gen "nmake6")
  ENDIF("${ED_args}" MATCHES "nmake6")
  IF("${ED_args}" MATCHES "nmake7")
    SET(ED_gen "nmake7")
  ENDIF("${ED_args}" MATCHES "nmake7")
  IF("${ED_args}" MATCHES "nmake71")
    SET(ED_gen "nmake71")
  ENDIF("${ED_args}" MATCHES "nmake71")
  IF("${ED_args}" MATCHES "nmake8")
    SET(ED_gen "nmake8")
  ENDIF("${ED_args}" MATCHES "nmake8")
  IF("${ED_args}" MATCHES "nmake9")
    SET(ED_gen "nmake9")
  ENDIF("${ED_args}" MATCHES "nmake9")
  IF("${ED_args}" MATCHES "nmake10")
    SET(ED_gen "nmake10")
  ENDIF("${ED_args}" MATCHES "nmake10")
  IF("${ED_args}" MATCHES "unix")
    SET(ED_gen "unix")
  ENDIF("${ED_args}" MATCHES "unix")
  IF("${ED_args}" MATCHES "clunix")
    SET(ED_gen "clunix")
  ENDIF("${ED_args}" MATCHES "clunix")
  IF("${ED_args}" MATCHES "cl6unix")
    SET(ED_gen "cl6unix")
  ENDIF("${ED_args}" MATCHES "cl6unix")
  IF("${ED_args}" MATCHES "cl7unix")
    SET(ED_gen "cl7unix")
  ENDIF("${ED_args}" MATCHES "cl7unix")
  IF("${ED_args}" MATCHES "cl71unix")
    SET(ED_gen "cl71unix")
  ENDIF("${ED_args}" MATCHES "cl71unix")
  IF("${ED_args}" MATCHES "cl8unix")
    SET(ED_gen "cl8unix")
  ENDIF("${ED_args}" MATCHES "cl8unix")
  IF("${ED_args}" MATCHES "cl9unix")
    SET(ED_gen "cl9unix")
  ENDIF("${ED_args}" MATCHES "cl9unix")
  IF("${ED_args}" MATCHES "vs")
    SET(ED_gen "vs8")
  ENDIF("${ED_args}" MATCHES "vs")
  IF("${ED_args}" MATCHES "vs6")
    SET(ED_gen "vs6")
  ENDIF("${ED_args}" MATCHES "vs6")
  IF("${ED_args}" MATCHES "vs7")
    SET(ED_gen "vs7")
  ENDIF("${ED_args}" MATCHES "vs7")
  IF("${ED_args}" MATCHES "vs71")
    SET(ED_gen "vs71")
  ENDIF("${ED_args}" MATCHES "vs71")
  IF("${ED_args}" MATCHES "vs8")
    SET(ED_gen "vs8")
  ENDIF("${ED_args}" MATCHES "vs8")
  IF("${ED_args}" MATCHES "vs8w64")
    SET(ED_gen "vs8w64")
  ENDIF("${ED_args}" MATCHES "vs8w64")
  IF("${ED_args}" MATCHES "vs9")
    SET(ED_gen "vs9")
  ENDIF("${ED_args}" MATCHES "vs9")
  IF("${ED_args}" MATCHES "vs9w64")
    SET(ED_gen "vs9w64")
  ENDIF("${ED_args}" MATCHES "vs9w64")
  IF("${ED_args}" MATCHES "vs10")
    SET(ED_gen "vs10")
  ENDIF("${ED_args}" MATCHES "vs10")
  IF("${ED_args}" MATCHES "vs10w64")
    SET(ED_gen "vs10w64")
  ENDIF("${ED_args}" MATCHES "vs10w64")
  IF("${ED_args}" MATCHES "vs11")
    SET(ED_gen "vs11")
  ENDIF("${ED_args}" MATCHES "vs11")
  IF("${ED_args}" MATCHES "vs11w64")
    SET(ED_gen "vs11w64")
  ENDIF("${ED_args}" MATCHES "vs11w64")
  IF("${ED_args}" MATCHES "watcom")
    SET(ED_gen "watcom")
  ENDIF("${ED_args}" MATCHES "watcom")
  IF("${ED_args}" MATCHES "xcode")
    SET(ED_gen "xcode")
  ENDIF("${ED_args}" MATCHES "xcode")
ENDIF(NOT DEFINED ED_gen)
IF(NOT DEFINED ED_gen)
  SET(ED_gen "${ED_gen_default}")
ENDIF(NOT DEFINED ED_gen)

IF(NOT DEFINED ED_generator)
  IF("${ED_gen}" STREQUAL "borland")
    SET(ED_generator "Borland Makefiles")
  ENDIF("${ED_gen}" STREQUAL "borland")
  IF("${ED_gen}" STREQUAL "cygwin")
    SET(ED_generator "Unix Makefiles")
  ENDIF("${ED_gen}" STREQUAL "cygwin")
  IF("${ED_gen}" STREQUAL "kd3")
    SET(ED_generator "KDevelop3")
  ENDIF("${ED_gen}" STREQUAL "kd3")
  IF("${ED_gen}" MATCHES "msys")
    SET(ED_generator "MSYS Makefiles")
  ENDIF("${ED_gen}" MATCHES "msys")
  IF("${ED_gen}" MATCHES "mingw")
    SET(ED_generator "MinGW Makefiles")
  ENDIF("${ED_gen}" MATCHES "mingw")
  IF("${ED_gen}" MATCHES "jom")
    SET(ED_generator "NMake Makefiles JOM")
  ENDIF("${ED_gen}" MATCHES "jom")
  IF("${ED_gen}" MATCHES "ninja")
    SET(ED_generator "Ninja")
  ENDIF("${ED_gen}" MATCHES "ninja")
  IF("${ED_gen}" MATCHES "nmake")
    SET(ED_generator "NMake Makefiles")
  ENDIF("${ED_gen}" MATCHES "nmake")
  IF("${ED_gen}" MATCHES "unix")
    SET(ED_generator "Unix Makefiles")
  ENDIF("${ED_gen}" MATCHES "unix")
  IF("${ED_gen}" STREQUAL "vs6")
    SET(ED_generator "Visual Studio 6")
  ENDIF("${ED_gen}" STREQUAL "vs6")
  IF("${ED_gen}" STREQUAL "vs7")
    SET(ED_generator "Visual Studio 7")
  ENDIF("${ED_gen}" STREQUAL "vs7")
  IF("${ED_gen}" STREQUAL "vs71")
    SET(ED_generator "Visual Studio 7 .NET 2003")
  ENDIF("${ED_gen}" STREQUAL "vs71")
  IF("${ED_gen}" STREQUAL "vs8")
    SET(ED_generator "Visual Studio 8 2005")
  ENDIF("${ED_gen}" STREQUAL "vs8")
  IF("${ED_gen}" STREQUAL "vs8w64")
    SET(ED_generator "Visual Studio 8 2005 Win64")
  ENDIF("${ED_gen}" STREQUAL "vs8w64")
  IF("${ED_gen}" STREQUAL "vs9")
    SET(ED_generator "Visual Studio 9 2008")
  ENDIF("${ED_gen}" STREQUAL "vs9")
  IF("${ED_gen}" STREQUAL "vs9w64")
    SET(ED_generator "Visual Studio 9 2008 Win64")
  ENDIF("${ED_gen}" STREQUAL "vs9w64")
  IF("${ED_gen}" STREQUAL "vs10")
    SET(ED_generator "Visual Studio 10")
  ENDIF("${ED_gen}" STREQUAL "vs10")
  IF("${ED_gen}" STREQUAL "vs10w64")
    SET(ED_generator "Visual Studio 10 Win64")
  ENDIF("${ED_gen}" STREQUAL "vs10w64")
  IF("${ED_gen}" STREQUAL "vs11")
    SET(ED_generator "Visual Studio 11")
  ENDIF("${ED_gen}" STREQUAL "vs11")
  IF("${ED_gen}" STREQUAL "vs11w64")
    SET(ED_generator "Visual Studio 11 Win64")
  ENDIF("${ED_gen}" STREQUAL "vs11w64")
  IF("${ED_gen}" STREQUAL "watcom")
    SET(ED_generator "Watcom WMake")
  ENDIF("${ED_gen}" STREQUAL "watcom")
  IF("${ED_gen}" STREQUAL "xcode")
    SET(ED_generator "Xcode")
  ENDIF("${ED_gen}" STREQUAL "xcode")
ENDIF(NOT DEFINED ED_generator)
IF(NOT DEFINED ED_generator)
  MESSAGE(FATAL_ERROR "ERROR: EasyDashboardVariables variable ED_gen set to an unknown CMake generator abbreviation... ED_gen='${ED_gen}'")
ENDIF(NOT DEFINED ED_generator)

IF(NOT DEFINED ED_system)
  IF(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} GREATER 2.4)
    INCLUDE(CMakeDetermineSystem)
    SET(ED_system "${CMAKE_HOST_SYSTEM_NAME}")
  ENDIF(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} GREATER 2.4)

  IF(UNIX)
    IF(NOT ED_system)
      SET(ED_system "Linux")
    ENDIF(NOT ED_system)
  ENDIF(UNIX)
  IF(APPLE)
    # I don't like "Darwin" so I'm overriding it on purpose:
    SET(ED_system "Mac")
  ENDIF(APPLE)
  IF(WIN32)
    # "Windows" is not descriptive enough - override it on purpose:
    SET(ED_system "Win32")
  ENDIF(WIN32)
  # TODO: How can we know if an nmake build is for Win64 at this stage prior
  # to cmake configure...?
  IF(ED_gen MATCHES "vs[0-9]+w64")
    SET(ED_system "Win64")
  ENDIF(ED_gen MATCHES "vs[0-9]+w64")
ENDIF(NOT DEFINED ED_system)
IF(NOT DEFINED ED_system)
  SET(ED_system "UnknownSystem")
ENDIF(NOT DEFINED ED_system)

IF(NOT DEFINED ED_buildname)
  SET(ED_buildname "${ED_system}-${ED_gen}-${ED_config}")
ENDIF(NOT DEFINED ED_buildname)

IF(NOT DEFINED ED_buildtarget)
  IF("${ED_args}" MATCHES "TargetInstall")
    SET(ED_buildtarget "install")
  ENDIF("${ED_args}" MATCHES "TargetInstall")
  IF("${ED_args}" MATCHES "TargetPackage")
    SET(ED_buildtarget "package")
  ENDIF("${ED_args}" MATCHES "TargetPackage")
  # If there is no build target, then fine, just let ctest choose the
  # default "all" target... If you want your dashboard to build the
  # equivalent of "make install" or "make package" then set ED_buildtarget
  # to install or package... which will build "all" first and then build
  # the install or package target...
ENDIF(NOT DEFINED ED_buildtarget)

IF(NOT DEFINED ED_duration)
  SET(ED_duration 85555)
ENDIF(NOT DEFINED ED_duration)

IF(NOT DEFINED ED_interval)
  SET(ED_interval 299)
ENDIF(NOT DEFINED ED_interval)

IF(NOT DEFINED ED_projectcachescript)
  SET(ED_projectcachescript "${CTEST_SCRIPT_DIRECTORY}/${ED_sourcename}.CMakeCache.cmake")
ENDIF(NOT DEFINED ED_projectcachescript)

IF(NOT DEFINED ED_site)
  SITE_NAME(ED_site)
  STRING(TOLOWER "${ED_site}" ED_site)
ENDIF(NOT DEFINED ED_site)

IF(NOT DEFINED ED_verbose)
  IF("${ED_args}" MATCHES "Verbose")
    SET(ED_verbose 1)
  ENDIF("${ED_args}" MATCHES "Verbose")
ENDIF(NOT DEFINED ED_verbose)
IF(NOT DEFINED ED_verbose)
  SET(ED_verbose 0)
ENDIF(NOT DEFINED ED_verbose)

IF("${ED_args}" MATCHES "WrapJava")
  SET(ED_wrappers ${ED_wrappers} "WrapJava")
ENDIF("${ED_args}" MATCHES "WrapJava")
IF("${ED_args}" MATCHES "WrapPython")
  SET(ED_wrappers ${ED_wrappers} "WrapPython")
ENDIF("${ED_args}" MATCHES "WrapPython")
IF("${ED_args}" MATCHES "WrapTcl")
  SET(ED_wrappers ${ED_wrappers} "WrapTcl")
ENDIF("${ED_args}" MATCHES "WrapTcl")

IF(NOT DEFINED ED_clean)
  IF("${ED_args}" MATCHES "NoClean")
    SET(ED_clean 0)
  ENDIF("${ED_args}" MATCHES "NoClean")
ENDIF(NOT DEFINED ED_clean)
IF(NOT DEFINED ED_clean)
  SET(ED_clean 1)
ENDIF(NOT DEFINED ED_clean)

IF(NOT DEFINED ED_write_ED_info)
  IF("${ED_args}" MATCHES "NoWriteEDInfo")
    SET(ED_write_ED_info 0)
  ENDIF("${ED_args}" MATCHES "NoWriteEDInfo")
ENDIF(NOT DEFINED ED_write_ED_info)
IF(NOT DEFINED ED_write_ED_info)
  SET(ED_write_ED_info 1)
ENDIF(NOT DEFINED ED_write_ED_info)

IF(NOT DEFINED ED_start)
  IF("${ED_args}" MATCHES "NoStart")
    SET(ED_start 0)
  ENDIF("${ED_args}" MATCHES "NoStart")
ENDIF(NOT DEFINED ED_start)
IF(NOT DEFINED ED_start)
  SET(ED_start 1)
ENDIF(NOT DEFINED ED_start)

IF(NOT DEFINED ED_start_append)
  IF("${ED_args}" MATCHES "StartAppend")
    SET(ED_start_append 1)
  ENDIF("${ED_args}" MATCHES "StartAppend")
ENDIF(NOT DEFINED ED_start_append)
IF(NOT DEFINED ED_start_append)
  SET(ED_start_append 0)
ENDIF(NOT DEFINED ED_start_append)

IF(NOT DEFINED ED_update)
  IF("${ED_args}" MATCHES "NoUpdate")
    SET(ED_update 0)
  ENDIF("${ED_args}" MATCHES "NoUpdate")
ENDIF(NOT DEFINED ED_update)
IF(NOT DEFINED ED_update)
  SET(ED_update 1)
ENDIF(NOT DEFINED ED_update)

IF(NOT DEFINED ED_configure)
  IF("${ED_args}" MATCHES "NoConfigure")
    SET(ED_configure 0)
  ENDIF("${ED_args}" MATCHES "NoConfigure")
ENDIF(NOT DEFINED ED_configure)
IF(NOT DEFINED ED_configure)
  SET(ED_configure 1)
ENDIF(NOT DEFINED ED_configure)

IF(NOT DEFINED ED_build)
  IF("${ED_args}" MATCHES "NoBuild")
    SET(ED_build 0)
  ENDIF("${ED_args}" MATCHES "NoBuild")
ENDIF(NOT DEFINED ED_build)
IF(NOT DEFINED ED_build)
  SET(ED_build 1)
ENDIF(NOT DEFINED ED_build)

IF(NOT DEFINED ED_test)
  IF("${ED_args}" MATCHES "NoTest")
    SET(ED_test 0)
  ENDIF("${ED_args}" MATCHES "NoTest")
ENDIF(NOT DEFINED ED_test)
IF(NOT DEFINED ED_test)
  SET(ED_test 1)
ENDIF(NOT DEFINED ED_test)

IF(NOT DEFINED ED_coverage)
  IF("${ED_args}" MATCHES "AddCoverage")
    SET(ED_coverage 1)
  ENDIF("${ED_args}" MATCHES "AddCoverage")
ENDIF(NOT DEFINED ED_coverage)
IF(NOT DEFINED ED_coverage)
  SET(ED_coverage 0)
ENDIF(NOT DEFINED ED_coverage)

IF(NOT DEFINED ED_submit)
  IF("${ED_args}" MATCHES "NoSubmit")
    SET(ED_submit 0)
  ENDIF("${ED_args}" MATCHES "NoSubmit")
ENDIF(NOT DEFINED ED_submit)
IF(NOT DEFINED ED_submit)
  SET(ED_submit 1)
ENDIF(NOT DEFINED ED_submit)

# If adding style checking, set ED_cmd_KWStyle_args.
# Then the "style check" counts as the build and test steps.
# So if ED_kwstyle is 1, then turn off build and test steps below,
# assuming KWStyle dart output is produced by the ED_kwstyle step...
#
IF(NOT DEFINED ED_kwstyle)
  IF("${ED_args}" MATCHES "AddKWStyleCheck")
    SET(ED_kwstyle 1)
  ENDIF("${ED_args}" MATCHES "AddKWStyleCheck")
ENDIF(NOT DEFINED ED_kwstyle)
IF(NOT DEFINED ED_kwstyle)
  SET(ED_kwstyle 0)
ENDIF(NOT DEFINED ED_kwstyle)

IF(NOT DEFINED ED_cmd_KWStyle)
  FIND_PROGRAM(ED_cmd_KWStyle KWStyle
    "${ED_dir_mytests}/KWStyle ${ED_buildname}/Release"
    "${ED_dir_mytests}/KWStyle ${ED_buildname}/Debug"
    "${ED_dir_mytests}/Nightly/KWStyle ${ED_buildname}/Release"
    "${ED_dir_mytests}/Nightly/KWStyle ${ED_buildname}/Debug"
    "C:/Program Files/KWStyle 1.0/bin"
    "C:/Program Files (x86)/KWStyle 1.0/bin"
    "/usr/local/bin"
    "/usr/bin"
    )
ENDIF(NOT DEFINED ED_cmd_KWStyle)

IF(NOT DEFINED ED_cmd_KWStyle_args)
  SET(ED_cmd_KWStyle_args
    -lesshtml
    -html Utilities/KWStyle/html
    -dart . -1 1
    -xml Utilities/KWStyle/${ED_sourcename}KWStyle.kws.xml
    -D Utilities/KWStyle/${ED_sourcename}KWStyleFiles.txt
    -o Utilities/KWStyle/${ED_sourcename}KWStyleOverwrites.txt
    )
ENDIF(NOT DEFINED ED_cmd_KWStyle_args)

IF(${ED_kwstyle})
  SET(ED_build 0)
  SET(ED_test 0)
ENDIF(${ED_kwstyle})

# If adding a post-dashboard "upload my build" step, set
# ED_upload_files and ED_upload_destination. Additionally,
# ED_upload is only turned on *automatically* if doing a
# Nightly dashboard or explicitly requested via AddUpload.
#
IF(NOT DEFINED ED_upload)
  IF("${ED_model}" STREQUAL "Nightly")
  IF(NOT "${ED_upload_files}" STREQUAL "")
    SET(ED_upload 1)
  ENDIF(NOT "${ED_upload_files}" STREQUAL "")
  ENDIF("${ED_model}" STREQUAL "Nightly")

  IF("${ED_args}" MATCHES "AddUpload")
    SET(ED_upload 1)
  ENDIF("${ED_args}" MATCHES "AddUpload")
ENDIF(NOT DEFINED ED_upload)
IF(NOT DEFINED ED_upload)
  SET(ED_upload 0)
ENDIF(NOT DEFINED ED_upload)

# Did caller set ED_tag via script arguments?
#
IF(NOT DEFINED ED_tag)
  SET(re "^.*ED_tag=<([^>]+)>.*$")

  IF(ED_args MATCHES "${re}")
    STRING(REGEX REPLACE "${re}" "\\1" ED_tag "${ED_args}")
  ENDIF(ED_args MATCHES "${re}")
ENDIF(NOT DEFINED ED_tag)

IF(NOT DEFINED ED_source_repository_type)
  IF(NOT "${ED_source_repository}" STREQUAL "")
    IF(ED_source_repository MATCHES "^:(ext|pserver):")
      SET(ED_source_repository_type "cvs")
    ENDIF(ED_source_repository MATCHES "^:(ext|pserver):")
    IF(ED_source_repository MATCHES "^https*://")
      IF(ED_source_repository MATCHES "\\.git$")
        SET(ED_source_repository_type "git")
      ELSE(ED_source_repository MATCHES "\\.git$")
        SET(ED_source_repository_type "svn")
      ENDIF(ED_source_repository MATCHES "\\.git$")
    ENDIF(ED_source_repository MATCHES "^https*://")
    IF(ED_source_repository MATCHES "^git://")
      SET(ED_source_repository_type "git")
    ENDIF(ED_source_repository MATCHES "^git://")
    IF(NOT DEFINED ED_source_repository_type)
      IF(ED_source_repository MATCHES "\\.git$")
        SET(ED_source_repository_type "git")
      ENDIF(ED_source_repository MATCHES "\\.git$")
    ENDIF(NOT DEFINED ED_source_repository_type)
  ENDIF(NOT "${ED_source_repository}" STREQUAL "")
ENDIF(NOT DEFINED ED_source_repository_type)
IF(NOT DEFINED ED_source_repository_type)
  SET(ED_source_repository_type "unknown")
ENDIF(NOT DEFINED ED_source_repository_type)

IF(NOT DEFINED ED_tag_buildname)
  SET(ED_tag_buildname "")

  IF(NOT "${ED_tag}" STREQUAL "")
    SET(ED_tag_buildname "${ED_tag}")

    # For svn repositories, extract "tagname-0-1" from
    # "tags/tagname-0-1/blah/blah" -- this is only a
    # convention for tag and branch naming and may not
    # be followed in all repositories everywhere...
    #
    IF("${ED_source_repository_type}" STREQUAL "svn")
      SET(regex "^(tags|branches)/([^/]+).*$")
      IF("${ED_tag}" MATCHES "${regex}")
        STRING(REGEX REPLACE "${regex}" "\\2" ED_tag_buildname "${ED_tag}")
      ENDIF("${ED_tag}" MATCHES "${regex}")
    ENDIF("${ED_source_repository_type}" STREQUAL "svn")

    # For git repositories, extract "v0.1.2" from
    # "tags/v0.1.2" -- this is only a
    # convention for tag naming and may not
    # be followed in all repositories everywhere...
    #
    IF("${ED_source_repository_type}" STREQUAL "git")
      SET(regex "^tags/(.*)$")
      IF("${ED_tag}" MATCHES "${regex}")
        STRING(REGEX REPLACE "${regex}" "\\1" ED_tag_buildname "${ED_tag}")
      ENDIF("${ED_tag}" MATCHES "${regex}")
    ENDIF("${ED_source_repository_type}" STREQUAL "git")
  ENDIF(NOT "${ED_tag}" STREQUAL "")
ENDIF(NOT DEFINED ED_tag_buildname)


IF(NOT DEFINED ED_tag_dir)
  SET(ED_tag_dir "${ED_tag_buildname}")
ENDIF(NOT DEFINED ED_tag_dir)


IF(NOT DEFINED ED_test_parallel_level)
IF(NOT "${ED_args}" MATCHES "NoParallelTest")
  IF(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} GREATER 2.7)
    # Default value: assume 2 simultaneous tests are ok for most projects even
    # on a single CPU machine...
    #
    SET(ED_test_parallel_level 2)

    # If we have a clue about number of cores available, run *that* many tests
    # at once:
    #
    IF(NOT "$ENV{NUMBER_OF_PROCESSORS}" STREQUAL "")
      SET(ED_test_parallel_level "$ENV{NUMBER_OF_PROCESSORS}")
    ENDIF(NOT "$ENV{NUMBER_OF_PROCESSORS}" STREQUAL "")
  ENDIF(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} GREATER 2.7)

  # TODO:
  # Add code here to use CMake's GetProcessorCount in versions that have it...

ENDIF(NOT "${ED_args}" MATCHES "NoParallelTest")
ENDIF(NOT DEFINED ED_test_parallel_level)


# If ED_update_dir is not defined, it should have the same value as
# CTEST_SOURCE_DIRECTORY. Defer setting its default value until
# CTEST_SOURCE_DIRECTORY is defined in EasyDashboard.cmake.


# If ED_test_dir is not defined, it should have the same value as
# CTEST_BINARY_DIRECTORY. Defer setting its default value until
# CTEST_BINARY_DIRECTORY is defined in EasyDashboard.cmake.


ED_ECHO_ELAPSED_TIME("EasyDashboardVariables-BottomOfScript")
