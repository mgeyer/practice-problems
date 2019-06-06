# https://www.hackerrank.com/challenges/picking-numbers/problem

# each number can be grouped with one above and one below
# I could represent each number going into a trio of buckets
# [ 01 11 12 22 23 33 34 44 45] etc
def pickingNumbers(a)
    # Write your code here
    possibles = []
    a.each do |i|
      index_at = i * 2 - 1
      possibles[index_at - 1] = (possibles[index_at - 1] || 0) + 1
      possibles[index_at]     = (possibles[index_at] || 0) + 1
      possibles[index_at + 1] = (possibles[index_at + 1] || 0) + 1
    end

    possibles.compact.max
end

puts pickingNumbers([4, 6, 5, 3, 3, 1])
