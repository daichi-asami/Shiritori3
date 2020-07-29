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
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if turnnumber == 2{
            label2.isHidden = true
            label3.isHidden = true
        }else if turnnumber %  2 == 1{
            label1.isHidden = true
            label3.isHidden = true
        }else{
            label1.isHidden = true
            label2.isHidden = true
        }
        
        

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toSecond" {
        let shiritoriViewContoroller = segue.destination as! ShiritoriViewController
        shiritoriViewContoroller.turnnumber = turnnumber
        shiritoriViewContoroller.lastword = shiritorienterword
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
