//
//  SecondViewController.swift
//  NewXcodeBasicApp
//
//  Created by 高橋康之 on 2020/09/20.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //ViewControllerから持ってきたデータを保存する配列
    var costTaxArray:[Double] = []
    
    var totalCost:Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        //配列のデータを持ってくる
        costTaxArray = UserDefaults.standard.object(forKey: "item")as! [Double]
        print(costTaxArray)
        //足し続ける
        totalCost = costTaxArray.reduce(0){(Num1:Double,Num2:Double) -> Double in return Num1 + Num2
        }
        print(totalCost)
        //ラベルに表示
        costTaxLabel.text = String(totalCost)
        
        UserDefaults.standard.set(totalCost, forKey: "answe")
    }
    
    
    @IBOutlet var costTaxLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
