import Foundation

// MARK: - BannerDataModel
struct BannerDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [banner]
}

// MARK: - Datum
struct banner: Codable {
    let id: Int
    let image: String
}
