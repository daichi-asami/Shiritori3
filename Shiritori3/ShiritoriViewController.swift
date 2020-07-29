//
//  ShiritoriViewController.swift
//  Shiritori3
//
//  Created by Daichi Asami on 2020/07/13.
//  Copyright © 2020 litech. All rights reserved.
//

import UIKit

extension String {
    /// 「カタカナ」に変換
    var toKatakana: String? {
        return self.applyingTransform(.hiraganaToKatakana, reverse: false)
    }
    var toHiragana: String? {
        return self.applyingTransform(.hiraganaToKatakana, reverse: true)
    }
}

class ShiritoriViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var firstlabel: UILabel!
    @IBOutlet var label1p: UILabel!
    @IBOutlet var label2p: UILabel!
    @IBOutlet var nyuuryokufield: UITextField!
    
    var turnnumber: Int!
    var nyuuryokuword = ""
    var shiritorienterword = ""
    var lastword = ""
    var  alertContoroller: UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nyuuryokufield.delegate = self
        if turnnumber == 1{
            firstlabel.text = "り"
        }else{
            firstlabel.text = String(lastword.toHiragana!.suffix(1))
        }
        // Do any additional setup after loading the view.
        if turnnumber % 2 == 1{
            label2p.isHidden = true
        }else{
            label1p.isHidden = true
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func alert(title:String,message:String){
        alertContoroller = UIAlertController(title: title,message: message,preferredStyle: .alert)
        alertContoroller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertContoroller, animated: true)
    }
    
    func segue(){
        if turnnumber >= 1{
            performSegue(withIdentifier: "turn1", sender: self)
        }
    }
    
    
    @IBAction func shiritori(){
        nyuuryokuword = nyuuryokufield.text!.toKatakana!
        self.view.endEditing(true)
        
        if String(firstlabel.text!.toKatakana!) != String(nyuuryokuword.prefix(1)){
            alert(title: "警告", message: " 最初の文字が違うよ！")
        }else if String(nyuuryokuword.suffix(1)) == "ン"{
            alert(title: "警告", message: "最後が『ん』だよ！")
        }else if String(nyuuryokuword.suffix(1)) == "ー"{
            alert(title: "警告", message: "最後が『ー』だよ！")
        }else if String(nyuuryokuword.suffix(1)) == "ャ"{
            shiritorienterword = String(nyuuryokuword.prefix(nyuuryokuword.count - 1)) + "ヤ"
            segue()
        }else if String(nyuuryokuword.suffix(1)) == "ュ"{
            shiritorienterword = String(nyuuryokuword.prefix(nyuuryokuword.count - 1)) + "ユ"
            segue()
        }else if String(nyuuryokuword.suffix(1)) == "ョ"{
            shiritorienterword = String(nyuuryokuword.prefix(nyuuryokuword.count - 1)) + "ヨ"
            segue()
        }else if String(nyuuryokuword.suffix(1)) == "ァ"{
            shiritorienterword = String(nyuuryokuword.prefix(nyuuryokuword.count - 1)) + "ア"
            segue()
        }else if String(nyuuryokuword.suffix(1)) == "ィ"{
            shiritorienterword = String(nyuuryokuword.prefix(nyuuryokuword.count - 1)) + "イ"
            segue()
        }else if String(nyuuryokuword.suffix(1)) == "ゥ"{
            shiritorienterword = String(nyuuryokuword.prefix(nyuuryokuword.count - 1)) + "ウ"
            segue()
        }else if String(nyuuryokuword.suffix(1)) == "ェ"{
            shiritorienterword = String(nyuuryokuword.prefix(nyuuryokuword.count - 1)) + "エ"
            segue()
        }else if String(nyuuryokuword.suffix(1)) == "ォ"{
            shiritorienterword = String(nyuuryokuword.prefix(nyuuryokuword.count - 1)) + "オ"
            segue()
        }else{
            shiritorienterword = nyuuryokuword
            segue()
            UserDefaults.standard.set(shiritorienterword, forKey: "shiritoriKey")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "turn1" {
            let turn1ViewContoroller = segue.destination as! Turn1ViewController
            turn1ViewContoroller.turnnumber = turnnumber
            turn1ViewContoroller.shiritorienterword = shiritorienterword
            turn1ViewContoroller.lastword = lastword
        }
    }
    
}
