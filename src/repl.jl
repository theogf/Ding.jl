# To be called at startup:
function __init__()
    Base.atreplinit(ding_repl) do
    end
end

function ding_repl(activate::Bool = true)
    asts = Base.active_repl_backend.ast_transforms
    idx = findfirst(==(ding_expr), asts)
    if activate && isnothing(idx)
        pushfirst!(asts, ding_expr)
    else
        !activate && !isnothing(idx)
        deleteat!(asts, idx)
    end
    return
end