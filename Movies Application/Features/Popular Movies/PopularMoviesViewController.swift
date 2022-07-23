//
//  Copyright © Modus Create. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PopularMoviesViewController: UICollectionViewController {
	init() {
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
		layout.minimumLineSpacing = 20
		layout.minimumInteritemSpacing = 20
		super.init(collectionViewLayout: layout)
	}
	
	var movieClient = MoviesClient(apiKey: "bf718d4dd8b23985d9c3edbcfd440a27")
	var popularMoviesList = [MovieSummary]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = "Popular"
		self.collectionView.register(PopularMovieCell.self, forCellWithReuseIdentifier: reuseIdentifier)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		Task  {
			await self.fetchPopularMovies()
		}
	}
	
	func fetchPopularMovies() async {
		self.popularMoviesList =  try! await movieClient.popularMovies()
		DispatchQueue.main.async {
			self.collectionView.reloadData()
		}
	}
	
	@available(*, unavailable)
	required init?(coder _: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}


// MARK: - Extensions

extension PopularMoviesViewController: UICollectionViewDelegateFlowLayout {
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.popularMoviesList.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PopularMovieCell
		let movieSummary = self.popularMoviesList[indexPath.row]
		cell.summary = movieSummary
		if movieSummary.voteAverage > 8.0 {
			cell.contentView.layer.borderWidth =  2
			cell.contentView.layer.borderColor = UIColor.red.cgColor
		}
		else {
			cell.contentView.layer.borderWidth =  0
			cell.contentView.layer.borderColor = UIColor.clear.cgColor
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = (collectionView.frame.width - 60) * 0.5
		return CGSize(width: width, height: (width * 1.5))
	}
	
	
	
}

