//
//  DrawView.swift
//  SensorLight
//
//  Created by 米谷裕輝 on 2021/12/14.
//

import UIKit

class DrawView: UIView {
    var guardian:UIImageView = UIImageView()
    var rectangle = UIBezierPath()
    var whiteRectangle = UIBezierPath()
    var brightness = CGFloat()
    override func draw(_ rect: CGRect) {
        //10はガーディアンの画像の関係による微調整
        rectangle = UIBezierPath(rect: CGRect(x:Int(frame.width/2-10) , y:Int(frame.height/3+guardian.frame.height/2-10) , width: Int(guardian.frame.width/5), height: Int(frame.height/2)))
            UIColor(red: 1, green: 0.5, blue: 0, alpha: 0.3).setFill()
            rectangle.fill()
    }
}
