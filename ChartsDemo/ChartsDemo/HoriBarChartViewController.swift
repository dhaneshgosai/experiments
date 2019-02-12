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
    var unitsSold = [Double]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Horizontal Bar Chart"
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        unitsSold = [106167.0, 533647.0, 340356.0, 27000.0, 0.0, 321784.0, 45706.0, 0.0, 2.0, 4.0, 5.0, 4.0]
        print("Max Val",unitsSold.max())
        
        horiBarChartView.noDataText = "Data will load soon..."
        horiBarChartView.xAxis.labelCount = months.count
        horiBarChartView.setHorizontalBarChartData(xValues: months, yValues: unitsSold, label: "Monthly Sales")
        horiBarChartView.leftAxis.labelFont = UIFont.systemFont(ofSize: 8.0, weight: UIFont.Weight.regular)
        horiBarChartView.xAxis.labelTextColor = .blue
        horiBarChartView.xAxis.labelPosition = .bottom
        horiBarChartView.drawValueAboveBarEnabled = false
        horiBarChartView.leftAxis.yOffset = 5.0
        horiBarChartView.leftAxis.axisMinimum = 0
        horiBarChartView.leftAxis.granularityEnabled = true
        horiBarChartView.leftAxis.granularity = 1.0
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    private class BarChartValueFormatter: NSObject, IValueFormatter {
        
        func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
            if (value > 0.0){
                return String(value) + "K"
            }else {
                return "0"
            }
        }
    }
    
    func setHorizontalBarChartData(xValues: [String], yValues: [Double], label: String) {
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<yValues.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: yValues[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: label)
        
        let chartData = BarChartData(dataSets: [chartDataSet])
        
        let chartFormatter = BarChartFormatter(labels: xValues)
        let xAxis = XAxis()
        xAxis.valueFormatter = chartFormatter
        self.xAxis.valueFormatter = xAxis.valueFormatter
        
        chartDataSet.valueFormatter = BarChartValueFormatter()
        
//        chartData.barWidth = Double(0.1)
        
        //        //Setup for GroupBars
        //        let groupSpace = 0.12 as Double
        //        let barSpace = 0.21 as Double
        //        let barWidth = 0.01 as Double
        //        // (0.3 + 0.05) * 2 + 0.3 = 1.00 -> interval per "group"
        //        // (0.25 + 0.02) * 3 + 0.19 = 1.00 -> interval per "group"
        //        // (0.28 + 0.04) * 3 + 0.04 = 1.00 -> interval per "group"
        //        // (baSpace + barWidth) * dataSet count + groupSpace = 1.0
        //
        //        let groupCount = 1 as Double
        //        let startYear = 0 as Double
        //
        //        chartData.barWidth = barWidth
        //        self.xAxis.axisMinimum = startYear
        //        chartData.groupBars(fromX: 0, groupSpace: groupSpace, barSpace: barSpace)
        //
        //
        //        let groupWidth = chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        //        self.xAxis.axisMaximum = startYear + groupWidth * groupCount
        
        
        self.data = chartData
        
    }
}
