import Foundation

struct SimpleConsole {
    let date: Date
    let message: String
}

enum EntryType: String {
    case tidal = "Tidal"
}

class Console {
    static let tidalLogPath = "~/Library/Logs/TIDAL/player.log"
    
    static func getRecentEntries(type: EntryType) throws -> [SimpleConsole] {
        var messages = [SimpleConsole]()
        
        let expandedPath = NSString(string: tidalLogPath).expandingTildeInPath
        guard let logContents = try? String(contentsOfFile: expandedPath, encoding: .utf8) else {
            throw NSError(domain: "Console", code: 1, userInfo: [NSLocalizedDescriptionKey: "Unable to read Tidal log file"])
        }
        
        let logLines = logContents.components(separatedBy: .newlines)
        
        let threeSecondsAgo = Date().addingTimeInterval(-3)
        
        for line in logLines.reversed() {
            if let entry = parseTidalLogLine(line) {
                if entry.date >= threeSecondsAgo {
                    messages.append(entry)
                } else {
                    break
                }
            }
        }
        
        return messages
    }
    
    private static func parseTidalLogLine(_ line: String) -> SimpleConsole? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "(EEE MMM dd yyyy HH:mm:ss)"
        
        let components = line.components(separatedBy: ") ")
        guard components.count >= 2,
              let dateString = components.first,
              let date = dateFormatter.date(from: dateString + ")") else {
            return nil
        }
        
        let messageParts = components.dropFirst().joined(separator: ") ").components(separatedBy: " - ")
        let message = messageParts.count > 1 ? messageParts[1] : messageParts[0]
        
        return SimpleConsole(date: date, message: message)
    }
}
