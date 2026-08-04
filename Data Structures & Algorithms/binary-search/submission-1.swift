class Solution {
    func search(
        _ nums: [Int], 
        _ target: Int
    ) -> Int {
        return search(nums, target, 0, nums.count - 1) ?? -1
    }

    private func search(
        _ nums: [Int],
        _ target: Int,
        _ startIndex: Int,
        _ endIndex: Int
    ) -> Int? {
        if startIndex == endIndex, nums[startIndex] == target { return startIndex }
        guard startIndex < endIndex else { return nil }

        let midIndex = ((endIndex - startIndex) / 2) + startIndex
        if nums[midIndex] == target { 
            return midIndex
        }

        if target < nums[midIndex] {
            return search(nums, target, startIndex, midIndex - 1)
        }

        return search(nums, target, midIndex + 1, endIndex)
    }
}
