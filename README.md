# FromDigits

<!-- ![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg) -->
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://FedericoStra.github.io/FromDigits.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://FedericoStra.github.io/FromDigits.jl/dev)
[![Build Status](https://github.com/FedericoStra/FromDigits.jl/workflows/CI/badge.svg)](https://github.com/FedericoStra/FromDigits.jl/actions)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)

```julia
julia> using FromDigits

julia> digits(739)
3-element Vector{Int64}:
 9
 3
 7

julia> fromdigits([9, 3, 7])
739

julia> fromdigits(fill(1, 19))
1111111111111111111

julia> fromdigits(fill(1, 20))
ERROR: OverflowError: 10 * 1111111111111111111 overflowed for type Int64
Stacktrace:
[...]

julia> fromdigits_unchecked(fill(1, 20))
-7335632962598440505

julia> fromdigits(BigInt, fill(1, 20))
11111111111111111111

julia> fromdigits(digits(UInt32, 12345))
0x00003039

julia> fromdigits(UInt16[0x1, 0x2, 0x3]; base=0x0010)
0x0321
```
