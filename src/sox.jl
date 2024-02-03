function play(file::AbstractString)
    @async run(`play -q $(file)`)
end