//
//  ModelData.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 12/28/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import Foundation
import UIKit

var newsSourceURL = ""

class Article {
	
	static var articles = [Article]()
	
	var author: String?
	var title: String
	var description: String
	var url: String // this is used to retrieve 'content'
	var urlToImage: String // this is used to retrieve 'image'
	var publishedAt: String
	
	init(author: String?, title: String, description: String, url: String, urlToImage: String = "", publishedAt: String){
		self.author = author
		self.title = title
		self.description = description
		self.url = url
		self.urlToImage = urlToImage
		self.publishedAt = publishedAt
		
		Article.articles.append(self) // self is the article being created
	}
	
}


