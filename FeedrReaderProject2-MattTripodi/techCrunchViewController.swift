//
//  techCrunchViewController.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 12/6/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

class techCrunchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath)
		return cell
	}
	
	
}

