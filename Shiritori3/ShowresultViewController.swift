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
