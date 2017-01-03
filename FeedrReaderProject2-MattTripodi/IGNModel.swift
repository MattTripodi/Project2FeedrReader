//
//  IGNModel.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 1/2/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import Foundation

class IGNArticle {

	var title: String?
	var description: String?
	var url: String? // this is used to retrieve 'content'
	var urlToImage: String? // this is used to retrieve 'image'
	
	init(data: [String : Any]) {
		title = data["title"] as? String ?? "unknown"
		description = data["description"] as? String ?? "unknown"
		url = data["url"] as? String ?? "unknown"
		urlToImage = data["urlToImage"] as? String ?? "unknown"
	}
}
