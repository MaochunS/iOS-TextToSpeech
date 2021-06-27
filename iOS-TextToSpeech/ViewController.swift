//
//  ViewController.swift
//  iOS-TextToSpeech
//
//  Created by maochun on 2021/6/27.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    lazy var textInput: UITextView = {
        let v = UITextView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .none
        v.font = UIFont.systemFont(ofSize: 16)
        v.text = "This is a test. Today is a beautiful day!"
        v.textColor = .black
        
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.gray.cgColor
        self.view.addSubview(v)
        
        NSLayoutConstraint.activate([
            v.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60),
            v.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            v.heightAnchor.constraint(equalToConstant: 300),
            v.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        
        return v
    }()
    
    lazy var btnStart : UIButton = {
        let b = UIButton()

        b.setTitle("Speak", for: .normal)
        b.setTitleColor(.blue, for: .normal)
        b.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(b)
        
        NSLayoutConstraint.activate([
            b.topAnchor.constraint(equalTo: self.textInput.bottomAnchor, constant: 40),
            b.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            
        ])
        
        return b
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        _ = self.textInput
        _ = self.btnStart
    }


    @objc func startAction(){
        
        guard let inputTxt = self.textInput.text, inputTxt.count > 0 else{
            return
        }
        
        let speechSynthesizer = AVSpeechSynthesizer()
        let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: inputTxt)

        speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2.5
      
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        //speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
       
        speechSynthesizer.speak(speechUtterance)
    }
}

