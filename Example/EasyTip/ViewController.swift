//
//  ViewController.swift
//  EasyTip
//
//  Created by NingLi-iOSer on 01/06/2020.
//  Copyright (c) 2020 NingLi-iOSer. All rights reserved.
//

import UIKit
import EasyTip

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func show(_ sender: Any) {
        EasyTip.show(in: view, image: #imageLiteral(resourceName: "failure"), message: "Message", duration: 2.0, complete: nil)
    }
}

