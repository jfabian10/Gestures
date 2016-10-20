//
//  PinchViewController.swift
//  Gestures
//
//  Created by CS3714 on 10/19/16.
//  Copyright © 2016 Jesus Fabian. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {

   
    
    @IBOutlet var messageBox: UILabel!
    
    
    @IBOutlet var imageView: UIImageView!
    
    
    
    var lastScaleFactor = 1.0
    
    
    
    /*
     
     -----------------------
     
     MARK: - View Life Cycle
     
     -----------------------
     
     */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        /**************************************************************************************************
         
         *  A Pinch is a continuous gesture, which                                                        *
         
         *                                                                                                *
         
         *   (a) begins when two fingers (touches) move toward each other (zoom-out) or                   *
         
         *       move away from each other (zoom-in), and                                                 *
         
         *   (b) ends when both fingers are lifted.                                                       *
         
         *                                                                                                *
         
         *  A Pinch has the following 3 states:                                                           *
         
         *                                                                                                *
         
         *  UIGestureRecognizerStateBegan                                 UIGestureRecognizerStateEnded   *
         
         *              |                                                                |                *
         
         *              |                UIGestureRecognizerStateChanged                 |                *
         
         *              V                                                                V                *
         
         *  time --------------------------------------------------------------------------------------   *
         
         *         touch begins                                                     touch ends            *
         
         *************************************************************************************************/
        
        
        
        // Instantiate a Pinch Gesture Recognizer object for the current View.
        
        // Identify which method to invoke when the Pinch gesture is applied.
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(PinchViewController.handlePinch(_:)))
        
        
        
        // Add Pinch Gesture Recognizer to the Image View
        
        imageView.addGestureRecognizer(pinchRecognizer)
        
    }
    
    
    
    /*
     
     ----------------------------
     
     MARK: - Handle Pinch Gesture
     
     ----------------------------
     
     */
    
    
    
    // This method is invoked when rotation gesture is applied
    
    func handlePinch(_ recognizer: UIPinchGestureRecognizer) {
        
        /*
         
         recognizer.scale = The scale factor that is proportional to change in distance between your fingers.
         
         D1 = distance between two fingers at the start of pinch
         
         D2 = distance between two fingers at the end of pinch
         
         recognizer.scale = D2/D1
         
         
         
         recognizer.scale = D2/D1 < 1.0 implies Pinch Close (moving two fingers close to each other)
         
         recognizer.scale = D2/D1 > 1.0 implies Pinch Open (moving two fingers away from each other)
         
         
         
         recognizer.velocity = The velocity of the pinch as scale factor per second.
         
         */
        
        
        
        let scaleFactor = Double(recognizer.scale)
        
        var message = ""
        
        
        
        if scaleFactor < 1.0 {   // Pinch Close
            
            
            
            message = "You pinched Close \(scaleFactor*100)% with velocity \(recognizer.velocity) scale factor per second."
            
            
            
            recognizer.view?.transform = CGAffineTransform(scaleX: CGFloat(lastScaleFactor * scaleFactor), y: CGFloat(lastScaleFactor * scaleFactor))
            
            
            
        } else {   // Pinch Open
            
            
            
            message = "You pinched Open \(scaleFactor*100)% with velocity \(recognizer.velocity) scale factor per second."
            
            
            
            recognizer.view?.transform = CGAffineTransform(scaleX: CGFloat(lastScaleFactor + (scaleFactor-1)), y: CGFloat(lastScaleFactor + (scaleFactor-1)))
            
        }
        
        
        
        if (recognizer.state == UIGestureRecognizerState.ended) {
            
            if (scaleFactor > 1.0) {
                
                lastScaleFactor += scaleFactor - 1
                
            } else {
                
                lastScaleFactor *= scaleFactor
                
            }
            
        }
        
        
        
        messageBox.text = message
        
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


