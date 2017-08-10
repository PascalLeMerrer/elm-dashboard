module View exposing (view)

import BulmaClasses exposing (bulma)
import Html exposing (..)
import Html.Events exposing (onInput, onClick)
import Html.Attributes as Attr exposing (id, class)
import Model exposing (..)
import Utils exposing (classes)
import UserView


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ viewHeader model
        , viewMainContent model
        ]


viewHeader : Model -> Html Msg
viewHeader model =
    nav [ class "navbar" ]
        [ div [ class "navbar-brand" ]
            [ a []
                [ text "Bleu Vanille - Admin" ]
            ]
        , div [ class "navbar-end" ]
            [ a [ class "txtright", onClick Logout ]
                [ text "Se déconnecter" ]
            ]
        ]


viewMenu : Model -> Html Msg
viewMenu model =
    div [ classes [ bulma.columns.column.container, bulma.columns.column.width.is2 ] ]
        [ aside [ class bulma.menu.container ]
            [ p [ class bulma.menu.label ]
                [ text "Admin" ]
            , ul [ class bulma.menu.list ]
                [ li []
                    [ a [ onClick <| Display UserAdmin ]
                        [ text "Utilisateurs" ]
                    ]
                , li []
                    [ a [ onClick <| Display IngredientAdmin ]
                        [ text "Ingrédients" ]
                    ]
                ]
            ]
        ]


viewMainContent : Model -> Html Msg
viewMainContent model =
    div [ class bulma.columns.container ]
        [ viewMenu model
        , div [ class bulma.columns.column.container ]
            [ selectPage model ]
        ]


selectPage : Model -> Html Msg
selectPage model =
    case model.currentPage of
        UserAdmin ->
            UserView.view model

        IngredientAdmin ->
            viewIngredients model


viewIngredients : Model -> Html Msg
viewIngredients model =
    p [] [ text "ingredients view" ]