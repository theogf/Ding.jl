const ding_files = Dict{String,String}(
    "ping" => "https://cdn.pixabay.com/download/audio/2022/03/15/audio_17cba0354b.mp3?filename=ping-82822.mp3",
    "negative_beep" => "https://cdn.pixabay.com/download/audio/2021/08/04/audio_c6ccf3232f.mp3?filename=negative_beeps-6008.mp3",
    "stop" => "https://cdn.pixabay.com/download/audio/2022/01/07/audio_d42d80c8e4.mp3?filename=stop-13692.mp3",
    "90s_game" => "https://cdn.pixabay.com/download/audio/2024/01/09/audio_28c453a8ff.mp3?filename=90s-game-ui-6-185099.mp3",
)

const elevator_files = Dict{String,String}(
    "jazz_music" => "https://cdn.pixabay.com/download/audio/2022/10/25/audio_532a18db2a.mp3?filename=for-elevator-jazz-music-124005.mp3",
    "bossa_nova" => "https://cdn.pixabay.com/download/audio/2021/11/18/audio_d702fb7672.mp3?filename=elevator-music-bossa-nova-background-music-version-60s-10900.mp3",
    "glass_wine" => "https://cdn.pixabay.com/download/audio/2023/03/22/audio_f6a5ac5e7d.mp3?filename=glass-of-wine-143532.mp3",
    "lofi" => "https://cdn.pixabay.com/download/audio/2022/06/25/audio_4ca472b499.mp3?filename=lofi-vibes-113884.mp3",
)

function rand_sound_file(dict::Dict{String,String})
    sound = rand(keys(dict))
    return joinpath(@datadep_str(sound), sound * ".mp3")
end