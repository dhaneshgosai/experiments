//
//  CombineChartViewController.swift
//  TestSwift
//
//  Created by Amit Bhonsle on 07/07/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import Charts

class CombineChartViewController: UIViewController {

    @IBOutlet weak var combineChart: CombinedChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Combine Chart"
        
        self.combineChart.setCombineChartData()
        self.combineChart.xAxis.granularity = 1.0
        self.combineChart.xAxis.labelPosition = .bottom
        self.combineChart.chartDescription?.enabled = false
        // Do any additional setup after loading the view.
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

extension CombinedChartView {
    
    func setCombineChartData() {
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        var unitsSold = [1.0, 2.0, 3.0, 5.0, 8.0, 12.0, 17.0, 23.0, 30.0, 38.0, 47.0, 57.0]
        let lineChartData = self.setLineChartData(xValues: months, yValues: unitsSold, label: "Monthly Sale")
        
        unitsSold = [5.0, 10.0, 15.0, 20.0, 25.0, 35.0, 30.0, 25.0, 20.0, 15.0, 10.0, 5.0]
        let barChartData = self.setBarChartData(xValues: months, yValues: unitsSold, label: "Monthly Purchase")
        
        let combineChartData = CombinedChartData()
        combineChartData.barData = barChartData
        combineChartData.lineData = lineChartData
        
        self.data = combineChartData
        
    }
    
    func setLineChartData(xValues: [String], yValues: [Double], label: String) -> LineChartData {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<yValues.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: yValues[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(values: dataEntries, label: label)
        let lineChartData = LineChartData(dataSet: chartDataSet)
        chartDataSet.highlightEnabled = true
        chartDataSet.drawHorizontalHighlightIndicatorEnabled = false
        chartDataSet.highlightColor = .blue
        chartDataSet.highlightLineWidth = 1
        chartDataSet.mode = .horizontalBezier
        chartDataSet.circleColors = Array(repeating: .blue, count: 12)
        chartDataSet.fillColor = .blue
        chartDataSet.drawCircleHoleEnabled = false
        chartDataSet.drawFilledEnabled = true
        chartDataSet.lineWidth = 0.0
        chartDataSet.drawValuesEnabled = true
        chartDataSet.axisDependency = .left
        
        return lineChartData
        
    }
    
    func setBarChartData(xValues: [String], yValues: [Double], label: String) -> BarChartData {
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<yValues.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: yValues[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: label)
        chartDataSet.colors = Array(repeating: .orange , count: 1)
        let barChartData = BarChartData(dataSets: [chartDataSet])
        
        return barChartData
    }
    
    
}
