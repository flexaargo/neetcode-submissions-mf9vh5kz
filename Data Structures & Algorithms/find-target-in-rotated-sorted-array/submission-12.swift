class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            // print(left, ":", nums[left], mid, ":", nums[mid], right, ":", nums[right])
            if nums[mid] == target { return mid }

            if nums[mid] >= nums[left] {
                if target >= nums[left] && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if target > nums[mid] && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }

        if left == right, nums[left] == target {
            return left
        }

        return -1
    }
}
