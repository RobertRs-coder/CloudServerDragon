import Fluent
import Vapor

func routes(_ app: Application) throws {
   
   try app.group("api") { builder in
   
        try builder.register(collection: AuxiliarController())
   }
    
}
