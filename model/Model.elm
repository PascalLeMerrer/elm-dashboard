module Model exposing (..)

import Http
import Navigation

--

import UserModel


type alias Model =
    { authenticated : Bool
    , currentPage : Page
    , email : String
    , history : List Navigation.Location
    , serverError : Bool
    , users : UserModel.Model
    }

type Msg
    = UrlChange Navigation.Location
    | Logout
    | Display Page
    | UserMsg UserModel.Msg


type Page
    = UserAdmin
    | IngredientAdmin


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { authenticated = True
      , currentPage = UserAdmin
      , email = ""
      , history = [ location ]
      , serverError = False
      , users = UserModel.init
      }
    , Cmd.none
    )