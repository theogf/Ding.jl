"""
Plays an elevator music after an initial time and stops it when the evaluation
is finished.
"""
function elevator_expr(ex)
    quote
        evaluated = false
        start = time_ns()
        @async begin
            sleep(Ding.MIN_T)
            if !evaluated
                p = Ding.play("data/elevator.mp3")
            else
                return
            end
            while !evaluated
                sleep(0.1)
            end
            kill(p)
        end
        try
            result = $(ex)
        catch e
            evaluated = true
            rethrow(e)
        end
        evaluated = true
        result
    end
end

macro elevator(ex)
    elevator_expr(ex)
end
