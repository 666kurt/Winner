import Foundation

// MARK: - RadioStation
struct RadioStation: Codable {
    let success, hasNext: Bool
    let total: Int
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case success
        case hasNext = "has_next"
        case total, data
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let slug, name: String
    let cityID, countryID: Int
    let httpsURL: [HTTPSURL]

    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case cityID = "city_id"
        case countryID = "country_id"
        case httpsURL = "https_url"
    }
}

// MARK: - HTTPSURL
struct HTTPSURL: Codable {
    let isfile: Int
    let codec: Codec
    let url: String

    enum CodingKeys: String, CodingKey {
        case isfile, codec, url
    }
}

enum Codec: String, Codable {
    case aac = "aac"
    case mp3 = "mp3"
}
