//
//  Copyright © Modus Create. All rights reserved.
//

import Foundation

public struct MovieDetails: Codable {
	public let genres: [Genre]
	public let id: Int
	public let overview: String
	public let posterPath: String
	public let releaseDate: String
	public let tagline: String
	public let title: String
	public let voteAverage: Double
	
	public var posterURL: URL {
		guard let baseURL = URL(string: "https://image.tmdb.org/t/p/original") else {
			preconditionFailure("Unable to build URL")
		}
		return baseURL.appendingPathComponent(posterPath)
	}
	
	enum CodingKeys: String, CodingKey {
		case genres
		case id
		case overview
		case posterPath = "poster_path"
		case releaseDate = "release_date"
		case tagline
		case title
		case voteAverage = "vote_average"
	}
	
	public struct Genre: Codable {
		public let name: String
	}
}

extension MovieDetails {
	static let longOverview =
		//	swiftlint:disable line_length
		"""
			Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
		"""
	
	public static let example = MovieDetails(
		genres: ["Hello", "World", "Hello"].map(Genre.init),
		id: 0,
		overview: longOverview,
		posterPath: "",
		releaseDate: "",
		tagline: "Lorem ipsum dolor sit amet",
		title: "Lorem ipsum",
		voteAverage: 3
	)
}
