//
//  ViewController.swift
//  MVVM
//
//  Created by Ranjit Singh on 03/04/19.
//  Copyright © 2019 zoomcar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    weak var viewModel: HomeViewModel!
    
    let emailSuccess: ([Email])->Void  = {
        print($0)
    }
    
    let emailFailure: (Error)->Void  = {
        print($0)
    }

    @IBOutlet weak var lblTest: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeViewModel.getEmails(success: emailSuccess, failure: emailFailure)
    }
}

