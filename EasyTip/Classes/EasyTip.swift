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
    
    private class LoadBundleClass { }
    
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
    
    public static func success(in view: UIView?, message: String?, option: EasyTipOption = .default, duration: TimeInterval = 2.0, complete: EasyTipComplete?) {
        let bundle = Bundle(for: LoadBundleClass.self)
        let scale = UIScreen.main.scale
        let imageName = "icon_success@\(scale)x.png"
        if let image = UIImage(named: imageName, in: bundle, compatibleWith: nil) {
            show(in: view, image: image, message: message, option: option, duration: duration, complete: complete)
        }
    }
}
