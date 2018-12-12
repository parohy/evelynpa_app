//
//  AlbumViewController.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/11/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit
import SDWebImage

class AlbumViewController: UIViewController, ApolloContentDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, OpenCellDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var albumLabel: UILabel!
    var albumContent: Content? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        ContentFetcher.loadContent(ref: "UmSePSFyChYbEle6O4hL", delegate: self)
    }
    
    func setData(content: Content?) {
        print("Set data ABLUM \(content?._ID as String?)")
        self.albumContent = content
        
        //Setting UI data
        if let dataToSet = content {
            albumLabel.text = dataToSet.title
            self.collectionView.reloadData()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = self.albumContent?.children.count else {
            return 0
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumUICell", for: indexPath) as! AlbumUICell
        guard let content = albumContent?.children[indexPath.row] else {
            return AlbumUICell()
        }
        cell.updateCellData(content: content, delegate: self)
        return cell
    }
    
    func openCell(content: Content) {
        print("Open Album \(content._ID as String)")
        ContentFetcher.loadContent(ref: content._ID, delegate: self)
    }

}
