//
//  EasyTipContentView.swift
//  EasyTip
//
//  Created by Ning Li on 2020/1/6.
//  Copyright © 2020 ningli. All rights reserved.
//

import UIKit

private let kEasyTipContentViewHeight: CGFloat = 56

class EasyTipContentView: UIView {
    
    private let option: EasyTipOption
    private var complete: EasyTipComplete?
    private var isDismiss: Bool = false
    
    init(message: String?, option: EasyTipOption, complete: EasyTipComplete?) {
        self.option = option
        self.complete = complete
        let rect = CGRect(x: 10, y: -kEasyTipContentViewHeight, width: UIScreen.main.bounds.width - 20, height: kEasyTipContentViewHeight)
        super.init(frame: rect)
        
        setupUI(size: rect.size, message: message)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(size: CGSize, message: String?) {
        backgroundColor = UIColor.clear
        
        // 背景
        let rect = CGRect(origin: CGPoint.zero, size: size)
        let backgroundLayer = CAShapeLayer()
        backgroundLayer.fillColor = option.backgroundColor.cgColor
        backgroundLayer.frame = rect
        let backgroundPath = UIBezierPath(roundedRect: rect, cornerRadius: 0)
        backgroundLayer.path = backgroundPath.cgPath
        layer.addSublayer(backgroundLayer)
        
        // 提示文本
        if let message = message {
            let tipLabel = UILabel(frame: rect)
            tipLabel.text = message
            tipLabel.font = option.textFont
            tipLabel.textColor = option.textColor
            tipLabel.textAlignment = option.textAligment
            addSubview(tipLabel)
        }
        
        if let shadow = option.shadow {
            backgroundLayer.shadowColor = shadow.shadowColor
            backgroundLayer.shadowOffset = shadow.shadowOffset
            backgroundLayer.shadowRadius = shadow.shadowRadius
            backgroundLayer.shadowOpacity = shadow.shadowOpacity
            
            let shadowPath = UIBezierPath(rect: rect)
            backgroundLayer.shadowPath = shadowPath.cgPath
        }
        
        if option.isEnableSwipeDismiss {
            addSwipeGeature()
        }
        
        show()
    }
    
    private func addSwipeGeature() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeRecognizer(swipe:)))
        swipe.direction = .up
        addGestureRecognizer(swipe)
    }
}

extension EasyTipContentView {
    private func show() {
        UIView.animate(withDuration: 0.25) {
            self.frame.origin.y = UIApplication.shared.statusBarFrame.height
        }
    }
    
    func dismiss() {
        if isDismiss {
            return
        }
        isDismiss = true
        UIView.animate(withDuration: 0.25, animations: {
            self.frame.origin.y = -kEasyTipContentViewHeight
        }) { (_) in
            self.complete?()
            self.removeFromSuperview()
        }
    }
}

extension EasyTipContentView {
    @objc private func swipeRecognizer(swipe: UISwipeGestureRecognizer) {
        dismiss()
    }
}
