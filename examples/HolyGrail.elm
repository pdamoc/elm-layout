import Flex exposing (..)
import Html exposing (..)

box grow color = 
  div [design <| flex grow 0 "auto" <| [("background", color)]] []

main = 
  let
    header = box 1  "red"
    footer = box 1 "black"
    nav = box 1 "blue" 
    ads = box 1 "yellow" 
    content = box 4 "green" 

    mainSection = design <| row <| flex 8 0 "auto" []

  in 
    div [design <| column fullscreen]
      [ header
      , div [mainSection] [nav, content, ads]
      , footer
      ]
