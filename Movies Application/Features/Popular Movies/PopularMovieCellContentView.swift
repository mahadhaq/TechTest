//
//  Copyright © Modus Create. All rights reserved.
//

import SwiftUI

extension PopularMovieCell {
	struct ContentView: View {
		let summary: MovieSummary
		
		var body: some View {
//			ZStack(alignment: .bottom) {
				VStack(alignment: .center) {
					AsyncImage(url: summary.thumbnailURL) { image in
						image.resizable()
					} placeholder: {
						Color.red
					}
					Text(summary.title)
						.fontWeight(.bold)
					Text(summary.overview)
						.lineLimit(3)

				}
//			}
			.ignoresSafeArea()
		}
	}
}

struct PopularMovieCellContentView_Previews: PreviewProvider {
	static var previews: some View {
		PopularMovieCell.ContentView(summary: .example)
//			.previewLayout(.fixed(width: 200, height: 350))
	}
}
