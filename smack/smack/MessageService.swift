//
//  MessageService.swift
//  smack
//
//  Created by Aziz Ur Rehman on 8/16/17.
//  Copyright © 2017 JAZIZ. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    
    var channels = [Channel]()
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let data = response.data else {return}
//                
//                do {
//                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
//                }
//                
//                catch let error {
//                    debugPrint(error as Any)
//                }
//                
//                print(self.channels)
            if let json = JSON(data: data).array{
                    for item in json{
                        let name = item["name"].stringValue
                        let description = item["description"].stringValue
                        let id = item["_id"].stringValue
                        
                        let channel = Channel(id: id, channelTitle: name, channelDescription: description)
                        
                        self.channels.append(channel)
                        
                    }
                    
                    completion(true)
            }
                
                
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    
    
    
}
