//
//  AlbumUICellCollectionViewCell.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/11/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

class AlbumUICell: UICollectionViewCell {
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumLabel: UILabel!
    
    var cellContent: Content? = nil
    var delegate: OpenCellDelegate? = nil
    
    func updateCellData(content: Content, delegate: OpenCellDelegate) {
        self.cellContent = content
        self.delegate = delegate
        print("Update album with \(content._ID as String)")
        albumLabel.text = content.title
        if let url = content.thumbnail {
            albumImage.sd_setImage(with: URL(string: url), completed: nil)
        }
    }
    
//    @IBAction func onCellTap(_ sender: Any) {
//        if let content = cellContent, let del = delegate {
//            del.openCell(content: content)
//        }
//    }
}
