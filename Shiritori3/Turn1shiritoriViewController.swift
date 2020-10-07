//
//  Turn1shiritoriViewController.swift
//  Shiritori3
//
//  Created by Daichi Asami on 2020/07/13.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit

class Turn1shiritoriViewController: UIViewController {
    var turnnumber: Int = 1
    var enterword = ""
    var correctnumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let shiritoriViewContoroller = segue.destination as! ShiritoriViewController
            shiritoriViewContoroller.turnnumber = turnnumber
            shiritoriViewContoroller.correctnumber = correctnumber
        }
    }
    
    
    
}
