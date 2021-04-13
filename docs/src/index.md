```@meta
CurrentModule = FromDigits
```

# FromDigits

Documentation for [FromDigits.jl](https://github.com/FedericoStra/FromDigits.jl).

## Examples

```jldoctest
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

## Library

```@index
```

### Public

```@autodocs
Modules = [FromDigits]
Private = false
```

### Private

```@autodocs
Modules = [FromDigits]
Public = false
```
