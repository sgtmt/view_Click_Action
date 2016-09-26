//
//  ButtonViewController.swift
//  btnClick
//
//  Created by 長沢　遼 on 2016/09/26.
//  Copyright © 2016年 Sgtmt. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   public func xb(){
        let myButton: UIButton = UIButton()
        let buttonWidth: CGFloat = 200
        let buttonHeight: CGFloat = 40
        let posX: CGFloat = (self.view.bounds.width - buttonWidth)/2
        let posY: CGFloat = 200
        myButton.frame = CGRect(x: posX, y: posY, width: buttonWidth, height: buttonHeight)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.layer.cornerRadius = 20.0
        myButton.setTitle("UIAlertを発動", for: .normal)
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.addTarget(self, action: #selector(onClickMyButton(sender:)), for: .touchDown)
        
        // ボタンをViewに追加する
        self.view.addSubview(myButton)
        
    }
    internal func onClickMyButton(sender: UIButton){
        
        // UIAlertControllerを作成する.
        let myAlert: UIAlertController = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .alert)
        
        // OKのアクションを作成する.
        let myOkAction = UIAlertAction(title: "OK", style: .default) { action in
            print("Action OK!!")
        }
        
        // OKのActionを追加する.
        myAlert.addAction(myOkAction)
        
        // UIAlertを発動する.
        present(myAlert, animated: true, completion: nil)
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
