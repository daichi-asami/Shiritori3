//
//  Turn2shiritoriViewController.swift
//  Shiritori3
//
//  Created by Daichi Asami on 2020/07/13.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit

class Turn2shiritoriViewController: UIViewController {
    var turnnumber: Int!
    var shiritorienterword = ""
    var correctnumber: Int!
    @IBOutlet var label1: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if turnnumber == 2{
            label1.text = String("2Pと1Pの順番を入れ替えます\n\n\n2Pの人は\n\n1Pの人に見られないように\n\n表示される単語から\n\nしりとりをしたら\n\n完了ボタンを押してください")
        }else if turnnumber %  2 == 1{
            label1.text = String("1Pがしりとりをする\n\nターンです")
        }else{
            label1.text = String("2Pがしりとりをする\n\nターンです")
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let shiritoriViewContoroller = segue.destination as! ShiritoriViewController
            shiritoriViewContoroller.turnnumber = turnnumber
            shiritoriViewContoroller.lastword = shiritorienterword
            shiritoriViewContoroller.correctnumber = correctnumber
        }
    }
    
    
    
}
