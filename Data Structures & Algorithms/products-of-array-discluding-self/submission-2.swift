class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let leftProducts = {
            var arr = Array(repeating: 1, count: nums.count)
            for i in 1..<nums.count {
                if i == 1 {
                    arr[i] = nums[i-1]
                    continue
                }
                arr[i] = nums[i-1] * arr[i-1]
            }
            return arr
        }()
        let rightProducts = {
            var arr = Array(repeating: 1, count: nums.count)
            for i in stride(from: nums.count - 2, through: 0, by: -1) {
                if i == nums.count - 1 {
                    arr[i] = nums[i+1]
                    continue
                }
                arr[i] = nums[i+1] * arr[i+1]
            }
            return arr
        }()

        var result = Array(repeating: 0, count: nums.count)
        for i in 0..<result.count {
            result[i] = leftProducts[i] * rightProducts[i]
        }
        return result
    }
}
