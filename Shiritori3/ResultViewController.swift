//
//  ResultViewController.swift
//  Shiritori3
//
//  Created by Daichi Asami on 2020/07/15.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var correctnumber: Int!
    @IBOutlet var resultlabel: UILabel!
    @IBOutlet weak var resultimage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultlabel.text = String(correctnumber)
        
        /*resultimage.image = UIImage(named: "")*/

        // Do any additional setup after loading the view.
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
