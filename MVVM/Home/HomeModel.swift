//
//  HomeModel.swift
//  MVVM
//
//  Created by Ranjit Singh on 03/04/19.
//  Copyright © 2019 zoomcar. All rights reserved.
//

import Foundation

struct HomeModel {
    private var _emails:[Email]  = []
    
    init(_ list:[[String: Any]]) {
        for item in list {
            _emails.append(Email(item))
        }
    }
    
    static var emails:[Email] {
        return DataCentre.emails
    }
}

struct Email {
    init(_ data:[String: Any]) {
        
    }
}
