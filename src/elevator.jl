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
        ΔT = @elapsed result = $(ex)
        evaluated = true
        result
    end
end

macro elevator(ex)
    elevator_expr(ex)
end
