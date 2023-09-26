import Vapor 

struct Version: Content {
    let current: String
    let live: String
    let needsUpdate: Bool
}