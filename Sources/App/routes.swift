import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    try app.group("api") { builder in
        
        try builder.group(APIKeyMiddleware()) { builder in
            
            try builder.register(collection: AuxiliarController())
            try builder.register(collection: AuthController())
            try builder.register(collection: CharactersController())
            try builder.register(collection: NewsController())
            try builder.register(collection: EpisodesController())
        
        }
    }
}
