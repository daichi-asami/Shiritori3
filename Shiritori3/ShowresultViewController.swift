//
//  ShowresultViewController.swift
//  Shiritori3
//
//  Created by Daichi Asami on 2020/07/13.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit

class ShowresultViewController: UIViewController {
    var turnnumber: Int!
    var shiritorienterword = ""
    var yosokuenterword = ""
    var correctnumber: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let turnresultViewContoroller = segue.destination as! TurnresultViewController
            turnresultViewContoroller.turnnumber = turnnumber + 1
            turnresultViewContoroller.shiritorienterword = shiritorienterword
            turnresultViewContoroller.yosokuenterword = yosokuenterword
            turnresultViewContoroller.correctnumber = correctnumber
        }
    }
    
    
}
