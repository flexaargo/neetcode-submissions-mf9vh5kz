class TimeMap {
    private var _values: [String: [(value: String, timestamp: Int)]] = [:]

    init() {

    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        _values[key, default: []].append((value, timestamp))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let arr = _values[key] else { return "" }

        var l = 0
        var r = arr.count - 1

        while l <= r {
            let mid = (l + r) / 2
            if arr[mid].timestamp == timestamp {
                return arr[mid].value
            }

            if arr[mid].timestamp < timestamp {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }

        guard arr.indices.contains(r) else { return "" }
        return arr[r].value
    }
}
