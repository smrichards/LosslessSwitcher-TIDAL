import Foundation

class TidalParser {
    static func parseConsoleLogs(_ logs: [SimpleConsole]) -> [CMPlayerStats] {
        var stats = [CMPlayerStats]()
        
        for log in logs {
            if log.message.contains("Decoder got") && log.message.contains("AudioMetadata") {
                let components = log.message.components(separatedBy: " ")
                if let channelsIndex = components.firstIndex(of: "channels:"),
                   let bitsPerSampleIndex = components.firstIndex(of: "bitsPerSample:"),
                   let sampleRateIndex = components.firstIndex(of: "sampleRate:"),
                   channelsIndex + 1 < components.count,
                   bitsPerSampleIndex + 1 < components.count,
                   sampleRateIndex + 1 < components.count {
                    
                    let channels = Int(components[channelsIndex + 1].trimmingCharacters(in: .punctuationCharacters)) ?? 0
                    let bitDepth = Int(components[bitsPerSampleIndex + 1].trimmingCharacters(in: .punctuationCharacters)) ?? 0
                    let sampleRate = Int(components[sampleRateIndex + 1].trimmingCharacters(in: .punctuationCharacters)) ?? 0
                    
                    let stat = CMPlayerStats(sampleRate: sampleRate, bitDepth: bitDepth, channels: channels, priority: 1)
                    stats.append(stat)
                }
            }
        }
        
        return stats
    }
}
