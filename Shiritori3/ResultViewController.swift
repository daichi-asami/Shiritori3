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
    var imagearray = [String]()
    @IBOutlet var resultlabel: UILabel!
    @IBOutlet weak var resultimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultlabel.text = String(correctnumber)
        imagearray = ["result0.png","result60.png","result120.png","result180.png","result240ex.png","result300ex.png","result360ex.png","result420.png","result480.png","result540.png","result600.png"]
        resultimage.image = UIImage(named: imagearray[correctnumber])
        // Do any additional setup after loading the view.
    }
    
    
    
}
