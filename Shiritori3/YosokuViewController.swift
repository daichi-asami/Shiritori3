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
    @IBOutlet var turnlabel: UILabel!
    @IBOutlet var nyuuryokufield: UITextField!
    @IBOutlet weak var nextbutton: UIButton!
    
    var turnnumber: Int!
    var shiritorienterword = ""
    var yosokuenterword = ""
    var lastword = ""
    var correctnumber: Int!
    var  alertContoroller: UIAlertController!
    private var nyuuryokuText: String?
    
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
            turnlabel.text = String("1Pの予測ターン")
            turnlabel.textColor = UIColor(red: 252/255, green: 81/255, blue: 133/255, alpha: 1.0)
        }else{
            turnlabel.text = String("2Pの予測ターン")
            turnlabel.textColor = UIColor(red: 54/255, green: 79/255, blue: 107/255, alpha: 1.0)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func nyuuryokuEditChanged(_ sender: UITextField){
        self.nyuuryokuText = sender.text
        self.validate()
    }
    
    private func validate() {
          guard let nyuuryokuTxt = self.nyuuryokuText else {
            self.nextbutton.isEnabled = false
            self.nextbutton.setTitleColor(UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1.0), for: .normal)
            return
          }
          if nyuuryokuTxt.count == 0{
            self.nextbutton.isEnabled = false
            self.nextbutton.setTitleColor(UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1.0), for: .normal)
            return
        }
          self.nextbutton.isEnabled = true
          self.nextbutton.setTitleColor(UIColor.black, for: .normal)
    }
    
    @IBAction func yosoku(){
        self.view.endEditing(true)
        
        if String(nyuuryokufield.text!.toKatakana!).isKatakana == false{
            alert(title: "警告", message: "ひらがなで入力してね！")
        }else if nyuuryokufield.text!.toKatakana! == ""{
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
            showresultViewContoroller.correctnumber = correctnumber
        }
    }
    
}
