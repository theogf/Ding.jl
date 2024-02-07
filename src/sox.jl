function play(file::AbstractString)
    ffplay() do exe
        withenv(
            "ALSA_CONFIG_PATH" => "/usr/share/alsa/alsa.conf",
            "ALSA_PLUGIN_DIR" => "/usr/lib/alsa-lib/",
        ) do
            run(`$(exe) -nodisp -v 0 -autoexit $(file)`; wait = false)
        end
    end
end
