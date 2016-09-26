//
//  buttonControll.swift
//  btnClick
//
//  Created by 長沢　遼 on 2016/09/26.
//  Copyright © 2016年 Sgtmt. All rights reserved.
//

import Foundation
//buttonを管理する

func xb(){
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
