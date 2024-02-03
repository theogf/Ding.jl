# Ding

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://theogf.github.io/Ding.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://theogf.github.io/Ding.jl/dev/)
[![Build Status](https://github.com/theogf/Ding.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/theogf/Ding.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/theogf/Ding.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/theogf/Ding.jl)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)

Sounds alerts when long-duration commands are run on the REPL

## TODO

- [X] Hook onto the REPL See [Alert.jl](https://github.com/haberdashPI/Alert.jl/blob/main/src/alert_repl.jl)
- [X] Define options for alerts
- [X] Download music files automatically
- [ ] Allow to add new music files -> [Source for many open-source sound files](https://pixabay.com/sound-effects/search/beeps/)
- [ ] Install `sox` automatically for every platform see [Artifacts page](https://pkgdocs.julialang.org/v1/artifacts/)
- [ ] Allow to access `sox` options ([sox docs](https://linux.die.net/man/1/sox))
- [ ] Alternative to play sounds: [Sound.jl](https://github.com/JeffFessler/Sound.jl) to take raw sinus values
