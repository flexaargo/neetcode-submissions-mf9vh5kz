class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [] }

        let nums = nums.sorted()
        var triplets = Set<[Int]>()

        for (i, n) in nums.enumerated() {
            if nums.indices.contains(i - 1), nums[i - 1] == n { continue }

            var left = i + 1
            var right = nums.count - 1

            while left < right {
                let sum = n + nums[left] + nums[right]
                if sum > 0 {
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    triplets.insert([n, nums[left], nums[right]])
                    left += 1
                    while nums[left] == nums[left - 1] && left < right {
                        left += 1
                    }
                }
            }
        }

        return Array(triplets)
    }
}
