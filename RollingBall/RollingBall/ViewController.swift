//
//  ViewController.swift
//  RollingBall
//
//  Created by Luong Quang Huy on 11/13/19.
//  Copyright © 2019 Luong Quang Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    var ball = UIView()
    var path = CGMutablePath()
    var contentBall = CAShapeLayer()
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.layer.borderColor = UIColor.black.cgColor
        self.ball.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        ball.layer.cornerRadius = 30
        ball.layer.backgroundColor = UIColor.red.cgColor
        myView.addSubview(ball)
        contentBall.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        contentBall.fillColor = UIColor.yellow.cgColor
        path.addEllipse(in: contentBall.bounds)
        contentBall.path = path
        ball.layer.addSublayer(contentBall)
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    func roll(){
        UIView.animate(withDuration: 2, delay: 0, animations: {
            self.ball.transform = CGAffineTransform(rotationAngle: .pi)
        })
        UIView.animate(withDuration: 2, delay: 0, animations: {
            self.ball.transform = .identity
        })
    }
    func move(){
        let width: CGFloat = self.myView.frame.size.width - 60
        let height: CGFloat = self.myView.frame.size.height - 60
        
            if  self.ball.frame.origin.x == 0 && self.ball.frame.origin.y == 0{
                UIView.animate(withDuration: 2,delay: 0 , animations: {
                    self.ball.frame.origin.x += width
                })
            }else if  self.ball.frame.origin.x == width && self.ball.frame.origin.y == 0{
                UIView.animate(withDuration: 2,delay: 0 , animations: {
                    self.ball.frame.origin.y += height
                })
            }else if self.ball.frame.origin.y == height &&  self.ball.frame.origin.x == width{
                UIView.animate(withDuration: 2,delay: 0 , animations: {
                    self.ball.frame.origin.x -= width
                })
            }else if self.ball.frame.origin.y == height &&  self.ball.frame.origin.x == 0{
                UIView.animate(withDuration: 2,delay: 0 , animations: {
                    self.ball.frame.origin.y -= height
                })
        }
        }
    
    @objc func runTimer(){
        roll()
        move()
    }
}

