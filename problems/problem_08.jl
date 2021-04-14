data =
    "73167176531330624919225119674426574742355349194934" *
    "96983520312774506326239578318016984801869478851843" *
    "85861560789112949495459501737958331952853208805511" *
    "12540698747158523863050715693290963295227443043557" *
    "66896648950445244523161731856403098711121722383113" *
    "62229893423380308135336276614282806444486645238749" *
    "30358907296290491560440772390713810515859307960866" *
    "70172427121883998797908792274921901699720888093776" *
    "65727333001053367881220235421809751254540594752243" *
    "52584907711670556013604839586446706324415722155397" *
    "53697817977846174064955149290862569321978468622482" *
    "83972241375657056057490261407972968652414535100474" *
    "82166370484403199890008895243450658541227588666881" *
    "16427171479924442928230863465674813919123162824586" *
    "17866458359124566529476545682848912883142607690042" *
    "24219022671055626321111109370544217506941658960408" *
    "07198403850962455444362981230987879927244284909188" *
    "84580156166097919133875499200524063689912560717606" *
    "05886116467109405077541002256983155200055935729725" *
    "71636269561882670428252483600823257530420752963450"

function problem_8(number)
    # convert to int array
    number_vals = map( i-> parse(Int, i), collect(data))
    largest_product = 0
    for i ∈ 1:(length(number_vals)-number)

        product = reduce(*, number_vals[i:i+number-1])
        # println(product)
        if product > largest_product
            largest_product = product
        end
    end
    return largest_product
end # function

# functional programming brute force approach
function problem_8_fp(number)
    # parse the data
    number_vals = map(i-> parse(Int, i), collect(data))
    # calculate all products that could be
    product_values = map(i->reduce(*, number_vals[i:i+number-1]) ,1:length(number_vals) - number)
    return maximum(product_values)
end

function problem_8_informed(number)
    #use the fact that zeros, you know  uhhh zero the multiplication
    number_vals = map( i-> parse(Int, i), collect(data))
    zero_indices = findall(value-> value == 0, number_vals)

    zero_sandwiches = zip(zero_indices[1:(end-1)], zero_indices[2:end])
    largest_product = 0

    for intervals in zero_sandwiches
        # we only care if this intervale is larger then 13 otherwise it is just zero
        # if intervals[2] - intervals[1] > number
        for i ∈ intervals[1]:(intervals[2]-number)
            product = reduce(*, number_vals[i:i+number-1])
            if product > largest_product
                largest_product = product
            end
        end
        # end
    end

    return largest_product
end

# Benchmarks
# problem_8(13)             254.800 μs (5159 allocations: 293.08 KiB)
# problem_8_fp(13)          48.100 μs (999 allocations: 205.17 KiB)
# problem_8_informed(13)    99.000 μs (2287 allocations: 117.44 KiB)
