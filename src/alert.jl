function ding_expr(ex)
    quote
        ΔT = @elapsed result = $(ex)
        if ΔT > 1 # in seconds
            play("data/ding.mp3")
        end
        result
    end
end

macro ding(ex)
    ding_expr(ex)
end

function ding_expr(ex)
    quote
        ΔT = @elapsed result = $(ex)
        if ΔT > 1 # in seconds
            play("data/ding.mp3")
        end
        result
    end
end
