{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_greeter (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/vinitrinh/.cabal/bin"
libdir     = "/home/vinitrinh/.cabal/lib/x86_64-linux-ghc-8.0.2/greeter-0.1.0.0-inplace-greeter-tests"
dynlibdir  = "/home/vinitrinh/.cabal/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/vinitrinh/.cabal/share/x86_64-linux-ghc-8.0.2/greeter-0.1.0.0"
libexecdir = "/home/vinitrinh/.cabal/libexec/x86_64-linux-ghc-8.0.2/greeter-0.1.0.0"
sysconfdir = "/home/vinitrinh/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "greeter_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "greeter_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "greeter_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "greeter_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "greeter_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "greeter_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)