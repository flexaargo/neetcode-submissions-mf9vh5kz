class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        guard heights.count > 1 else { return 0 }
        var maximum = 0

        var leftPtr = 0
        var rightPtr = heights.count - 1

        while leftPtr < rightPtr {
            let leftHeight = heights[leftPtr]
            let rightHeight = heights[rightPtr]

            let width = rightPtr - leftPtr
            let area = min(leftHeight, rightHeight) * width
            maximum = max(area, maximum)

            print(leftHeight, rightHeight, width, area)

            if leftHeight < rightHeight {
                leftPtr += 1
            } else {
                rightPtr -= 1
            }
        }

        return maximum
    }
}
