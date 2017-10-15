//
//  ViewController.swift
//  DiscoverNewberg
//
//  Created by Chris Winikka on 10/15/17.
//  Copyright © 2017 Chris Winikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        DataService.shared.getData { (data) in
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                print("any json here?")
            }
            catch
            {
                print(error)
            }
        }
    }
    
    /* NOTES
        This project is based on two main sources:
            + Parsing JSON: Complex/Nested Data | Swift 3, Xcode 8
                - https://youtu.be/odmPOnt21AI
                - We're only 16 minutes in
                - I had to change DataService.swift because the video tutorial simply added a JSON file to the project whereas we are making an API call to a secure WordPress site (all WP sites now can serve content as a JSON file
                - For the rest of the video, we'll need to see how Kilo Loco digs into a JSON file and pull data but we'll need to adapt the concepts to the JSON file the website pulls up
                - https://youtu.be/odmPOnt21AI?t=16m52s is where we left off
            + Swift 3 — APIs , Network Requests, & JSON: Getting the data: Example 4 
                - https://code.bradymower.com/swift-3-apis-network-requests-json-getting-the-data-4aaae8a5efc0
                - I tried at least 2 examples until I got this to work in Example 4
                - this deviates from the video in how it loads a JSON file because the video loads a local file and our app makes an API call
     
            + How To Work With JSON In Xcode 8 (Swift 3.0)
                - https://youtu.be/-ddIP7NRkmY
                - this was a good resource on setting up a table view, making an API call, and populating cells with some text
                - An interesting exercise would be to compare the api call from this video to the call in DataService. I somehow think that the other example is a better one
                - Code below came from this video
     
     */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = "Yo!"
        return cell
    }



}

