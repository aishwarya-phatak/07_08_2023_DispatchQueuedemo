//
//  ViewController.swift
//  07_08_2023_DispatchQueuedemo
//
//  Created by Vishal Jagtap on 25/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        concurrentQueueExecutionAsync()
//        concurrentQueueExecution()
//        concurrentQueue()
        //serialQueue()
    }
    
    func serialQueue(){
        let serialQueue1 = DispatchQueue(label: "serialQueue1")
        serialQueue1.sync {
            for _ in 1...1000000{
                print("Inside Serial Queue inside for loop sync mode\(Thread.current) -- \(Thread.current.isMainThread)")
            }
            
            print("Inside Serial Queue but outside for loop \(Thread.current)")
            print(Thread.current.isMainThread)
        }
        
        DispatchQueue.main.async {
            print("main - async mode \(Thread.current)")
        }
        
        print("Outside the serial queue \(Thread.current.isMainThread)")
    }
    
    func concurrentQueue(){
       let c1 = DispatchQueue(label: "concurrent1", attributes: .concurrent)
        c1.sync {
            for _ in 1...100{
                print("Inside concurrent queue and for loop \(Thread.current)")
            }
            print("Inside c1 but outside for loop\(Thread.current)")
        }
        
        c1.async {
            print("Inside async mode -- 1\(Thread.current)")
            print("Task 2\(Thread.current)")
        }
        
        c1.async {
            print("Inside aync -- 2\(Thread.current)")
        }
        print("Outside c1\(Thread.current)")
    }
    
    func concurrentQueueExecution(){
       let concurrentQueue2 = DispatchQueue(label: "concurrentQueue2", attributes: .concurrent)
        concurrentQueue2.sync {
            print("Pallavi mam has enquiry \(Thread.current) -- \(Thread.isMainThread) -- \(Thread.threadPriority())")
            for _ in 1...100{
                print("Pallavi mam is attending an enquiry \(Thread.current)")
            }
            print("Pallavi mam finished attending the enquiry \(Thread.current) -- \(Thread.current.threadPriority)")
        }
        print("Pallavi mam is assigning some tasks to Sachin \(Thread.current) -- \(Thread.current.threadPriority)")
        
        DispatchQueue.main.async {
            print("Pallavi mam talking with iOS Batch Students \(Thread.current) -- \(Thread.current.threadPriority)")
        }
    }
    
    func concurrentQueueExecutionAsync(){
       let concurrentQueue3 = DispatchQueue(label: "concurrentQueue3", attributes: .concurrent)
        concurrentQueue3.async {
            print("Pallavi mam has enquiry \(Thread.current) -- \(Thread.isMainThread) -- \(Thread.threadPriority())")
            for _ in 1...100{
                print("Pallavi mam is attending an enquiry \(Thread.current)")
            }
            print("Pallavi mam finished attending the enquiry \(Thread.current) -- \(Thread.current.threadPriority)")
        }
        
        concurrentQueue3.async {
            print("Pallavi mam has meeting with faculty")
        }
        print("Pallavi mam is assigning some tasks to Sachin \(Thread.current) -- \(Thread.current.threadPriority)")
        
        DispatchQueue.main.async {
            print("Pallavi mam talking with iOS Batch Students \(Thread.current) -- \(Thread.current.threadPriority)")
        }
    }
    
//    func serialQueueExecution(){
//
//    }
}
