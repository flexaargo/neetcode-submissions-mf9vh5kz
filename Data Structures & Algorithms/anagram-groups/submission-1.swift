class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups: [([Character: Int], [String])] = []
        outter: for str in strs {
            var strCounts = [Character: Int]()
            for c in str {
                strCounts[c, default: 0] += 1
            }

            inner: for (index, (counts, _)) in groups.enumerated() {
                if counts == strCounts {
                    groups[index].1.append(str)
                    continue outter
                }
            }

            groups.append((strCounts, [str]))
        }
        return groups.map { $0.1 }
    }
}
