module FromDigits

export fromdigits, fromdigits_unchecked

"""
Converts from digits to an integer. This is the inverse function of `digits`.

Returns the integer represented by the `digits` in the `base`.
The result is of type `T`, which defaults to `D`.

See also [`fromdigits_unchecked`](@ref).
"""
function fromdigits end

"""
    fromdigits(digits::AbstractVector{D}; base::D=D(10)) where D<:Integer

Returns the integer represented by the `digits` in the `base`. The result is of type `D`.
"""
fromdigits(digits::AbstractVector{D}; base::D=D(10)) where D<:Integer =
    fromdigits(D, digits; base=base)

"""
    fromdigits(T::Type{<:Integer}, digits::AbstractVector{D}; base::D=D(10)) where D<:Integer

Returns the integer represented by the `digits` in the `base`. The result is of type `T`.
"""
function fromdigits(T::Type{<:Integer}, digits::AbstractVector{D}; base::D=D(10)) where D<:Integer
    all(d -> d >= 0, digits) || all(d -> d <= 0, digits) || throw(ArgumentError("All the digits must have the same sign"))
    x = zero(T)
    for i in reverse(eachindex(digits))
        d = digits[i]
        abs(d) < base || throw(ArgumentError("Invalid digit $d for given base $base"))
        base_x = T(Base.Checked.checked_mul(base, x))
        x = T(Base.Checked.checked_add(base_x, d))
    end
    x
end

"""
Converts from digits to an integer. This is the inverse function of `digits`.

This function does not check the validity of the digits nor overflows in the computations.

See also [`fromdigits`](@ref).
"""
function fromdigits_unchecked end

fromdigits_unchecked(digits::AbstractVector{D}; base::D=D(10)) where D<:Integer =
    fromdigits_unchecked(D, digits; base=base)

function fromdigits_unchecked(T::Type{<:Integer}, digits::AbstractVector{D}; base::D=(10)) where D<:Integer
    # return foldr((d, x) -> base*x + d, digits; init=zero(T))
    # return evalpoly(base, digits)
    x = zero(T)
    for i in reverse(eachindex(digits))
        x = base*x + digits[i]
    end
    x
end

end
