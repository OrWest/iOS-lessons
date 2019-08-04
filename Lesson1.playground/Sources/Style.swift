import UIKit

public typealias Decoration<T> = (T) -> Void

public struct Decorator<T> {
    let object: T
    func apply(_ decorations: Decoration<T>...) -> Void {
        decorations.forEach({ $0(object) })
    }
}

protocol DecoratorCompatible {
    associatedtype DecoratorCompatibleType
    var decorator: Decorator<DecoratorCompatibleType> { get }
}

extension DecoratorCompatible {
    var decorator: Decorator<Self> {
        return Decorator(object: self)
    }
}

extension UIView: DecoratorCompatible {}

///
/// ##!## Template for naming functions, constants, etc.: Font text_color backgound_color text_style other_options
///
public enum Style {
    public enum Label {
        public static let h1NavyWhiteCenter: Decoration<UILabel> = { label in
            label.decorator.apply(
                Font.h1,
                Color.screenBigTitle,
                TextStyle.center)
            label.backgroundColor = Color.Global.white
        }
        
        static let h1NavyClearCenter: Decoration<UILabel> = { label in
            label.decorator.apply(
                Font.h1,
                Color.screenBigTitle,
                TextStyle.center)
            label.backgroundColor = .clear
        }
        
        static let multiline: Decoration<UILabel> = { label in
            label.numberOfLines = 0
        }
    }
    
    enum Button {
        static let h2WhiteTealishGreenDefaultCorners12: Decoration<UIButton> = { button in
            button.backgroundColor = Color.Global.tealishGreen
            button.decorator.apply(View.corners(radius: 12))
            button.setTitleColor(Color.Global.white, for: .normal)
            button.titleLabel?.font = Font.Global.h2
        }
        
        static let contentInsets4_7_4_7: Decoration<UIButton> = { button in
            button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 7, bottom: 4, right: 7)
        }
    }
    
    enum TextField {
        static let h2NavyWhiteLeftPlaceholderColorNavy48: Decoration<UITextField> = { textField in
            textField.textColor = Color.Global.navy
            textField.font = Font.Global.h2
            textField.backgroundColor = Color.Global.white
            textField.textAlignment = NSTextAlignment.left
            
            (textField.value(forKey: "placeholderLabel") as? UILabel)?.textColor = Color.Global.navy48
        }
    }
    
    enum TextView {
        static let h2NavyWhiteLeftPlaceholderColorNavy48: Decoration<UITextView> = { textView in
            
            textView.textColor = Color.Global.navy88
            textView.font = Font.Global.h2
        }
    }
    
    enum View {
        static func corners(radius: CGFloat) -> Decoration<UIView> {
            return { [radius] (view: UIView) -> Void in
                view.layer.cornerRadius = radius
            }
        }
        
        static func shadow(radius: CGFloat) -> Decoration<(UIView, UIView)> {
            return { (views: (UIView, UIView)) -> Void in
                let parent = views.0
                let child = views.1
                
                child.layer.cornerRadius = radius
                child.clipsToBounds = true
                parent.layer.shadowColor = UIColor(rgb: 0x16476d).cgColor
                parent.layer.shadowOffset = CGSize(width: 0, height: 4)
                parent.layer.shadowOpacity = 0.2
                parent.layer.masksToBounds = false
                parent.layer.cornerRadius = radius
                parent.layer.shadowRadius = radius
                parent.layer.shadowPath = UIBezierPath(
                    roundedRect: CGRect(origin: CGPoint(x: 0, y: 14),
                                        size: parent.bounds.size), cornerRadius: radius).cgPath
            }
        }
        
        static func roundShadow(cornerRadius: CGFloat, shadowRadius: CGFloat, color: UIColor) -> Decoration<UIView> {
            return { view in
                view.layer.shadowColor = color.cgColor
                view.layer.shadowRadius = shadowRadius
                view.layer.shadowOpacity = 0.65
                view.layer.shadowOffset = CGSize(width: 1.0, height: 8.0)
                view.layer.masksToBounds = false
                view.layer.cornerRadius = cornerRadius
            }
        }
        
        static func alpha(value: CGFloat) -> Decoration<UIView> {
            return { view in
                view.alpha = value
            }
        }
        static let colorPaleGray: Decoration<UIView> = { $0.backgroundColor = Color.Global.paleGray}
        static let navy64: Decoration<UIView> = { $0.backgroundColor = Color.Global.navy64}
        
        static let tintNavy64: Decoration<UIView> = { $0.tintColor = Color.Global.navy64}
        static let tintWhite: Decoration<UIView> = { $0.tintColor = Color.Global.white}
        static let tintSlate: Decoration<UIView> = { $0.tintColor = Color.Global.slate}
    }
    
    enum TextStyle {
        static let center: Decoration<UILabel> = { $0.textAlignment = NSTextAlignment.center }
        static let left: Decoration<UILabel> = { $0.textAlignment = NSTextAlignment.left }
    }
    
    enum Font {
        static let h1: Decoration<UILabel> = { $0.font = Global.h1 }
        static let p1Regular: Decoration<UILabel> = { $0.font = Global.p1Regular }
        static let p1Bold: Decoration<UILabel> = { $0.font = Global.p1Bold }
        static let p2: Decoration<UILabel> = { $0.font = UIFont(name: Global.avenierNextMedium, size: 14) }
        static let h2: Decoration<UILabel> = { $0.font = Global.h2 }
        static let p3: Decoration<UILabel> = { $0.font = UIFont(name: Global.avenierNextMedium, size: 12)}
        static let p3Bold: Decoration<UILabel> = { $0.font = UIFont(name: Global.avenierNextMedium, size: 12)}
        
        enum Global {
            static let avenierNextBold = "AvenirNext-Bold"
            static let avenierNextDemiBold = "AvenirNext-DemiBold"
            static let avenierNextMedium = "AvenirNext-Medium"
            
            static let h1 = UIFont(name: Global.avenierNextBold, size: 28)!
            static let h2 = UIFont(name: Global.avenierNextBold, size: 20)!
            static let p1Regular = UIFont(name: Global.avenierNextMedium, size: 16)!
            static let p1Bold = UIFont(name: Global.avenierNextDemiBold, size: 16)!
            static let p3Bold = UIFont(name: Global.avenierNextDemiBold, size: 12)!
        }
    }
    
    enum Color {
        static let screenBigTitle: Decoration<UILabel> = { $0.textColor = Global.navy }
        static let navy: Decoration<UILabel> = { $0.textColor = Global.navy }
        static let navy64: Decoration<UILabel> = { $0.textColor = Global.navy64 }
        static let navy44: Decoration<UILabel> = { $0.textColor = Global.navy44 }
        static let navy48: Decoration<UILabel> = { $0.textColor = Global.navy48 }
        static let navy32: Decoration<UILabel> = { $0.textColor = Global.navy32 }
        static let navy88: Decoration<UILabel> = { $0.textColor = Global.navy88 }
        static let subTitleError: Decoration<UILabel> = { $0.textColor = Global.coralPink64 }
        static let screenBackground: Decoration<UIView> = { $0.backgroundColor = Global.white }
        static let tealishGreen64: Decoration<UILabel> = { $0.textColor = Global.tealishGreen64 }
        static let paleGray: Decoration<UIView> = { $0.backgroundColor = Global.paleGray }
        static let silver: Decoration<UIView> = { $0.backgroundColor = Global.silver }
        static let bluishGrey: Decoration<UIView> = { $0.backgroundColor = Global.bluishGrey }
        static let azure: Decoration<UILabel> = { $0.textColor = Global.azure }
        static let coralPink: Decoration<UILabel> = { $0.textColor = Global.coralPink }
        static let white: Decoration<UIView> = { $0.backgroundColor = Global.white }
        static let coolGrey: Decoration<UILabel> = { $0.textColor = Global.coolGrey }
        static let tealishGreen: Decoration<UILabel> = { $0.textColor = Global.tealishGreen }
        static let tealishGreenBackground: Decoration<UIView> = { $0.backgroundColor = Global.tealishGreen }
        static let coolGreyBackground: Decoration<UIView> = { $0.backgroundColor = Global.coolGrey }
        static let coralPinkBackground: Decoration<UIView> = { $0.backgroundColor = Global.coralPink }
        
        enum Global {
            static let navy = UIColor(rgb: 0x002331)
            static let navy25 = UIColor(rgb: 0x002331, a: 0.25)
            static let navy32 = UIColor(rgb: 0x002331, a: 0.32)
            static let navy44 = UIColor(rgb: 0x002331, a: 0.44)
            static let navy48 = UIColor(rgb: 0x002331, a: 0.48)
            static let navy64 = UIColor(rgb: 0x002331, a: 0.64)
            static let navy88 = UIColor(rgb: 0x002331, a: 0.88)
            static let white = UIColor.white
            static let white50 = UIColor.white.withAlphaComponent(0.5)
            static let azure = UIColor(rgb: 0x0E98F8)
            static let azure88 = UIColor(rgb: 0x0E98F8, a: 88)
            static let paleGray = UIColor(rgb: 0xf5f6f7)
            static let coralPink = UIColor(rgb: 0xff5964)
            static let coralPink64 = UIColor(rgb: 0xff5964, a: 0.64)
            static let tealishGreen = UIColor(rgb: 0x0cce6b)
            static let tealishGreen50 = UIColor(rgb: 0x0cce6b, a: 0.5)
            static let tealishGreen64 = UIColor(rgb: 0x0cce6b, a: 0.64)
            static let lightGold = UIColor(rgb: 0xffdf4f)
            static let silver = UIColor(rgb: 0xccd3d6)
            static let bluishGrey = UIColor(rgb: 0x85969d)
            static let slate = UIColor(rgb: 0x5c727b)
            static let coolGrey = UIColor(rgb: 0xadb8bd)
        }
    }
}
