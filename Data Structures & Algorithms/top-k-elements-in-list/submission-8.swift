class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard !nums.isEmpty else { return [] }
        var highest = 0
        var counts = [Int: Int]()
        var buckets = [Int: Set<Int>]()

        for num in nums {
            counts[num] = counts[num, default: 0] + 1
            guard let count = counts[num] else { return [] }

            if count - 1 > 0 {
                buckets[count - 1]?.remove(num)
            }
            buckets[count, default: []].insert(num)
            if count > highest {
                highest = count
            }
        }

        var result = [Int]()
        while result.count < k {
            result.append(contentsOf: buckets[highest, default: []].prefix(k))
            highest -= 1
        }

        return result
    }
}
