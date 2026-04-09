enum Constants {
    static let pairs: [Character: Character] = [
        "(": ")",
        "[": "]",
        "{": "}",
    ]
}

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []

        for p in s {
            let pairIndex = Constants.pairs.index(forKey: p)
            let isOpenParen = pairIndex != nil

            if isOpenParen {
                stack.append(p)
            } else {
                if let prev = stack.last, Constants.pairs[prev] == p {
                    stack.popLast()
                } else {
                    return false
                }
            }
        }

        return stack.isEmpty
    }
}
