module Update exposing (..)

import Navigation
import Model exposing (..)
import UserModel
import UserUpdate


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Logout ->
            ( { model | authenticated = False }
            , Navigation.load "/admin"
            )

        UrlChange location ->
            ( { model | history = location :: model.history }
            , Cmd.none
            )

        Display page ->
            ( { model | currentPage = page }
            , Cmd.none
            )

        UserMsg usrMsg ->
            let
                (updatedUserModel, userCmd) = UserUpdate.update usrMsg model.users
            in
                ({ model | users = updatedUserModel }
                , Cmd.map UserMsg userCmd
                )