# C style
function problem_2(upper::Int)

    f_1, f_2, accum = 1, 1, 0

    while f_1 < upper

        f_1, f_2 = f_1 + f_2, f_1

        if f_1 % 2 == 0
            accum += f_1
        end
    end

    return accum
end

function problem_2(upper::Int)

    

end
