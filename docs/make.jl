using FromDigits
using Documenter

DocMeta.setdocmeta!(FromDigits, :DocTestSetup, :(using FromDigits); recursive=true)

makedocs(;
    modules=[FromDigits],
    authors="Federico Stra <stra.federico@gmail.com> and contributors",
    repo="https://github.com/FedericoStra/FromDigits.jl/blob/{commit}{path}#{line}",
    sitename="FromDigits.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://FedericoStra.github.io/FromDigits.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/FedericoStra/FromDigits.jl",
)
