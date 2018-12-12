//
//  Content.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/10/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import Foundation

struct Content {
    private(set) public var _ID: String!
    private(set) public var title: String?
    private(set) public var description: String?
    private(set) public var created: String!
    private(set) public var updated: String!
    private(set) public var isCol: Bool!
    private(set) public var likes: Int!
    private(set) public var thumbnail: String?
    private(set) public var children: [Content]
    
    init(_ID: String!, title: String?, description: String?, created: String!, updated: String?, isCol: Bool? = false, likes: Int!, thumbnail: String?, children: [Content]) {
        self._ID = _ID
        self.title = title
        self.description = description
        self.created = created
        self.updated = updated
        self.isCol = isCol
        self.likes = likes
        self.thumbnail = thumbnail
        self.children = children
    }
}
