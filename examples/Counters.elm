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
