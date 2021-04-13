
function sieve_erasthanes(n::Int)
       isprime = ones(Bool, n)
       isprime[1] = false
       for i in 2:(isqrt(n)+1)
           if isprime[i]
              for j in (i*i):i:n
                isprime[j] = false
              end
           end
      end
     return filter(x -> isprime[x], 1:n) # filter using anonymous function
end

# C Style brute force with prime upper_bound
function problem_7(number::Int)::Int
  # we know that the n^th prime number has the following ineqality associated
  # P_n < n * ()
  upper_bound = 13

  if number > 6
    upper_bound = ceil(Int, number * (log(number) + log(log(number))))
  end

  primes = sieve_erasthanes(upper_bound)
  return primes[number + 1]
end # function

# Benchmarks
# problem_7(10001)      182.200 μs (7 allocations: 1.06 MiB)
