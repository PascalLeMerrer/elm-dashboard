module UserModel exposing (..)

import Http

type alias Model =
    {
        list: List User -- TODO rename to list
    }

type alias User =
    { id : Int
    , email : String
    , firstname : String
    , lastname : String
    }

type Msg =
    FetchUserList
    | UserListLoaded (Result Http.Error (List User))

init : Model
init =
    {
        list = []
    }
