import Vapor

struct AuxiliarController: RouteCollection {
    // MARK: - Override
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.get("version", use: needsUpdate)
    }
    // MARK: - Routes
    func needsUpdate(req: Request) async throws -> Version {

        guard let currentVersion: String = req.query["current"] else { 
            throw Abort(.badRequest)
         }

         let appStoreLiveVersion = "1.0.8"
         let needsUpdate = currentVersion < appStoreLiveVersion

        return Version(current: currentVersion, live: appStoreLiveVersion , needsUpdate: needsUpdate)
    }
}