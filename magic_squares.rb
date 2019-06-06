require 'pry'

# Complete the formingMagicSquare function below.
def formingMagicSquare(s)
    all_possible_magic_squares = [
            [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
            [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
            [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
            [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
            [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
            [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
            [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
            [[2, 7, 6], [9, 5, 1], [4, 3, 8]],
    ]

    changes = all_possible_magic_squares.map do |magic_square|
        magic_square.flatten.zip(s.flatten).reduce(0) do |tot, values_of_squares|
            tot + (values_of_squares[0] - values_of_squares[1]).abs
        end
    end.min
end

formingMagicSquare([
    [4, 8, 2],
    [4, 5, 7],
    [6, 1, 6]
])


# formingMagicSquare([
#     [4, 9, 2],
#     [3, 5, 7],
#     [8, 1, 3]
# ])
