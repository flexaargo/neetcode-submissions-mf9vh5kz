typealias Operation = (Int, Int) -> Int
let ops: [String: Operation] = [
    "+": { $0 + $1 },
    "-": { $0 - $1 },
    "*": { $0 * $1 },
    "/": { $0 / $1 },
]

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []

        for token in tokens {
            if let operation = ops[token] {
                if let y = stack.popLast(), let x = stack.popLast() {
                    stack.append(operation(x, y))
                } else {
                    assertionFailure("Expected to have 2 elements in stack")
                    return Int.max
                }
            } else if let val = Int(token) {
                stack.append(val)
            } else {
                assertionFailure("Expected either operation or Int for token: \(token)")
                return Int.max
            }
        }

        guard let last = stack.popLast(), stack.isEmpty else { return Int.max }
        return last
    }
}
