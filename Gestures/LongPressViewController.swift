//
//  LongPressViewController.swift
//  Gestures
//
//  Created by CS3714 on 10/19/16.
//  Copyright © 2016 Jesus Fabian. All rights reserved.
//

import UIKit

class LongPressViewController: UIViewController {

    
    
    @IBOutlet var messageBox: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    /*
     
     -----------------------
     
     MARK: - View Life Cycle
     
     -----------------------
     
     */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        /**************************************************************************************************
         
         *  Long Press is a continuous gesture, which                                                     *
         
         *                                                                                                *
         
         *   (a) begins when the user presses down one or more fingers (numberOfTouchesRequired)          *
         
         *       for more than a given number of seconds (minimumPressDuration)                           *
         
         *       within a maximum movement area (allowableMovement), and                                  *
         
         *   (b) ends when all fingers are lifted.                                                        *
         
         *                                                                                                *
         
         *  Long-press gesture has the following 3 states:                                                *
         
         *                                                                                                *
         
         *  UIGestureRecognizerStateBegan                                 UIGestureRecognizerStateEnded   *
         
         *              |                                                                |                *
         
         *              |                UIGestureRecognizerStateChanged                 |                *
         
         *              V                                                                V                *
         
         *  time --------------------------------------------------------------------------------------   *
         
         *         touch begins                                                     touch ends            *
         
         *************************************************************************************************/
        
        
        
        // Create Long Press Gesture Recognizer for the Image View
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(LongPressViewController.handleLongPress(_:)))
        
        
        
        // Number of fingers (touches) that must be pressed on the Image View for the gesture to be recognized.
        
        longPressRecognizer.numberOfTouchesRequired = 1
        
        
        
        // Minimum number of seconds fingers must press on the Image View for the gesture to be recognized.
        
        longPressRecognizer.minimumPressDuration = 1
        
        
        
        // Maximum movement (in points) of the fingers on the Image View before the gesture fails.
        
        longPressRecognizer.allowableMovement = 15
        
        
        
        // Add Long Press Gesture Recognizer to the Image View
        
        imageView.addGestureRecognizer(longPressRecognizer)
        
    }
    
    
    
    /*
     
     ------------------------------------------
     
     MARK: - Long Press Gesture Handling Method
     
     ------------------------------------------
     
     */
    
    func handleLongPress(_ recognizer: UILongPressGestureRecognizer) {
        
        
        
        // Display the alert dialog view only when the long-press gesture begins
        
        if recognizer.state == UIGestureRecognizerState.began {
            
            
            
            let alertController = UIAlertController(title: "Available Actions", message: "Select one of the following options for the long press gesture.", preferredStyle: .alert)
            
            
            
            let emailOption = UIAlertAction(title: "Email Picture", style: .default, handler: { (action) -> Void in
                
                
                
                self.messageBox.text = "You selected to Email the picture!"
                
            })
            
            
            
            let copyOption = UIAlertAction(title: "Copy Picture", style: .default, handler: { (action) -> Void in
                
                
                
                self.messageBox.text = "You selected to Copy the picture!"
                
            })
            
            
            
            let saveOption = UIAlertAction(title: "Save Picture", style: .default, handler: { (action) -> Void in
                
                
                
                self.messageBox.text = "You selected to Save the picture!"
                
            })
            
            
            
            alertController.addAction(emailOption)
            
            alertController.addAction(copyOption)
            
            alertController.addAction(saveOption)
            
            
            
            present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    
    }



