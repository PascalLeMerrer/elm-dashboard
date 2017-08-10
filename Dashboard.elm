module AdminDashboard exposing (main)

import Navigation

import Model exposing (..)
import Subscriptions
import Update
import View


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = Model.init
        , view = View.view
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        }