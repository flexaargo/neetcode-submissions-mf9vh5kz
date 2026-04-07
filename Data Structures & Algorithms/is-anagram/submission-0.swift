class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        var sCounts = counts(s)

        for c in t {
            guard let count = sCounts[c], count > 0 else { return false }
            sCounts[c] = count - 1
        }

        return true
    }

    private func counts(_ s: String) -> [Character: Int] {
        s.reduce(into: [:]) { partial, element in 
            partial[element] = partial[element, default: 0] + 1
        }
    }
}
