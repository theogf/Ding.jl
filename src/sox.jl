function play(file::AbstractString)
    run(`play $(file)`; wait = false)
end
