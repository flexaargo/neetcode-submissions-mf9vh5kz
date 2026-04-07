class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        var result: [Int] = []
        
        for i in 0..<nums.count {
            var product = 1
            for j in 0..<nums.count where j != i {
                product *= nums[j]
            }
            result.append(product)
        }
        
        return result
    }
}
