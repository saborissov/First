//
//  ViewController.swift
//  First
//
//  Created by 17586317 on 24.06.2020.
//  Copyright © 2020 Борисов Сергей Александрович. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var newsSwitch: UISwitch!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func changeAge(_ sender: UISlider) {
        let age = Int(sender.value)
        let ageString = getEnding(number: age, var1: "год", var2: "года", var3: "лет")
        ageLabel.text = "Возраст: \(age) \(ageString)"
        
    }
    
    @IBAction func requestAdd(_ sender: UIButton) {
        
        //проверяем, заполненно, или нет поле: почта
        if emailTextField.text!.isEmpty {
            let alert2 = UIAlertController(title: "Внимание!", message: "Вы не указали почту", preferredStyle: .alert)
            
            let emailNon = UIAlertAction(title: "ОК", style: .default, handler: nil)
            
            alert2.addAction(emailNon)
            present(alert2, animated: true, completion: nil)
        }
        let segment = segmentControl.selectedSegmentIndex
        let ending = (segment == 0 ? "ый" : "ая")
        let name = nameTextField.text!
        let email = emailTextField.text!
        let newsSubscribe = (newsSwitch.isOn ? "" : "не ")
        let message = """
        Уважаем\(ending), \(name)!
        Ваш запрос принят.Вы \(newsSubscribe)подписаны на новости.
        Вы получите уведомление на вашу почту \(email).
        """
        print(message)
        let alert = UIAlertController(title: "Здравствуйте, \(name)!", message: message, preferredStyle: UIAlertController.Style.alert)
        let actionOk = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(actionOk)
        present(alert, animated: true, completion: nil)
    
    }
    
    func getEnding(number:Int, var1: String, var2:String,var3:String) -> String {
        let res  = number % 100
        
        if (11...19).contains(res){
            return var3
            
        } else if[5,6,7,8,9,0].contains(res % 10){
            return var3
            
        } else if [2,3,4].contains(res % 10){
            return var2
        }
        
        return var1
        
    }
    
    
}
