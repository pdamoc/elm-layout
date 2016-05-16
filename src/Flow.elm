module Flow exposing 
  (flow, Direction, up, down, left, right)
{-| Module Flex 

# Types 

@docs Direction 

# Flow
@docs flow, Direction, up, down, left, right

-}

import Html exposing (Html, div)
import Flex exposing (..)

{-| Represents a `flow` direction for a list of nodes.
-}
type Direction = DUp | DDown | DLeft | DRight 


{-| Have a list of nodes flow in a particular direction.
The `Direction` starts from the first node in the list.

    flow right [a,b,c]

        +---+---+---+
        | a | b | c |
        +---+---+---+
-}
flow : Direction -> List (Html msg) -> Html msg
flow dir ns =
  let 
    common = design --<< alignItemsCenter
    flex = 
      case dir of 
        DUp -> columnReverse
        DDown -> column
        DLeft -> rowReverse
        DRight -> row
  in 
    div [common <| flex []] ns

{-|-}
up : Direction
up =
  DUp


{-|-}
down : Direction
down =
  DDown


{-|-}
left : Direction
left =
  DLeft


{-|-}
right : Direction
right =
  DRight