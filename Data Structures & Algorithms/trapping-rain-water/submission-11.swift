class Solution {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        var result = 0
        var leftMaxHeight = Array(repeating: 0, count: height.count)
        var rightMaxHeight = Array(repeating: 0, count: height.count)
        for i in 1..<height.count {
            leftMaxHeight[i] = max(leftMaxHeight[i-1], height[i-1])
        }
        for i in stride(from: height.count - 2, through: 0, by: -1) {
            rightMaxHeight[i] = max(rightMaxHeight[i+1], height[i+1])
        }
        for (i, iHeight) in height.enumerated() {
            let surroundingHeight = min(leftMaxHeight[i], rightMaxHeight[i])
            let iCavity = max(0, surroundingHeight - iHeight)
            result += iCavity
        }
        return result
    }
}
