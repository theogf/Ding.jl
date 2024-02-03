using Ding
using Documenter

DocMeta.setdocmeta!(Ding, :DocTestSetup, :(using Ding); recursive=true)

makedocs(;
    modules=[Ding],
    authors="theogf <theo.galyfajou@gmail.com> and contributors",
    sitename="Ding.jl",
    format=Documenter.HTML(;
        canonical="https://theogf.github.io/Ding.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/theogf/Ding.jl",
    devbranch="main",
)
