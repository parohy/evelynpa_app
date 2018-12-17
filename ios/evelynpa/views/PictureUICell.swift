//
//  ContentViewCell.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/11/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

class PictureUICell: UICollectionViewCell, CellDataDelegate {
    @IBOutlet weak var likesContainer: UIView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    var cellContent: Content? = nil
    var delegate: OpenCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //corner radius
        self.layer.cornerRadius = CGFloat(5.0)
        self.likesContainer.layer.cornerRadius = CGFloat(5.0)
        self.contentImage.layer.cornerRadius = CGFloat(5.0)
        self.contentImage.layer.masksToBounds = true
        
        //shadow
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = Float(0.45)
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        
        self.contentImage.layer.cornerRadius = 4
    }
    
    func updateCellData(content: Content, delegate: OpenCellDelegate) {
        print("Update content with \(content._ID as String)")
        self.cellContent = content
        self.delegate = delegate
        if let url = content.thumbnail {
            contentImage.sd_setImage(with: URL(string: url), completed: nil)
        }
        self.likesLabel.text = String(content.likes)
    }
    
    @IBAction func onCellTap(_ sender: Any) {
        if let content = cellContent, let del = delegate {
            del.openCell(content: content)
        }
    }
}
