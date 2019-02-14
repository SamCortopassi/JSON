//
//  ViewController.swift
//  JSON
//
//  Created by Samantha Cortopassi on 2/13/19.
//  Copyright © 2019 Samantha Cortopassi. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable {
    let name: String?
    let description: String?
    let courses: [Course]?
}

struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageURL: String?
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageURL = json["imageURL"] as? String ?? ""
//    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        
        guard let url = URL(string: jsonUrlString) else { return }
       
        URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let data = data else { return }
            
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            
            do {
                let courses = try JSONDecoder().decode([WebsiteDescription].self, from: data)
                print("\(jsonUrlString)")
                
//  2/3/objC
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
//
//                let course = Course(json: json)
//                print(course.name)
                
            } catch let jsonErr {
                    print("serializing error", jsonErr)
            }
            
            }.resume()
    }
}

