//
//  ViewController.swift
//  NewXcodeBasicApp
//
//  Created by 高橋康之 on 2020/09/19.
//  Copyright © 2020 yasu.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITableViewDelegate,UITableViewDataSourceを使うときは書く
        itemTableView.delegate = self
        itemTableView.dataSource = self
        
    }
    //受け皿
    //最初の値
    var cost:Double = 0
    //cost*taxの値
    var costTax:Double = 0
    //配列をどんどん入れるための空の配列
    var costArray:[Double] = []
    //costTaxをどんどん足していく値
    var totalCost:Double = 0
    //テーブルビューの空の配列
    
    //テーブルビュー
    @IBOutlet var itemTableView: UITableView!
    
    @IBOutlet var answerLabel: UILabel!
    
    
    @IBOutlet var costLabel: UITextField!
    
    @IBOutlet var taxController: UISegmentedControl!
    
    @IBAction func taxButton(_ sender: Any) {
        cost = Double(costLabel.text!)!
//        print(cost)
        if taxController.selectedSegmentIndex == 0{
            costTax = cost * 1.1
        }else{
            costTax = cost * 1.08
        }
//        print(costTax)
        answerLabel.text = String(costTax)
        
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        costArray.append(contentsOf: [costTax])
//        print(costArray)
        
        //costTaxをどんどん足していく値
        totalCost = totalCost + costTax
        print(totalCost)
        //配列を保存
        UserDefaults.standard.set(costArray, forKey: "item")
        
        //テーブルビューをリロード
        self.itemTableView.reloadData()
        
        //ラベルとテキストフィールドを空にしてあげる
        costLabel.text = ""
        
    }
    
    //ここからテーブルビュー
    //セクションの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costArray.count
    }
    //セルに表示する内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //"Cell"というIDのセルを何個用意するか決める(セルの生成)
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //表示内容を決める
        cell.textLabel?.text = "\(costArray[indexPath.row])"
        
        return cell
        
    }
    
}

