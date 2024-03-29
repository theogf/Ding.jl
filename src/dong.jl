"Transform an expression to play a sound if execution took more than `min_duration` seconds"
function ding_expr(ex; min_duration::Real = options[].ding.minimum_duration)
    esc(quote
        ΔT = @elapsed result = $(ex)
        if ΔT > $(min_duration) # in seconds
            Ding.play(Ding.rand_sound_file(Ding.ding_files))
        end
        result
    end)
end

"Play a short sound after the execution is over"
macro ding(ex)
    ding_expr(ex; min_duration = 0)
end
