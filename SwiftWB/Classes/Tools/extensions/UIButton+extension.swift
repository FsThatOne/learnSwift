//
//  UIButton+extension.swift
//  learnSwift
//
//  Created by qufenqi on 16/1/26.
//  Copyright © 2016年 王正一. All rights reserved.
//

import UIKit

extension UIButton{
    /**
     便利构造函数
     - parameter imageName:   按钮图片名称
     - parameter bgImageName: 按钮背景图片名称
     - returns: 构造完成的按钮
     */
    convenience init(imageName: String, bgImageName: String){
        self.init()
        setImage(UIImage(named: imageName), for: UIControlState())
        setImage(UIImage(named: imageName + "_hightlighted"), for: UIControlState.highlighted)
        setBackgroundImage(UIImage(named: bgImageName), for: UIControlState())
        setBackgroundImage(UIImage(named: bgImageName + "_hightlighted"), for: UIControlState.highlighted)
        sizeToFit()
    }
}
