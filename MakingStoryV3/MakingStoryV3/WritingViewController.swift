//
//  WritingViewController.swift
//  MakingStoryV3
//
//  Created by 이동기 on 04/10/2018.
//  Copyright © 2018 이동기. All rights reserved.
//

import UIKit

class WritingViewController: UIViewController {

    @IBOutlet weak var txtGivenWord: UILabel!
    @IBOutlet weak var txtRegister: UITextView!
    @IBOutlet weak var btnWordPick: UIButton!
    
    var toGiveWord = ["사람","등","그러나","사회","그것","집","문제","그녀","자신","문화","생각","소리","여자","개","뒤","함께","아이","시간","인간","사실","어머니","눈","점","시대","다음","누구","여러","하나","세계","위","운동","퍼센트","학교","자기","가장","대통령","가지","바로","그래서","무엇","정부","돈","국가","모두","여성","친구","마음","남성","어른","사랑","학교","남자","창문","하늘","비","크기","고기","서양","냄새","공연","남녀","속도","준비","소년","소식","작용","허리","공업","노인","새","영어","출신","결정","경향","기록","움직임","이미지","특성","교장","업무","입시","청소년","사장","선배","업체","국회","걱정","행사","누나","근처","이별","극복","연민"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toGiveWord.shuffle()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btnWordPick.setImage(UIImage(named: "wordUnpicked2.png"), for: .normal)
    }
    
    @IBAction func btnUnwind(_ sender: Any) {
        let userDefault = UserDefaults.standard
        userDefault.set("0", forKey: "check")
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnChooseWord(_ sender: Any) {
        let alertController = UIAlertController(title: "단어를 선택하세요",message: "선택한 단어를 포함해야 합니다", preferredStyle: UIAlertController.Style.actionSheet)
        
        let firstAction = UIAlertAction(title: "\(toGiveWord[0])", style: UIAlertAction.Style.default){ (action: UIAlertAction) in
            self.txtGivenWord.text = self.toGiveWord[0]
            self.txtGivenWord.textColor = UIColor.white
            self.btnWordPick.setImage(UIImage(named: "wordPicked2.png"), for: .normal)
        }
        
        let secondAction = UIAlertAction(title: "\(toGiveWord[1])", style: UIAlertAction.Style.default){ (action: UIAlertAction) in
            self.txtGivenWord.text = self.toGiveWord[1]
            self.txtGivenWord.textColor = UIColor.white
            self.btnWordPick.setImage(UIImage(named: "wordPicked2.png"), for: .normal)
        }
        
        let thirdAction = UIAlertAction(title: "\(toGiveWord[2])", style: UIAlertAction.Style.default){ (action: UIAlertAction) in
            self.txtGivenWord.text = self.toGiveWord[2]
            self.txtGivenWord.textColor = UIColor.white
            self.btnWordPick.setImage(UIImage(named: "wordPicked2.png"), for: .normal)
        }
        
        let cancelButton = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(thirdAction)
        alertController.addAction(cancelButton)
        
        self.present(alertController,animated: true,completion: nil)
    }
    
    @IBAction func btnComplete(_ sender: Any) {
        let checkText = txtGivenWord.text!
        if txtGivenWord.text != "단어" {
            if txtRegister.text.count < 50 {
                makeAlert(titl: "너무 짧습니다", mess: "50글자 이상 입력해주세요", first: "확인")
            } else if txtRegister.text.count > 150 {
                makeAlert(titl: "너무 깁니다", mess: "150글자 이하 입력해주세요", first: "확인")
            } else {
                if (txtRegister.text?.contains(checkText))! {
                    let alertController = UIAlertController(title: "등록하시겠습니까?", message: "등록하면 취소할 수 없습니다", preferredStyle: UIAlertController.Style.alert)
                    
                    let registerAction = UIAlertAction(title: "등록", style: UIAlertAction.Style.default){ (action: UIAlertAction) in
                        let ud = UserDefaults.standard
                        let userDefault = UserDefaults.standard
                        ud.set(self.txtRegister.text, forKey: "story")
                        userDefault.set("1", forKey: "check")
                        self.presentingViewController?.dismiss(animated:true)
                        self.dismiss(animated: true, completion: nil)
                    }
                    let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.default)
                    
                    alertController.addAction(registerAction)
                    alertController.addAction(cancelAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    makeAlert(titl: "다시 확인하세요", mess: "선택한 단어를 포함하지 않았습니다", first: "확인")
                }
            }
            
        } else {
            makeAlert(titl: "다시 확인하세요", mess: "단어를 선택하지 않았습니다", first: "확인")
        }
        
    }
    
    func makeAlert(titl: String, mess: String, first: String) {
        let alertController = UIAlertController(title: "\(titl)", message: "\(mess)", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "\(first)", style: UIAlertAction.Style.default)
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
