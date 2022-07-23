//
//  Copyright © Modus Create. All rights reserved.
//

import Foundation
import SwiftyJSON

public class MoviesClient {
	let apiKey: String
	let baseUrl: URL
	
	public init(apiKey: String) {
		self.apiKey = apiKey
		
		guard let url = URL(string: "https://api.themoviedb.org/3/") else {
			preconditionFailure("Unable to build URL")
		}
		self.baseUrl = url
	}
	
	public func popularMovies() async throws -> [MovieSummary] {
		var urlComponents = URLComponents(string: baseUrl.appendingPathComponent("movie/popular").absoluteString)!
		urlComponents.queryItems = [
				URLQueryItem(name: "api_key", value: apiKey)
		]

		let url = urlComponents.url!
		let (data, _) = try await URLSession.shared.data(from: url)
		let popularMovies = try JSONDecoder().decode(PopularMoviesDataModel.self, from: data)
		return popularMovies.results
	}
	
	public func movieDetails(_ id: Int) async throws -> MovieDetails {
		var urlComponents = URLComponents(string: baseUrl.appendingPathComponent("movie/\(id)").absoluteString)!
		urlComponents.queryItems = [
				URLQueryItem(name: "api_key", value: apiKey)
		]

		let url = urlComponents.url!
		let (data, _) = try await URLSession.shared.data(from: url)
		return try JSONDecoder().decode(MovieDetails.self, from: data)
	}
}
