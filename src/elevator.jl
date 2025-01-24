"""
Rewrite an expression such that an elevator music start playing after an initial time and stops it when the evaluation
is finished.
"""
function elevator_expr(
    ex;
    min_duration::Real = options[].elevator.minimum_duration,
    _module = @__MODULE__
)
    esc(quote
        _evaluated = Threads.Atomic{Bool}(false)
        start = time_ns()
        @async begin
            sleep($(min_duration))
            if !_evaluated[]
                p = Ding.play(Ding.rand_sound_file(Ding.elevator_files); loop = true)
            else
                return
            end
            while !_evaluated[]
                sleep($(options[].elevator.refresh_rate))
            end
            kill(p)
        end
        result = try
            Core.eval($(_module), $(QuoteNode(ex)))
        finally
            _evaluated[] = true
        end
        result
    end)
end

"Plays an elevator music along the given expression"
macro elevator(ex, macro_call)
    elevator_expr(ex; min_duration = macro_call ? 0 : options[].elevator.minimum_duration, _module = __module__)
end
