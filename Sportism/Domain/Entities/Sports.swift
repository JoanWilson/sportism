import Foundation

public struct Sport: Codable {
    let idSport, strSport: String
    let strFormat: StrFormat
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}

public enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}

public struct Sports: Codable {
    var sports: [Sport]
}

extension Sports: Hashable {

    public static func == (lhs: Sports, rhs: Sports) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
}
