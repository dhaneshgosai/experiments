//
//  GroupBarChartViewController.swift
//  TestSwift
//
//  Created by Sheshnath on 09/07/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import Charts

class GroupBarChartViewController: UIViewController {

    @IBOutlet weak var stackedBarChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        stackedBarChartView.description = ""
        stackedBarChartView.xAxis.labelPosition = .bottom
        setChart()
        // Do any additional setup after loading the view.
    }
    
    func setChart(){
        let months = ["Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun"]
        let points = [20.0, 4.0, 3.0, 6.0, 12.0, 16.0, 4.0]
        let scans = [2.0, 4.0, 3.0, 6.0, 2.0, 4.0, 2.0]
        stackedBarChartView.setBarChartData(xValues: months, yValues1: scans, yValues2: points)
        stackedBarChartView.drawMarkers = true
        let marker:BalloonMarker = BalloonMarker(color: .red, font: UIFont(name: "Helvetica", size: 12)!, textColor: .white, insets: UIEdgeInsets(top: 7.0, left: 7.0, bottom: 7.0, right: 7.0))
        marker.minimumSize = CGSize(width:75.0, height:35.0)
        stackedBarChartView.marker = marker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BarChartView {
    
    func setBarChartData(xValues: [String], yValues1: [Double], yValues2 : [Double]) {
        
        var dataEntries1: [BarChartDataEntry] = []
        for i in 0..<yValues1.count {
            let dataEntry1 = BarChartDataEntry(x: Double(i), yValues: [yValues1[i], yValues2[i]])
            dataEntries1.append(dataEntry1)
        }
        
        let chartDataSet1 = BarChartDataSet(values: dataEntries1, label: "Points")
        chartDataSet1.barBorderColor = .red
        chartDataSet1.stackLabels = ["Points", "Scans"]
        chartDataSet1.colors =  [UIColor.darkGray, UIColor.lightGray]
        
        
        let chartData = BarChartData(dataSets: [chartDataSet1])
    
        
//        let chartFormatter = BarChartFormatter(labels: xValues)
//        let xAxis = XAxis()
//        xAxis.valueFormatter = chartFormatter
//        self.xAxis.valueFormatter = xAxis.valueFormatter
        self.data = chartData
    }
}
