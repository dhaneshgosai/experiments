//
//  ViewController.swift
//  TestSwift
//
//  Created by Amit Bhonsle on 22/05/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var chartsTypes: [String] = ["Line Chart", "Bar Chart", "Combine Chart", "Donut Chart", "Horizontal Bar Chart","Group Bar Chart","Stacked Bar Chart","Line Chart(Obj-C)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chartsTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ChartTypeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = chartsTypes[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "LineChartSegue", sender: nil)
            break
        case 1:
            self.performSegue(withIdentifier: "BarChartSegue", sender: nil)
            break
        case 2:
            self.performSegue(withIdentifier: "CombineChartSegeu", sender: nil)
            break
        case 3:
            self.performSegue(withIdentifier: "DonutChartSegue", sender: nil)
            break
        case 4:
            self.performSegue(withIdentifier: "HoriBarChartSegue", sender: nil)
            break
        case 5:
            self.performSegue(withIdentifier: "GroupBarChartSegeu", sender: nil)
            break
        case 6:
            self.performSegue(withIdentifier: "StackedBarChartSegeu", sender: nil)
            break
        case 7:
            self.performSegue(withIdentifier: "LineChartObjCSegeu", sender: nil)
            break
        default:
            break
        }
        
    }

}

