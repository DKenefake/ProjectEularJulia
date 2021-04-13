
function collatz(k::Int)::Int
    i = 1

    while k != 1
        if k % 2 == 0
            k = Int(k/2)
        else
            k = 3*k +1
        end
        i += 1
    end

    return i
end

# C Style Brute Force
function problem_14(number::Int)

    max_index = 0
    max_value = -1

    for i ∈ 1:number

        seq_length = collatz(i)

        if seq_length > max_value
            max_value = seq_length
            max_index = i
        end

    end

    return max_index, max_value

end # function

# functional programming brute force
function problem_14_fp(number::Int)

    seq_lengths = map(collatz, 1:number)
    largest_index = argmax(seq_lengths)
    return largest_index, seq_lengths[largest_index]

end

function offset_collatz(k::Int)

    start = k
    steps = 0

    while k != 1
        if k % 2 == 0
            k = Int(k/2)
        else
            k = 3*k +1
        end

        steps += 1

        if k < start
            return steps, k
        end
    end

    return 1, 1
end

# C Style without brout force
function problem_14_offset(number::Int)

    values = zeros(Int, number)

    for i ∈ 1:number

        # if i is even we have a short cut answer
        if i % 2 == 0
            values[i] = values[div(i, 2)] + 1
            continue
        end
        offset, index = offset_collatz(i)
        values[i] = values[index] + offset
    end

    largest_index = argmax(values)
    return largest_index, values[largest_index]
end

# Benchmarks
# problem_14(1_000_000)         510.043 ms (0 allocations: 0 bytes)
# problem_14_fp(1_000_000)      514.014 ms (2 allocations: 7.63 MiB)
# problem_14_offset(1_000_000)   21.509 ms (2 allocations: 7.63 MiB)
