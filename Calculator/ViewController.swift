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
    case unknown //어떤 연산자도 해당하지 않을 때
}

class ViewController: UIViewController {

    @IBOutlet weak var lblNumberOutput: UILabel!
    
    //계산기의 상태값을 가지고 있는 프로퍼티
    var displayNumber = "" //계산기가 눌러질 때마다 lblNumberOutput 값을 할당받는 프로퍼티
    var firstOperand = "" //이전 계산값을 저장하는 프로퍼티. 첫 번째 피연산자.
    var secondOperand = "" //새롭게 입력된 값을 저장하는 프로퍼티. 두 번째 피연산자.
    var result = "" // 계산의 결과값 할당
    var currentOperation: Operation = .unknown //현재 어떤 연산자가 입력되었는지 알 수 있게 연산자의 값을 저장하는 프로퍼티
    
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
        self.currentOperation = .unknown
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
        self.operation(.Divide)
    }
    
    @IBAction func tapBtnMultiply(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    @IBAction func tapBtnSubtract(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    
    @IBAction func tapBtnAdd(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tapBtnEqual(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation) {
        //파라미터로 전달받은 연산자에 따라 계산. 계산된 결과값을 화면에 표시
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = "" //다음 피연산자를 받기 위함
                
                //피연산자 형변환
                guard let firstOperand = Double(self.firstOperand) else {return}
                guard let secondOperand = Double(self.secondOperand) else {return}
                
                //연산자에 따라 첫 번째 피연산자와 두 번째 피연산자 계산
                switch currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                default:
                    break
                }
                
                //소수점 아래의 값이 없다면 정수로 형변환
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                //한 번의 연산이 끝나면, 그 결과값과 다음 피연산자를 다음 연산자를 가지고 계산해야 한다.
                //따라서 첫 번째 연산자 프로퍼티에 결과값을 할당한다.
                self.firstOperand = self.result
                self.lblNumberOutput.text = self.result
            }
            self.currentOperation = operation //만약 1+2-3 이라면 1+2 연산을 한 후 currentOperation에 .Subtract 할당
            
        } else{//.unknown : 값이 초기화된 상태에서 사용자가 첫 번째 피연산자와 연산자를 입력한 상태
            //만약 1+이라면 firstOperand에 1할당, currentOperation에 .Add 할당.
            self.firstOperand = self.displayNumber // 화면에 표시된 피연산자.
            self.currentOperation = operation //선택한 연산자
            self.displayNumber = "" // 첫 번째 피연산자를 해당 프로퍼티에 할당했으므로 초기화. 두 번째 피연산자를 받기 위함
        }
    }
}

