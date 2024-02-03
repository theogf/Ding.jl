function ding_expr(ex)
    quote
        ΔT = @elapsed result = $(ex)
        if ΔT > Ding.options[].ding.minimum_duration # in seconds
            Ding.play(Ding.rand_sound_file(Ding.ding_files))
        end
        result
    end
end

macro ding(ex)
    ding_expr(ex)
end
