//
//  TechRadarTableViewCell.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 1/2/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import UIKit

class TechRadarTableViewCell: UITableViewCell {
	
	//IBOutlets
	@IBOutlet weak var techRadarArticleImage: UIImageView!
	@IBOutlet weak var techRadarTitleLabel: UILabel!
	@IBOutlet weak var techRadarDescriptionLabel: UILabel!
	@IBOutlet weak var techRadarAuthorLabel: UILabel!
	
	// To get the cell to display the image 
	func updateCell(cellData: Article) {
		let url = URL(string: cellData.urlToImage!)
		
		DispatchQueue.global().async {
			do{
				let urlData = try Data(contentsOf: url!)
				
				DispatchQueue.main.async {
					self.techRadarArticleImage.image = UIImage(data: urlData)
				}
				
			} catch {
				print(error.localizedDescription)
			}
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
