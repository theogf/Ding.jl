"Transform an expression to play a sound if execution took more than `min_duration` seconds"
function ding_expr(ex; min_duration::Real = options[].ding.minimum_duration)
    esc(quote
        ΔT = @elapsed result = $(ex)
        if ΔT > $(min_duration) # in seconds
            DingDingDing.play(DingDingDing.rand_sound_file(DingDingDing.ding_files))
        end
        result
    end)
end

"Play a short sound after the execution is over"
macro ding(ex, macro_call = true)
    ding_expr(ex; min_duration = macro_call ? 0 : options[].ding.minimum_duration)
end
