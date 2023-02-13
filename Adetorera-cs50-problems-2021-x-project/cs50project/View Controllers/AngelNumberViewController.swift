

//
//  AngelNumberViewController.swift
//  cs50project
//
//  Created by Adetorera Marcus on 30/10/2021.
//

import UIKit

class AngelNumberViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    
    let angelNumbers = [
        "11:11 : it means you have loads of power and energy to manifest and create now.Your manifestation will come lightning fast.Whether you’re thinking something positive or negative, you will manifest more of that very thing into your life.",
        "111 : means that every effort you’re putting into manifesting has been seen, received and your desire is on its way to you, now.",
        "222 : it is a reminder to focus on bringing joy, playfulness, and feelings of love in all that you do.",
        "333 : you need more balance in your life.Positive shifts are happening in your life.333 is particularly good if you are dealing with your twin flame.",
        "444 : take it as an acknowledgment of your feelings and thoughts. You are supported, you are heard, and you are loved.",
        "555 : Whatever you’ve been used to or have come to expect on your manifestation journey – it’s about to change.",
        "666 : It just means you’ve been paying too much attention to material desires or pleasures of the flesh lately and could stand to dial it back a bit!",
        "777 : If you’ve been doing the work on spiritual and physical levels, taking care of your personal responsibilities and trusting in the Universe and yourself, you can let your hair down and relax a little bit, now. The results of all your efforts are working together swimmingly, and good luck is coming your way.",
        "888 :  it is a reminder that you are an infinite being. is also a strong sign of abundance. Even if it doesn’t seem like it right now, your angels want you to know that the world is infinitely open to you.Whether it’s money, love, happiness, success — anything is available to you if you never give up.Keep going no matter what and never limit yourself to anything.",
        "999 : think about any projects, big dreams or goals that you’ve been working on manifesting. You are nearing completion of this goal and it will soon be time to move on. If you are a perfectionist and require things to be just so – let that go.",
        "1212 : symbolizes your spiritual awakening in life and a great sign that you're on your way towards your luck for love. When you see these numbers, think of some sense to stay positive and continue leading the right track and purpose in life",
        "000 :  The number 000 itself represents infinite oneness, eternity.",
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
   
  
}

extension AngelNumberViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped")
    }
}

extension AngelNumberViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return angelNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath)
        
        cell.textLabel?.text = angelNumbers[indexPath.row]
        
        return cell
    }
    
}
