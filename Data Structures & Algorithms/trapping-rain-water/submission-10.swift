class Solution {
  func trap(_ height: [Int]) -> Int {
    let maxLeft: [Int] = {
      var maxes = Array(repeating: 0, count: height.count)
      for i in height.indices {
        if i > 0 {
          maxes[i] = max(maxes[i-1], height[i])
        } else {
          maxes[i] = height[i]
        }
      }
      return maxes
    }()

    let maxRight: [Int] = {
      var maxes = Array(repeating: 0, count: height.count)
      for i in stride(from: height.count - 1, through: 0, by: -1) {
        if i < (maxes.count - 1) {
          maxes[i] = max(maxes[i+1], height[i])
        } else {
          maxes[i] = height[i]
        }
      }
      return maxes
    }()

    var totalVolume: Int = 0

    for i in height.indices {
      let h = height[i]
      let wallHeight = min(maxLeft[i], maxRight[i])
      let volume = max(0, wallHeight - h)
      totalVolume += volume
    }

    return totalVolume
  }
}
