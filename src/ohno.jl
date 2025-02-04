function ohno_expr(ex; _module = @__MODULE__)
    esc(quote
        try
            Core.eval($(_module), $(QuoteNode(ex)))
        catch e
            DingDingDing.play(DingDingDing.rand_sound_file(DingDingDing.ohno_files))
            rethrow(e)
        end
    end)
end

macro ohno(ex)
    ohno_expr(ex; _module = __module__)
end
