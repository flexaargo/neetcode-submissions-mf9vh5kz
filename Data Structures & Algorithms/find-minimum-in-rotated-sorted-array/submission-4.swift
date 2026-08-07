class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard nums[0] > nums[nums.count - 1] else {
            return nums[0]
        }

        var l = 0
        var r = nums.count - 1
        while l < r {
            let m = (l + r) / 2
            let midNum = nums[m]

            if midNum >= nums[0] {
                l = m + 1
            } else {
                r = m
            }
        }
        return nums[l]
    }
}
