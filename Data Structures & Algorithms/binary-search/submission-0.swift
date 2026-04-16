class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        guard nums.count > 1 else { 
            return nums[0] == target ? 0 : -1
        }

        let idx = nums.count / 2
        guard nums.indices.contains(idx) else { return -1 }
        if nums[idx] == target { 
            return idx
        } else if nums[idx] < target {
            let newStart = idx + 1
            let newEnd = nums.count - 1
            guard nums.indices.contains(newStart), nums.indices.contains(newEnd) else {
                return -1
            }
            let targetIdx = search(Array(nums[newStart...newEnd]), target)
            guard targetIdx > -1 else { return -1 }
            return targetIdx + newStart
        } else {
            let newStart = 0
            let newEnd = idx - 1
            guard nums.indices.contains(newStart), nums.indices.contains(newEnd) else {
                return -1
            }
            let targetIdx = search(Array(nums[newStart...newEnd]), target)
            guard targetIdx > -1 else { return -1 }
            return targetIdx + newStart
        }
    }
}

// 0 1 2 3
//         4 count
//     2     count / 2
//   1       (count / 2) - 1