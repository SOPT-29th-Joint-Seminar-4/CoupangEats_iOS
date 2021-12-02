import Foundation

// MARK: - LikeDataModel
struct LikeDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: like
}

// MARK: - DataClass
struct like: Codable {
    let isLike: Bool
}
