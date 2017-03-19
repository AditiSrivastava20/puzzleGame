//
//  ViewController2.swift
//  puzzlegame
//
//  Created by Sierra 4 on 16/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import CLTimer

class ViewController2: UIViewController {
 /*   var img = UIImage()
    var counter = 0
    var itimer = Timer()
    
    @IBOutlet weak var timer: CLTimer!
    @IBOutlet weak var imageoutlet: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img9: UIImageView!
    @IBOutlet weak var img8: UIImageView!
    @IBOutlet weak var img7: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var second3: UIImageView!
    @IBOutlet weak var second5: UIImageView!
    @IBOutlet weak var second2: UIImageView!
    @IBOutlet weak var second1: UIImageView!
    @IBOutlet weak var second6: UIImageView!
    @IBOutlet weak var second8: UIImageView!
    @IBOutlet weak var second9: UIImageView!
    @IBOutlet weak var second7: UIImageView!
    @IBOutlet weak var second4: UIImageView!
       override func viewDidLoad() {
        super.viewDidLoad()
       
        imageoutlet.image = img
        let image : UIImage = img
        let topHalf = image.topHalf
        let verticallyMiddleHalf = image.VerticallyMiddleHalf
        let bottomHalf = image.bottomHalf
        let topLeft = topHalf?.leftHalf
        let topMiddle = topHalf?.horizontallyMiddleHalf
        let topRight = topHalf?.rightHalf
        let centerLeft = verticallyMiddleHalf?.leftHalf
        let centerMiddle = verticallyMiddleHalf?.horizontallyMiddleHalf
        let centerRight = verticallyMiddleHalf?.rightHalf
        let bottomLeft = bottomHalf?.leftHalf
        let bottomMiddle = bottomHalf?.horizontallyMiddleHalf
        let bottomRight = bottomHalf?.rightHalf
        
        var array = [topLeft,topMiddle,topRight,centerLeft,centerMiddle,centerRight,bottomLeft,bottomMiddle,bottomRight]
        array.shuffleArray()
       second1.image = array[0]
        second2.image = array[1]
        second3.image = array[2]
        second4.image = array[3]
        second5.image = array[4]
        second6.image = array[5]
        second7.image = array[6]
        second8.image = array[7]
        second9.image = array[8]
        timer.startTimer(withSeconds: 180, format:.Minutes , mode: .Reverse)
        itimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        /*let gestureInstance = PanGestureHandler.sharedInstance
        gestureInstance.registerGesture(self.view)*/
    }
    
   /* static let sharedInstance : PanGestureHandler = {
        let instance = PanGestureHandler()
        return instance
    }()*/
    
    
    func timerAction() {
        if(counter <= 180)
        {
            counter += 1
           
        }
        else{
            itimer.invalidate()
            alertBox(message: "TRY AGAIN!!!")
            
        }
        
    }
    func alertBox(message : String)
    {
        let alert = UIAlertController(title: "OOPS!..Game Over!!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func panGesture(recognizer: UIPanGestureRecognizer ) {
        
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        print(translation.x,translation.y)
        let Viewimg = recognizer.view as! UIImageView
        print(Viewimg.frame)
        print("tag",Viewimg.tag)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
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
    }*/
}



