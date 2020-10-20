////
////  Repository.swift
////  ios-repo-app
////
////  Created by Brian Bansenauer on 10/5/19.
////  Copyright © 2019 Cascadia College. All rights reserved.
////
//import Foundation
//// TODO : Add Repo Protocol to allow for a MockAPIRepo
//protocol APIRepository {
//

import UIKit

protocol hasID{
    var id: Int? { get set }
}

class MusicRepository<genericObject> where genericObject : Codable, genericObject : hasID {
    var path: String
    init(withPath path:String){
        self.path = path
    }
    // READ a single object
    func fetch(withId id: Int, withCompletion completion: @escaping (genericObject?) -> Void) {
        let URLstring = path + "/id/\(id)"
        if let url = URL.init(string: URLstring){
            let task = URLSession.shared.dataTask(with: url, completionHandler:
            {(data, response, error) in
                if let music = try? JSONDecoder().decode(genericObject.self, from: data!){
                    completion (music)
                }
            })
            task.resume()
        }
    }
    
    //TODO: Build and test comparable methods for the other CRUD items
    func create( a:genericObject) {
        guard a.id != nil else {return};
        let urlString = path + "/id/\(a.id!)"
        var postRequest = URLRequest.init(url: URL.init(string: urlString)!)
        postRequest.httpMethod = "POST"
        postRequest.httpBody = try? JSONEncoder().encode(a.self)
        let task = URLSession.shared.dataTask(with: postRequest) { (data, response, error) in
            print (String.init(data: data!, encoding: .ascii) ?? "no data")
        }
        task.resume()
    }
    func update( withId id:Int, a:genericObject) {
        guard a.id != nil else {return};
        let urlString = path + "/id/\(a.id!)"
        var updateRequest = URLRequest.init(url: URL.init(string: urlString)!)
        updateRequest.httpMethod = "PUT"
        updateRequest.httpBody = try? JSONEncoder().encode(a.self)
        let task = URLSession.shared.dataTask(with: updateRequest) { (data, response, error) in
            print (String.init(data: data!, encoding: .ascii) ?? "no data")

        }
        task.resume()

    }
    func delete( withId id:Int ) {
        let urlString = path + "/id/\(id)"
        var deleteRequest = URLRequest.init(url: URL.init(string: urlString)!)
        deleteRequest.httpMethod = "DELETE"
        let task = URLSession.shared.dataTask(with: deleteRequest) { (data, response, error) in
            print (String.init(data: data!, encoding: .ascii) ?? "no data")

        }
        task.resume()
    }
}
class Music: Codable, hasID{
    var id: Int?
    var music_url: String?
    var name: String?
    var description: String?
}
//Create a User Repository for the API

//}
//// TODO : Use Generics and typeAlias to make the Repository class more general
//class Repository:APIRepository {
//    var path: String
//    init(withPath path:String){
//        self.path = path
//    }
//
//    func fetch(withCompletion completion: @escaping ([User]?) -> Void) { }
//
//    func fetch(withId id: Int, withCompletion completion: @escaping (User?) -> Void) {
//        let URLstring = path + "\(id)"
//        if let url = URL.init(string: URLstring){
//            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//                if let user = try? JSONDecoder().decode(User.self, from: data!){
//                    completion (user)
//                }
//            }
//            task.resume()
//        }
//    }
//    func create( a:User, withCompletion completion: @escaping (User?) -> Void ) {
//        let url = URL.init(string: path)
//        var urlRequest = URLRequest.init(url: url!)
//        urlRequest.httpMethod = "POST"
//        urlRequest.httpBody = try? JSONEncoder().encode(a)
//
//        let task = URLSession.shared.dataTask(with: urlRequest) {
//            (data, response, error) in
//            let user = try? JSONDecoder().decode(User.self, from: data!)
//            completion (user)
//        }
//        task.resume()
//    }
//    func update( withId id:Int, a:User ) {
//        if let url = URL.init(string: path + "\(id)"){
//            var urlRequest = URLRequest(url: url)
//            urlRequest.httpMethod = "PUT"
//            urlRequest.httpBody = try? JSONEncoder().encode(a)
//            let task = URLSession.shared.dataTask(with: urlRequest)
//            task.resume()
//        }
//    }
//    func delete( withId id:Int ) {
//        if let url = URL.init(string: path + "\(id)"){
//            var urlRequest = URLRequest(url: url)
//            urlRequest.httpMethod = "DELETE"
//            let task = URLSession.shared.dataTask(with: urlRequest)
//            task.resume()
//        }
//    }
//}
//
