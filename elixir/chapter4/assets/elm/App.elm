module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- MODEL


type alias Model =
    { scale : String
    , inputTemp : Int
    , celciusTemp : Int
    , kelvinTemp : Int
    , fahrenheitTemp : Int
    }


model =
    { scale = "Metric"
    , inputTemp = 0
    , celciusTemp = 0
    , kelvinTemp = 0
    , fahrenheitTemp = 0
    }



-- MESSAGES


type Scale
    = Celcius
    | Fahrenheit
    | Kelvin


type Msg
    = SetScale String
    | SetTemp String



-- VIEW


view : Model -> Html Msg
view model =
    let
        scales =
            [ Celcius, Fahrenheit, Kelvin ]
    in
        div []
            [ text "Please select the temperature scale?"
            , select [ onInput SetScale ]
                (scaleList)
            , br [] []
            , text "Please enter the temperature: "
            , input [ placeholder "temperature", onInput SetTemp ] []
            , br [] []
            , text (String.concat [ "Temperature in Celcius: ", (toString model.celciusTemp) ])
            , br [] []
            , text (String.concat [ "Temperature in Fahrenheit: ", (toString model.fahrenheitTemp) ])
            , br [] []
            , text (String.concat [ "Temperature in Kelvin: ", (toString model.kelvinTemp) ])
            ]


scaleList : List (Html msg)
scaleList =
    [ option [ value "Celcius" ] [ text "Metric" ]
    , option [ value "Fahrenheit" ] [ text "Imperial" ]
    , option [ value "Kelvin" ] [ text "Kelvin" ]
    ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetScale value ->
            ( { model | scale = value }, Cmd.none )

        SetTemp value ->
            ( { model | inputTemp = (Result.withDefault 0 (String.toInt value)) }, Cmd.none )



-- MAIN


main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }
