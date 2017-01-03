//
//  WebViewViewController.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 12/28/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit


class WebViewViewController: UIViewController {
	
	@IBOutlet weak var articleWebView: UIWebView!
	
	var urlTechCrunch: String!
	var urlTechRadar: String!
	var urlIGN: String!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		articleWebView.loadRequest(URLRequest(url: URL(string: urlTechCrunch)!))
		articleWebView.loadRequest(URLRequest(url: URL(string: urlTechRadar)!))
		articleWebView.loadRequest(URLRequest(url: URL(string: urlIGN)!))

        // Do any additional setup after loading the view.
    }


}
