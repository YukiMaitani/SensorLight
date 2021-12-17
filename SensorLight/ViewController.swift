//
//  ViewController.swift
//  SensorLight
//
//  Created by 米谷裕輝 on 2021/12/11.
//

import UIKit

class ViewController: UIViewController {
    let link = UIImageView()
    let bokoblin = UIImageView()
    let guardian = UIImageView()
    //クラス内で使用するためインスタンス変数として定義
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    let textLabel = UILabel()
    var drawView = DrawView()
    var lightDrawView = UIView()
    //タッチしたとき有効になるようにデフォルトはfalse
    var linkMove = false
    var bokoblinMove = false

    //明るさ
    var brightness:CGFloat = 0.0
    @IBAction func brightValue(_ sender: UISlider) {
        brightness = CGFloat(sender.value)
        UIScreen.main.brightness = brightness
        if brightness > 0.4{
            textLabel.text = "オヤスミチュウ"
            drawView.isHidden = true
        }else{
            textLabel.text = "サクテキチュウ"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // link
        screenWidth = view.frame.size.width
        screenHeight = view.frame.size.height
        link.image = UIImage(named: "Link")
        link.frame = CGRect(x:0, y:0, width:128, height:128)
        link.center = CGPoint(x:screenWidth/6, y:screenHeight/6*5)
        link.isUserInteractionEnabled = true
        self.view.addSubview(link)
        
        //bokoblin
        bokoblin.image = UIImage(named: "Bokoblin")
        bokoblin.frame = CGRect(x: 0, y: 0, width: 128, height: 128)
        bokoblin.center = CGPoint(x: screenWidth/6*5, y: screenHeight/6*5)
        bokoblin.isUserInteractionEnabled = true
        self.view.addSubview(bokoblin)
        
        //guardian
        guardian.image = UIImage(named: "FlyingGuardian")
        guardian.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        guardian.center = CGPoint(x: screenWidth/2, y: screenHeight/3)
        self.view.addSubview(guardian)
        
        //描写するためのboxを用意している。なので、frameでview全体を指定するのが望ましい
        drawView = DrawView(frame: self.view.bounds)
        drawView.backgroundColor = UIColor.clear
        //一番前にいると全体を覆っているため、スライダーが操作できなくなる
        self.view.addSubview(drawView)
        self.view.sendSubviewToBack(drawView)
        
        //line
        let lineDrawView = LineDrawView(frame: self.view.bounds)
        lineDrawView.backgroundColor = UIColor.clear
        self.view.addSubview(lineDrawView)
        self.view.sendSubviewToBack(lineDrawView)
        
        
        //テキスト
        textLabel.frame = CGRect(x: screenWidth/2-100, y: screenHeight/3-100,width:200,height:20)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.text = "サクテキチュウ"
        self.view.addSubview(textLabel)
        
        brightness = UIScreen.main.brightness
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch touches.first?.view?.frame{
        case link.frame:
            linkMove = true
        case bokoblin.frame:
            bokoblinMove = true
        default:
            return
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchEvent = touches.first!
        //in:linkだと分身する？
        let newx = touchEvent.location(in: self.view).x
        let newy = touchEvent.location(in: self.view).y
        //コントローラーと切り分ける
        guard newy > (screenHeight/7)+64 else{return}
        if linkMove{link.center = CGPoint(x:newx,y:newy)}
        if bokoblinMove{bokoblin.center = CGPoint(x: newx, y: newy)}
        guard brightness < 0.4 else{
            textLabel.text = "オヤスミチュウ"
            drawView.isHidden = true
            return
        }
        if link.frame.midX < (screenWidth/2)+80 && link.frame.midX > (screenWidth/2)-70 && link.frame.midY >= screenHeight/3+65 {
            textLabel.text = "テキハッケン"
            drawView.isHidden = false
        }else{
            textLabel.text = "サクテキチュウ"
            drawView.isHidden = true
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        linkMove = false
        bokoblinMove = false
    }

}

