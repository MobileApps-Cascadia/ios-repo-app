//
//  Repository.swift
//  ios-repo-app
//
//  Created by Brian Bansenauer on 10/5/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//
import Foundation
// TODO : Add Repo Protocol to allow for a MockAPIRepo
protocol hasId {
    var id: Int? {get set}

}

// TODO : Use Generics and typeAlias to make the Repository class more general
class MusicRepository<placeholderForType> where placeholderForType: Codable, placeholderForType: hasId {
    var path: String
    init(withPath path:String){
        self.path = path
    }
        
    func fetch(withId id: Int, withCompletion completion: @escaping (placeholderForType?) -> Void) {
        let URLstring = path + "/id/\(id)"
        if let url = URL.init(string: URLstring){
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                if let music = try? JSONDecoder().decode(placeholderForType.self, from: data!){completion(music)}
            })
            task.resume()
        }
    }
        
    func create(a:placeholderForType) {
        guard a.id != nil else {return}
        let url = path + "/id/\(a.id!)"
        var urlRequest = URLRequest.init(url: URL.init(string: url)!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try? JSONEncoder().encode(a.self)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            print(String.init(data: data!, encoding: .ascii) ?? "no data")
        }
        task.resume()
    }
    
    func update( withId id:Int, a:placeholderForType ) {
        if let url = URL.init(string: path + "\(id)"){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "PUT"
            urlRequest.httpBody = try? JSONEncoder().encode(a)
            let task = URLSession.shared.dataTask(with: urlRequest)
            task.resume()
        }
    }
    
    func delete( withId id:Int ) {
        if let url = URL.init(string: path + "\(id)"){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "DELETE"
            let task = URLSession.shared.dataTask(with: urlRequest)
            task.resume()
        }
    }
}

class Music: Codable, hasId {
    var id: Int?
    var music_url: String?
    var name: String?
    var description: String?
}
