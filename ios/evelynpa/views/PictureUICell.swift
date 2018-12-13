//
//  ContentViewCell.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/11/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

class PictureUICell: UICollectionViewCell {
    @IBOutlet weak var contentImage: UIImageView!
    var cellContent: Content? = nil
    var delegate: OpenCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 0.7
        self.layer.borderColor = UIColor(rgb: 0x4b052e).cgColor
    }
    
    
    func updateCellData(content: Content, delegate: OpenCellDelegate) {
        print("Update content with \(content._ID as String)")
        self.cellContent = content
        self.delegate = delegate
        if let url = content.thumbnail {
            contentImage.sd_setImage(with: URL(string: url), completed: nil)
        }
    }
    
    @IBAction func onCellTap(_ sender: Any) {
        if let content = cellContent, let del = delegate {
            del.openCell(content: content)
        }
    }
}
