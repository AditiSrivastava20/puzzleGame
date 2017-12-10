//
//  newViewController.swift
//  puzzlegame
//
//  Created by Sierra 4 on 17/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import CLTimer

class newViewController: UIViewController {

    var img = UIImage()
    var counter = 0
    var itimer = Timer()
    var selectedImageOriginalCenter = CGRect()
    @IBOutlet var UpperImageCollection: [UIImageView]!
    @IBOutlet var LowerImageCollection: [UIImageView]!
    @IBOutlet weak var timer: CLTimer!
    @IBOutlet weak var imageoutlet: UIImageView!
    var topleft = UIImage()
    var topright = UIImage()
    var topmiddle = UIImage()
    var centerleft = UIImage()
    var centermiddle = UIImage()
    var centerright = UIImage()
    var bottomleft = UIImage()
    var bottommiddle = UIImage()
    var bottomright = UIImage()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imageoutlet.image = img
        let image : UIImage = img
        let topHalf = img.topHalf
        let bottomHalf = img.bottomHalf
        let middleHalf = img.VerticallyMiddleHalf
        
        
        topleft = (topHalf?.leftHalf)!
        topright = (topHalf?.rightHalf)!
        bottomleft = (bottomHalf?.leftHalf)!
        bottomright = (bottomHalf?.rightHalf)!
        topmiddle = (topHalf?.horizontallyMiddleHalf)!
        bottommiddle = (bottomHalf?.horizontallyMiddleHalf)!
        centerleft = (middleHalf?.leftHalf)!
        centermiddle = (middleHalf?.horizontallyMiddleHalf)!
        centerright = (middleHalf?.rightHalf)!
        
        
        
        var array = [topleft,topmiddle,topright,centerleft,centermiddle,centerright,bottomleft,bottommiddle,bottomright]
        array.shuffleArray()
        LowerImageCollection[0].image = array[0]
        LowerImageCollection[1].image = array[1]
        LowerImageCollection[2].image = array[2]
        LowerImageCollection[3].image = array[3]
        LowerImageCollection[4].image = array[4]
        LowerImageCollection[5].image = array[5]
        LowerImageCollection[6].image = array[6]
        LowerImageCollection[7].image = array[7]
        LowerImageCollection[8].image = array[8]
        
        timer.startTimer(withSeconds: 180, format:.Minutes , mode: .Reverse)
        itimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        let panGesture1 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.LowerImageCollection[0].addGestureRecognizer(panGesture1)
        let panGesture2 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.LowerImageCollection[1].addGestureRecognizer(panGesture2)
        let panGesture3 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.LowerImageCollection[2].addGestureRecognizer(panGesture3)
        let panGesture4 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.LowerImageCollection[3].addGestureRecognizer(panGesture4)
        let panGesture5 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.LowerImageCollection[4].addGestureRecognizer(panGesture5)
        let panGesture6 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.LowerImageCollection[5].addGestureRecognizer(panGesture6)
        let panGesture7 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.LowerImageCollection[6].addGestureRecognizer(panGesture7)
        let panGesture8 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.LowerImageCollection[7].addGestureRecognizer(panGesture8)
        let panGesture9 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.LowerImageCollection[8].addGestureRecognizer(panGesture9)
        
        let panGesture11 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.UpperImageCollection[0].addGestureRecognizer(panGesture11)
        let panGesture22 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.UpperImageCollection[1].addGestureRecognizer(panGesture22)
        let panGesture33 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.UpperImageCollection[2].addGestureRecognizer(panGesture33)
        let panGesture44 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.UpperImageCollection[3].addGestureRecognizer(panGesture44)
        let panGesture55 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.UpperImageCollection[4].addGestureRecognizer(panGesture55)
        let panGesture66 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.UpperImageCollection[5].addGestureRecognizer(panGesture66)
        let panGesture77 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.UpperImageCollection[6].addGestureRecognizer(panGesture77)
        let panGesture88 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.UpperImageCollection[7].addGestureRecognizer(panGesture88)
        let panGesture99 = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.UpperImageCollection[8].addGestureRecognizer(panGesture99)
        
        
        
            }
    
    
  
        
    
    func handlePan(_ pan: UIPanGestureRecognizer)
    {
        let translation = pan.translation(in: self.view)
        
        let img = pan.view as! UIImageView
        self.view.bringSubview(toFront: img)
        if img.image != nil {
            img.center = CGPoint(x:img.center.x + translation.x,
                                 y:img.center.y + translation.y)
            
            switch pan.state {
            case .ended:
                var flag = false
                for i in 0...8{
                    if (UpperImageCollection[i].frame.intersects(img.frame)) {
                        if(UpperImageCollection[i].image == nil){
                            UpperImageCollection[i].image = img.image
                            img.image = UIImage(named: DataIdentifier.nilWrapping.rawValue)
                            flag = true
                        }
                        else{
                            flag = false
                        }
                    }
                }
                for i in 0...8{
                    if (LowerImageCollection[i].frame.intersects(img.frame)) {
                        if(LowerImageCollection[i].image == nil){
                            LowerImageCollection[i].image = img.image
                            img.image = UIImage(named: DataIdentifier.nilWrapping.rawValue)
                            flag = true
                        }
                        else{
                            flag = false
                        }
                    }
                }
                if(!flag){
                    img.frame = selectedImageOriginalCenter
                }
            case .began:
                selectedImageOriginalCenter = img.frame
            default:
                break
            }
            pan.setTranslation(CGPoint.zero, in: self.view)
        }
    }
    
    
    
    func timerAction() {
        if(counter <= 180)
        {
            counter += 1
            
        }
        else{
            itimer.invalidate()
            alertBox(message: infos.tryagain.rawValue)
            
        }
        
    }
    
    func alertBox(message : String)
    {
        let alert = UIAlertController(title: infos.gameover.rawValue, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: infos.ok.rawValue, style: UIAlertActionStyle.default, handler: { action in
            self.navigationController?.popViewController(animated: true);
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    

    @IBAction func btnSubmit(_ sender: Any) {
        
            for i in 0...8
            {
                if (self.UpperImageCollection[i].image != nil)
                {
                    if((UpperImageCollection[0].image == topleft) &&
                        (UpperImageCollection[1].image == topmiddle) &&
                        (UpperImageCollection[2].image == topright) &&
                        (UpperImageCollection[3].image == centerleft) &&
                        (UpperImageCollection[4].image == centermiddle) &&
                        (UpperImageCollection[5].image == centerright) &&
                        (UpperImageCollection[6].image == bottomleft) &&
                        (UpperImageCollection[7].image == bottommiddle) &&
                        (UpperImageCollection[8].image == bottomright))
                    {
                        alertBox(message: infos.won.rawValue )
                    }
                    else
                    {
                        alertBox(message: infos.lost.rawValue )
                    }
                    
                }
            }
        }
    
}

    
    



    

extension UIImage {
    var topHalf: UIImage? {
        guard let cgImage = cgImage,
            let image = cgImage.cropping(to: CGRect(
                origin: .zero,
                size: CGSize(width: size.width, height: size.height/3)
                )
            )
            else
        {
            return nil
        }
        return UIImage(cgImage: image, scale: 1, orientation: imageOrientation)
    }
    
    var VerticallyMiddleHalf: UIImage? {
        guard let cgImage = cgImage,
            let image = cgImage.cropping(to: CGRect(
                origin: CGPoint(x: 0,  y: CGFloat(Int(size.height)-Int(size.height/3)-Int(size.height/3))),
                size: CGSize(width: size.width, height: CGFloat(Int(size.height) - Int((size.height/3 )*2  )))
                )
            )
            else
        {
            return nil
        }
        return UIImage(cgImage: image)
    }
    
    var bottomHalf: UIImage? {
        guard let cgImage = cgImage,
            let image = cgImage.cropping(to: CGRect(
                origin: CGPoint(x: 0,  y: CGFloat(Int(size.height) - Int(size.height/3))),
                size: CGSize(width: size.width, height: CGFloat(Int(size.height) - Int((size.height/3)*2 )))
                )
            )
            else
        {
            return nil
        }
        return UIImage(cgImage: image)
    }
    
    
    
    
    var leftHalf: UIImage? {
        guard let cgImage = cgImage, let image = cgImage.cropping(to: CGRect(
            origin: .zero,
            size: CGSize(width: size.width/3, height: size.height)
            )
            )
            else
        {
            return nil
        }
        return UIImage(cgImage: image)
    }
    
    
    var horizontallyMiddleHalf: UIImage? {
        guard let cgImage = cgImage, let image = cgImage.cropping(to: CGRect(
            origin: CGPoint(x: CGFloat(Int(size.width)-Int((size.width/3))-Int((size.width/3))), y: 0),
            size: CGSize(width: CGFloat(Int(size.width)-Int(((size.width/3)*2))), height: size.height)
            )
            )
            else
        {
            return nil
        }
        return UIImage(cgImage: image)
    }
    
    var rightHalf: UIImage? {
        guard let cgImage = cgImage, let image = cgImage.cropping(to: CGRect(
            origin: CGPoint(x: CGFloat(Int(size.width)-Int((size.width/3))), y: 0),
            size: CGSize(width: CGFloat(Int(size.width)-Int(((size.width/3)*2))), height: size.height)
            )
            )
            else
        {
            return nil
        }
        return UIImage(cgImage: image)
    }
}

extension Array
{
    
    mutating func shuffleArray()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}



