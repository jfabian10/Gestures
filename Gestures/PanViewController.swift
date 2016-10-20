//
//  PanViewController.swift
//  Gestures
//
//  Created by CS3714 on 10/19/16.
//  Copyright © 2016 Jesus Fabian. All rights reserved.
//

import UIKit

class PanViewController: UIViewController {

    
    
    @IBOutlet var imageView1: UIImageView!
    
    
    @IBOutlet var imageView2: UIImageView!
    
    @IBOutlet var imageView3: UIImageView!
    
    @IBOutlet var imageView4: UIImageView!
    
    
    
    /*
     
     A geometric translation moves every point of our UIImageView object by the same amount
     
     in a given direction when it is panned (dragged) from one location to another.
     
     We store the (x, y) coordinates of the last translation of imageViewj into an
     
     instance variable lastTranslationj, where j=1,2,3,4
     
     
     
     CGPoint is a structure that contains the (x, y) coordinate values.
     
     */
    
    
    
    var lastTranslation1 = CGPoint(x: 0.0, y: 0.0)
    
    var lastTranslation2 = CGPoint(x: 0.0, y: 0.0)
    
    var lastTranslation3 = CGPoint(x: 0.0, y: 0.0)
    
    var lastTranslation4 = CGPoint(x: 0.0, y: 0.0)
    
    
    
    /*
     
     -----------------------
     
     MARK: - View Life Cycle
     
     -----------------------
     
     */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        /**************************************************************************************************
         
         *  Panning (Dragging) is a continuous gesture, which                                             *
         
         *                                                                                                *
         
         *   (a) begins when the user starts panning while one or more fingers are pressed down, and      *
         
         *   (b) ends when all fingers are lifted.                                                        *
         
         *                                                                                                *
         
         *  Panning has the following 3 states:                                                           *
         
         *                                                                                                *
         
         *  UIGestureRecognizerStateBegan                                 UIGestureRecognizerStateEnded   *
         
         *              |                                                                |                *
         
         *              |                UIGestureRecognizerStateChanged                 |                *
         
         *              V                                                                V                *
         
         *  time --------------------------------------------------------------------------------------   *
         
         *         touch begins                                                     touch ends            *
         
         *************************************************************************************************/
        
        
        
        //------------------------------ Image View 1 --------------------------------------
        
        // Create Panning (Dragging) Gesture Recognizer for Image View 1
        
        let panRecognizer1 = UIPanGestureRecognizer(target: self, action: #selector(PanViewController.handlePanning1(_:)))
        
        
        
        // Add Panning (Dragging) Gesture Recognizer to Image View 1
        
        imageView1.addGestureRecognizer(panRecognizer1)
        
        
        
        //------------------------------ Image View 2 --------------------------------------
        
        // Create Panning (Dragging) Gesture Recognizer for Image View 2
        
        let panRecognizer2 = UIPanGestureRecognizer(target: self, action: #selector(PanViewController.handlePanning2(_:)))
        
        
        
        // Add Panning (Dragging) Gesture Recognizer to Image View 2
        
        imageView2.addGestureRecognizer(panRecognizer2)
        
        
        
        //------------------------------ Image View 3 --------------------------------------
        
        // Create Panning (Dragging) Gesture Recognizer for Image View 3
        
        let panRecognizer3 = UIPanGestureRecognizer(target: self, action: #selector(PanViewController.handlePanning3(_:)))
        
        
        
        // Add Panning (Dragging) Gesture Recognizer to Image View 3
        
        imageView3.addGestureRecognizer(panRecognizer3)
        
        
        
        //------------------------------ Image View 4 --------------------------------------
        
        // Create Panning (Dragging) Gesture Recognizer for Image View 4
        
        let panRecognizer4 = UIPanGestureRecognizer(target: self, action: #selector(PanViewController.handlePanning4(_:)))
        
        
        
        // Add Panning (Dragging) Gesture Recognizer to Image View 4
        
        imageView4.addGestureRecognizer(panRecognizer4)
        
    }
    
    
    
    /*
     
     -------------------------------------------
     
     MARK: - Panning (Dragging) Handling Methods
     
     -------------------------------------------
     
     */
    
    
    
    /********************************************************
     
     *  Handle Panning (Dragging) Gesture  for Image View 1  *
     
     ********************************************************/
    
    func handlePanning1(_ recognizer: UIPanGestureRecognizer) {
        
        
        
        let newTranslation: CGPoint = recognizer.translation(in: imageView1)
        
        
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation1.x + newTranslation.x, y: lastTranslation1.y + newTranslation.y)
        
        
        
        if recognizer.state == UIGestureRecognizerState.ended {
            
            lastTranslation1.x += newTranslation.x
            
            lastTranslation1.y += newTranslation.y
            
        }
        
    }
    
    
    
    /********************************************************
     
     *  Handle Panning (Dragging) Gesture  for Image View 2  *
     
     ********************************************************/
    
    func handlePanning2(_ recognizer: UIPanGestureRecognizer) {
        
        
        
        let newTranslation: CGPoint = recognizer.translation(in: imageView2)
        
        
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation2.x + newTranslation.x, y: lastTranslation2.y + newTranslation.y)
        
        
        
        if recognizer.state == UIGestureRecognizerState.ended {
            
            lastTranslation2.x += newTranslation.x
            
            lastTranslation2.y += newTranslation.y
            
        }
        
    }
    
    
    
    /********************************************************
     
     *  Handle Panning (Dragging) Gesture  for Image View 3  *
     
     ********************************************************/
    
    func handlePanning3(_ recognizer: UIPanGestureRecognizer) {
        
        
        
        let newTranslation: CGPoint = recognizer.translation(in: imageView3)
        
        
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation3.x + newTranslation.x, y: lastTranslation3.y + newTranslation.y)
        
        
        
        if recognizer.state == UIGestureRecognizerState.ended {
            
            lastTranslation3.x += newTranslation.x
            
            lastTranslation3.y += newTranslation.y
            
        }
        
    }
    
    
    
    /********************************************************
     
     *  Handle Panning (Dragging) Gesture  for Image View 4  *
     
     ********************************************************/
    
    func handlePanning4(_ recognizer: UIPanGestureRecognizer) {
        
        
        
        let newTranslation: CGPoint = recognizer.translation(in: imageView4)
        
        
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation4.x + newTranslation.x, y: lastTranslation4.y + newTranslation.y)
        
        
        
        if recognizer.state == UIGestureRecognizerState.ended {
            
            lastTranslation4.x += newTranslation.x
            
            lastTranslation4.y += newTranslation.y
            
        }
        
    }
    

}
