//
//  ViewController.swift
//  ProjectEuler
//
//  Created by Ростислав Ермаченков on 25.12.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [TaskPresentable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTasksArray()
        

        // Do any additional setup after loading the view.
    }
    
    func setupTasksArray() {
        tasks.append(Task1())
        tasks.append(Task2())
        tasks.append(Task4())
        //tasks.append(Task5())
        tasks.append(Task6())
        tasks.append(Task7())
        
        tasks.sort { $0.name < $1.name }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        cell.nameLabel.text = "\(tasks[indexPath.row].name)"
        cell.answerLabel.text = "\(tasks[indexPath.row].answer)"
        
        return cell
    }


}

