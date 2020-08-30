//
//  ViewController.swift
//  chiosePB
//
//  Created by eric on 2020/8/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bigSlider: UISlider!
    @IBOutlet weak var smallSlider: UISlider!
    @IBOutlet weak var languageSwitch: UISwitch!
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var bigItemLabel: UILabel!
    @IBOutlet weak var smallItemLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var bigItemNameLabel: UILabel!
    @IBOutlet weak var smallItemNameLabel: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
    
    var sex = ""
    var bigItem = ""
    var smallItem = ""
    var born = ""
    var bigResult = ""
    var smallResult = ""
    var endResult = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    
    
    
    @IBAction func BigSlider(_ sender: UISlider) {
        bigItemLabel.text = "\(Int(bigSlider.value).description)項"
        if Int(bigSlider.value) == 1 {
            bigItem = "抬頭"
        }else if Int(bigSlider.value) == 2 {
            bigItem = "抬頭、硬勁"
        }else if Int(bigSlider.value) == 3 {
            bigItem = "抬頭、硬勁、翻身"
        }else if Int(bigSlider.value) == 4 {
            bigItem = "抬頭、硬勁、翻身、坐"
        }else if Int(bigSlider.value) == 5 {
            bigItem = "抬頭、硬勁、翻身、坐、爬行"
        }else if Int(bigSlider.value) == 6 {
        bigItem = "抬頭、硬勁、翻身、坐、爬行、扶東西站立"
        }else if Int(bigSlider.value) == 7 {
            bigItem = "抬頭、硬勁、翻身、坐、爬行、扶東西站立、走路"
            }
        bigItemNameLabel.text = "學會:\(bigItem)"
    }
    
    @IBAction func smallSlider(_ sender: UISlider) {
        smallItemLabel.text = "\(Int(smallSlider.value).description)項"
        
        if Int(smallSlider.value) == 1 {
            smallItem = "手張開"
        }else if Int(smallSlider.value) == 2 {
            smallItem = "手張開、握住玩具"
        }else if Int(smallSlider.value) == 3 {
            smallItem = "手張開、握住玩具、手伸向物體"
        }else if Int(smallSlider.value) == 4 {
            smallItem = "手張開、握住玩具、手伸向物體、兩手拿杯子"
        }else if Int(smallSlider.value) == 5 {
            smallItem = "手張開、握住玩具、手伸向物體、兩手拿杯子、拍手"
        }else if Int(smallSlider.value) == 6 {
            smallItem = "手張開、握住玩具、手伸向物體、兩手拿杯子、拍手、捏小東西"
        }else if Int(smallSlider.value) == 7 {
            smallItem = "手張開、握住玩具、手伸向物體、兩手拿杯子、拍手、捏小東西、撕紙"
            }
        
        smallItemNameLabel.text = "學會:\(smallItem)"
    }
    
    @IBAction func sexSegmentedControlChiose(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            sex = "小王子"
        }else if sender.selectedSegmentIndex == 1{
            sex = "小公主"
        }
        
    }
    
    
    @IBAction func birthdayDatePicker(_ sender: Any) {
        let datePicker = sender as! UIDatePicker
        let babyDate = datePicker.date
        
        let babyBirthday = DateFormatter()
        babyBirthday.dateFormat = "yyyy/MM/dd"
        birthdayLabel.text = babyBirthday.string(from: birthdayDatePicker.date)
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let time = formatter.string(from: now)
        self.todayLabel.text = "評估日期:\(time)"
        let calendar = Calendar.current
        
        let day1 = calendar.startOfDay(for: babyDate)
        let day2 = calendar.startOfDay(for: now)
     
        let components = calendar.dateComponents([.day], from: day1, to: day2)

            born = "誕生：\(components.day!)天"
        
        
    }
    
    @IBAction func languageSwitch(_ sender: Any) {
        if languageSwitch.isOn{
            languageLabel.text = "很棒哦，好厲害的孩子"}
    }
    
    @IBAction func resultBtn(_ sender: Any) {
        let name = nameTextField.text!
        
    
        doctorImage.isHidden = false

        if Int(smallSlider.value) < 2,Int(bigSlider.value) < 2 {
            endResult = "孩子很努力在學，別太太緊張"
        }else if Int(smallSlider.value) < 5,Int(bigSlider.value) < 5 {
            endResult = "強大的學習能力"
        }else if languageSwitch.isOn,Int(smallSlider.value) > 5,Int(bigSlider.value) > 5 {
            endResult = "天才呀.....未來的愛因斯坦"
        }
        
        if Int(smallSlider.value) <= 3 {
            smallResult = "也開始在學(\(smallItem))的細動作"
        }else if Int(smallSlider.value) > 4{
            smallResult = "好厲害學這麼多細動作"
        }
        if Int(bigSlider.value) <= 3 {
                bigResult = "慢慢在學(\(bigItem))的粗動作"
            }else if Int(bigSlider.value) > 4 {
            bigResult = "好厲害學這麼多粗動作"
         
           
    }
        resultTextView.text = "\(name)寶寶,才\(born),您的\(sex),\(bigResult),\(smallResult),\(endResult)"
       
    }
  
    
    @IBAction func reChioseBtn(_ sender: Any) {
        
        nameTextField.text = ""
        smallSlider.value = 0
        bigSlider.value = 0
        languageSwitch.isOn = false
        birthdayLabel.text = ""
        resultTextView.text = ""
        doctorImage.isHidden = true
        smallItemLabel.text = ""
        bigItemLabel.text = ""
        languageLabel.text = ""
        todayLabel.text = ""
        bigItemNameLabel.text = ""
        smallItemNameLabel.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
}


