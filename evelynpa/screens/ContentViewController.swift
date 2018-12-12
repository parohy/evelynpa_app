//
//  ContentViewController.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/11/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, ContentWithExternalNavigator, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var albumLabel: UILabel!
    var openCellDelegate: OpenCellDelegate? = nil
    var albumContent: [Content?] = [Content?]()
    var externalNavigationProtocol: ExternalNavigationProtocol? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setDataToView(data: Content) {
        print("Set data CONTENT \(data._ID as String)")
        
        self.albumContent = data.children.filter {
            $0.isCol == false
        }
        self.collectionView.reloadData()
    }
    
    func setOpenCellDelegate(openCellDelegate: OpenCellDelegate) {
        self.openCellDelegate = openCellDelegate
    }
    
    func setSender(sender: ExternalNavigationProtocol) {
        self.externalNavigationProtocol = sender
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albumContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentUICell", for: indexPath) as! ContenUICell
        if let content = self.albumContent[indexPath.row], let delegate = openCellDelegate {
            cell.updateCellData(content: content, delegate: delegate)
            return cell
        }
        return ContenUICell()
    }
}
