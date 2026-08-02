class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else { return true }

        var lhs = s.startIndex
        var rhs = s.index(s.endIndex, offsetBy: -1)

        while lhs < rhs {
            let left = s[lhs]
            guard left.isLetter || left.isNumber else {
                lhs = s.index(lhs, offsetBy: 1)
                continue
            }
            let right = s[rhs]
            guard right.isLetter || right.isNumber else {
                rhs = s.index(rhs, offsetBy: -1)
                continue
            }
            if left.lowercased() != right.lowercased() {
                return false
            }

            lhs = s.index(lhs, offsetBy: 1)
            rhs = s.index(rhs, offsetBy: -1)
        }

        return true
    }
}
