//
//  DrawView.swift
//  SensorLight
//
//  Created by 米谷裕輝 on 2021/12/14.
//

import UIKit

class DrawView: UIView {

    override func draw(_ rect: CGRect) {
        let rectangle = UIBezierPath(rect: CGRect(x:Int(frame.width)/2-10 , y:Int(frame.height)/3+65 , width: 30, height: Int(frame.height)/2))
        UIColor(red: 1, green: 0.5, blue: 0, alpha: 0.3).setFill()
        rectangle.fill()
        
        let line = UIBezierPath()
        line.move(to: CGPoint(x: 0, y:frame.height/7 ))
        line.addLine(to: CGPoint(x: frame.width, y: frame.height/7))
        line.close()
        line.stroke()
    }
   
}
