module Prepexam.Finances exposing (..)
import List exposing (filter)
import List exposing (minimum)

minimumGain: List Float -> Maybe Float
minimumGain list =
    filter (\x -> x > 0) list |> minimum