module Main where

import CF
import System.Win32
import Foreign.C.String
import System.Environment
import qualified GHC.Foreign as GHC
import qualified GHC.IO.Encoding as GHC

main :: IO ()
main = do
  [x] <- getArgs
  let filename = if x == "eng" then "bla" else "бла"
  enc <- GHC.getFileSystemEncoding
  GHC.withCString enc filename $ \fname ->
    failIfWithRetry (==iNVALID_HANDLE_VALUE) "createFileA" $
      createFileA
        fname
        gENERIC_WRITE
        fILE_SHARE_NONE
        (maybePtr Nothing)
        cREATE_ALWAYS
        fILE_ATTRIBUTE_NORMAL
        (maybePtr Nothing)
  pure ()
