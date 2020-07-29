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
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if turnnumber == 1{
            label2.isHidden = true
            label3.isHidden = true
            label4.isHidden = true
        }else if turnnumber == 2{
            label1.isHidden = true
            label3.isHidden = true
            label4.isHidden = true
        }else if turnnumber % 2 == 1{
            label1.isHidden = true
            label2.isHidden = true
            label4.isHidden = true
        }else{
            label1.isHidden = true
            label2.isHidden = true
            label3.isHidden = true
        }

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toSecond" {
        let yosokuViewContoroller = segue.destination as! YosokuViewController
        yosokuViewContoroller.turnnumber = turnnumber
        yosokuViewContoroller.shiritorienterword = shiritorienterword
        yosokuViewContoroller.lastword = lastword
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
