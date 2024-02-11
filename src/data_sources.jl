"List of files (with sources) played when using [`@ding`](@ref) or [`ding_repl`](@ref)."
const ding_files = Dict{String,Vector{String}}(
    "ping" => [
        "https://cdn.pixabay.com/download/audio/2022/03/15/audio_17cba0354b.mp3?filename=ping-82822.mp3",
        "c54d088fa2709e6b3c9ce87594a9187d0d5338d3a8c683271f9c4353a8ee8c91",
    ],
    "negative_beep" => [
        "https://cdn.pixabay.com/download/audio/2021/08/04/audio_c6ccf3232f.mp3?filename=negative_beeps-6008.mp3",
        "1ac25b4a2dfd6b1094fc5577c3561711097691549d7353c044786ee9771ba289",
    ],
    "stop" => [
        "https://cdn.pixabay.com/download/audio/2022/01/07/audio_d42d80c8e4.mp3?filename=stop-13692.mp3",
        "afe9b1021f8e7b92622d59ca3ee573809b7413d78efd9543a59af493d90bec5c",
    ],
    "90s_game" => [
        "https://cdn.pixabay.com/download/audio/2024/01/09/audio_28c453a8ff.mp3?filename=90s-game-ui-6-185099.mp3",
        "0b115c42feca136e69cd097d7e9c18e17f236eff1880517eda18a8db794f6387",
    ],
)

"List of files (with sources) played when using [`@elevator`](@ref) or [`elevator_repl`](@ref)."
const elevator_files = Dict{String,Vector{String}}(
    "jazz_music" => [
        "https://cdn.pixabay.com/download/audio/2022/10/25/audio_532a18db2a.mp3?filename=for-elevator-jazz-music-124005.mp3",
        "6a753b4c9d3a41f312d75eb8efa9580614e128e3807ee9af5a43fca1e49165dd",
    ],
    "bossa_nova" => [
        "https://cdn.pixabay.com/download/audio/2021/11/18/audio_d702fb7672.mp3?filename=elevator-music-bossa-nova-background-music-version-60s-10900.mp3",
        "c133c01caa3563654b79245fa1a0da1f82ebab82769bf6348ed039fe5d711490",
    ],
    "glass_wine" => [
        "https://cdn.pixabay.com/download/audio/2023/03/22/audio_f6a5ac5e7d.mp3?filename=glass-of-wine-143532.mp3",
        "2785c0300ba16e170e7237f654a36407ff4e8b51214972bbef13289f8584cfea",
    ],
    "lofi" => [
        "https://cdn.pixabay.com/download/audio/2022/06/25/audio_4ca472b499.mp3?filename=lofi-vibes-113884.mp3",
        "fd595ea5543fe2447bf33a7d491b0112a8eab3e676b74943f14ddda1141c97eb",
    ],
)

"Given a dictionary, get a random file and fetch its source."
function rand_sound_file(dict::Dict{String,String})
    sound = rand(keys(dict))
    return joinpath(@datadep_str(sound), sound * ".mp3")
end
