//
//  RotationViewController.swift
//  Gestures
//
//  Created by CS3714 on 10/19/16.
//  Copyright © 2016 Jesus Fabian. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    @IBOutlet var messageBox: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    
    let π = 3.14159
    
    
    
    /*
     
     -----------------------
     
     MARK: - View Life Cycle
     
     -----------------------
     
     */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        /**************************************************************************************************
         
         *  A Rotation is a continuous gesture, which                                                     *
         
         *   (a) begins when two fingers (touches) move enough distance to be considered a rotation, and  *
         
         *   (b) ends when both fingers are lifted.                                                       *
         
         *                                                                                                *
         
         *  The gesture recognizer sends its action message at each stage of movements of the fingers.    *
         
         *************************************************************************************************/
        
        
        
        // Instantiate a Rotation Gesture Recognizer object for the current View.
        
        // Identify which method to invoke when the Rotation gesture is applied.
        
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(RotationViewController.handleRotation(_:)))
        
        
        
        // Add Rotation Gesture Recognizer to the View
        
        self.view.addGestureRecognizer(rotationRecognizer)
        
    }
    
    
    
    /*
     
     -------------------------------
     
     MARK: - Handle Rotation Gesture
     
     -------------------------------
     
     */
    
    
    
    // This method is invoked when rotation gesture is applied
    
    func handleRotation(_ recognizer: UIRotationGestureRecognizer) {
        
        
        
        /*
         
         recognizer.rotation = rotation of the gesture in radians since its last change.
         
         recognizer.velocity = velocity of the rotation gesture in radians per second.
         
         
         
         Positive velocity values indicate Clockwise rotation.
         
         Negative velocity values indicate Counterclockwise rotation.
         
         
         
         Degrees are most commonly used and better understood by the users. Therefore,
         
         we convert radians to degrees using this formula:  Degrees = Radians x 180 / π
         
         */
        
        
        
        let rotationInDegrees = Double((recognizer.rotation)) * 180.0 / π
        
        let velocityInDegrees = Double((recognizer.velocity)) * 180.0 / π
        
        
        
        messageBox.text = "You rotated \(rotationInDegrees) degrees with velocity \(velocityInDegrees) degrees per second."
        
        
        
        /*
         
         CGAffineTransform = A structure for holding an affine transformation matrix.
         
         CGAffineTransformMakeRotation = Returns an affine transformation matrix constructed from a rotation value given.
         
         Affine transformation is the one for which parallel lines remain parallel.
         
         */
        
        let transformationMatrix = CGAffineTransform(rotationAngle: recognizer.rotation)
        
        
        
        imageView.transform = transformationMatrix
        
    }
    
    
    }
