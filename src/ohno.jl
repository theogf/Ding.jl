function ohno_expr(ex; _module = @__MODULE__)
    esc(quote
        try
            Core.eval($(_module), $(QuoteNode(ex)))
        catch e
            Ding.play(Ding.rand_sound_file(Ding.ohno_files))
            rethrow(e)
        end
    end)
end

macro ohno(ex)
    ohno_expr(ex; _module = __module__)
end
