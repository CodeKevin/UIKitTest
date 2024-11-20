//
//  ViewController.swift
//  UIKitTest
//
//  Created by Kevin on 2024/11/19.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    @IBOutlet weak var axisButton: UIButton!
    @IBOutlet weak var distributionButton: UIButton!
    @IBOutlet weak var alignmentButton: UIButton!
    @IBOutlet weak var spaceButton: UIButton!
    
    let redView = UIView()
    let greenView = UIView()
    let yellowView = UIView()
    var stack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        yellowView.backgroundColor = .yellow
        
        stack = UIStackView(arrangedSubviews: [self.redView, self.greenView, self.yellowView])
        stack.backgroundColor = .lightGray
        
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0

        axisButton.setTitle("axis:horizontal", for: .normal)
        distributionButton.setTitle("distribution:fillEqually", for: .normal)
        alignmentButton.setTitle("alignment:fill", for: .normal)
        spaceButton.setTitle("spacing:0", for: .normal)
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(self.spaceButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        redView.snp.makeConstraints { make in
            make.height.width.equalTo(40).priority(.high)
        }
        greenView.snp.makeConstraints { make in
            make.height.width.equalTo(70).priority(.high)
        }
        yellowView.snp.makeConstraints { make in
            make.height.width.equalTo(100).priority(.high)
        }
        
    }
    @IBAction func selectAxis(_ sender: UIAction) {
        switch sender.title {
        case "horizontal":
            stack.axis = .horizontal
        case "vertical":
            stack.axis = .vertical
        default:
            break
        }
        axisButton.setTitle("axis:" + sender.title, for: .normal)
    }
    @IBAction func selectDistribution(_ sender: UIAction) {
        switch sender.title {
        case "fill":
            stack.distribution = .fill
        case "fillEqually":
            stack.distribution = .fillEqually
        case "fillProportionally":
            stack.distribution = .fillProportionally
        case "equalSpacing":
            stack.distribution = .equalSpacing
        case "equalCentering":
            stack.distribution = .equalCentering
        default:
            break
        }
        distributionButton.setTitle("distribution:" + sender.title, for: .normal)
    }
    @IBAction func selectAlignment(_ sender: UIAction) {
        switch sender.title {
        case "fill":
            stack.alignment = .fill
        case "leading":
            stack.alignment = .leading
        case "top":
            stack.alignment = .top
        case "firstBaseline":
            stack.alignment = .firstBaseline
        case "center":
            stack.alignment = .center
        case "trailing":
            stack.alignment = .trailing
        case "bottom":
            stack.alignment = .bottom
        case "lastBaseline":
            stack.alignment = .lastBaseline
        default:
            break
        }
        alignmentButton.setTitle("alignment:" + sender.title, for: .normal)
    }
    @IBAction func setupSpacing(_ sender: UIAction) {
        if let space = Float(sender.title) {
            stack.spacing = CGFloat(space)
        }
        spaceButton.setTitle("spacing:" + sender.title, for: .normal)
    }
    
    @IBAction func addSubviews(_ sender: Any) {
        if stack.arrangedSubviews.count == 0 {
            stack.addArrangedSubview(redView)
        } else if stack.arrangedSubviews.count == 1 {
            stack.addArrangedSubview(greenView)
        } else if stack.arrangedSubviews.count == 2 {
            stack.addArrangedSubview(yellowView)
        } 
    }
    @IBAction func deleteSubviews(_ sender: Any) {
        if stack.arrangedSubviews.count == 1 {
            redView.removeFromSuperview()
        } else if stack.arrangedSubviews.count == 2 {
            greenView.removeFromSuperview()
        } else if stack.arrangedSubviews.count == 3 {
            yellowView.removeFromSuperview()
        }
    }
}

