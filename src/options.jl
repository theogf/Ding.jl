@option struct DingOptions
    "Minimum evaluation duration for the ding sound to appear."
    minimum_duration::Float64 = 5.0
    file::String = "data/ding.mp3"
end

@option struct ElevatorOptions
    minimum_duration::Float64 = 10.0
    file::String = "data/elevator.mp3"
    "How often is the evaluation completion checked for."
    refresh_rate::Float64 = 0.1
end

@option struct GeneralDingOptions
    ding::DingOptions = DingOptions()
    elevator::ElevatorOptions = ElevatorOptions()
end

function refresh!(file::Union{Nothing,AbstractString} = nothing)
    options[] = from_toml_if_exists(GeneralDingOptions, @something file "Ding.toml")
end

const options =
    Ref{GeneralDingOptions}(from_toml_if_exists(GeneralDingOptions, "Ding.toml"))