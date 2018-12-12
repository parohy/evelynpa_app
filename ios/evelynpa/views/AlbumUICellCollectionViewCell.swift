//
//  AlbumUICellCollectionViewCell.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/11/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

class AlbumUICell: UICollectionViewCell, MediaCellProtocol {
    var cellContent: Content? = nil
    
    
    func updateCellData(content: Content) {
        self.cellContent = content
        print("Update with \(content._ID as String)")
    }
    
    func openCell() {
        guard let content = self.cellContent else {
            print("Content is still not set!")
            return
        }
        
        print("Open \(content._ID as String)")
    }
}
