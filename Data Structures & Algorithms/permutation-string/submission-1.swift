class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var counts = {
            var counts = [Character: Int]()
            for c in s1 {
                counts[c, default: 0] += 1
            }
            return counts
        }()

        let chars = Array(s2)
        var l: Int? = nil
        for r in 0..<chars.count {
            let rightChar = chars[r]

            while let _l = l, _l < r && counts[rightChar, default: 0] == 0 {
                let leftChar = chars[_l]
                counts[leftChar, default: 0] += 1
                let newLeft = _l + 1
                if newLeft == r {
                    l = nil
                } else {
                    l = newLeft
                }
            }
            
        //    print("left: \(l.map { chars[$0] } ?? "0"), right: \(rightChar), \(counts)")
            if let rightCharCount = counts[rightChar] {
                let newCount = rightCharCount - 1
                if newCount <= 0 {
                    counts.removeValue(forKey: rightChar)
                } else {
                    counts[rightChar] = newCount
                }
                
                if l == nil {
                    l = r
                }

                if counts.isEmpty {
                    return true
                }
                continue
            }
        }

        return counts.isEmpty
    }
}
