extension String {
    private static let operators: Set<String> = ["+", "-", "*", "/"]
    var isOperator: Bool { Self.operators.contains(self) }
}

func operation(for op: String) -> ((Int, Int) -> Int)? {
    guard op.isOperator else { return nil }
    switch op {
    case "+":
        return { $0 + $1 }
    case "-":
        return { $0 - $1 }
    case "*":
        return { $0 * $1 }
    case "/":
        return { $0 / $1 }
    default:
        return nil
    }
}

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        guard tokens.count > 1 else { return Int(tokens[0]) ?? 0 }

        var values = [Int]()
        for token in tokens {
            if let op = operation(for: token), let rhs = values.popLast(), let lhs = values.popLast() {
                values.append(op(lhs, rhs))
            } else {
                values.append(Int(token) ?? 0)
            }
        }
        return values.last ?? 0
    }
}
