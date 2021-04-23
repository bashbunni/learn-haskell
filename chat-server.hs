-- credit: https://wiki.haskell.org/Implement_a_chat_server

module Main where

import System.IO
import Network.Socket

main :: IO ()
main = do
    sock <- socket AF_INET Stream 0
    setSocketOption sock ReuseAddr 1 -- create socket
    bind sock (SockAddrInet 4242 (tupleToHostAddress (0x7f,0x0,0x0,0x1))) -- specify the port to use
    listen sock 2 -- set max connections
    mainLoop sock  -- our function to implement (functionality lives here)

mainLoop :: Socket -> IO ()
mainLoop sock = do
    connection <- accept sock
    runConn connection
    mainLoop sock -- basically a while true but recursive bc haskell

runConn :: (Socket, SockAddr) -> IO ()
runConn (sock, _) = do
    handle <- socketToHandle sock ReadWriteMode 
    hSetBuffering handle NoBuffering
    hPutStrLn handle "bashbunni was here\n"
    hClose handle



