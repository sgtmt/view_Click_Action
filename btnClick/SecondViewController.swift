//
//  SecondViewController.swift
//  btnClick
//
//  Created by 長沢　遼 on 2016/09/22.
//  Copyright © 2016年 Sgtmt. All rights reserved.
//

import UIKit

class SecondViewController:UIViewController {
   private var mySystemButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor.green
        
         mySystemButton = UIButton(type: .system)
        // ボタンの位置を指定する
        
        // Systemボタンのサイズ.
        let sWidth: CGFloat = 200
        let sHeight: CGFloat = 50
        // Systemボタンの配置するx,y座標
        let sposX: CGFloat = self.view.frame.width/2 - sWidth/2
        let sposY: CGFloat = 250
        
        // Systemボタンに配置するx,y座標とサイズを設定.
        mySystemButton.frame = CGRect(x: sposX, y: sposY, width: sWidth, height: sHeight)
        
        // Systemボタンにタイトルを設定する.
        mySystemButton.setTitle("MySystemButton", for: .normal)
    
        mySystemButton.addTarget(self, action: #selector(SecondViewController.onClickMyButton(sender:)), for: .touchDown)
        
        self.view.addSubview(mySystemButton)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     internal func onClickMyButton(sender: UIButton) {
        let mySecondViewController: UIViewController = ViewController()
        
        // アニメーションを設定する.
        mySecondViewController.modalTransitionStyle = .partialCurl
        
        
        // Viewの移動する.
        self.present(mySecondViewController, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
