//
//  ContentDataProtocol.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/12/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

protocol ContentDataProtocol {
    var openCellDelegate: OpenCellDelegate? {get}
    func setOpenCellDelegate(openCellDelegate: OpenCellDelegate)
    func setDataToView(data: Content)
}
