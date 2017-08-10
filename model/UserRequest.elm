module UserRequest exposing (fetchAll, listDecoder, decoder)

import Http
import Json.Decode
import Json.Decode.Pipeline

--

import UserModel exposing (..)

fetchAll : Cmd Msg
fetchAll =
    Http.send UserListLoaded (Http.get "/admin/users" listDecoder)

listDecoder : Json.Decode.Decoder (List User)
listDecoder =
    Json.Decode.list decoder

decoder : Json.Decode.Decoder User
decoder =
    Json.Decode.Pipeline.decode User
        |> Json.Decode.Pipeline.required "id" Json.Decode.int
        |> Json.Decode.Pipeline.required "email" Json.Decode.string
        |> Json.Decode.Pipeline.required "firstname" Json.Decode.string
        |> Json.Decode.Pipeline.required "lastname" Json.Decode.string