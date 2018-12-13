//
//  GalleryTabBarController.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/11/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
import UIKit

class GalleryTabBarController: UITabBarController, ApolloContentDelegate, OpenCellDelegate, ExternalNavigationProtocol {
    var contentFetcher: ContentFetcher? = nil
    var currentContent: Content? = nil
    var currentReference: [String] = ["UmSePSFyChYbEle6O4hL"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers?.forEach { let _ = $0.view }
        if let controllers = viewControllers {
            for case let viewDelegate as ContentWithExternalNavigator in controllers {
                viewDelegate.setOpenCellDelegate(openCellDelegate: self)
                viewDelegate.setSender(sender: self)
            }
        }
        self.contentFetcher = ContentFetcher(delegate: self)
        self.triggerLoad()
    }
    
    func setData(content: Content?) {
        print("Set data all \(content?._ID as String?)")
        self.currentContent = content

        if let controllers = viewControllers, let data = content {
            for case let viewDelegate as ContentWithExternalNavigator in controllers {
                viewDelegate.setDataToView(data: data)
                viewDelegate.hideBackButton(self.currentReference.count == 1)
                viewDelegate.onRefreshEnd()
            }
        }
    }
    
    func openCell(content: Content) {
        guard content.isCol else {
            print("Zoom image \(content._ID as String)")
            return
        }
        
        print("Push album \(content._ID as String)")
        pushReference(ref: content._ID)
    }
    
    func back() -> Bool {
        guard currentReference.count > 1 else {
            return true
        }
        popReference()
        return false
    }

    func onRefresh() {
        triggerLoad(true)
    }
    
    private func pushReference(ref: String) {
        currentReference.append(ref)
        triggerLoad()
    }
    
    private func popReference() {
        let prevReference = currentReference.popLast()
        print("Pop \(prevReference as String?)")
        triggerLoad()
    }
    
    private func triggerLoad(_ isRefresh: Bool? = false) {
        guard isRefresh == true else {
            self.contentFetcher?.loadContent(ref: currentReference[currentReference.count - 1])
            return
        }
        self.contentFetcher?.loadContent(ref: currentReference[currentReference.count - 1], cachePolicy: .fetchIgnoringCacheData)
    }
}
