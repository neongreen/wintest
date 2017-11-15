module Main where

import CF
import System.Win32
import Foreign.C.String

main :: IO ()
main = do
  withCString "бла" $ \fname ->
    createFileA
      fname
      gENERIC_WRITE
      fILE_SHARE_NONE
      (maybePtr Nothing)
      cREATE_ALWAYS
      fILE_ATTRIBUTE_NORMAL
      (maybePtr Nothing)
  pure ()
