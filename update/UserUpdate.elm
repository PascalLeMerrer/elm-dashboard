module UserUpdate exposing (update)

import UserModel exposing (..)
import UserRequest exposing (fetchAll)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchUserList ->
            ( model
            , UserRequest.fetchAll
            )

        UserListLoaded (Ok users) ->
            ( { model | list = users }
            , Cmd.none
            )

        UserListLoaded (Err httpError) ->
            ( model -- TODO handle error
            , Cmd.none
            )

