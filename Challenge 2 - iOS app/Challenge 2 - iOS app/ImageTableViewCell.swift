//
//  ImageTableViewCell.swift
//  Challenge 2 - iOS app
//
//  Created by Hod Kimhi on 2019-05-18.
//  Copyright © 2019 hodkimhi. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var photoName: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoView.layer.cornerRadius = photoView.frame.size.width / 2
        photoView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
