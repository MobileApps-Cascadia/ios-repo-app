//
//  DeviceRepository.swift
//  ios-repo-app
//
//  Created by juanita aguilar on 10/11/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import Foundation
// TODO : Use Generics and typeAlias to make the Repository class more general
class DeviceRepository:APIRepository {
  
    
   
    typealias T = Device
    
    var path: String
    
    init(withPath path:String){
        self.path = path
    }
    
    func fetch(withCompletion completion: @escaping ([Device]?) -> Void) { }
    
    func fetch(withId id: Int, withCompletion completion: @escaping (Device?) -> Void) {
        let URLstring = path + "\(id)"
        if let url = URL.init(string: URLstring){
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                if let device = try? JSONDecoder().decode(Device.self, from: data!){
                    completion (device)
                }
            }
            task.resume()
        }
    }
    func create( a:Device, withCompletion completion: @escaping (Device?) -> Void ) {
        let url = URL.init(string: path)
        var urlRequest = URLRequest.init(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = try? JSONEncoder().encode(a)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            let device = try? JSONDecoder().decode(Device.self, from: data!)
            completion (device)
        }
        task.resume()
    }
    func update( withId id:Int, a:Device ) {
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
