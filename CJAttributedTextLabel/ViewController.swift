//
//  ViewController.swift
//  20170920CJAttributedTextLabel
//
//  Created by 笨笨编程 on 2017/9/20.
//  Copyright © 2017年 chenxiaojie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    /// 调用富文本的对象方法：addAttribute(_ name: String, value: Any, range: NSRange)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let attributedStr = NSMutableAttributedString(string: "哈哈哈哈哈哈123456789")
        otherOperations(attributedStr: attributedStr)
        
        label.attributedText = settingTextAttributed(attributedStr: attributedStr)
        label.attributedText = settingTextImageAttributed(attributedStr: attributedStr)
    }
    
    
    /// 追加图片
    ///
    /// - Parameter attributedStr: <#attributedStr description#>
    /// - Returns: <#return value description#>
    private func settingTextImageAttributed(attributedStr: NSMutableAttributedString) -> NSAttributedString {
        let attch = NSTextAttachment()
        attch.image = UIImage(named: "111")
        attch.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        let attributed = NSAttributedString(attachment: attch)// as NSMutableAttributedString
        attributedStr.append(attributed)
        return attributedStr
    }
    
    /// 文本属性
    ///
    /// - Parameter attributedStr: <#attributedStr description#>
    /// - Returns: <#return value description#>
    private func settingTextAttributed(attributedStr: NSMutableAttributedString) -> NSMutableAttributedString {
        let range1 = NSRange(location: 0, length: 6)
        // 修改富文本字体颜色
        attributedStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.black, range: range1)
        // 修改富文本字体大小
        attributedStr.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 25), range: range1)
        
        let range2 = NSRange(location: 6, length: 9)
        attributedStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: range2)
        attributedStr.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 40), range: range2)
        
        // 修改字体背景色
        let range3 = NSRange(location: 0, length: 4)
        attributedStr.addAttribute(NSBackgroundColorAttributeName, value: UIColor.purple, range: range3)
        
        // 增加文字下划线
        let range4 = NSRange(location: 6, length: 7)
        attributedStr.addAttribute(NSUnderlineStyleAttributeName, value: (1), range: range4)
        attributedStr.addAttribute(NSUnderlineColorAttributeName, value: UIColor.cyan, range: range4)
        
        // 增加文字删除线
        let range5 = NSRange(location: 4, length: 2)
        attributedStr.addAttribute(NSStrikethroughStyleAttributeName, value: (1), range: range5)
        attributedStr.addAttribute(NSStrikethroughColorAttributeName, value: UIColor.blue, range: range5)
        
        // 边线宽度
        // 这个宽度必须设置
        let range6 = NSRange(location: 13, length: 4)
        attributedStr.addAttribute(NSStrokeWidthAttributeName, value: (1), range: range6)
        attributedStr.addAttribute(NSStrokeColorAttributeName, value: UIColor.black, range: range6)
        
        // 阴影
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.green
        shadow.shadowOffset = CGSize(width: 0, height: 2)
        attributedStr.addAttribute(NSShadowAttributeName, value: shadow, range: range4)
        return attributedStr
    }

    
    /// 其他类似字符串操作【部分内容，全部内容直接查看官方 API 文档】
    ///
    /// - Parameter attributedStr: <#attributedStr description#>
    /// - Returns: <#return value description#>
    private func otherOperations(attributedStr: NSMutableAttributedString) {
        printContentStr(str: "原始", attr: attributedStr)
        // 字符串截取
        let attr = attributedStr.attributedSubstring(from: NSRange(location: 5, length: 3))
        printContentStr(str: "字符串截取", attr: attr)
        // 字符串 --> 追加
        let addAttr = NSAttributedString(string: "笨笨编程")
        attributedStr.append(addAttr)
        printContentStr(str: "字符串追加", attr: attributedStr)
        // 字符串 --> 插入
        attributedStr.insert(addAttr, at: 0)
        printContentStr(str: "字符串插入", attr: attributedStr)
        // 字符串 --> 删除
        attributedStr.deleteCharacters(in: NSRange(location: 0, length: 6))
        printContentStr(str: "字符串删除", attr: attributedStr)
        // 字符串 --> 修改
        attributedStr.replaceCharacters(in: NSRange(location: 0, length: 4), with: addAttr)
        printContentStr(str: "字符串修改", attr: attributedStr)
    }
    
    private func printContentStr(str: NSString, attr: NSAttributedString) {
        print("字符串 --> \(str) attributedStr =  \(attr)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

