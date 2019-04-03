//
//  HomeViewModel.swift
//  MVVM
//
//  Created by Ranjit Singh on 03/04/19.
//  Copyright © 2019 zoomcar. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    static func getEmails(success:([Email])->(), failure:(Error)->Void) {
        success(HomeModel.emails)
    }
}
