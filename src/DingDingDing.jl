module DingDingDing

using REPL
using Configurations
using DataDeps
using FFplay_jll: ffplay


include("data_sources.jl")

function __init__()
    orig_key = get(ENV, "DATADEPS_ALWAYS_ACCEPT", nothing)
    ENV["DATADEPS_ALWAYS_ACCEPT"] = true
    for file_list in (ding_files, elevator_files, ohno_files)
        for (name, (url, hash)) in pairs(file_list)
            register(
                DataDep(
                    name,
                    """"Downloading "$(name)" """,
                    url,
                    hash;
                    post_fetch_method = file ->
                        mv(file, joinpath(dirname(file), "$(name).mp3")),
                ),
            )
            @datadep_str(name)
        end
    end
    # Restore original state (false by default)
    ENV["DATADEPS_ALWAYS_ACCEPT"] = @something orig_key false
end

export @ding, @elevator, @ohno, ding_repl, elevator_repl, ohno_repl, full_repl

include("options.jl")

include("ding.jl")
include("repl.jl")
include("play.jl")
include("elevator.jl")
include("ohno.jl")

end
