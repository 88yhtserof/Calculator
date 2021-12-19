//
//  RoundButton.swift
//  Calculator
//
//  Created by limyunhwi on 2021/12/19.
//

/*
 @IBInspectable: 커스텀한 UIView 컴포넌트에서 인스펙터 창을 이용해서 보다 쉽게 속성을 적용할 수 있도록 도와주는 속성.
 @IBDesignable : 컴파일 타임으로 적용된 속성을 실시간으로 스토리보드에 랜더링해준다.
                    남용하게 되면 스토리보드를 열 때마다 build가 되어 느려질 수 있다.
 
 UIButton을 상속한 RoundButton 클래스 생성
 기존 UIButton의 속성들을 그대로 사용할 수 있고, 추가적으로 사용자가 원하는 속성을 이 클래스에 정의하여 만들 수 있다.
 */
import UIKit

@IBDesignable
class RoundButton: UIButton {
    //연산 프로퍼티
    @IBInspectable var isRound: Bool = false {
        didSet {//값 변경 직후 호출된다.
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2 //정사각형이면 원, 아니면 둥근 모서리를 갖게 된다.
            }
        }
    }
    
}
