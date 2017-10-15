//
//  DataService.swift
//  DiscoverNewberg
//
//  Created by Chris Winikka on 10/15/17.
//  Copyright © 2017 Chris Winikka. All rights reserved.
//  Thanks to Kilo Loco for providing the DataService class
//  https://www.youtube.com/watch?v=odmPOnt21AI&t=1012s
//  Thanks also to Brady Mower for providing example 4 to help us make the API call 
//  https://code.bradymower.com/swift-3-apis-network-requests-json-getting-the-data-4aaae8a5efc0
//

import Foundation

class DataService {
    
    private init() {}
    static let shared = DataService()
    
    func  getData(completion: @escaping (Data) -> Void) {
        let url = URL(string: "https://discover.hundredvisions.com/wp-json/wp/v2/posts")
        let session = URLSession.shared
        
        if let usableUrl = url {
            let task = session.dataTask(with: usableUrl, completionHandler: { (data, response, error) in
                if let data = data {
                    if let stringData = String(data: data, encoding: String.Encoding.utf8) {
                        print(stringData) //JSONSerialization
                        completion(data)
                    }
                }
            })
            task.resume()
        }
    }
}
