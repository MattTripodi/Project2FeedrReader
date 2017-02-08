//
//  techCrunchViewController.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 12/6/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit
import SafariServices

class techCrunchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var articleJson = [Article]()
	
	//IBOutlets
	@IBOutlet weak var tableView: UITableView!
	
	//ViewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		
		fetchData(closure: {arrayArticles in
			self.articleJson = arrayArticles!
			self.tableView.reloadData()
		})
		
	}

	//TableView Code
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articleJson.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! TechCrunchArticleTableViewCell
		cell.titleLabel.text = articleJson[indexPath.row].title
		cell.authorLabel.text = articleJson[indexPath.row].author
		cell.descriptionLabel.text = articleJson[indexPath.row].description
		let thisArticle = articleJson[indexPath.row]
		cell.updateCell(cellData: thisArticle)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let safariVC = SFSafariViewController(url: URL(string: articleJson[indexPath.row].url!)!)
		present(safariVC, animated:  true, completion: nil)
	}
	
	
	// Parsing JSON
	func parseJson(data: Data, completionHandler: @escaping ([Article]?) -> ()) {
		var newArticles : [Article] = []
		if let jsonObject = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any] {
			let realArticlesJson = jsonObject["articles"] as? [[String : Any]]
			for newArticle in realArticlesJson! {
				let articles = Article(data: newArticle)
				newArticles.append(articles)
			}
			DispatchQueue.main.async {
				completionHandler(newArticles)
			}
		}
	}
	
	// Fetching Data 
	func fetchData(closure: @escaping ([Article]?) -> ()) {
		
		let urlString = "https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=a368d3c0637848d0a275cf2a83cfcbfe"
		let urlRequest = URL(string: urlString)!
		let task = URLSession.shared.dataTask(with: urlRequest) { rawData, response, error in
			guard let responseData = rawData else {
				closure(nil)
				return
			}
			self.parseJson(data: responseData, completionHandler: closure)
			print(self.articleJson)
		}
		
		task.resume()
	}
		
}

