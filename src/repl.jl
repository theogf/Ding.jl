# To be called at startup:
function ding_repl(activate::Bool = true)
    asts = Base.active_repl_backend.ast_transforms
    idx = findfirst(==(ding_expr), asts)
    if activate && isnothing(idx)
        pushfirst!(asts, ding_expr)
    elseif !activate && !isnothing(idx)
        deleteat!(asts, idx)
    end
    return
end

function elevator_repl(activate::Bool = true)
    asts = Base.active_repl_backend.ast_transforms
    idx = findfirst(==(elevator_expr), asts)
    if activate && isnothing(idx)
        pushfirst!(asts, elevator_expr)
    elseif !activate && !isnothing(idx)
        deleteat!(asts, idx)
    end
    return
end
