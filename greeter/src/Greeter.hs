module Greeter where

    import Data.Text.Titlecase
    import Hello
    
    greet :: String -> String
    greet who = 
        titlecase . hello $ who
        -- titlecase $
        -- "Hello, " who "!"
        -- "Hello, " ++ who ++ "!"
        -- "Hello, " <> who <> "!"