//
//  ViewController.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/10/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadCollectionContentForRef(ref: "UmSePSFyChYbEle6O4hL")
    }

    private func loadCollectionContentForRef(ref: String!) {
        ContentFetcher.loadContent(ref: ref, isCol: true) {
            res in
            print("COMPLETION RESULT: \(res?._ID as String?)")
        }
    }
    
    private func loadContentForRef(ref: String!) {
    ContentFetcher.loadContent(ref: ref, isCol: false) {
            res in
            print("COMPLETION RESULT: \(res?._ID as String?)")
        }
    }
}

