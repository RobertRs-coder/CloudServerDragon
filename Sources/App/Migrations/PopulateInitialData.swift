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
        // MARK: - Characters
        let roshi = Character(name: "Maestro Roshi", description: "Es un maestro de artes marciales que tiene una escuela, donde entrenará a Goku y Krilin para los Torneos de Artes Marciales. Aún en los primeros episodios había un toque de tradición y disciplina, muy bien representada por el maestro. Pero Muten Roshi es un anciano extremadamente pervertido con las chicas jóvenes, una actitud que se utilizaba en escenas divertidas en los años 80. En su faceta de experto en artes marciales, fue quien le enseñó a Goku técnicas como el Kame Hame Ha", favorite: false, imageURL: "https://cdn.alfabetajuega.com/alfabetajuega/2020/06/Roshi.jpg?width=300", type: "hero")
        let satan = Character(name: "Mr. Satán", description: "Mr. Satán es un charlatán fanfarrón, capaz de manipular a las masas. Pero en realidad es cobarde cuando se da cuenta que no puede contra su adversario como ocurrió con Androide 18 o Célula. Siempre habla más de la cuenta, pero en algún momento del combate empieza a suplicar. Androide 18 le ayuda a fingir su victoria a cambio de mucho dinero. Él acepta el trato porque no podría soportar que todo el mundo le diera la espalda por ser un fraude.", favorite: false, imageURL: "https://cdn.alfabetajuega.com/alfabetajuega/2020/06/dragon-ball-satan.jpg?width=300", type: "hero")
        let krilin = Character(name: "Krillin", description: "Krilin lo tiene todo. Cuando aún no existían los 'memes', Krilin ya los protagonizaba. Junto a Yamcha ha sido objeto de burla por sus desafortunadas batallas en Dragon Ball Z. Inicialmente, Krilin era el mejor amigo de Goku siendo sólo dos niños que querían aprender artes marciales. El Maestro Roshi les entrena para ser dos grandes luchadores, pero la diferencia entre ambos cada vez es más evidente. Krilin era ambicioso y se ablanda con el tiempo. Es un personaje que acepta un papel secundario para apoyar el éxito de su mejor amigo Goku de una forma totalmente altruista.", favorite: false, imageURL: "https://cdn.alfabetajuega.com/alfabetajuega/2020/08/Krilin.jpg?width=300", type: "hero")
        let goku = Character(name: "Goku", description: "Sobran las presentaciones cuando se habla de Goku. El Saiyan fue enviado al planeta Tierra, pero hay dos versiones sobre el origen del personaje. Según una publicación especial, cuando Goku nació midieron su poder y apenas llegaba a dos unidades, siendo el Saiyan más débil. Aun así se pensaba que le bastaría para conquistar el planeta. Sin embargo, la versión más popular es que Freezer era una amenaza para su planeta natal y antes de que fuera destruido, se envió a Goku en una incubadora para salvarle.", favorite: true, imageURL: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/goku1.jpg?width=300", type: "hero")
        
        let vegeta = Character(name: "Vegeta", description: "Vegeta es todo lo contrario. Es arrogante, cruel y despreciable. Quiere conseguir las bolas de Dragón y se enfrenta a todos los protagonistas, matando a Yamcha, Ten Shin Han, Piccolo y Chaos. Es despreciable porque no duda en matar a Nappa, quien entonces era su compañero, como castigo por su fracaso. Tras el intenso entrenamiento de Goku, el guerrero se enfrenta a Vegeta y estuvo a punto de morir. Lejos de sobreponerse, Vegeta huye del planeta Tierra sin saber que pronto tendrá que unirse a los que considera sus enemigos.", favorite: false, imageURL: "https://cdn.alfabetajuega.com/alfabetajuega/2020/12/vegetita.jpg?width=300", type: "hero")

        let trunks = Character(name: "Trunks", description: "Trunks es hijo de Bulma y Vegeta, pero tarda bastante en aparecer en la trama. Todo se vuelve más interesante cuando aparece un misterioso viajero del tiempo que se llama Trunks del Futuro, que será determinante en Dragon Ball Z. Este personaje es una versión del pequeño Trunks que ha viajado al pasado para advertir de las amenazas que pueden destruir el mundo. Es el único superviviente de los Guerreros Z en un futuro alternativo apocalíptico, así que utiliza la máquina del tiempo que inventa su madre para regresar al tiempo presente.", favorite: false, imageURL: "https://cdn.alfabetajuega.com/alfabetajuega/2020/07/Trunks.jpg?width=300", type: "hero")
        
        let piccolo = Character(name: "Piccolo", description: "Es un namekiano que demuestra su sadismo en el 23º Torneo de Artes Marciales donde se enfrenta a Goku y otros oponentes sin escrúpulos. En la final reveló su verdadera identidad y creó pánico entre el público. Separó su lado bueno gracias a la fisión y así Kami creó las bolas de Dragón de la Tierra que casi son destruidas por el propio Piccolo. Llama la atención que tiempo después su carácter haya cambiado tanto. Se vuelve un personaje más amable y dócil, incluso acepta a Son Gohan como su discípulo. Es un punto de inflexión para Piccolo, ya que esta amistad consigue sacar el lado más bondadoso del namekiano que no duda en sacrificarse para defender a Gohan frente a Nappa. De todos los Guerreros Z, es el luchador más estratégico e inteligente. Esto quiere decir que mientras los demás se lanzan a actuar, Piccolo prefiere pensar la mejor opción.", favorite: false, imageURL: "https://cdn.alfabetajuega.com/alfabetajuega/2020/09/piccolo.jpg?width=300", type: "hero")
        
        let raditz = Character(name: "Raditz", description: "Con la llegada de Raditz a la Tierra comienza Dragon Ball Z. Tiene mucha presencia física como Saiyan con una larga melena y una armadura que permite ver sus músculos. Es uno de los pocos Saiyan que sobrevivieron a la destrucción del Planeta Vegeta y siente absoluto desprecio por los humanos y cualquier ser que sea más débil. Cuando se encuentra con un granjero no duda en matarlo aun sabiendo que no es una amenaza real para él. Es cruel y despiadado, con un carácter muy parecido a Vegeta.", favorite: false, imageURL: "https://cdn.alfabetajuega.com/alfabetajuega/2019/10/Raditz.jpg?width=300", type: "villain")
        
        
//                try await [roshi, goku, satan, vegeta, trunks, piccolo, raditz, krilin].create(on: database)
//        
        await withThrowingTaskGroup(of: Void.self) { taskGroup in
            [roshi, goku, satan, vegeta, trunks, piccolo, raditz, krilin].forEach { model in
                taskGroup.addTask {
                    try await model.create(on: database)
                }
            }
        }
        
        
        // MARK: - News
        let news0 = News(title: "Super Dragon Ball Heroes: World Mission ya está disponible", body: "Bandai Namco ha anunciado el lanzamiento de Super Dragon Ball Heroes: World Mission para Nintendo Switch y PC (en formato digital). Este título es un videojuego estratégico de combates por cartas que incluye más de 1000 cartas y más de 350 personajes de toda la franquicia, incluyendo Dragon Ball Super, la saga Dragon Ball XENOVERSE, Dragon Ball FighterZ y muchas más.", imageURL: "/images/dragon_ball_heroes.jpeg")
        
        let news1 = News(title: "Lo que sabemos de: \"Dragon Ball Super: Broly\"", body: "Ya van quedando menos de 4 meses para el estreno en Japón de la próxima apuesta cinematográfi ca traída por Akira Toriyama, y desde Dragon Ball Wiki en español te hemos querido recopilar cuál ha sido la información que ha salido a flote de la ambiciosa \"Dragon Ball Super: Broly\".", imageURL: "/images/super_broly.jpeg")
        
        let news2 = News(title: "Vegetto llega a «Dragon Ball FighterZ»", body: "Bandai Namco Entertainment ha presentado a Vegetto (SSGSS) como nuevo personaje de Dragon Ball FighterZ. Tanto Vegetto (SSGSS) como Zamas (fusionado) estarán disponibles el 31 de mayo de 2018, con el lanzamiento del segundo contenido descargable.", imageURL: "/images/fighterz_vegetto.jpeg")
        
        let news3 = News(title: "Dragon Ball FighterZ incluye nuevos modos de juego", body: "Bandai Namco Entertainment ha anunciado que los modos Batalla de equipos y Copa FighterZ estarán muy pronto disponibles en Dragon Ball FighterZ. Estos nuevos modos online han sido añadidos al juego gracias a una actualización gratuita que se publicó el pasado 9 de mayo. El primer evento de Batalla de equipos ya está disponible en PlayStation 4, Xbox One y PC.", imageURL: "/images/fighterz_game.jpeg")
        
        try await [news0, news1, news2, news3].create(on: database)
        
        


        // MARK: - Episodes
        let episode195 = Episode(episodeNumber: 195, title: "Un Misterioso Guerrero", airedAt: Date(), summary: "Chi-Chi llama a Gohan y a Son Goku para comer, mientras Goku va en busca de leña, arrancando un árbol de gran tamaño. Cuando llega a su casa con la leña, Chi-Chi le pregunta si a visto a Gohan, que se había ido a jugar en el bosque, por lo tanto, Goku va en su búsqueda.\n\nMientras un Granjero ve cómo un artefacto desconocido llega a la Tierra ocasionando una fuerte explosión, primero pensó que sería un meteorito pero... es una nave y de ella sale un formidable guerrero, a el cual le extraña que los habitantes del planeta Tierra sigan vivos, preguntándole a el granjero ¿Que ha sido de mi hermano? para calcular la fuerza con su Scouter de combate 5, pero el granjero antes le dispara con su escopeta, pero el guerrero atrapa la bala con facilidad y con un solo dedo se la devuelve a gran velocidad asesinándolo. Su Scouter detecta una \"gran energía\" a algo mas de cuatro kilómetros.", imageURL: "/images/raditz.jpeg")
        
        let episode196 = Episode(episodeNumber: 196, title: "El Pasado de Goku", airedAt: Date(), summary: "Bulma decide ir a Kame House para según ella pasárselo bien sin Yamcha, ya que siempre se están peleando como pareja. Llevó unos pasteles de regalo, aunque como es normal en el Maestro Roshi le dijo: ''Solo me conformo con que me des un abrazo de bienvenida''. Luego Bulma le dio un golpe en la cabeza mientras el Maestro Roshi le decía que no entendía su sentido del humor. Por otro lado Son Goku y Son Gohan se acercaban en la Nube Kinton al igual que Raditz, donde todos quedan asombrados pensando que Goku cuidaba niños cuando en realidad les dice que el niño es su hijo, el Maestro Roshi queda asombrado ya que Goku le había puesto el nombre de su abuelo, quien junto a Bulma, Krilin y Umigame le preguntan si a Son Gohan le pasaba algo cuando aparecía la luna llena (transformarse en Ozaru) pero como ellos se iban a dormir temprano no había problema. Después Goku siente un gran poder y rápidamente aparece un guerrero que parece conocer mucho a Goku, llamándole Kakarrot y diciéndole que se parece mucho a su Papá, este le pregunta que como está la situación de el planeta, seguidamente Krilin se acerca a él para que se largase, pero éste con un simple golpe con su cola lo tumba, el guerrero piensa que Kakarrot lo había reconocido, donde gracias a el Maestro Roshi cuenta que Goku se había dado un fuerte golpe de pequeño y pasó de ser un niño violento a ser un buen chico que se salvó gracias a su extraordinaria fuerza vital. finalmente (mientras Krilin se levanta después de el golpe) donde le cuenta la historia de su pasado, diciéndole que pertenecía a una familia de Saiyan y que su planeta natal era el Planeta Vegeta.", imageURL: "/images/gohan.jpeg")
        
        let episode197 = Episode(episodeNumber: 197, title: "La Unión de los dos Adversarios", airedAt: Date(), summary: "Para que Raditz devolviese a Son Gohan con vida, Goku tendría que matar a cien personas para que se lo devolviese. Después de que Raditz le diga esto a Goku, se va volando, mientras que Goku se recupera del golpe. El Maestro Roshi le pide que no vaya inmediatamente porque está confuso y si va solo y sin ninguna idea, perdería la batalla. Goku les cuenta a Krilin, Roshi y Bulma que puede que su hermano tenga el mismo punto débil que él cuando era pequeño, la cola y por ello dice que él no podrá hacerlo solo, por lo cual le pide ayuda a Krilin y Roshi. Ambos le dicen a Bulma que si mueren los haga resucitar con las Bolas de Dragon, pero Goku les recuerda que Shen Long no puede cumplir el mismo deseo más de una vez. Aún así con la ausencia de Ten shin han y Yamcha, deciden ir con él aunque tanto Krilin como Roshi sabían que prácticamente no tenían ninguna posibilidad de ganar. Bulma tiene una gran idea diciendo que si reúnen las Esferas del Dragón, podrían pedir a Shen Long que salvará la Tierra de las personas malas, pero no podrían conseguir las 7 Esferas en un solo día. Cuando están por partir, aparece nada más ni nada menos que Piccolo, que había seguido a Raditz, Piccolo le dijo a Goku que la fuerza de Raditz era mucho mayor que la de ellos y no podrían vencerlo por separado y le dice a Goku que irá con él, pero no porque quiera salvar a Gohan sino porque Raditz se interpone en sus planes de conquistar la Tierra.", imageURL: "/images/raditz_gohan.jpeg")
        
        let episode198 = Episode(episodeNumber: 198, title: "El Plan de Piccolo", airedAt: Date(), summary: "La dura batalla acaba de empezar contra Raditz, pero aún así Goku y Piccolo están temblando de miedo ante Raditz por su superioridad. Piccolo le dice a Goku que seguro que le hace ilusión saber que los otros dos saiyajin son muchísimo más fuerte que Raditz, aunque a Goku tampoco le gusta saber esto. Seguidamente Goku le pregunta a su hermano mayor que donde está Son Gohan, quien le responde que lo encerró en su nave porque lloraba mucho. Después Goku y Piccolo se deciden a iniciar el ataque, pero Raditz puede con ellos fácilmente, ambos con su velocidad se ponen detrás de su oponente para realizar un ataque por la espalda, pero Raditz que es mucho más rápido, incluso con toda tranquilidad y sin esforzarse al máximo. Luego esquiva el golpe de ambos saltando a gran altura, donde le siguen hasta donde está realizando un ataque doble de energía el cual, Goku consiguió esquivar por muy poco, sin embargo Piccolo pierde un brazo. Goku consigue levantarse del suelo para luego recibe una fuerte patada de Raditz que lo deja de nuevo en el suelo, pero agotado se vuelve a levantar quien le pregunta a Piccolo si está bien, y éste le responde que puede pelear incluso con un solo brazo, mientras Raditz se ríe de ellos, dejando que se expriman la cabeza pensando que hacer.", imageURL: "/images/piccolo_goku.jpeg")
        
        let episode199 = Episode(episodeNumber: 199, title: "El Sacrificio de Goku", airedAt: Date(), summary: "Goku ahora tiene que enfrentarse solo a Raditz mientras Piccolo acumula energía para realizar su técnica secreta, Goku ataca decidido, pero su oponente es muy superior a él, quien le da una buena paliza, pero Goku consigue resistir, luego Raditz queda asombrado por como su hermano concentra en un solo punto toda su energía y aumentarla de 416 a 924, después ve como Piccolo hace lo mismo de 408 a 1.030... y sigue aumentándola. Goku le lanza el KameHameHa y Raditz lo intenta esquivar, pero le sigue a donde vaya, por eso lo para sin mucha dificultad con una sola mano, dejando a su hermano pequeño asombrado, para luego mandarle un ataque de energía que deja en el suelo a Goku.\n\nRaditz le va a dar el golpe final pero Piccolo ya tiene preparado el Makankosappo con una fuerza de 1.330, en primer lugar intenta pararla, pero la esquiva y solo se hace una pequeña herida en el hombro rompiendo su armadura. Este admite que si le llega a dar lo deja fuera de combate, y Piccolo piensa que todo está perdido. Se ha acabado el juego, Raditz iba a matar a Piccolo, pero Goku se levanta y le agarra la cola haciéndole perder parte de su poder, pero este le engaña para que lo suelte y Goku cae en su trampa, luego se levanta y le da un fuerte codazo con el que Goku cae a el suelo para luego torturarlo pisándole el pecho diciéndole que no sirve como guerrero espacial. Mientras Raditz le dice a Piccolo que vuelva a utilizar el Makankosappo, pero éste sabe que lo volvería a esquivar mientras torturaba a su hermano menor.", imageURL: "/images/raditz_vs_goku.jpeg")
        
//        try await [episode195, episode196, episode197, episode198, episode199].create(on: database)
        
        await withThrowingTaskGroup(of: Void.self) { taskGroup in
            [episode195, episode196, episode197, episode198, episode199].forEach { model in
                taskGroup.addTask { try await model.create(on: database) }
            }
        }
        
//        //MARK: - Character+Episode
//        try await chiChi.$episodes.attach([episode195, episode199], on: database)
//        try await goku.$episodes.attach([episode195, episode196, episode197, episode198, episode199], on: database)
//        try await granjero.$episodes.attach([episode195], on: database)
//        try await raditz.$episodes.attach([episode195, episode196, episode197, episode198, episode199], on: database)
//        try await gohan.$episodes.attach([episode195, episode196, episode197, episode198, episode199], on: database)
//        try await piccolo.$episodes.attach([episode195, episode196, episode197, episode198, episode199], on: database)
//        try await milk.$episodes.attach([episode196, episode197], on: database)
//        try await krilin.$episodes.attach([episode196, episode197, episode198, episode199], on: database)

        //MARK: - Episode+Character
        try await episode195.$characters.attach([roshi, goku, satan, vegeta, trunks, piccolo], on: database)
        try await episode196.$characters.attach([raditz, goku, piccolo, vegeta, krilin, trunks], on: database)
        try await episode197.$characters.attach([trunks, piccolo, goku, krilin, vegeta, raditz], on: database)
        try await episode198.$characters.attach([trunks, goku, piccolo, vegeta, krilin], on: database)
        try await episode199.$characters.attach([vegeta, trunks, piccolo, goku, roshi, krilin], on: database)
        
    }

    func revert(on database: Database) async throws {
        
        try await News.query(on: database).delete()
        try await Episode.query(on: database).delete()
        try await Character.query(on: database).delete()
        try await News.query(on: database).delete()
        try await Episode.query(on: database).delete()
        try await EpisodeCharacter.query(on: database).delete()
        
    }
    
}
