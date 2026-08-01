class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var counts = [Character: Int]()
        for c in s {
            counts[c, default: 0] += 1
        }

        for c in t {
            if let val = counts[c] {
                let newVal = val - 1
                if newVal == 0 {
                    counts.removeValue(forKey: c)
                } else {
                    counts[c] = newVal
                }
            } else {
                return false
            }
        }

        return counts.isEmpty
    }
}
