//
//  EasyTip.swift
//  EasyTip
//
//  Created by Ning Li on 2020/1/6.
//  Copyright © 2020 ningli. All rights reserved.
//

import Foundation
import UIKit

public typealias EasyTipComplete = (() -> Void)

public struct EasyTip {
    
    public static func show(in view: UIView?, image: UIImage?, message: String?, option: EasyTipOption = .default, duration: TimeInterval, complete: EasyTipComplete?) {
        let v = EasyTipContentView(image: image, message: message, option: option, complete: complete)
        if let superView = view {
            superView.addSubview(v)
        } else {
            guard let window = UIApplication.shared.keyWindow else {
                return
            }
            window.addSubview(v)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            v.dismiss()
        }
    }
}
