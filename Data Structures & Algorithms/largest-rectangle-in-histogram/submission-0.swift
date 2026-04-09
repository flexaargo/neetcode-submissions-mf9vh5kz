class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var height: Int = heights[0]
        var largestArea: Int = height

        for start in 0..<heights.count {
            var shortest = heights[start]
            for current in start..<heights.count {
                let width = (current - start) + 1
                let currentHeight = heights[current]
                shortest = min(shortest, currentHeight)
                let area = width * shortest
                largestArea = max(area, largestArea)
            }
        }

        return largestArea
    }
}