using DingDingDing
using Documenter

DocMeta.setdocmeta!(DingDingDing, :DocTestSetup, :(using DingDingDing); recursive=true)

makedocs(;
    modules=[DingDingDing],
    authors="theogf <theo.galyfajou@gmail.com> and contributors",
    sitename="DingDingDing.jl",
    format=Documenter.HTML(;
        canonical="https://theogf.github.io/DingDingDing.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/theogf/DingDingDing.jl",
    devbranch="main",
)
