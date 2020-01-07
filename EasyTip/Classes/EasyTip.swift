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
    
    @discardableResult
    public static func show(in view: UIView?, image: UIImage?, message: String?, option: EasyTipOption = .default, duration: TimeInterval = 0, complete: EasyTipComplete?) -> EasyTipContentView {
        let v = EasyTipContentView(image: image, message: message, option: option, complete: complete)
        if let superView = view {
            superView.addSubview(v)
        } else {
            guard let window = UIApplication.shared.keyWindow else {
                return v
            }
            window.addSubview(v)
        }
        
        if duration > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                v.dismiss()
            }
        }
        return v
    }
    
    /// Show success tip
    /// - Parameters:
    ///   - view: super view
    ///   - message: tip message
    ///   - option: option
    ///   - duration: show time
    ///   - complete: complete handler
    public static func success(in view: UIView?, message: String?, option: EasyTipOption = .default, duration: TimeInterval = 2.0, complete: EasyTipComplete?) {
        let bundle = Bundle(for: LoadBundleClass.self)
        guard let bundleURL = bundle.url(forResource: "EasyTip", withExtension: "bundle"),
            let targetBundle = Bundle(url: bundleURL)
            else {
                return
        }
        let imageName = "icon_success"
        if let image = UIImage(named: imageName, in: targetBundle, compatibleWith: nil) {
            show(in: view, image: image, message: message, option: option, duration: duration, complete: complete)
        }
    }
    
    /// Show error tip
    /// - Parameters:
    ///   - view: super view
    ///   - message: tip message
    ///   - option: option
    ///   - duration: show time
    ///   - complete: complete handler
    public static func error(in view: UIView?, message: String?, option: EasyTipOption = .default, duration: TimeInterval = 2.0, complete: EasyTipComplete?) {
        let bundle = Bundle(for: LoadBundleClass.self)
        guard let bundleURL = bundle.url(forResource: "EasyTip", withExtension: "bundle"),
            let targetBundle = Bundle(url: bundleURL)
            else {
                return
        }
        let imageName = "icon_failure"
        if let image = UIImage(named: imageName, in: targetBundle, compatibleWith: nil) {
            show(in: view, image: image, message: message, option: option, duration: duration, complete: complete)
        }
    }
}
