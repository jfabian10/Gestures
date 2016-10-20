//
//  TapViewController.swift
//  Gestures
//
//  Created by CS3714 on 10/19/16.
//  Copyright © 2016 Jesus Fabian. All rights reserved.
//

import UIKit

class TapViewController: UIViewController {

   
    @IBOutlet var messageBox: UILabel!
    
    
    @IBOutlet var imageScrollView: UIScrollView!
    
    @IBOutlet var imageView: UIImageView!
    
    
    
    
    let zoomStep = 1.5
    
    
    
    /*
     
     -----------------------
     
     MARK: - View Life Cycle
     
     -----------------------
     
     */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        /***************************************************************************************
         
         *  A Tap is a discrete gesture, which sends only one action message when it occurs.   *
         
         **************************************************************************************/
        
        
        
        // Instantiate a Tap Gesture Recognizer object for the current View.
        
        // Identify which method to invoke for which type of Tap gesture.
        
        
        
        let singleTap           = UITapGestureRecognizer(target: self, action: #selector(TapViewController.handleSingleTap(_:)))
        
        let doubleTap           = UITapGestureRecognizer(target: self, action: #selector(TapViewController.handleDoubleTap(_:)))
        
        let twoFingerTap        = UITapGestureRecognizer(target: self, action: #selector(TapViewController.handleTwoFingerTap(_:)))
        
        let twoFingerDoubleTap  = UITapGestureRecognizer(target: self, action: #selector(TapViewController.handleTwoFingerDoubleTap(_:)))
        
        
        
        // Set number of taps and touches required
        
        
        
        singleTap.numberOfTapsRequired = 1
        
        doubleTap.numberOfTapsRequired = 2
        
        twoFingerTap.numberOfTouchesRequired = 2
        
        twoFingerDoubleTap.numberOfTapsRequired = 2
        
        twoFingerDoubleTap.numberOfTouchesRequired = 2
        
        
        
        // Add Tap Gesture Recognizers to the imageView
        
        
        
        imageView.addGestureRecognizer(singleTap)
        
        imageView.addGestureRecognizer(doubleTap)
        
        imageView.addGestureRecognizer(twoFingerTap)
        
        imageView.addGestureRecognizer(twoFingerDoubleTap)
        
        
        
        /*** Calculate minimum scale to perfectly fit the actual image width ***
         
         
         
         UIView object's BOUNDS is defined as a rectangle with (x, y) and size (width, height) relative to its own coordinate system (0,0).
         
         UIView object's FRAME  is defined as a rectangle with (x, y) and size (width, height) relative to the superview it is contained within.
         
         */
        
        let imageScrollViewBoundsSize = imageScrollView.bounds.size
        
        let imageViewBoundsSize = imageView.bounds.size
        
        
        
        let xScale = imageScrollViewBoundsSize.width / imageViewBoundsSize.width
        
        let yScale = imageScrollViewBoundsSize.height / imageViewBoundsSize.height
        
        
        
        let minimumZoomScaleToUse = min(xScale, yScale)
        
        
        
        // Set the minimum zoom scale factor that can be applied to the scroll view's content.
        
        imageScrollView.minimumZoomScale = minimumZoomScaleToUse
        
        
        
        // Set the current zoom scale factor applied to the scroll view's content.
        
        // This value determines how much the content is currently scaled. The default value is 1.0.
        
        imageScrollView.zoomScale = minimumZoomScaleToUse
        
        
        
        // Set the maximum zoom scale factor that can be applied to the scroll view's content
        
        imageScrollView.maximumZoomScale = 3.0
        
    }
    
    
    
    /*
     
     --------------------------------------------
     
     MARK: - UIScrollViewDelegate Protocol Method
     
     --------------------------------------------
     
     */
    
    
    
    // Asks the delegate for the view to scale when zooming is about to occur in the scroll view
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        
        
        return imageView
        
    }
    
    
    
    /*
     
     ----------------------------
     
     MARK: - Tap Handling Methods
     
     ----------------------------
     
     */
    
    
    
    // This method is invoked when single tap gesture is applied
    
    func handleSingleTap(_ gestureRecognizer: UIGestureRecognizer) {
        
        
        
        let tapLocation: CGPoint = gestureRecognizer.location(in: gestureRecognizer.view)
        
        
        
        messageBox.text = "You single tapped with one finger at location x = \(tapLocation.x) y = \(tapLocation.y)!"
        
    }
    
    
    
    // This method is invoked when double tap gesture is applied
    
    func handleDoubleTap(_ gestureRecognizer: UIGestureRecognizer) {
        
        
        
        self.messageBox.text = "You double tapped with one finger to zoom in!"
        
        
        
        // zoomScale = A floating-point value that specifies the current scale factor applied to the scroll view's content.
        
        // The zoomScale default value is 1.0.
        
        let newScaleInDouble: Double = Double(imageScrollView.zoomScale) * zoomStep
        
        
        
        let newScale: CGFloat = CGFloat(newScaleInDouble)
        
        
        
        let tapLocation: CGPoint = gestureRecognizer.location(in: gestureRecognizer.view)
        
        
        
        // Compute the rectangle defining an area of the content view based on zoom scale with tap location being the center
        
        let zoomRect: CGRect = zoomRectForScale(newScale, withCenter:tapLocation)
        
        
        
        /*
         
         zoomRect = a rectangle defining an area of the content view
         
         animated --> YES if the scrolling should be animated, NO if it should be immediate
         
         */
        
        imageScrollView.zoom(to: zoomRect, animated:true)
        
    }
    
    
    
    // This method is invoked when two finger tap gesture is applied
    
    func handleTwoFingerTap(_ gestureRecognizer: UIGestureRecognizer) {
        
        
        
        messageBox.text = "You single tapped with two fingers to zoom out!"
        
        
        
        // zoomScale = A floating-point value that specifies the current scale factor applied to the scroll view's content.
        
        // The zoomScale default value is 1.0.
        
        let newScaleInDouble: Double = Double(imageScrollView.zoomScale) / zoomStep
        
        
        
        let newScale: CGFloat = CGFloat(newScaleInDouble)
        
        
        
        let tapLocation: CGPoint = gestureRecognizer.location(in: gestureRecognizer.view)
        
        
        
        // Compute the rectangle defining an area of the content view based on zoom scale with tap location being the center
        
        let zoomRect: CGRect = zoomRectForScale(newScale, withCenter:tapLocation)
        
        
        
        /*
         
         zoomRect = a rectangle defining an area of the content view
         
         animated --> YES if the scrolling should be animated, NO if it should be immediate
         
         */
        
        imageScrollView.zoom(to: zoomRect, animated:true)
        
    }
    
    
    
    // This method is invoked when two finger double tap gesture is applied
    
    func handleTwoFingerDoubleTap(_ gestureRecognizer: UIGestureRecognizer) {
        
        
        
        messageBox.text = "You double tapped with two fingers!"
        
    }
    
    
    
    /*
     
     ----------------------
     
     MARK: - Utility Method
     
     ----------------------
     
     */
    
    
    
    //
    
    func zoomRectForScale(_ scale: CGFloat, withCenter center: CGPoint) -> CGRect {
        
        
        
        var zoomRect: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        
        
        // The zoom rect is in the content view's coordinates.
        
        //    At a zoom scale of 1.0, it would be the size of the imageScrollView's bounds.
        
        //    As the zoom scale decreases, so more content is visible, the size of the rect grows.
        
        zoomRect.size.height = imageScrollView.frame.size.height / scale
        
        zoomRect.size.width  = imageScrollView.frame.size.width / scale
        
        
        
        // Choose an origin so as to get the right center.
        
        zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0)
        
        zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0)
        
        
        
        return zoomRect
        
    }

}
