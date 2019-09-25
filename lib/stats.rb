def mean(numbers)
    Float(numbers.reduce(0, :+)) / numbers.length
end

def median(numbers)
    sorted = numbers.sort
    return sorted[numbers.length / 2 - 1] if numbers.length.odd?
    p = numbers.length / 2 - 1
    Float(mean([sorted[p], sorted[p + 1]]))
end

def mode(numbers)
    table = Hash.new{ |h, k| h[k] = 0 }
    number_and_counts = numbers.reduce(table) { |memo, e| memo[e] += 1; memo }
    top_count = -1
    top = -1
    number_and_counts.each_pair do |k, n|
        if n > top_count
        top_count = n
        top = k
        end
    end
    top
end 

def standard_deviation(numbers)
    Math.sqrt(mean(numbers.map{ |n| (n - mean(numbers)) ** 2 }))
end 
