//  This file was automatically generated and should not be edited.

import Apollo

public final class ContentQuery: GraphQLQuery {
  public let operationDefinition =
    "query Content($ref: String!, $isCol: Boolean) {\n  content(ref: $ref) {\n    __typename\n    ...MediaFragment\n    children(isCol: $isCol) {\n      __typename\n      thumbnail {\n        __typename\n        url\n      }\n      ...MediaFragment\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(MediaFragment.fragmentDefinition) }

  public var ref: String
  public var isCol: Bool?

  public init(ref: String, isCol: Bool? = nil) {
    self.ref = ref
    self.isCol = isCol
  }

  public var variables: GraphQLMap? {
    return ["ref": ref, "isCol": isCol]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("content", arguments: ["ref": GraphQLVariable("ref")], type: .object(Content.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(content: Content? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "content": content.flatMap { (value: Content) -> ResultMap in value.resultMap }])
    }

    public var content: Content? {
      get {
        return (resultMap["content"] as? ResultMap).flatMap { Content(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "content")
      }
    }

    public struct Content: GraphQLSelectionSet {
      public static let possibleTypes = ["Content"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("created", type: .nonNull(.scalar(String.self))),
        GraphQLField("updated", type: .nonNull(.scalar(String.self))),
        GraphQLField("likes", type: .nonNull(.scalar(Int.self))),
        GraphQLField("children", arguments: ["isCol": GraphQLVariable("isCol")], type: .list(.object(Child.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String? = nil, description: String? = nil, created: String, updated: String, likes: Int, children: [Child?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Content", "_id": id, "title": title, "description": description, "created": created, "updated": updated, "likes": likes, "children": children.flatMap { (value: [Child?]) -> [ResultMap?] in value.map { (value: Child?) -> ResultMap? in value.flatMap { (value: Child) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["_id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var created: String {
        get {
          return resultMap["created"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created")
        }
      }

      public var updated: String {
        get {
          return resultMap["updated"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updated")
        }
      }

      public var likes: Int {
        get {
          return resultMap["likes"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "likes")
        }
      }

      public var children: [Child?]? {
        get {
          return (resultMap["children"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Child?] in value.map { (value: ResultMap?) -> Child? in value.flatMap { (value: ResultMap) -> Child in Child(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Child?]) -> [ResultMap?] in value.map { (value: Child?) -> ResultMap? in value.flatMap { (value: Child) -> ResultMap in value.resultMap } } }, forKey: "children")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var mediaFragment: MediaFragment {
          get {
            return MediaFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Child: GraphQLSelectionSet {
        public static let possibleTypes = ["Content"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("thumbnail", type: .object(Thumbnail.selections)),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("created", type: .nonNull(.scalar(String.self))),
          GraphQLField("updated", type: .nonNull(.scalar(String.self))),
          GraphQLField("likes", type: .nonNull(.scalar(Int.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(thumbnail: Thumbnail? = nil, id: GraphQLID, title: String? = nil, description: String? = nil, created: String, updated: String, likes: Int) {
          self.init(unsafeResultMap: ["__typename": "Content", "thumbnail": thumbnail.flatMap { (value: Thumbnail) -> ResultMap in value.resultMap }, "_id": id, "title": title, "description": description, "created": created, "updated": updated, "likes": likes])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var thumbnail: Thumbnail? {
          get {
            return (resultMap["thumbnail"] as? ResultMap).flatMap { Thumbnail(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "thumbnail")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["_id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var created: String {
          get {
            return resultMap["created"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created")
          }
        }

        public var updated: String {
          get {
            return resultMap["updated"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updated")
          }
        }

        public var likes: Int {
          get {
            return resultMap["likes"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "likes")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var mediaFragment: MediaFragment {
            get {
              return MediaFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }

        public struct Thumbnail: GraphQLSelectionSet {
          public static let possibleTypes = ["Image"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(url: String) {
            self.init(unsafeResultMap: ["__typename": "Image", "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }
      }
    }
  }
}

public struct MediaFragment: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment MediaFragment on Content {\n  __typename\n  _id\n  title\n  description\n  created\n  updated\n  likes\n}"

  public static let possibleTypes = ["Content"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("title", type: .scalar(String.self)),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("created", type: .nonNull(.scalar(String.self))),
    GraphQLField("updated", type: .nonNull(.scalar(String.self))),
    GraphQLField("likes", type: .nonNull(.scalar(Int.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, title: String? = nil, description: String? = nil, created: String, updated: String, likes: Int) {
    self.init(unsafeResultMap: ["__typename": "Content", "_id": id, "title": title, "description": description, "created": created, "updated": updated, "likes": likes])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["_id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "_id")
    }
  }

  public var title: String? {
    get {
      return resultMap["title"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "title")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var created: String {
    get {
      return resultMap["created"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "created")
    }
  }

  public var updated: String {
    get {
      return resultMap["updated"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "updated")
    }
  }

  public var likes: Int {
    get {
      return resultMap["likes"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "likes")
    }
  }
}