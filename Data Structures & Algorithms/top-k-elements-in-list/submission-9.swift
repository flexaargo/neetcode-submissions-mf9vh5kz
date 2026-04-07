class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard !nums.isEmpty else { return [] }

        var buckets: [Int: Set<Int>] = [:]
        // counts of some num (key)
        var counts: [Int: Int] = [:]

        for num in nums {
            if let currentCount = counts[num] {
                buckets[currentCount]?.remove(num)
            }
            counts[num, default: 0] += 1
            guard let count = counts[num] else { 
                assertionFailure("Expected count for num: \(num)")
                return []
            }

            buckets[count, default: []].insert(num)
        }

        var results: [Int] = []

        var count = nums.count
        while results.count < k {
            results.append(contentsOf: buckets[count, default: []].prefix(k))
            count -= 1
        }
        return results
    }
}
