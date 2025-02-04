using DingDingDing
using Test

@testset "DingDingDing.jl" begin
    @ding a = 3
    @elevator sleep(3)
    @test_throws DomainError @ohno sqrt(-1)
end
