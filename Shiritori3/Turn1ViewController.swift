//
//  Turn1ViewController.swift
//  Shiritori3
//
//  Created by Daichi Asami on 2020/07/13.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit

class Turn1ViewController: UIViewController {
    var turnnumber: Int!
    var shiritorienterword = ""
    var lastword = ""
    var correctnumber: Int!
    @IBOutlet var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if turnnumber == 1{
            label1.text = String("スマホを2Pの人に\n\n渡してください\n\n\n2Pの人は1Pの人が打った\n\n単語を予測して\n\nその単語に続いて\n\nしりとりしてください")
        }else if turnnumber == 2{
            label1.text = String("スマホを1Pの人に\n\n渡してください\n\n\n1Pの人は2Pの人が打った\n\n単語を予測して\n\nその単語に続いて\n\nしりとりしてください")
        }else if turnnumber % 2 == 1{
            label1.text = String("2Pが予測をする\n\nターンです")
        }else{
            label1.text = String("1Pが予測をする\n\nターンです")
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let yosokuViewContoroller = segue.destination as! YosokuViewController
            yosokuViewContoroller.turnnumber = turnnumber
            yosokuViewContoroller.shiritorienterword = shiritorienterword
            yosokuViewContoroller.lastword = lastword
            yosokuViewContoroller.correctnumber = correctnumber
        }
    }
    
    
    
}
