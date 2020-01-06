//
//  EasyTipOption.swift
//  EasyTip
//
//  Created by Ning Li on 2020/1/6.
//  Copyright © 2020 ningli. All rights reserved.
//

import UIKit

struct EasyTipOption {
    /// 背景色
    let backgroundColor: UIColor
    /// 阴影
    let shadow: EasyTipShadow?
    /// 文本字体
    let textFont: UIFont
    /// 文本颜色
    let textColor: UIColor
    /// 文本对齐方式
    let textAligment: NSTextAlignment
    /// 向上轻扫 dismiss
    var isEnableSwipeDismiss = true
    
    static let `default` = EasyTipOption(backgroundColor: UIColor.white,
                                         shadow: .default,
                                         textFont: UIFont.systemFont(ofSize: 15),
                                         textColor: UIColor.black,
                                         textAligment: .center)
}

/// 阴影
struct EasyTipShadow {
    let shadowOffset: CGSize
    let shadowOpacity: Float
    let shadowRadius: CGFloat
    let shadowColor: CGColor
    
    static let `default` = EasyTipShadow(shadowOffset: CGSize.zero, shadowOpacity: 0.4, shadowRadius: 4, shadowColor: UIColor.gray.cgColor)
}
