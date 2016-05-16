# elm-layout
This library contains several affordances for laying out Html using flexbox.

There are two modules `Flex` and `Flow`.

`Flex` provides funtions that help with laying out elements with the flexbox hints. 
For more information about the flexbox hints use [scotch.io's wonderful tutorial](https://scotch.io/tutorials/a-visual-guide-to-css3-flexbox-properties) and [playground](https://demos.scotch.io/visual-guide-to-css3-flexbox-flexbox-playground/demos/)

`Flow` provide some help with simpler layouts.

Flex Example: 

```elm
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
```

Flow Example: 

```elm
import Flow exposing (..)
import Html exposing (..)
import Html.Attributes as Attr
import Html.Events exposing (onClick)
import Html.App as App

main = 
  App.beginnerProgram 
    { model = Model 0 0 
    , update = update 
    , view = view }

-- MODEL 

type alias Model = 
  { left : Int, right : Int}

-- UPDATE 

type Msg = Increment | Decrement

updateCounter msg model = 
  case msg of
    Increment -> model + 1 
    Decrement -> model - 1

type PairMsg = Left Msg | Right Msg

update msg {left, right} = 
  case msg of
    Left m -> Model (updateCounter m left) right
    Right m -> Model left (updateCounter m right)

counter m =
  flow down 
    [ button [onClick Increment] [text "+"] 
    , div [] [text (toString m)] 
    , button [onClick Decrement] [text "-"] 
    ]

view model = 
  flow right
    [ App.map Left (counter model.left)
    , App.map Right (counter model.right)
    ]
```
