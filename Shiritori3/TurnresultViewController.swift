//
//  TurnresultViewController.swift
//  Shiritori3
//
//  Created by Daichi Asami on 2020/07/13.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit

class TurnresultViewController: UIViewController {
    @IBOutlet var shiritorilabel: UILabel!
    @IBOutlet var yosokulabel: UILabel!
    @IBOutlet var resultlabel: UILabel!
    @IBOutlet var turnlabel: UILabel!
    @IBOutlet var nexxtbutton: UIButton!
    var turnnumber: Int!
    var shiritorienterword = ""
    var yosokuenterword = ""
    var correctnumber: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shiritorilabel.text = UserDefaults.standard.object(forKey: "shiritoriKey") as? String
        yosokulabel.text = yosokuenterword
        turnlabel.text = String(turnnumber - 1)
        
        if yosokuenterword.prefix(1) == shiritorienterword.suffix(1){
            resultlabel.text = "一致"
            correctnumber += 1
        }else{
            resultlabel.text = "不一致"
        }
        if turnnumber == 11{
            nexxtbutton.setTitle("最終結果", for: .normal)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "turn2" {
            let turn2shiritoriViewContoroller = segue.destination as! Turn2shiritoriViewController
            turn2shiritoriViewContoroller.turnnumber = turnnumber
            turn2shiritoriViewContoroller.shiritorienterword = shiritorienterword
            turn2shiritoriViewContoroller.correctnumber = correctnumber
        }else if segue.identifier == "turn10"{
            let resultViewcontroller = segue.destination as! ResultViewController
            resultViewcontroller.correctnumber = correctnumber
        }
    }
    
    @IBAction func next(){
        if turnnumber == 11{
            performSegue(withIdentifier: "turn10", sender: self)
        }else{
            performSegue(withIdentifier: "turn2", sender: self)
        }
    }
    
    
}
