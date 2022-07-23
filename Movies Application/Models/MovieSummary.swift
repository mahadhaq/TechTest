//
//  Copyright © Modus Create. All rights reserved.
//

import Foundation


public struct PopularMoviesDataModel: Codable {
		let page: Int
		let results: [MovieSummary]
		let totalPages, totalResults: Int

		enum CodingKeys: String, CodingKey {
				case page, results
				case totalPages = "total_pages"
				case totalResults = "total_results"
		}
}

public struct MovieSummary: Codable {
	public let id: Int
	public let overview: String
	public let posterPath: String
	public let releaseDate: String
	public let title: String
	public let voteAverage: Double
	
	public var isPopular: Bool {
		voteAverage > 7.5
	}
	
	public var thumbnailURL: URL {
		guard let baseURL = URL(string: "https://image.tmdb.org/t/p/w300") else {
			preconditionFailure("Unable to build URL")
		}
		return baseURL.appendingPathComponent(posterPath)
	}
	
	enum CodingKeys: String, CodingKey {
		case id
		case overview
		case posterPath = "poster_path"
		case releaseDate = "release_date"
		case title
		case voteAverage = "vote_average"
	}
}

extension MovieSummary: Hashable {}

public extension MovieSummary {
	static let example = MovieSummary(id: 0, overview: "Great Movie", posterPath: "", releaseDate: "", title: "Movie", voteAverage: 4.5)
}
