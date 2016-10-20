//
//  SwipeViewController.swift
//  Gestures
//
//  Created by CS3714 on 10/19/16.
//  Copyright © 2016 Jesus Fabian. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    
    
    @IBOutlet var messageBox: UILabel!
    
    
    // Instantiate and initialize an Image View object to be used in the animation of the swipe gesture
    
    var imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
    
    
    
    // Specify the location where the animation will Begin
    
    var animationStartLocation = CGPoint(x: 0.0, y: 0.0)
    
    
    
    // Specify the location where the animation will End
    
    var animationEndLocation: CGPoint = CGPoint(x: 0.0, y: 0.0)
    
    
    
    let animationDistance: CGFloat = 500.0   // Points in x or y direction
    
    
    
    /*
     
     -----------------------
     
     MARK: - View Life Cycle
     
     -----------------------
     
     */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        /****************************************************************************************
         
         *  A Swipe is a discrete gesture, which sends only one action message when it occurs.  *
         
         ***************************************************************************************/
        
        
        
        /*
         
         ---------------------
         
         MARK: - Swipe to LEFT
         
         ---------------------
         
         */
        
        // Create a Swipe Left Gesture Recognizer object and
        
        // Identify which method to invoke when the Swipe Left gesture occurs.
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.performAnimation(_:)))
        
        
        
        /*-----------------------------------------------------------------------------------------
         
         The : after performAnimation above implies that the performAnimation method has one
         
         parameter, which will contain the object reference of the object invoking the method.
         
         In this case, the UISwipeGestureRecognizer's object reference (unique ID) will be passed
         
         as the parameter value. We will use this obj ref to communicate with the recognizer.
         
         -----------------------------------------------------------------------------------------*/
        
        
        
        // Set the Swipe Gesture Recognizer Direction to Left
        
        swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirection.left
        
        
        
        // Add Swipe Left Gesture Recognizer to the View
        
        self.view.addGestureRecognizer(swipeLeftRecognizer)
        
        
        
        /*
         
         ----------------------
         
         MARK: - Swipe to RIGHT
         
         ----------------------
         
         */
        
        // Create a Swipe Right Gesture Recognizer object and
        
        // Identify which method to invoke when the Swipe Right gesture occurs.
        
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.performAnimation(_:)))
        
        
        
        // Set the Swipe Gesture Recognizer Direction to Right
        
        swipeRightRecognizer.direction = UISwipeGestureRecognizerDirection.right
        
        
        
        // Add Swipe Right Gesture Recognizer to the View
        
        self.view.addGestureRecognizer(swipeRightRecognizer)
        
        
        
        /*
         
         ----------------
         
         MARK: - Swipe UP
         
         ----------------
         
         */
        
        // Create a Swipe Up Gesture Recognizer object and
        
        // Identify which method to invoke when the Swipe Up gesture occurs.
        
        let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.performAnimation(_:)))
        
        
        
        // Set the Swipe Gesture Recognizer Direction to Up
        
        swipeUpRecognizer.direction = UISwipeGestureRecognizerDirection.up
        
        
        
        // Add Swipe Up Gesture Recognizer to the View
        
        self.view.addGestureRecognizer(swipeUpRecognizer)
        
        
        
        /*
         
         ---------------------
         
         MARK: - Swipe to DOWN
         
         ---------------------
         
         */
        
        // Create a Swipe Down Gesture Recognizer object and
        
        // Identify which method to invoke when the Swipe Down gesture occurs.
        
        let swipeDownRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SwipeViewController.performAnimation(_:)))
        
        
        
        // Set the Swipe Gesture Recognizer Direction to Down
        
        swipeDownRecognizer.direction = UISwipeGestureRecognizerDirection.down
        
        
        
        // Add Swipe Down Gesture Recognizer to the View
        
        self.view.addGestureRecognizer(swipeDownRecognizer)
        
        
        
        //-----------------------------------------------------------------------------
        
        // Set content mode of the imageView and add imageView as a subview of the View
        
        //-----------------------------------------------------------------------------
        
        
        
        // Set the content mode of the image view to be used in the animation
        
        imageView.contentMode = UIViewContentMode.center
        
        
        
        self.view.addSubview(imageView)
        
    }
    
    
    
    /*
     
     --------------------------------------
     
     MARK: - Animation of the Swipe Gesture
     
     --------------------------------------
     
     We animate the fading out of an image in the direction of swipe to show the user the
     
     action of swiping. We start the animation at the location where the swipe starts.
     
     - At the start of the animation, the image will be entirely visible.
     
     - At the end of the animation, the image will be entirely invisible (fades out).
     
     */
    
    func performAnimation(_ recognizer: UISwipeGestureRecognizer) {
        
        
        
        // Set the swipe start location to be the animation start location
        
        animationStartLocation = recognizer.location(in: self.view)
        
        
        
        switch recognizer.direction {
            
            
            
        case UISwipeGestureRecognizerDirection.left:
            
            messageBox.text = "You swiped to LEFT"
            
            imageView.image = UIImage(named: "Football.png")
            
            animationEndLocation.y = animationStartLocation.y
            
            animationEndLocation.x = animationStartLocation.x - animationDistance
            
            
            
        case UISwipeGestureRecognizerDirection.right:
            
            messageBox.text = "You swiped to RIGHT"
            
            imageView.image = UIImage(named: "Soccer.png")
            
            animationEndLocation.y = animationStartLocation.y
            
            animationEndLocation.x = animationStartLocation.x + animationDistance
            
            
            
        case UISwipeGestureRecognizerDirection.up:
            
            messageBox.text = "You swiped to UP"
            
            imageView.image = UIImage(named: "Tennis.png")
            
            animationEndLocation.x = animationStartLocation.x
            
            animationEndLocation.y = animationStartLocation.y - animationDistance
            
            
            
        case UISwipeGestureRecognizerDirection.down:
            
            messageBox.text = "You swiped to DOWN"
            
            imageView.image = UIImage(named: "Basketball.png")
            
            animationEndLocation.x = animationStartLocation.x
            
            animationEndLocation.y = animationStartLocation.y + animationDistance
            
            
            
        default:
            
            return
            
        }
        
        
        
        // Set the image view center to the animation start location
        
        imageView.center = animationStartLocation
        
        
        
        // Make the image entirely visible at the start of animation
        
        imageView.alpha = 1.0
        
        
        
        // Marks the beginning of a begin/commit animation block
        
        UIView.beginAnimations("", context: nil)
        
        
        
        // Sets the duration (in seconds) of the animation in the animation block
        
        UIView.setAnimationDuration(1.50)
        
        
        
        // Set the image view center to the animation end location
        
        imageView.center = animationEndLocation
        
        
        
        // Make the image entirely invisible (fade out) at the end of the animation
        
        imageView.alpha = 0.0
        
        
        
        // Marks the end of a begin/commit animation block and schedules the animations for execution.
        
        UIView.commitAnimations()
        
    }
    
    }
    




