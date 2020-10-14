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
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startstopdisplay: UIButton!
    
    
    var num = 1
    
    // タイマー
    var timer: Timer!

    // タイマー用の時間のための変数
    var timer_sec: Float = 0

    // バンドルした画像ファイルを読み込み
    let image1 = UIImage(named: "cat-649164_640.jpg")
    let image2 = UIImage(named: "cat-3535404_640.jpg")
    let image3 = UIImage(named: "cat-4189697_640.jpg")

    override func viewDidLoad() {

        // Image Viewに画像を設定
               imageView.image = image1
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func NextBotton(_ sender: Any) {
        switch num {
        case 1 :
            // Image Viewに画像を設定
            imageView.image = image2
            num = 2
        case 2 :
            // Image Viewに画像を設定
            imageView.image = image3
            num = 3
        case 3 :
            // Image Viewに画像を設定
            imageView.image = image1
            num = 1
        default:
            break // do nothing
        }
        
    }
    @IBAction func BuckBotton(_ sender: Any) {
        switch num {
        case 1 :
            // Image Viewに画像を設定
            imageView.image = image3
            num = 3
        case 2 :
            // Image Viewに画像を設定
            imageView.image = image1
            num = 1
        case 3 :
            // Image Viewに画像を設定
            imageView.image = image2
            num = 2
        default:
            break // do nothing
        }

    }
    
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        switch self.timer_sec{
        case 0...1 :
            // Image Viewに画像を設定
            imageView.image = image1
        case 2...3 :
            // Image Viewに画像を設定
            imageView.image = image2
        case 4...5 :
            // Image Viewに画像を設定
            imageView.image = image3
        default:
            imageView.image = image1
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil
            self.timer_sec = 0
            num = 1

        }
    }

    
    
    
    @IBAction func StartStop(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            num = 0
            startstopdisplay.setTitle("停止", for: .normal)
        }else {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の self.timer == nil で判断するために、 self.timer = nil としておく
            self.timer_sec = 0
            imageView.image = image1
            num = 1
            startstopdisplay.setTitle("再生", for: .normal)

        }
    }

    
    

}

