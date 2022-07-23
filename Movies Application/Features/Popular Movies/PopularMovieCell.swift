//
//  Copyright © Modus Create. All rights reserved.
//

import SwiftUI
import UIKit

class PopularMovieCell: UICollectionViewCell {
	var summary: MovieSummary? {
		didSet {
			guard let summary = summary else { return }
			contentController.rootView = .init(summary: summary)
		}
	}
	
	private let contentController = UIHostingController<ContentView>(rootView: .init(summary: .example))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		contentView.addSubview(contentController.view)
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		contentController.view.frame = contentView.bounds
	}
	
	@available(*, unavailable)
	required init?(coder _: NSCoder) {
		preconditionFailure("Unavailable")
	}
}
