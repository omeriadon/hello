import NIOSSL
import Vapor

/// configures your application
public func configure(_ app: Application) async throws {
	// uncomment to serve files from /Public folder
	// app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

	app.http.server.configuration.hostname = "0.0.0.0"

	let certificate = try NIOSSLCertificate.fromPEMFile("/Users/adonomeri/vapor-certs/fullchain.pem")
	let privateKey = try NIOSSLPrivateKey(file: "/Users/adonomeri/vapor-certs/privkey.pem", format: .pem)

	app.http.server.configuration.tlsConfiguration = .makeServerConfiguration(
		certificateChain: certificate.map { .certificate($0) },
		privateKey: .privateKey(privateKey)
	)

	// Optional: set port 443 for HTTPS
	app.http.server.configuration.port = 443

	// register routes
	try routes(app)
}
