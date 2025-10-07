import Vapor

func routes(_ app: Application) throws {
	app.get { _ async in
		"It works!"
	}

	app.get("hello", ":name") { req -> String in
		let name = req.parameters.get("name")!
		return "Hello, \(name)!"
	}

	app.get("number", ":x") { req -> String in
		guard let int = req.parameters.get("x", as: Int.self) else {
			throw Abort(.badRequest)
		}
		return "well the number \(int) is a great number"
	}
}
