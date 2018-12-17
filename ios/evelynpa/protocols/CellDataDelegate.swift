//
//  CellDataDelegate.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/17/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

protocol CellDataDelegate {
    var delegate: OpenCellDelegate? {get}
    var cellContent: Content? {get}
    func updateCellData(content: Content, delegate: OpenCellDelegate)
}
