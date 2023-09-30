//
//  PopulateInitialData.swift
//
//
//  Created by Roberto Rojo Sahuquillo on 30/9/23.
//

import Vapor
import Fluent

struct PopulateInitialData: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        // MARK: - News
        let news0 = News(title: "Super Dragon Ball Heroes: World Mission ya está disponible", body: "Bandai Namco ha anunciado el lanzamiento de Super Dragon Ball Heroes: World Mission para Nintendo Switch y PC (en formato digital). Este título es un videojuego estratégico de combates por cartas que incluye más de 1000 cartas y más de 350 personajes de toda la franquicia, incluyendo Dragon Ball Super, la saga Dragon Ball XENOVERSE, Dragon Ball FighterZ y muchas más.", imageURL: "/images/dragon_ball_heroes.jpeg")
        
        let news1 = News(title: "Lo que sabemos de: \"Dragon Ball Super: Broly\"", body: "Ya van quedando menos de 4 meses para el estreno en Japón de la próxima apuesta cinematográfica traída por Akira Toriyama, y desde Dragon Ball Wiki en español te hemos querido recopilar cuál ha sido la información que ha salido a flote de la ambiciosa \"Dragon Ball Super: Broly\".", imageURL: "/images/super_broly.jpeg")
        
        let news2 = News(title: "Vegetto llega a «Dragon Ball FighterZ»", body: "Bandai Namco Entertainment ha presentado a Vegetto (SSGSS) como nuevo personaje de Dragon Ball FighterZ. Tanto Vegetto (SSGSS) como Zamas (fusionado) estarán disponibles el 31 de mayo de 2018, con el lanzamiento del segundo contenido descargable.", imageURL: "/images/fighterz_vegetto.jpg")
        
        let news3 = News(title: "Dragon Ball FighterZ incluye nuevos modos de juego", body: "Bandai Namco Entertainment ha anunciado que los modos Batalla de equipos y Copa FighterZ estarán muy pronto disponibles en Dragon Ball FighterZ. Estos nuevos modos online han sido añadidos al juego gracias a una actualización gratuita que se publicó el pasado 9 de mayo. El primer evento de Batalla de equipos ya está disponible en PlayStation 4, Xbox One y PC.", imageURL: "/images/fighterz_game.jpg")
        
        try await [news0, news1, news2, news3].create(on: database)
        
    }

    func revert(on database: Database) async throws {
        
        try await News.query(on: database).delete()
        
    }
    
}
