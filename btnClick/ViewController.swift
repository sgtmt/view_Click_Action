//
//  ViewController.swift
//  btnClick
//
//  Created by 長沢　遼 on 2016/09/22.
//  Copyright © 2016年 Sgtmt. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    private var myButton: UIButton!
    private var myProgressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                // ボタンをViewに追加.
        noficationAction()
 
       
        progress()
        
        Timer.scheduledTimer(timeInterval: 7.2, target: self, selector: #selector(ViewController.onUpdate(timer:)), userInfo: nil, repeats: true)
        
                  }
    func makeButton(){
        
        myButton = UIButton()

        
        // ボタンのサイズ.
        let bWidth: CGFloat = 200
        let bHeight: CGFloat = 50
        
        // ボタンのX,Y座標.
        let posX: CGFloat = self.view.frame.width/2 - bWidth/2
        let posY: CGFloat = self.view.frame.height/2 - bHeight/2
        
        // ボタンの設置座標とサイズを設定する.
        myButton.frame = CGRect(x: posX, y: posY, width: bWidth, height: bHeight)
        
        // ボタンの背景色を設定.
        myButton.backgroundColor = UIColor.red
        
        // ボタンの枠を丸くする.
        myButton.layer.masksToBounds = true
        
        // コーナーの半径を設定する.
        myButton.layer.cornerRadius = 20.0
        
        // タイトルを設定する(通常時).
        myButton.setTitle("ボタン(通常)", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        
        // タイトルを設定する(ボタンがハイライトされた時).
        myButton.setTitle("ボタン(押された時)", for: .highlighted)
        myButton.setTitleColor(UIColor.black, for: .highlighted)
        
        // ボタンにタグをつける.
        myButton.tag = 1
       
        
        // イベントを追加する
        myButton.addTarget(self, action: #selector(ViewController.onClickMyButton(sender:)), for: .touchUpInside)
        
         self.view.addSubview(myButton)
        
           }

       func noficationAction(){
        let center:UNUserNotificationCenter = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge], completionHandler: {(permit, error) in
            
            if permit {
                print("通知が許可されました")
            }else {
                print("通知が拒否されました")
            }
            
            //バッジの数の設定.
            UIApplication.shared.applicationIconBadgeNumber = 1
            
        })

    }
    internal func onClickMyButton(sender: UIButton) {
        print("onClickMyButton:");
        print("sender.currentTitle: \(sender.currentTitle)")
        print("sender.tag: \(sender.tag)")
        
        
        
        // 遷移するViewを定義する.
        let mySecondViewController: UIViewController = SecondViewController()
        
        // アニメーションを設定する.
        mySecondViewController.modalTransitionStyle = .partialCurl
        
     
        // Viewの移動する.
        self.present(mySecondViewController, animated: true, completion: nil)
    }
    func progress(){
        // ProgressViewを作成する.
        
        myProgressView = UIProgressView()
        
        myProgressView = UIProgressView(frame: CGRect(x:0, y:0, width:200, height:10))
        myProgressView.progressTintColor = UIColor.green
        myProgressView.trackTintColor = UIColor.white
        
        // 座標を設定する.
        myProgressView.layer.position = CGPoint(x: self.view.frame.width/2, y: 200)
        
        // バーの高さを設定する(横に1.0倍,縦に2.0倍).
        myProgressView.transform = CGAffineTransform(scaleX: 1.0, y: 2.0)
        
        // 進捗具合を設定する(0.0~1.0).
        myProgressView.progress = 0.3
        
        
        // アニメーションを付ける.
        myProgressView.setProgress(1.0, animated: true)
     
        self.view.addSubview(myProgressView)
        if( myProgressView.progress == 8.0){
            print(myProgressView.progress);
            
            
            //
     
            
                   }        // Viewに追加する.
    
    }
     func onUpdate(timer : Timer){
        self.myProgressView.removeFromSuperview()
                      makeButton()

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

