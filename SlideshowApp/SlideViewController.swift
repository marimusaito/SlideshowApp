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
    let imagenum = ["猫1.jpg", "猫2.jpg", "猫3.jpg"]

    // 受け取るためのプロパティ（変数）を宣言しておく
    var x:Int = 0
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "\(imagenum[x])")
        
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
