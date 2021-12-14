//
//  ViewController.swift
//  SensorLight
//
//  Created by 米谷裕輝 on 2021/12/11.
//

import UIKit

class ViewController: UIViewController {
    let link = UIImageView()
    let guardian = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // link
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        link.image = UIImage(named: "Link")
        link.frame = CGRect(x:0, y:0, width:128, height:128)
        link.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        link.isUserInteractionEnabled = true
        self.view.addSubview(link)
        
        //guardian
        guardian.image = UIImage(named: "FlyingGuardian")
        guardian.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        guardian.center = CGPoint(x: screenWidth/2, y: screenHeight/3)
        self.view.addSubview(guardian)
        
        //描写するためのboxを用意している。なので、frameでview全体を指定するのが望ましい
        let drawView = DrawView(frame: self.view.bounds)
        drawView.backgroundColor = UIColor.clear
        self.view.addSubview(drawView)
        
        //テキスト
        let textLabel = UILabel()
        textLabel.frame = CGRect(x: screenWidth/2-100, y: screenHeight/3-100,width:200,height:20)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.text = "サクテキチュウ"
        self.view.addSubview(textLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchEvent = touches.first!
        let newx = touchEvent.location(in: self.view).x
        let newy = touchEvent.location(in: self.view).y
        link.center = CGPoint(x:newx,y:newy)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchEvent = touches.first!
        //in:linkだと分身する？
        let newx = touchEvent.location(in: self.view).x
        let newy = touchEvent.location(in: self.view).y
        print("x:\(newx),y:\(newy)")
        link.center = CGPoint(x:newx,y:newy)
    }


}

