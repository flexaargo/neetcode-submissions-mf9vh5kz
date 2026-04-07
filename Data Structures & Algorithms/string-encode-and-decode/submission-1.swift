private enum Constants {
    /// Separator between an output String and the output's length indicator
    static let separator: Character = "."
}

class Solution {
    func encode(_ strs: [String]) -> String {
        return strs.reduce(into: "") { partial, str in
            partial.append("\(str.count)\(Constants.separator)\(str)")
        }
    }

    func decode(_ str: String) -> [String] {
        var result: [String] = []

        var decodePosition = str.startIndex
        while decodePosition < str.endIndex {
            var separatorPosition = decodePosition
            while str[separatorPosition] != Constants.separator {
                separatorPosition = str.index(after: separatorPosition)
            }
            guard let outputLength = Int(str[decodePosition..<separatorPosition]) else { 
                decodePosition = str.index(after: separatorPosition)
                continue
            }

            let outputStartIndex = str.index(after: separatorPosition)
            let outputEndIndex = str.index(outputStartIndex, offsetBy: outputLength)
            result.append(String(str[outputStartIndex..<outputEndIndex]))
            decodePosition = outputEndIndex
        }

        return result
    }
}
