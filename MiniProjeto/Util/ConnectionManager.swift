//
//  ConnectionManager.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 14/12/20.
//

import Foundation

struct ConnectionSessionManager {
    typealias Callback<T:Any, E:Any> = (T, E) -> Void
    static var session = URLSession.shared
    static let timeOutInterval = 15.0
    
    static func invoke(url: String, withArgs args: Dictionary<String, Any>, httpMethod: ConnectionSessionHttpMethod, completion: Callback<Any?, NSError?>?){
        URLCache.shared.removeAllCachedResponses()
        guard let url = URL(string: url) else{
            completion?(nil, ConnectionSessionError.invalidUrl as NSError?)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.description()
        
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: args, options: .prettyPrinted)
        }catch{
            print(error)
            completion?(nil, error as NSError?)
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeOutInterval
        configuration.timeoutIntervalForResource = timeOutInterval + 5.0
        let session = URLSession(configuration: configuration)
        
        session.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let error = error else{
                guard let data = data else {
                    completion?(nil, NSError())
                    return
                }
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    completion?(json, nil)
                    return
                }catch{
                    completion?(nil, error as NSError?)
                    return
                }
            }
            completion?(nil, error as NSError?)
        }).resume()
    }
}


