//
//  ModelData.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 12/28/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import Foundation

class Article {
	
	var author: String?
	var title: String?
	var description: String?
	var url: String? // this is used to retrieve 'content'
	var urlToImage: String? // this is used to retrieve 'image'
	var publishedAt: String?
	
	init(data: [String : Any]) {
		author = data["author"] as? String ?? "unknown"
		title = data["title"] as? String ?? "unknown"
		description = data["description"] as? String ?? "unknown"
		url = data["url"] as? String ?? "unknown"
		urlToImage = data["urlToImage"] as? String ?? "unknown"
		publishedAt = data["publishedAt"] as? String ?? "unknown"
	}
}


