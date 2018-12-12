//
//  DataLoader.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/10/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//  "UmSePSFyChYbEle6O4hL"
//

import Foundation
import Apollo

class ContentFetcher {
    var apollo: ApolloClient
    var apolloDataDelegate: ApolloContentDelegate? = nil
    
    init(delegate: ApolloContentDelegate) {
        apollo = ApolloClient(url: URL(string: "https://us-central1-evelynpa-43e6d.cloudfunctions.net/api/v2/graphql")!)
        apolloDataDelegate = delegate
    }
    
    /**
     Load content for specified ref and handle result in completion handler
     - parameter ref: Reference id of the content
     - parameter isCol: True if you want to fetch collections
     - parameter delegate: ApolloContentDelegate
     */
    func loadContent(ref: String, isCol: Bool? = nil) {
        apollo.fetch(query: ContentQuery(ref: ref, isCol: isCol)) { result, err in
            var resultContent: Content? = nil
            if let err = err {
                print("ERROR: \(err)")
            } else {
                resultContent = self.createResultContent(queryData: result?.data)
            }
            
            self.apolloDataDelegate?.setData(content: resultContent)
        }
    }
    
    /**
     Create Content out of query result
     - parameter queryData: Result from ApolloClient you want to parse
     - Returns: A Content object type
     */
    private func createResultContent(queryData: ContentQuery.Data?) -> Content? {
        var resultContent: Content? = nil
        //Do I have query data
        if let data = queryData {
            var children = [Content]()
            
            //Do I have a content data
            if let content = data.content {
                var dataChildren = [ContentQuery.Data.Content.Child?]()
                
                //Check if content has children
                if let childrenArray = content.children {
                    dataChildren = childrenArray
                }
                
                //Parse children
                for childContent in dataChildren {
                    if let child = childContent {
                        children.append(Content(_ID: child.fragments.mediaFragment.id, title: child.fragments.mediaFragment.title,
                                                description: child.fragments.mediaFragment.description, created: child.fragments.mediaFragment.created, updated: child.fragments.mediaFragment.updated,
                                                    isCol: child.isCol ,likes: child.fragments.mediaFragment.likes, thumbnail: child.thumbnail?.url, children: []))
                    }
                    
                }
                
                //Create content object
                resultContent = Content(_ID: content.fragments.mediaFragment.id, title: content.fragments.mediaFragment.title,
                                        description: content.fragments.mediaFragment.description, created: content.fragments.mediaFragment.created, updated: content.fragments.mediaFragment.updated, likes: content.fragments.mediaFragment.likes, thumbnail: nil, children: children)
            }
        }
    
        return resultContent
    }
}
