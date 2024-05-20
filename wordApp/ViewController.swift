//
//  ViewController.swift
//  wordApp
//
//  Created by 심소영 on 5/19/24.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var detailLabel: UILabel!
    
    @IBOutlet var labelView: UIImageView!
    
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    
    var searchList: [String] = []
    var wordList: [String: String] = ["등세권":"등산할 수 있는 산이 가까이 있는 주거지역",
                                      "중꺽마":"중요한건 꺽이지 않는 마음",
                                      "스불재":"스스로 불러온 재앙",
                                      "쓸쓸비용":"쓸쓸한 기분을 전환하기 위해 지출하는 비용",
                                      "갑통알":"갑자기 통장을 보니 알바해야겠다",
                                      "무물보":"무엇이든 물어보세요",
                                      "애빼시":"애교 빼면 시체의 줄임말",
                                      "소확횡":"소소하고 확실한 횡령의 줄임말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextFieldSetting()
        
        searchButton.backgroundColor = .black
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        
        
        detailLabel.text = ""
        detailLabel.textAlignment = .center
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        labelView.image = UIImage(named: "background")
        
        ButtonSetting(oneButton, setTitle: "쓸쓸비용")
        ButtonSetting(twoButton, setTitle: "무물보")
        ButtonSetting(threeButton, setTitle: "스불재")
        ButtonSetting(fourButton, setTitle: "소확횡")
        
    }
    
    
    @IBAction func searchTextFieldTapped(_ sender: UITextField) {
        searchList.append(searchTextField.text ?? "")
        for keyword in searchList {
            if let value = wordList[keyword] {
                detailLabel.text = ("\(keyword): \(value)")
            } else {
                detailLabel.text = "검색 결과가 없습니다."
            }
        }
    }

    
    @IBAction func buttonTapped(_ sender: UIButton, label text: String) {
        searchTextField.resignFirstResponder()
        detailLabel.text = wordList[text]
        searchTextField.text = ""
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchTextField.resignFirstResponder()
        searchList.append(searchTextField.text ?? "")
        for keyword in searchList {
            if let value = wordList[keyword] {
                detailLabel.text = ("\(keyword): \(value)")
            } else {
                detailLabel.text = "검색 결과가 없습니다."
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString: NSString = (textField.text ?? "검색결과가 없습니다") as NSString
        let newString:NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func ButtonSetting(_ sender: UIButton, setTitle set: String){
        sender.setTitle(set, for: .normal)
        sender.setTitleColor(.black, for: .normal)
        sender.titleLabel?.font = .systemFont(ofSize: 12)
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 1
        sender.layer.cornerRadius = 10
        sender.backgroundColor = .clear
    }
    
    func searchTextFieldSetting(){
        searchTextField.delegate = self
        searchTextField.backgroundColor = .white
        searchTextField.keyboardType = .default
        searchTextField.placeholder = "신조어를 검색해보세요"
        searchTextField.textColor = .black
        searchTextField.borderStyle = .roundedRect
        searchTextField.clearButtonMode = .always
        searchTextField.clearsOnBeginEditing = false
        searchTextField.returnKeyType = .search
        searchTextField.layer.borderWidth = 2
        searchTextField.layer.borderColor = UIColor.black.cgColor
    }
    
}


