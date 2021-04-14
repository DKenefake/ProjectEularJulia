
# functional programming
function problem_5_fp(number::Int)
    primes = filter(is_prime, 1:number)
    factors = map(i->floor(Int, log(number)/log(i)), primes)
    return reduce(*,map(i -> i[1]^i[2], zip(primes, factors)))
end
