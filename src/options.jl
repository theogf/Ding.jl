@option struct DingOptions
    "Minimum evaluation duration for the ding sound to appear."
    minimum_duration::Float64 = 5.0
end

@option struct ElevatorOptions
    "Minimum evaluation duration for the elevator music to start."
    minimum_duration::Float64 = 10.0
    "How often is the evaluation completion checked for."
    refresh_rate::Float64 = 0.1
end

@option struct GeneralDingOptions
    ding::DingOptions = DingOptions()
    elevator::ElevatorOptions = ElevatorOptions()
end

"Reload the options given the `Ding.toml` file present in the current directory."
function refresh!(file::Union{Nothing,AbstractString} = nothing)
    options[] = from_toml_if_exists(GeneralDingOptions, @something file "Ding.toml")
end

const options =
    Ref{GeneralDingOptions}(from_toml_if_exists(GeneralDingOptions, "Ding.toml"))
