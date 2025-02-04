# To be called at startup:
"Enable a ding sound on all REPL commands taking more than a certain time."
ding_repl(activate::Bool = true) = add_to_repl(add_ding, activate)
add_ding(ex) = :(@ding $ex false)

"Enable elevator music on all REPL commands taking more than a certain time."
elevator_repl(activate::Bool = true) = add_to_repl(add_elevator, activate)
add_elevator(ex) = :(@elevator $ex false)

"Enable elevator music on all REPL commands taking more than a certain time."
ohno_repl(activate::Bool = true) = add_to_repl(add_ohno, activate)
add_ohno(ex) = :(@ohno $ex)

"Toggle all the repl hooks at the same time."
function full_repl(activate::Bool = true, emoji_prompt::Bool = true)
  ding_repl(activate)
  elevator_repl(activate)
  ohno_repl(activate)
  if emoji_prompt
      first(Base.active_repl.interface.modes).prompt = "julia📢>"
  end
  return
end

current_ast_transforms() = isdefined(Base, :active_repl_backend) ? Base.active_repl_backend.ast_transforms : REPL.repl_ast_transforms

function add_to_repl(f, activate::Bool)
    asts = current_ast_transforms()
    idx = findfirst(==(f), asts)
    if activate && isnothing(idx)
        pushfirst!(asts, f)
    elseif !activate && !isnothing(idx)
        deleteat!(asts, idx)
    end
    return
end
