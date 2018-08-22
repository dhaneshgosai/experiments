//
//  HoriBarChartViewController.swift
//  TestSwift
//
//  Created by Sheshnath on 07/03/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import Charts

class HoriBarChartViewController: UIViewController {
    
    //Varibales
    @IBOutlet weak var horiBarChartView: HorizontalBarChartView!
    var months =  [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Horizontal Bar Chart"
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        
        horiBarChartView.noDataText = "Data will load soon..."
//        horiBarChartView.xAxis.labelCount = months.count
        setBarChartData(xValues: months, yValues: unitsSold, label: "Monthly Sales")
        horiBarChartView.leftAxis.labelFont = UIFont.systemFont(ofSize: 8.0, weight: UIFont.Weight.regular)
        horiBarChartView.backgroundColor = .white
//        horiBarChartView.extraTopOffset = 10
        horiBarChartView.xAxis.labelTextColor = .blue
        horiBarChartView.xAxis.labelPosition = .topInside
//        horiBarChartView.leftAxis.labelTextColor = .orange
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
    
    func setBarChartData(xValues: [String], yValues: [Double], label: String) {
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<yValues.count {
            //            let dataEntry = BarChartDataEntry(x: Double(i), y: yValues[i])
            let dataEntry = BarChartDataEntry(x:yValues[i],y:Double(i))
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: label)
        let chartData = BarChartData(dataSets: [chartDataSet])
        
        horiBarChartView.data = chartData
        
    }

}

extension HorizontalBarChartView {
    
    private class BarChartFormatter: NSObject, IAxisValueFormatter {
        
        var labels: [String] = []
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            return labels[Int(value)]
        }
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    }
    
//    func setBarChartData(xValues: [String], yValues: [Double], label: String) {
//        
//        var dataEntries: [BarChartDataEntry] = []
//        
//        for i in 0..<yValues.count {
//            let dataEntry = BarChartDataEntry(x: Double(i), y: yValues[i])
//            dataEntries.append(dataEntry)
//        }
//        
//        let chartDataSet = BarChartDataSet(values: dataEntries, label: label)
//        let chartData = BarChartData(dataSets: [chartDataSet])
//        
//        let chartFormatter = BarChartFormatter(labels: xValues)
//        let xAxis = XAxis()
//        xAxis.valueFormatter = chartFormatter
//        self.xAxis.valueFormatter = xAxis.valueFormatter
//        
//        chartData.barWidth = Double(0.1)
//        
//        //        //Setup for GroupBars
//        //        let groupSpace = 0.12 as Double
//        //        let barSpace = 0.21 as Double
//        //        let barWidth = 0.01 as Double
//        //        // (0.3 + 0.05) * 2 + 0.3 = 1.00 -> interval per "group"
//        //        // (0.25 + 0.02) * 3 + 0.19 = 1.00 -> interval per "group"
//        //        // (0.28 + 0.04) * 3 + 0.04 = 1.00 -> interval per "group"
//        //        // (baSpace + barWidth) * dataSet count + groupSpace = 1.0
//        //
//        //        let groupCount = 1 as Double
//        //        let startYear = 0 as Double
//        //
//        //        chartData.barWidth = barWidth
//        //        self.xAxis.axisMinimum = startYear
//        //        chartData.groupBars(fromX: 0, groupSpace: groupSpace, barSpace: barSpace)
//        //
//        //
//        //        let groupWidth = chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
//        //        self.xAxis.axisMaximum = startYear + groupWidth * groupCount
//        
//        
//        self.data = chartData
//        
//    }
}
