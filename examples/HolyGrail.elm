import Flow exposing (..)
import Html exposing (text, div)
import Html.Attributes as Attr

full = "100%"

box w h color = 
  div [Attr.style [("background", color), ("width", w), ("height", h)]] 

main = 
  flow down 
    [ box full "10%" "red" []
    , box full "80%" "white" 
      [ flow right 
        [ box "30%" full "green" []
        , box "50%" full "white" []
        , box "20%" full "green" []
        ]
      ]
    , box full "10%" "blue" []
    ]