# Ding

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://theogf.github.io/Ding.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://theogf.github.io/Ding.jl/dev/)
[![Build Status](https://github.com/theogf/Ding.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/theogf/Ding.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/theogf/Ding.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/theogf/Ding.jl)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)

Sounds alerts when long-duration commands are run on the REPL

## Macros

There are for now three exported macros: `@ding`, `@ohno` and `@elevator`:

- `@ding ex` will play a random bell sound at the end of the execution of `ex`.
- `@elevator ex` will play a random elevator music while `ex` is running.
- `@ohno ex` will play an error sound if the `ex` process is failing

Examples

```julia
@ding sleep(3)
@elevator sleep(10)
@ohno sqrt(-1)
```

## REPL integration

To avoid having to write these macros everywhere, there are two functions to directly integrate the sounds to your workflow: `ding_repl(activate=true)` `ohno_repl` and `elevator_repl(activate=true)`.
If the execution in the REPL takes more than a (configurable) time, a ding will play at the end and an elevator music will play during the execution respectively.

## Configuration

Although meager, the different options such as the minimum running time for the sound trigger and the refresh rate can be configured in a `Ding.toml` file present in the current working folder.

## Details

All sounds will be downloaded in the first execution of `using Ding`. These files are royalty free and come from the sound bank [pixabay.com](https://pixabay.com).
The sounds are played using `FFplay` which is a library of [`FFmpeg`](https://pixabay.com).

## TODO

- [ ] Allow to add new music files -> [Source for many open-source sound files](https://pixabay.com/sound-effects/search/beeps/)
- [ ] Allow to play another song when process finishes
- [ ] Introduce fading between songs
- [ ] Add "failure" sound, when execution returns an error
- [ ] Ensure order of sound playing (elevator -> ding)
- [ ] Search for config file in more different paths.
- [ ] Add more options such as
  - [ ] Exclude/Include list of sounds
  - [ ] Sound level
