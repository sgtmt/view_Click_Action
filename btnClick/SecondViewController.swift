//
//  SecondViewController.swift
//  btnClick
//
//  Created by 長沢　遼 on 2016/09/22.
//  Copyright © 2016年 Sgtmt. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIScrollViewDelegate{
    private var pageControl: UIPageControl!
    private var scrollView: UIScrollView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // ビューの縦、横のサイズを取得する.
        let width = self.view.frame.maxX, height = self.view.frame.maxY
        
        // 背景の色をCyanに設定する.
        self.view.backgroundColor = UIColor.cyan
        
        // ScrollViewを取得する.
        scrollView = UIScrollView(frame: self.view.frame)
        
        // ページ数を定義する.
        let pageSize = 4
        
        // 縦方向と、横方向のインディケータを非表示にする.
        scrollView.showsHorizontalScrollIndicator = false;
        scrollView.showsVerticalScrollIndicator = false
        
        // ページングを許可する.
        scrollView.isPagingEnabled = true
        
        // ScrollViewのデリゲートを設定する.
        scrollView.delegate = self
        
        // スクロールの画面サイズを指定する.
        
        scrollView.contentSize = CGSize(width: CGFloat(pageSize) * width, height: 0)
        
        // ScrollViewをViewに追加する.
        self.view.addSubview(scrollView)
        
        
        
        // ページ数分ボタンを生成する.
        for i in 0 ..< pageSize {
            
            
            
            // ページごとに異なるラベルを生成する.
            
            let myLabel:UILabel = UILabel(frame: CGRect(x: CGFloat(i) * width + width/2 - 40, y: height/2 - 40, width: 80, height: 80))
            myLabel.backgroundColor = UIColor.black
            myLabel.textColor = UIColor.white
            myLabel.textAlignment = NSTextAlignment.center
            myLabel.layer.masksToBounds = true
            myLabel.text = "Page\(i)"
            
            myLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
            myLabel.layer.cornerRadius = 40.0
            
            switch i {
            case 0:
                myLabel.text = "123"
                makeButton()
                break
            case 1:
              myLabel.text = "345"
                break
            case 2:
                myLabel.text = "456"
                break
            case 3:
                myLabel.text = "567"
                break
            default:
                break
            }


            
            
            scrollView.addSubview(myLabel)
            if(i == 3){
                myLabel.backgroundColor = UIColor.green
                            myLabel.text = "おなかすいた"
                
                
                
            }else{
                
            }
          
         
        }
        
        // PageControlを作成する.
        pageControl = UIPageControl(frame: CGRect(x:0, y:self.view.frame.maxY - 100, width:width, height:50))
        pageControl.backgroundColor = UIColor.orange
        
        // PageControlするページ数を設定する.
        pageControl.numberOfPages = pageSize
        
        // 現在ページを設定する.
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        
        if(pageControl.currentPage == 3){
            
        }
        
        self.view.addSubview(pageControl)
    
}
  
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        // スクロール数が1ページ分になったら時.
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
            // ページの場所を切り替える.
            pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
            
         
        }
    }
    func makeButton(){
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
        scrollView.addSubview(myButton)
        
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


        // Do any additional setup after loading the view.


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
