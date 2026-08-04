class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let chars = Array(s)
        var counts: [Character: Int] = [:]
        var maxLen = 0

        var l = 0
        for r in chars.indices {
            counts[chars[r], default: 0] += 1

            while (r - l + 1) - (counts.values.max() ?? 0) > k {
                // shift right
                counts[chars[l], default: 0] -= 1
                l += 1
            }

            let newWindowLen = r - l + 1
            maxLen = max(maxLen, newWindowLen)
        }

        return maxLen
    }
}
