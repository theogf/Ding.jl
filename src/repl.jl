# To be called at startup:
"Enable a ding sound on all REPL commands taking more than a certain time."
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

"Enable elevator music on all REPL commands taking more than a certain time."
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
