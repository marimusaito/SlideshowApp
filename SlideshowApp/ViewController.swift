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
    
    
        var imagename: [String]  = ["猫1", "猫2", "猫3"]
    
    // タイマー
    var timer: Timer!

    // タイマー用の時間のための変数
    var timer_sec: Float = 0


    override func viewDidLoad() {

        // Image Viewに画像を設定
               imageView.image = UIImage(named: "1.jpg")
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

   
    @IBAction func NextBotton(_ sender: Any) {
        
        while num < 3 {
            num += 1
            imageView.image = UIImage(named: "\(imagename[num]).jpg")
        }
        for num in imagenum {
            // Image Viewに画像を設定
            imageView.image = UIImage(named: "\(num).jpg")
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
    // timeInterval: 0.1, repeats: true で指定された通り、1秒毎に呼び出され続ける
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
    @IBAction func tapAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toSlide", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let slideViewController:SlideViewController = segue.destination as! SlideViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        slideViewController.x = num
    }

    
    

}

