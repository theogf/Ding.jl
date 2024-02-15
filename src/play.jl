function play(file::AbstractString)
    ffplay() do exe
        run(
            addenv(
                `$(exe) -nodisp -v 0 -autoexit $(file)`,
                "ALSA_CONFIG_PATH" => "/usr/share/alsa/alsa.conf",
                "ALSA_PLUGIN_DIR" => "/usr/lib/alsa-lib/",
            );
            wait = false,
        )
    end
end
