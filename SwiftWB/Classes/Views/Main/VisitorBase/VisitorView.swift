//
//  VisitorView.swift
//  SwiftWB
//
//  Created by qufenqi on 16/1/29.
//  Copyright © 2016年 王正一. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    // MARK: -懒加载控件
    // 小房子
    private lazy var bgImageView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    // 轮子
    private lazy var wheelView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    // 灰色遮罩
    private lazy var greyView : UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    // 消息文字
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    // 登陆和注册的按钮
//    private lazy var loginBtn : UIButton = {
//        
//    }()
}
extension VisitorView{
    
    @objc private func setupUI(){
        // 设置背景颜色
//        backgroundColor = UIColor.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        // 添加控件
        addSubview(wheelView)
        addSubview(greyView)
        addSubview(bgImageView)
        addSubview(titleLabel)
        // 设置自动布局
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraint(NSLayoutConstraint(item: bgImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: bgImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: wheelView, attribute: .centerX, relatedBy: .equal, toItem: bgImageView, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: wheelView, attribute: .centerY, relatedBy: .equal, toItem: bgImageView, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: bgImageView, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: bgImageView, attribute: .centerY, multiplier: 1, constant: 100))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 224))
        addConstraint(NSLayoutConstraint(item: greyView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: greyView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: greyView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: greyView, attribute: .bottom, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 100))
    }
}
