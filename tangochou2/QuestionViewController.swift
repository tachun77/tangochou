//
//  xQuestionViewController.swift
//  tangochou2
//
//  Created by 福島達也 on 2016/06/09.
//  Copyright © 2016年 福島達也. All rights reserved.
// 

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton : UIButton!
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var answerLabel : UILabel!
    
    var isAnswered : Bool = false
    var wordArray : [AnyObject] = []
    var shuffledWordArray : [AnyObject] = []
    var nowNumber : Int = 0
    
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = ""
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool){
        wordArray = saveData.arrayForKey("WORD")!
        
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
    }

    @IBAction func nextbuttonPushed(){
        if isAnswered{
            
            nowNumber++
            answerLabel.text = ""
            
            if nowNumber < shuffledWordArray.count {
                questionLabel.text = shuffledWordArray[nowNumber]["english"] as? String
                isAnswered = false
                
                nextButton .setTitle("答えを表示", forState : UIControlState.Normal)
            }else{
                self.performSegueWithIdentifier("toFinishView", sender : nil)
            }
        }else{
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"] as? String
            isAnswered = true
            nextButton.setTitle("次へ", forState : UIControlState.Normal)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

func shuffle(){
    while wordArray.count > 0{
        let index = Int(rand()) % wordArray.count
        shuffledWordArray.append(wordArray[index])
        wordArray.removeAtIndex(index)
        
        }
    }
}
