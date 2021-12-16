//
//  LineDrawView.swift
//  SensorLight
//
//  Created by 米谷裕輝 on 2021/12/16.
//

import UIKit

class LineDrawView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let line = UIBezierPath()
        line.move(to: CGPoint(x: 0, y:frame.height/7 ))
        line.addLine(to: CGPoint(x: frame.width, y: frame.height/7))
        line.close()
        line.stroke()
    }

}
