class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        let nums = Set(nums)
        var maxLength = 0
        var sequences: [Int: Int] = [:]

        for num in nums {
            let isStart = !nums.contains(num - 1)
            if isStart {
                sequences[num] = 1
                var current = num + 1
                while nums.contains(current) {
                    sequences[num, default: 1] += 1
                    current += 1
                }
                maxLength = max(maxLength, sequences[num, default: 1])
            }
        }

        return maxLength
    }
}
