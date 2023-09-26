import Vapor

struct AuxiliarController: RouteCollection {
    // MARK: - Override
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.get("version", use: needsUpdate)
    }
    // MARK: - Routes
    func needsUpdate(req: Request) async throws -> String {
        return "La version es 1.0.0"
    }
}