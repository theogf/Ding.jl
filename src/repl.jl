# To be called at startup:
"Enable a ding sound on all REPL commands taking more than a certain time."
ding_repl(activate::Bool = true) = add_to_repl(ding_expr, activate)

"Enable elevator music on all REPL commands taking more than a certain time."
elevator_repl(activate::Bool = true) = add_to_repl(elevator_expr, activate)

"Enable elevator music on all REPL commands taking more than a certain time."
ohno_repl(activate::Bool = true) = add_to_repl(ohno_expr, activate)

function add_to_repl(f, activate::Bool)
    asts = Base.active_repl_backend.ast_transforms
    idx = findfirst(==(f), asts)
    if activate && isnothing(idx)
        pushfirst!(asts, f)
    elseif !activate && !isnothing(idx)
        deleteat!(asts, idx)
    end
    return
end
