# elm-layout
This library contains several affordances for laying out Html using flexbox.

There are two modules `Flex` and `Flow`.

`Flex` provides funtions that help with laying out elements with the flexbox hints. 
For more information about the flexbox hints use [scotch.io's wonderful tutorial](https://scotch.io/tutorials/a-visual-guide-to-css3-flexbox-properties) and [playground](https://demos.scotch.io/visual-guide-to-css3-flexbox-flexbox-playground/demos/)

`Flow` provide some help with simpler layouts.

Example: 

```elm
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
```
