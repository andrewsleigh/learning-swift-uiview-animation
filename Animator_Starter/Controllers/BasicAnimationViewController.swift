//
//  ViewController.swift
//  Animator_Starter
//
//  Created by Harrison Ferrone on 18.02.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class BasicAnimationViewController: UIViewController {
    
    // MARK: Storyboard outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var graphic: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    // MARK: Appearance
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // UI setup
        graphic.round(cornerRadius: graphic.frame.size.width/2, borderWidth: 3.0, borderColor: .black)
        
        // TODO: Animation setup
        
        // make them all invsible when this viewCOntroller loads
        // set this viewController to be 'is initial view controller' in storyboard
        
        // three objects we have in this scene
        // and which are connected to this swift file with an @IBOutlet
        titleLabel.alpha = 0
        graphic.alpha = 0
        loadingLabel.alpha = 0
        
        //
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: Fire initial animations
        animateTitleIn()
        // animateGraphicIn() - try using version with options:
        animateGraphicInWithOptions()
        
    }
    
    // put animation code in separate function for clarity
    // then call this function in viewDidAppear
    
    func animateTitleIn() {
        
        // use the simplest version of the animation funtion which just takes as input paramters a duration and a closure
        
        // going back to the closure tutorial
        // a basic example is:
        
            /*
             var saluteHunter = { (parameterString:String) -> Void in
             print(parameterString)
             }
             // so it takes parameterString in as a string, and returns Void
             // the keyword 'in' means: parameter and return type are done, what comes next is the body of the closure
             */
        

    
        UIView.animate(withDuration: 1.5) {
            // this closure doesnt return any values
            // it just has to execute its commands
            // prefix variable names with self. because we're inside a closure
            // WHy???
            
            self.titleLabel.alpha = 1
            self.titleLabel.frame.origin.y -= 50
            
            // note these animations happen together, not one after the other
        }

    
    }
    
    // now try animating the graphic in
    // want to add a delay, so it fades in after the title appears
    // so make a separate function
    // and call the UIView.animate function overlaod that allows for a delay to be passed in
    
    // and call this function just after the previous function in viewDidAppear()
    
    func animateGraphicIn() {
        // go through all the parameters we pass in:
            // withDuration - just the duration of the animation
            // delay - a bit of time before i triggers
            // options - just pass in an empty delay - there are no potions we're interested in
            // animations - a closure that we also leave empty - just press enter to autocomplete
                // we fill this in by hand next
            // completion - pass in completed as the boolean (ie whate follows is the code to execute once the animation has completed - we can use this to chain animations
        
        
        
        UIView.animate(withDuration: 1.5, delay: 0.75, options: [], animations: {
            // now fill in the animations closure
            
            self.graphic.alpha = 1
            self.graphic.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            
            // use this CGAffineTransform class for anything to do with scaling or rotation
            
        }) { (completed) in
            
        }
    }

    
    // can also try a version of this with some options added:
    func animateGraphicInWithOptions() {
        UIView.animate(withDuration: 1.5, delay: 0.75, options: [.curveEaseInOut], animations: {
            
        // .repeat - endless looping
        // .autoreverse  - can only be sed when repeat is present
        // also lots of easing options
            
        // now fill in the animations closure
        
        self.graphic.alpha = 1
        self.graphic.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        // use this CGAffineTransform class for anything to do with scaling or rotation
        
        }) { (completed) in
            // call the challenge function here
            // ie do that function once this animation is complete
            // pulseLoadingButton()
            pulseLoadingButtonSolution()
            
            // since this function runs forever, he also calls this segue function that he alreasy had set up in extensions.swift
            self.segueToNextViewController(segueID: Constants.Segues.toSpringsVC, delay: 3)
            // also, see how this calls on a Constants struct he has set up in a separate file. Quite tidy
            // I could od this too!
            // WIth structs for all my data referring to  different objects!
        }

        // CHALLENGE!

        // my solution
//        func pulseLoadingButton() {
//            UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
//                self.loadingLabel.alpha = 1
//                self.loadingLabel.alpha = 0.7
//                self.loadingLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//                } // end of animations
//                ) // end of parameters
//
//            // return statement, which in this case, we want to be nothing
//            { (completed) in
//                print("This will never complete!")
//            }
//        }
        
        // his solution
        func pulseLoadingButtonSolution() {
            UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations:{
                    self.loadingLabel.alpha = 1
                    self.loadingLabel.alpha = 0.7
                    self.loadingLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }, completion: nil)
        }
        
        // I dont understand this syntax!

        
        
        
        
        
        
        
        
    }

}
