function play(file::AbstractString; loop = false)
    @assert isfile(file)
    ffplay() do exe
        args = ["--nodisp", "-v", "0", "--autoexit"]
        if loop
            push!(args, "--loop")
        end
        @info Cmd(vcat(exe, args, file))
        run(
            addenv(
                Cmd(vcat(exe, args, file)),
                "ALSA_CONFIG_PATH" => "/usr/share/alsa/alsa.conf",
                "ALSA_PLUGIN_DIR" => "/usr/lib/alsa-lib/",
            );
            wait = false,
        )
    end
end
