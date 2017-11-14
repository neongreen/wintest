{-# LANGUAGE CPP #-}

module CF where

import System.Win32

#include <windows.h>

foreign import ccall unsafe "windows.h CreateFileA"
  createFileA :: LPCTSTR -> AccessMode -> ShareMode -> LPSECURITY_ATTRIBUTES -> CreateMode -> FileAttributeOrFlag -> HANDLE -> IO HANDLE
