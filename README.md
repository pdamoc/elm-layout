# elm-layout
This library contains several affordances for laying out Html using flexbox.

There are two modules `Flex` and `Flow`.

`Flex` provides funtions that help with laying out elements with the flexbox hints. 
For more information about the flexbox hints use [scotch.io's wonderful tutorial](https://scotch.io/tutorials/a-visual-guide-to-css3-flexbox-properties) and [playground](https://demos.scotch.io/visual-guide-to-css3-flexbox-flexbox-playground/demos/)

`Flow` provide some help with simpler layouts.

Example: 

```elm
import Flex exposing (..)
import Html exposing (text, div)
import Html.Attributes as Attr

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
```
