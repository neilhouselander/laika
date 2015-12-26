//
//  ViewController.swift
//  Age Of Laika
//
//  Created by Neil Houselander on 13/12/2015.
//  Copyright © 2015 Neil Houselander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ageInHumanTextField: UITextField!
    @IBOutlet weak var ageInDogLabel: UILabel!
    @IBOutlet weak var dogNameTextField: UITextField!
    @IBOutlet weak var convertToDogButtonOutlet: UIButton!
    @IBOutlet weak var covertAnotherButtonOutlet: UIButton!
    
    //convert age button
    @IBAction func convertToDogButtonPressed(sender: UIButton)
    {
//error handling goes here e.g. no name or age
        
//BOTH FIELDS MISSING
        if (dogNameTextField.text == "") && (ageInHumanTextField.text == "")
        {
            ageInDogLabel.text = "You need to type something!"
            ageInDogLabel.hidden = false
            ageInHumanTextField.resignFirstResponder()
            convertToDogButtonOutlet.hidden = true
            covertAnotherButtonOutlet.hidden = false
        }

//JUST NAME MISSING
      else if (dogNameTextField.text == "")
        {
        ageInDogLabel.text = "Need a name please!"
        ageInDogLabel.hidden = false
        convertToDogButtonOutlet.hidden = true
        covertAnotherButtonOutlet.hidden = false
        }
            
//JUST AGE MISSING
        else if (ageInHumanTextField.text == "")
        {
        ageInDogLabel.text = "Need an age please!"
        ageInDogLabel.hidden = false
        convertToDogButtonOutlet.hidden = true
        covertAnotherButtonOutlet.hidden = false
         }
            
//ALL COMPLETED
        else
        {
            //grab the age
            let humanYears = Double(ageInHumanTextField.text!)
            let dogName = dogNameTextField.text
            var answer: Double
            
            //handles non-numbers in age field
            if humanYears == nil
            {
                ageInDogLabel.text = "Needs to be numbers!"
                ageInDogLabel.hidden = false
                ageInHumanTextField.resignFirstResponder()
                convertToDogButtonOutlet.hidden = true
                covertAnotherButtonOutlet.hidden = false
            }
                
            else
            {
//convert and output. Logic-> dogs age 10.5 years per year 1st 2 years, then 4 years for each year
            
            if humanYears <= 2
                {
                    answer = humanYears! * 10.5
                }
                
            else
                {
                    answer = ((humanYears! - 2) * 4 ) + 21
                }
            
            ageInDogLabel.text = "\(dogName! ) is \(answer ) years old !" //output the answer
            ageInHumanTextField.resignFirstResponder()                    //tidy up
            ageInHumanTextField.hidden = true                             //hide the text fields
            dogNameTextField.hidden = true
            ageInDogLabel.hidden = false                                  //show the label
            convertToDogButtonOutlet.hidden = true                        //hide the convert button and show convert another
            covertAnotherButtonOutlet.hidden = false
            
            }//end of this else
         }//end of all completed block
        
}//end of function
    
    //clear everything
    @IBAction func converAnotherButtonPressed(sender: UIButton)
    {
        //hide this button & show the original button
        covertAnotherButtonOutlet.hidden = true
        convertToDogButtonOutlet.hidden = false
        
        //show the text fields & clear the text
        ageInHumanTextField.hidden = false
        dogNameTextField.hidden = false
        
        ageInHumanTextField.text = ""
        dogNameTextField.text = ""
        
        //hide the label
        ageInDogLabel.hidden = true
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

