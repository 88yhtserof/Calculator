//
//  ViewController.swift
//  Calculator
//
//  Created by limyunhwi on 2021/12/18.
//

import UIKit

//열거형
enum Operation {
    //연산자를 case에도 만들기
    case Add
    case Subtract
    case Divide
    case Multiply
    case unown //어떤 연산자도 해당하지 않을 때
}

class ViewController: UIViewController {

    @IBOutlet weak var lblNumberOutput: UILabel!
    
    //계산기의 상태값을 가지고 있는 프로퍼티
    var displayNumber = "" //계산기가 눌러질 때마다 lblNumberOutput 값을 할당받는 프로퍼티
    var firstOperand = "" //이전 계산값을 저장하는 프로퍼티. 첫 번째 피연산자.
    var secondOperand = "" //새롭게 입력된 값을 저장하는 프로퍼티. 두 번째 피연산자.
    var result = "" // 계산의 결과값 할당
    var currentOperation: Operation = .unown //현재 어떤 연산자가 입력되었는지 알 수 있게 연산자의 값을 저장하는 프로퍼티
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapBtnNumber(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else {return} //선택한 버튼의 title값 가져오기. 즉, 입력된 숫자 가져오기
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.lblNumberOutput.text = self.displayNumber
        }
    }
    
    @IBAction func tapBtnClear(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unown
        self.lblNumberOutput.text = "0"
    }
    
    @IBAction func tapBtnDot(_ sender: UIButton) {
        //소수점 포함 9자리까지만 작성할 수 있게 예외처리. 더해서 소수점이 중복 입력되지 않게 처리.
        if self.displayNumber.count < 8, !self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "." //삼항연산자
            self.lblNumberOutput.text = self.displayNumber
        }
    }
    
    @IBAction func tapBtnDivide(_ sender: UIButton) {
    }
    
    @IBAction func tapBtnMultiply(_ sender: UIButton) {
    }
    
    @IBAction func tapBtnSubtract(_ sender: UIButton) {
    }
    
    @IBAction func tapBtnAdd(_ sender: UIButton) {
    }
    
    @IBAction func tapBtnEqual(_ sender: UIButton) {
    }
}

