//
//  ContentViewController.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/11/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, ContentWithExternalNavigator, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var collectionView: UICollectionView!
    var openCellDelegate: OpenCellDelegate? = nil
    var albumContent: [Content?] = [Content?]()
    var externalNavigationProtocol: ExternalNavigationProtocol? = nil
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(rgb: 0x4b052e)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if #available(iOS 10.0, *) {
            collectionView.refreshControl = refreshControl
        } else {
            collectionView.addSubview(refreshControl)
        }
        
        self.navigationBar.topItem?.title = "Gallery"
        self.navigationBar.shadowImage = UIImage()
        self.backButton.isHidden = true
    }
    
    @objc func refresh(_ sender: UIRefreshControl) {
        externalNavigationProtocol?.onRefresh()
    }
    
    func onRefreshEnd() {
        self.refreshControl.endRefreshing()
    }
    
    func hideBackButton(_ hide: Bool) {
        self.backButton.isHidden = hide
    }
    
    func setDataToView(data: Content) {
        print("Set data CONTENT \(data._ID as String)")
        
        self.albumContent = data.children.filter {
            $0.isCol == false
        }
        
        //Setting UI data
        if let title = data.title {
            self.navigationBar.topItem?.title = title
        } else {
            self.navigationBar.topItem?.title = "Gallery"
        }
        
        self.collectionView.performBatchUpdates({
            self.collectionView.reloadSections(IndexSet(integer: 0))
        })
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
    
    @IBAction func onBackTap(_ sender: Any) {
        guard externalNavigationProtocol?.back() == false else {
//            self.performSegue(withIdentifier: "unwindFromScreen", sender: self)
            return
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albumContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentUICell", for: indexPath) as! PictureUICell
        if let content = self.albumContent[indexPath.row], let delegate = openCellDelegate, let cellDelegate = cell as? CellDataDelegate {
            cellDelegate.updateCellData(content: content, delegate: delegate)
            return cell
        }
        return PictureUICell()
    }
}
