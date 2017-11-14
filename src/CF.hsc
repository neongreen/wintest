{-# LANGUAGE CPP #-}

module CF where

#include <windows.h>

foreign import ccall unsafe "windows.h CreateFileW"
  c_CreateFile :: LPCTSTR -> AccessMode -> ShareMode -> LPSECURITY_ATTRIBUTES -> CreateMode -> FileAttributeOrFlag -> HANDLE -> IO HANDLE
