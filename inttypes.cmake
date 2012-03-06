include(CheckTypeSize)
include(CheckIncludeFile)
include(CheckCXXSourceRuns)

#check the wchar_t length
check_type_size(wchar_t LEMON_WCHAR_SIZE)

#check the bytes endian
check_cxx_source_runs("int main(){short i = 1; return (int)((char*)&i)[1] == 1?0:1;}" LEMON_SYSTEM_BIGEND)

#check the standard files
check_include_file(stdbool.h LEMON_HAS_STDBOOL_H)
check_include_file(inttypes.h LEMON_HAS_INITTYPES_H)
check_include_file(stdint.h LEMON_HAS_STDINT_H)


#check and define fix length int types
if(WIN32)
   SET(SBYTE_T "__int8")
  
  SET(BYTE_T "unsigned __int8")
  
  SET(INT16_T "__int16")
  
  SET(UINT16_T "unsigned __int16")
  
  SET(INT32_T "__int32")
  
  SET(UINT32_T "unsigned __int32")
  
  SET(INT64_T "__int64")
  
  SET(UINT64_T "unsigned __int64")
else()
  SET(SBYTE_T "int8_t")
  
  SET(BYTE_T "uint8_t")
  
  SET(INT16_T "int16_t")
  
  SET(UINT16_T "uint16_t")
  
  SET(INT32_T "int32_t")
  
  SET(UINT32_T "uint32_t")
  
  SET(INT64_T "int64_t")
  
  SET(UINT64_T "uint64_t")
endif()

CHECK_TYPE_SIZE(${SBYTE_T} INT8_T_SIZEOF)


IF(NOT ${INT8_T_SIZEOF} EQUAL 1)
  MESSAGE(FATAL_ERROR "not found int8_t")
ENDIF()

CHECK_TYPE_SIZE(${BYTE_T} UINT8_T_SIZEOF)

IF(NOT ${UINT8_T_SIZEOF} EQUAL 1)
  MESSAGE(FATAL_ERROR "not found uint8_t")
ENDIF()

CHECK_TYPE_SIZE(${INT16_T} INT16_T_SIZEOF)

IF(NOT ${INT16_T_SIZEOF} EQUAL 2)
  MESSAGE(FATAL_ERROR "not found int16_t")
ENDIF()

CHECK_TYPE_SIZE(${UINT16_T} UINT16_T_SIZEOF)

IF(NOT ${UINT16_T_SIZEOF} EQUAL 2)
  MESSAGE(FATAL_ERROR "not found uint16_t")
ENDIF()

CHECK_TYPE_SIZE(${INT32_T} INT32_T_SIZEOF)

IF(NOT ${INT32_T_SIZEOF} EQUAL 4)
  MESSAGE(FATAL_ERROR "not found int32_t")
ENDIF()

CHECK_TYPE_SIZE(${UINT32_T} UINT32_T_SIZEOF)

IF(NOT ${UINT32_T_SIZEOF} EQUAL 4)
  MESSAGE(FATAL_ERROR "not found int32_t")
ENDIF()

CHECK_TYPE_SIZE(${INT64_T} INT64_T_SIZEOF)

IF(NOT ${INT64_T_SIZEOF} EQUAL 8)
  MESSAGE(FATAL_ERROR "not found int64_t")
ENDIF()

CHECK_TYPE_SIZE(${UINT64_T} UINT64_T_SIZEOF)

IF(NOT ${UINT64_T_SIZEOF} EQUAL 8)
  MESSAGE(FATAL_ERROR "not found uint64_t")
ENDIF()