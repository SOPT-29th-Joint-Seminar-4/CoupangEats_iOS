
import Foundation

// MARK: - MenuDataModel
struct MenuDataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [menu]
}

// MARK: - menu
struct menu: Codable {
    let id: Int
    let name, menu: String
    let price, likes: Int
    let datumDescription: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id, name, menu, price, likes
        case datumDescription = "description"
        case image
    }
}
