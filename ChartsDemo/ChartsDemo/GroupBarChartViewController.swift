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

    @IBOutlet weak var groupBarChartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Group Bar Chart"
        
//        groupBarChartView.description = ""
        groupBarChartView.xAxis.labelPosition = .bottom
        setChart()
        // Do any additional setup after loading the view.
    }
    
    func setChart(){
        let months = ["Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun"]
        let points = [20.0, 4.0, 3.0, 6.0, 12.0, 16.0, 4.0]
        let scans = [2.0, 4.0, 3.0, 6.0, 2.0, 4.0, 2.0]
        groupBarChartView.setGroupBarChartData(xValues: months, yValues1: scans, yValues2: points)
        groupBarChartView.drawMarkers = true
        groupBarChartView.xAxis.labelCount = months.count
        groupBarChartView.xAxis.granularity = 1
        groupBarChartView.xAxis.granularityEnabled = true
//        self.xAxis.avoidFirstLastClippingEnabled = true
        
        let marker:BalloonMarker = BalloonMarker(color: .red, font: UIFont(name: "Helvetica", size: 12)!, textColor: .white, insets: UIEdgeInsets(top: 7.0, left: 7.0, bottom: 7.0, right: 7.0))
        marker.minimumSize = CGSize(width:75.0, height:35.0)
        groupBarChartView.marker = marker
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
    
    private class GroupBarChartFormatter: NSObject, IAxisValueFormatter {
        
        var labels: [String] = []
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            if Int(value) < labels.count {
                return labels[Int(value)]
            }else{
                return String("")
            }
        }
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    }
    
    func setGroupBarChartData(xValues: [String], yValues1: [Double], yValues2 : [Double]) {
        
        var dataEntries1: [BarChartDataEntry] = []
        var dataEntries2: [BarChartDataEntry] = []
        for i in 0..<xValues.count {
            let dataEntry1 = BarChartDataEntry(x: Double(i), y:yValues1[i])
            dataEntries1.append(dataEntry1)
            let dataEntry2 = BarChartDataEntry(x: Double(i), y:yValues2[i])
            dataEntries2.append(dataEntry2)
            
        }
        
        let chartDataSet1 = BarChartDataSet(values: dataEntries1, label: "Points")
        chartDataSet1.colors =  [UIColor.orange]
        let chartDataSet2 = BarChartDataSet(values: dataEntries2, label: "Scans")
        chartDataSet2.colors =  [UIColor.purple]
        
        let chartData = BarChartData(dataSets: [chartDataSet1,chartDataSet2])
        
        let groupSpace = 0.3
        let barSpace = 0.05
        let barWidth = 0.3
        // (0.3 + 0.05) * 2 + 0.3 = 1.00 -> interval per "group"
        
        let groupCount = xValues.count - 1
        let startYear = 0
        
        
        chartData.barWidth = barWidth;
        
        self.xAxis.axisMinimum = Double(startYear)
        let gg = chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        print("Groupspace: \(gg)")
        self.xAxis.axisMaximum = Double(startYear) + gg * Double(groupCount)
        
        chartData.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)
        
        
    
        
        let chartFormatter = GroupBarChartFormatter(labels: xValues)
        let xAxis = XAxis()
        xAxis.valueFormatter = chartFormatter
        self.xAxis.valueFormatter = xAxis.valueFormatter
        self.data = chartData
    }
}
