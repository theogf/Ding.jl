"""
Rewrite an expression such that an elevator music start playing after an initial time and stops it when the evaluation
is finished.
"""
function elevator_expr(ex; min_duration::Real = options[].elevator.minimum_duration)
    quote
        _evaluated = Ref(false)
        start = time_ns()
        @async begin
            sleep($(min_duration))
            if !_evaluated[]
                p = Ding.play(Ding.rand_sound_file(Ding.elevator_files))
            else
                return
            end
            while !_evaluated[]
                sleep($(options[].elevator.refresh_rate))
            end
            kill(p)
        end
        result = try
            $(ex)
        catch e
            _evaluated[] = true
            rethrow(e)
        end
        _evaluated[] = true
        result
    end
end

"Plays an elevator music along the given expression"
macro elevator(ex)
    elevator_expr(ex; min_duration = 0)
end
