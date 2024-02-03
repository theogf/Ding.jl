"""
Plays an elevator music after an initial time and stops it when the evaluation
is finished.
"""
function elevator_expr(ex)
    quote
        evaluated = false
        start = time_ns()
        @async begin
            sleep(Ding.options[].elevator.minimum_duration)
            if !evaluated
                p = Ding.play(Ding.rand_sound_file(Ding.elevator_files))
            else
                return
            end
            while !evaluated
                sleep(Ding.options[].elevator.refresh_rate)
            end
            kill(p)
        end
        result = try
            $(ex)
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
