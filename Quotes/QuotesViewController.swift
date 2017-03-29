//
//  QuotesViewController.swift
//  Quotes
//
//  Created by shaochang on 15/12/24.
//  Copyright © 2015年 shaochang. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
    // MARK: Properties
    
    @IBOutlet var textLabel: NSTextField!
    let quotes = Quote.all
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        
        currentQuoteIndex = 0
    }
    
    func updateQuote() {
        textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
// MARK: Actions

extension QuotesViewController {
    @IBAction func goLeft(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    
    @IBAction func goRight(_ sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }
    
    @IBAction func quit(_ sender: NSButton) {
        NSApplication.shared().terminate(sender)
    }
}
