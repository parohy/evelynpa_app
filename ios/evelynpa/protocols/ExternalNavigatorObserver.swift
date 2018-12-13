//
//  ExternalNavigatorObserver.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/12/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

protocol ExternalNavigatorObserver {
    var externalNavigationProtocol: ExternalNavigationProtocol? {get}
    func setSender(sender: ExternalNavigationProtocol)
    func onRefreshEnd()
    func hideBackButton(_ hide: Bool)
}
