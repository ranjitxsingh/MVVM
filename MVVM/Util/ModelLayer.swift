//
//  ModelLayer.swift
//  MVVM
//
//  Created by Ranjit Singh on 03/04/19.
//  Copyright © 2019 Ranjit Singh. All rights reserved.
//

import Foundation


/*
 Model Centre
 */
struct DataCentre {
    static var emails:[Email] {
        return JSONModel.getlist(for: .email)
    }
}

/*
 Model Layer Protocol
 */
protocol ModelLayer {
    static func getlist<T>(for type: ModelType) -> [T]
}


enum ModelType {
    case email
}


/*
 JSON Parser
 */

struct JSONModel: ModelLayer {
    
    static func getlist<T>(for type: ModelType) -> [T] {
        switch type {
        case .email:
            if let jsonData = parse(fileName: emailFile) as? Array<[String: Any]> {
                return HomeModel(jsonData).emails as! [T]
            }
            
            return []
        }
    }
    
    
    private static func parse(fileName: String) -> Any? {
        var jsonData: Any?
        
        let url = URL(fileURLWithPath: path(for: fileName))
        
        do {
            let data = try Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
            jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
        } catch {
            print("Something went wrong!!!")
        }
        
        return jsonData
    }
    
    private static func path(for file: String) -> String {
        guard let path = Bundle.main.path(forResource: file, ofType: "json") else {
            fatalError("\(file) Not Found")
        }
        return path
    }
    
    
    static let emailFile = "email_file"
    
}

struct CoreDataModel:  ModelLayer {
    static func getlist<T>(for type: ModelType) -> [T] {
        switch type {
        case .email:
            return []
        }
    }
}
