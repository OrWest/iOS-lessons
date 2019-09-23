//
//  AttributedViewController.swift
//  Project22
//
//  Created by Alex Motor on 9/23/19.
//  Copyright © 2019 Alexander Motarykin. All rights reserved.
//

import UIKit

class AttributedViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    
    private let html = """
    <html>
    <body>
    <p style="color: blue; font-size: 34;">This is blue!</p>
    </body>
    </html>
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        prepare()
//        renderLink()
        renderHTML(html)
    }
    
    private func renderHTML(_ html: String) {
        let data = Data(html.utf8)
        if let attrString = try? NSAttributedString(data: data, options: [.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil) {
         
            label.attributedText = attrString
        }
        
    }
    
    private func renderLink() {
        let attrs: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.green
        ]
        let attrString = NSMutableAttributedString(string: "Do you want some link?", attributes: attrs)
        let range = (attrString.string as NSString).range(of: "link")
        
        attrString.addAttribute(.link, value: "http://tut.by", range: range)
        
        label.attributedText = attrString
    }
    
    private func prepare() {
        //        let text = "Some new text 2019\nfal;djskf;alskdj f;las"
        //        let attrString = NSAttributedString(string: text)
        
        //        let shadow = NSShadow()
        //        shadow.shadowColor = UIColor.black
        //        shadow.shadowBlurRadius = 5
        //        shadow.shadowOffset = CGSize(width: 1, height: 1)
        
        //        let paragraphStyle = NSMutableParagraphStyle()
        //        paragraphStyle.alignment = .center
        //
        //        let attributes: [NSAttributedString.Key : Any] = [
        //            .font: UIFont.systemFont(ofSize: 20),
        //            .foregroundColor: UIColor.blue,
        //            .paragraphStyle: paragraphStyle,
        //            .kern: -2
        //            //.shadow: shadow
        //        ]
        
        let attrString = NSMutableAttributedString()
        let amount = "10"
        let amountAttrs: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 50),
            .foregroundColor: UIColor.blue,
            .kern: 1
        ]
        let amountString = NSAttributedString(string: amount, attributes: amountAttrs)
        
        let unit = "gb"
        let unitAttrs: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.green,
            .kern: 0.2
        ]
        let unitString = NSAttributedString(string: unit, attributes: unitAttrs)
        
        attrString.append(amountString)
        attrString.append(unitString)
        attrString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 80), range: NSRange(location: 1, length: 2))
        
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "coffee")
        let imageString = NSAttributedString(attachment: attachment)
        attrString.insert(imageString, at: 2)
        label.attributedText = attrString
        //        label.text =

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
