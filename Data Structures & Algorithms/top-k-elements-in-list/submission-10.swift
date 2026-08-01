class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count > k else { return nums }
        var result = (0..<k).map { $0 }
        var frequencies = [Int: Int]()
        for n in nums {
            frequencies[n, default: 0] += 1
            let frequency = frequencies[n, default: 0]
            if result.contains(n) { continue }
            for (index, r) in result.enumerated() {
                if frequencies[r, default: 0] < frequency {
                    result[index] = n
                    break
                }
            }
        }
        return result
    }
}
