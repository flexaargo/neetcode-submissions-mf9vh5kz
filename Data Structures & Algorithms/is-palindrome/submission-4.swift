extension Character {
    var isAlphanumeric: Bool { isNumber || isLetter }

    func isSame(as other: Character) -> Bool {
        lowercased() == other.lowercased()
    }
}

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else { return true }
        
        var left = s.startIndex
        var right = s.index(before: s.endIndex)

        while left <= right {
            guard s[left].isAlphanumeric else {
                left = s.index(after: left)
                continue
            }
            guard s[right].isAlphanumeric else {
                right = s.index(before: right)
                continue
            }

            guard s[left].isSame(as: s[right]) else { return false }
            guard left != right else { return true }

            left = s.index(after: left)
            right = s.index(before: right)
        }

        return true
    }
}
