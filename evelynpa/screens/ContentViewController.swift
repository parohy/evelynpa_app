//
//  ContentViewController.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/11/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, ApolloContentDelegate {
    @IBOutlet weak var viewController: UICollectionView!
    @IBOutlet weak var albumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContentFetcher.loadContent(ref: "UmSePSFyChYbEle6O4hL", delegate: self)
    }
    
    func setData(content: Content?) {
        print("Set data CONTENT \(content?._ID as String?)")
        
        //Setting UI data
        if let dataToSet = content {
            albumLabel.text = dataToSet.title
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
