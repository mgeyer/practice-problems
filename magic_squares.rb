require 'pry'

# Complete the formingMagicSquare function below.
def formingMagicSquare(s)
    max_changes = 0
    magic_square_found = isMagicSquare?(s)

    while(!magic_square_found) do
        max_changes += 1
        magic_square_found = magicSquaresWithChanges(s, max_changes)
    end

    max_changes
end

# Try all numbers and change by 1
def magicSquaresWithChanges(s, max_changes)
    if max_changes == 1
        squaresPlusOne(s).each do |new_square|
            return new_square if isMagicSquare?(new_square)
        end
        squaresMinusOne(s).each do |new_square|
            return new_square if isMagicSquare?(new_square)
        end
        return false
    else
        (squaresPlusOne(s) + squaresMinusOne(s)).each do |square|
            found_magic_square = magicSquaresWithChanges(square, max_changes - 1)
            return found_magic_square if found_magic_square
        end
    end

    return false
end

def squaresPlusOne(s)
    squares = []
    (0..2).each do |x|
        (0..2).each do |y|
            new_square = Marshal.load(Marshal.dump(s))
            new_square[x][y] = new_square[x][y] + 1
            squares << new_square
        end
    end
    squares
end

def squaresMinusOne(s)
    squares = []
    (0..2).each do |x|
        (0..2).each do |y|
            new_square = Marshal.load(Marshal.dump(s))
            new_square[x][y] = new_square[x][y] - 1
            squares << new_square
        end
    end
    squares
end

def isMagicSquare?(s)
    first_row = s[0][0] + s[0][1] + s[0][2]
    second_row = s[1][0] + s[1][1] + s[1][2]
    third_row = s[2][0] + s[2][1] + s[2][2]

    first_column = s[0][0] + s[1][0] + s[2][0]
    second_column = s[0][1] + s[1][1] + s[2][1]
    third_column = s[0][2] + s[1][2] + s[2][2]

    first_diagonal = s[0][0] + s[1][1] + s[2][2]
    second_diagonal = s[2][0] + s[1][1] + s[0][2]

    [first_row, second_row, third_row, first_column, second_column, third_column, first_diagonal, second_diagonal].uniq.length == 1
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
