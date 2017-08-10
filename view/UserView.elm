module UserView exposing (view)

import Html exposing (..)
--import Html.Events exposing (onInput, onClick)
--import Html.Attributes as Attr exposing (id, class)

--

import UserModel exposing (User)
import Model exposing (..)

view : Model -> Html Msg
view model =
    div []
        (List.map viewUser model.users.list)

viewUser : User -> Html Msg
viewUser user =
    p [] [ text user.email ]
