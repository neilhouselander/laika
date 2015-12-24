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
        
        if (dogNameTextField.text == "")
        {
        //set up the error label
        ageInDogLabel.text = "Need a name please!"
            
        //show the label
        ageInDogLabel.hidden = false
            
        //hide convert button & show convert another
            convertToDogButtonOutlet.hidden = true
            covertAnotherButtonOutlet.hidden = false
        
        }
        else if (ageInHumanTextField.text == "")
        {
            //set up the error label
            ageInDogLabel.text = "Need an age please!"
            
            //show the label
            ageInDogLabel.hidden = false
            
            //hide convert button & show convert another
            convertToDogButtonOutlet.hidden = true
            covertAnotherButtonOutlet.hidden = false
        }
        else{
            
            //grab the number & then the name
            //NEED ERROR HANDLING HERE IF LETTERS ENTERED
            let humanYears = Double(ageInHumanTextField.text!)
            let dogName = dogNameTextField.text
            var answer: Double
            
            //convert and output. Logic-> dogs age 10.5 years per year 1st 2 years, then 4 years for each year
            
            if humanYears <= 2
            {
                answer = humanYears! * 10.5
            }
            else{
                answer = ((humanYears! - 2) * 4 ) + 21
            }
            
            ageInDogLabel.text = "\(dogName! ) is \(answer ) years old !"
            
            //tidy up
            ageInHumanTextField.resignFirstResponder()
            
            //hide the text fields
            ageInHumanTextField.hidden = true
            dogNameTextField.hidden = true
            
            //show the label
            ageInDogLabel.hidden = false
            
            //hide the convert button and show convert another
            convertToDogButtonOutlet.hidden = true
            covertAnotherButtonOutlet.hidden = false
            
            }
    }
    
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

