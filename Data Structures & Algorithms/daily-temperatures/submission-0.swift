class Solution {
    struct Pair {
        var temp: Int
        var index: Int
    }
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: temperatures.count)
        var stack: [Pair] = []
        for i in temperatures.indices {
            let temp = temperatures[i]
            while let last = stack.last, temp > last.temp {
                result[last.index] = i - last.index
                stack.removeLast()
            }
            stack.append(Pair(temp: temp, index: i))
        }
        return result
    }
}
