class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        guard temperatures.count > 1 else { return result }

        var stack: [(temp: Int, index: Int)] = []
        for (i, dayTemp) in temperatures.enumerated() {
            if var last = stack.last {
                while dayTemp > last.temp {
                    let days = i - last.index
                    result[last.index] = days
                    stack.removeLast()
                    if let newLast = stack.last {
                        last = newLast
                        continue
                    }
                    break
                }
            }
            stack.append((dayTemp, i))
        }

        return result
    }
}
