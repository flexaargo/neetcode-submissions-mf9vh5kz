class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        guard heights.count > 0 else { return 0 }
        guard heights.count > 1 else { return heights[0] }
        var result: Int = 0
        var left = 0
        var right = heights.count - 1
        while left < right, left < heights.count {
            let areaHeight = min(heights[left], heights[right])
            let area = areaHeight * (right - left)
            result = max(area, result)
            if heights[left] > heights[right] {
                right -= 1
            } else { 
                left += 1
            }
        }
        return result
    }
}
