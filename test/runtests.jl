using FromDigits
using Test

# we use `===` instead of `==` to check also the type

@testset "FromDigits.jl" begin
    @testset "empty" begin
        @test fromdigits(Int[]) === 0
        @test fromdigits(Int32[]) === Int32(0)
        @test fromdigits(Int64, Int32[]) === Int64(0)
    end
    @testset "valid" begin
        @test fromdigits([0]) === 0
        @test fromdigits([0,0]) === 0
        @test fromdigits([1,2,3]) === 321
        @test fromdigits(0:9) === 9876543210
        @test fromdigits(UInt16, [1,2,3]) === 0x0141
        @test fromdigits(fill(1,19)) === 1111111111111111111
    end
    @testset "invalid" begin
        @testset "invalid digit" begin
            @test_throws ArgumentError fromdigits(1:19)
        end
        @testset "overflow" begin
            @test_throws OverflowError fromdigits(fill(1,20))
        end
    end
end
