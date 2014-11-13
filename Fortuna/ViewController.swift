//
//  ViewController.swift
//  Fortuna
//
//  Created by Heaven on 10/22/14.
//  Copyright (c) 2014 HeavenWesker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func rootViewTaped(sender: UITapGestureRecognizer) {
        displayRondomQuote()
    }
    @IBOutlet weak var quotationTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        println("controller: \(self)")
        println("view: \(self.view)")
        println("view's frame: \(self.view.frame)")
        println("viewDidLoad quotationTextView: \(quotationTextView)")
        quotationTextView.selectable = false
        quotationTextView.editable = false
        displayRondomQuote()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func awakeFromNib() {
        // The super method doesn't do anything, but we call it anyway.
        super.awakeFromNib()
        println("awakeFromNib quotationTextView: \(quotationTextView)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayRondomQuote() {
        var appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var positiveQuotes = appDelegate.positiveQuotes
        var negativeQuotes = appDelegate.negativeQuotes
        var quote: String
        if arc4random_uniform(2) == 0{
            quote = positiveQuotes[Int(arc4random_uniform(UInt32(positiveQuotes.count)))]
            println("positiveQuote")
        }else{
            quote = negativeQuotes[Int(arc4random_uniform(UInt32(negativeQuotes.count)))]
            println("negativeQuote")
        }
        quotationTextView.text = quote
    }
}

