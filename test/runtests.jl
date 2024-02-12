using Ding
using Test

@testset "Ding.jl" begin
    @test_nowarn @ding a = 3
    @test_nowarn @elevator sleep(3)
end
