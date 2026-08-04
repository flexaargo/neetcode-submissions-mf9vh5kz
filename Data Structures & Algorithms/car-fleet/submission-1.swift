class Solution {
    func carFleet(
        _ target: Int,
        _ position: [Int],
        _ speed: [Int]
    ) -> Int {
        var fleetTimes = [Double]()
        let travelers = zip(position, speed).sorted(by: { $0.0 > $1.0 })

        for (position, speed) in travelers {
            let travelDistance = target - position
            let travelTime = Double(travelDistance) / Double(speed)
            if let prevFleetTime = fleetTimes.last {
                if travelTime > prevFleetTime {
                    fleetTimes.append(travelTime)
                }
            } else {
                fleetTimes.append(travelTime)
            }
        }
        
        return fleetTimes.count
    }
}
