class Solution {
    struct Key: Hashable {
        var counts: [Character: Int]
    }

    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var results = [[String]]()
        var indices = [Key: Int]()

        for str in strs {
            let key = Key(counts: getCounts(str))
            if let index = indices[key] {
                results[index].append(str)
            } else {
                results.append([str])
                indices[key] = results.count - 1
            }
        }

        return results
    }

    private func getCounts(_ s: String) -> [Character: Int] {
        s.reduce(into: [:]) { partial, c in
            partial[c] = partial[c, default: 0] + 1
        }
    }
}
