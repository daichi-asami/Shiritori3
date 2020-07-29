//
//  YosokuViewController.swift
//  Shiritori3
//
//  Created by Daichi Asami on 2020/07/13.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit

class YosokuViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var firstlabel: UILabel!
    @IBOutlet var label1p: UILabel!
       @IBOutlet var label2p: UILabel!
    @IBOutlet var nyuuryokufield: UITextField!
    var turnnumber: Int!
    var shiritorienterword = ""
    var yosokuenterword = ""
    var lastword = ""
    var  alertContoroller: UIAlertController!
    
    func alert(title:String,message:String){
        alertContoroller = UIAlertController(title: title,message: message,preferredStyle: .alert)
        alertContoroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertContoroller, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nyuuryokufield.delegate = self
        
        if turnnumber == 1{
            firstlabel.text = "り"
        }else{
            firstlabel.text = String(lastword.toHiragana!.suffix(1))
        }
        if turnnumber % 2 == 1{
            label1p.isHidden = true
        }else{
            label2p.isHidden = true
        }

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func yosoku(){
        self.view.endEditing(true)
        
        if nyuuryokufield.text!.toKatakana! == ""{
            alert(title: "警告", message: " 何も入力されてないよ！")
        }else{
            yosokuenterword = nyuuryokufield.text!.toKatakana!
            performSegue(withIdentifier: "toSecond", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toSecond" {
        let showresultViewContoroller = segue.destination as! ShowresultViewController
        showresultViewContoroller.turnnumber = turnnumber
        showresultViewContoroller.shiritorienterword = shiritorienterword
        showresultViewContoroller.yosokuenterword = nyuuryokufield.text!.toKatakana!
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
