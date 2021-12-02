import Foundation

// MARK: - ShopDataModel
struct ShopDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [shop]
}

// MARK: - Datum
struct shop: Codable {
    let id: Int
    let name: String
    let deliveryTime: Int
    let rating: Double
    let comments: Int
    let distance: Double
    let isFree: Bool
    let deliveryFee: Int
    let image: String
}
