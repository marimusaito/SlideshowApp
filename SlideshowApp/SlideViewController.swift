//
//  SlideViewController.swift
//  SlideshowApp
//
//  Created by 齋藤万璃夢 on 2020/10/12.
//  Copyright © 2020 mari.saito. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    // バンドルした画像ファイルを読み込み
    let image1 = UIImage(named: "cat-649164_640.jpg")
    let image2 = UIImage(named: "cat-3535404_640.jpg")
    let image3 = UIImage(named: "cat-4189697_640.jpg")

    // 受け取るためのプロパティ（変数）を宣言しておく
    var x:Int = 0
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch x {
        case 1 :
            // Image Viewに画像を設定
            imageView.image = image1
        case 2 :
            // Image Viewに画像を設定
            imageView.image = image2
        case 3 :
            // Image Viewに画像を設定
            imageView.image = image3
        default:
            break // do nothing
            
            // Do any additional setup after loading the view.
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
