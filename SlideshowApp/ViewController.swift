//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 齋藤万璃夢 on 2020/10/10.
//  Copyright © 2020 mari.saito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startstopdisplay: UIButton!
    
    
    var num = 0
    let imagenum = ["猫1.jpg", "猫2.jpg", "猫3.jpg"]
    // タイマー
    var timer: Timer!
    

    
    // ボタン無効化用の変数
    var bottonon: String = "true"
    
    override func viewDidLoad() {
        
        // Image Viewに画像を設定
        imageView.image = UIImage(named: "\(imagenum[num])")
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    @IBAction func NextBotton(_ sender: Any) {
        
        if self.bottonon == "true" {
            switch num {
            case 0...1 :
                // Image Viewに画像を設定
                num += 1
                imageView.image = UIImage(named: "\(imagenum[num])")
            case 2 :
                // Image Viewに画像を設定
                num = 0
                imageView.image = UIImage(named: "\(imagenum[num])")
            default:
                break // do nothing
            }
        }
        
    }
    
    
    @IBAction func BuckBotton(_ sender: Any) {
        if self.bottonon == "true" {
            switch num {
            case 0 :
                // Image Viewに画像を設定
                num = 2
                imageView.image = UIImage(named: "\(imagenum[num])")
            case 1...2 :
                // Image Viewに画像を設定
                num -= 1
                imageView.image = UIImage(named: "\(imagenum[num])")
            default:
                break // do nothing
            }
        }
    }
    
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、2秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        self.num += 1
        switch self.num{
        case 0...2 :
            // Image Viewに画像を設定
            imageView.image = UIImage(named: "\(imagenum[num])")
        default:
            imageView.image = UIImage(named: "\(imagenum[0])")
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil
            num = 0
            startstopdisplay.setTitle("再生", for: .normal)
            bottonon = "true"
        }
    }
    
    
    
    
    @IBAction func StartStop(_ sender: Any) {
        
        num = 0
        imageView.image = UIImage(named: "\(imagenum[0])")
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            startstopdisplay.setTitle("停止", for: .normal)
            bottonon = "false"
        }else {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            imageView.image = UIImage(named: "\(imagenum[0])")
            startstopdisplay.setTitle("再生", for: .normal)
            bottonon = "true"
        }
    }
    @IBAction func tapAction(_ sender: Any) {
        if self.timer !== nil {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            startstopdisplay.setTitle("再生", for: .normal)
            bottonon = "true"
        }
        
        self.performSegue(withIdentifier: "toSlide", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let slideViewController:SlideViewController = segue.destination as! SlideViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        slideViewController.x = num
    }
    
    
    
    
}

