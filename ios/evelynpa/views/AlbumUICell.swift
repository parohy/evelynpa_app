//
//  AlbumUICellCollectionViewCell.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/11/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

class AlbumUICell: UICollectionViewCell, CellDataDelegate {
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumLabelContainer: UIView!
    @IBOutlet weak var albumLabel: UILabel!
    
    var cellContent: Content? = nil
    var delegate: OpenCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setGradientBG()
        
        //border
        self.layer.borderWidth = 0.7
        self.layer.borderColor = UIColor(rgb: 0x4b052e).cgColor
    }

    func updateCellData(content: Content, delegate: OpenCellDelegate) {
        self.cellContent = content
        self.delegate = delegate
        print("Update album with \(content._ID as String)")
        albumLabel.text = content.title
        if let url = content.thumbnail {
            albumImage.sd_setImage(with: URL(string: url), completed: nil)
        }
    }
    
    //set gradient color for label container
    private func setGradientBG() {
        let colors = [UIColor(rgb: 0xffffff, a: CGFloat(0.0)).cgColor, UIColor(rgb: 0xffffff).cgColor]
        albumLabelContainer.addGradientToView(colors: colors)
    }
    
    @IBAction func openCell(_ sender: Any) {
        if let content = cellContent, let del = delegate {
            del.openCell(content: content)
        }
    }
}
