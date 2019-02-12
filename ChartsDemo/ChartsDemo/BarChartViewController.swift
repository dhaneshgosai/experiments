//
//  BarChartViewController.swift
//  TestSwift
//
//  Created by Amit Bhonsle on 20/06/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import Charts
import SDWebImage

class BarChartViewController: UIViewController {

    //Varibales
    @IBOutlet weak var barChartView: BarChartView!
    var months =  [String]()
    
    @IBAction func goToTest(_ sender: UISegmentedControl) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Bar Chart"
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]

        barChartView.noDataText = "Data will load soon..."
        barChartView.xAxis.labelCount = months.count
        barChartView.setBarChartData(xValues: months, yValues: unitsSold, label: "Monthly Sales")
        barChartView.leftAxis.labelFont = UIFont.systemFont(ofSize: 8.0, weight: UIFont.Weight.regular)
        barChartView.leftAxis.labelTextColor = .orange
        self.setUpGraph()
//        self.setGraphData()
    }
    
    func setUpGraph() {
        self.barChartView.chartDescription?.enabled = false
        self.barChartView.drawGridBackgroundEnabled = false
        self.barChartView.drawBordersEnabled = false
        self.barChartView.dragEnabled = false;
        self.barChartView.setScaleEnabled(true)
        self.barChartView.pinchZoomEnabled = false
//        self.barChartView.minOffset = 0
        self.barChartView.animate(yAxisDuration: 1.0)
        
//        self.barChartView.xAxis.enabled = false
//        self.barChartView.leftAxis.enabled = false
//        self.barChartView.leftAxis.inverted = true
//        self.barChartView.rightAxis.inverted = true
//        self.barChartView.rightAxis.enabled = false
//        self.barChartView.legend.enabled = false
        
//        self.barChartView.xAxis.drawAxisLineEnabled = false
//        self.barChartView.leftAxis.drawAxisLineEnabled = false
//        self.barChartView.rightAxis.drawAxisLineEnabled = false
//
//        self.barChartView.xAxis.drawGridLinesEnabled = false
//        self.barChartView.leftAxis.drawGridLinesEnabled = false
//        self.barChartView.rightAxis.drawGridLinesEnabled = false
//
//        self.barChartView.xAxis.drawLabelsEnabled = false
//        self.barChartView.xAxis.drawLabelsEnabled = false
//        self.barChartView.leftAxis.drawLabelsEnabled = false
//        self.barChartView.rightAxis.drawLabelsEnabled = false
//
//        self.barChartView.xAxis.drawAxisLineEnabled
        
//        self.barChartView.leftAxis.xOffset = 0.0
        self.barChartView.xAxis.yOffset = 0.0
        self.barChartView.highlightPerTapEnabled = false
        
        let marker:BalloonMarker = BalloonMarker(color: UIColor(red: 93/255, green: 186/255, blue: 215/255, alpha: 1), font: UIFont(name: "Helvetica", size: 12)!, textColor: UIColor.white, insets: UIEdgeInsets(top: 7.0, left: 7.0, bottom: 25.0, right: 7.0))
        marker.minimumSize = CGSize(width: 75.0, height: 35.0)//CGSize(75.0, 35.0)
        self.barChartView.marker = marker
        
        
        let longPressgesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressDetected(gesture:)))
        longPressgesture.allowableMovement = 50
        self.barChartView.addGestureRecognizer(longPressgesture)
    }
    
    @objc func longPressDetected(gesture: UILongPressGestureRecognizer) {
        
        
        switch gesture.state {
            case .began:
                print("Began State")
            case .changed:
                print("Changed State")
            case .ended:
                print("Ended State")
            case .cancelled:
                print("Canclled State")
            default:
                print("No State")
        }
        if gesture.state == .ended {
            let point = gesture.location(in: self.barChartView)
            let h = self.barChartView.getHighlightByTouchPoint(point)
            self.barChartView.highlightValue(x: (h?.x)!, dataSetIndex: (h?.dataSetIndex)!, stackIndex: (h?.stackIndex)!)
        }
        
    }
    
    
    func setGraphData() {
        var yVals:Array<BarChartDataEntry> = Array<BarChartDataEntry>()
        
        yVals.append(BarChartDataEntry(x: 0, y: 10))
        yVals.append(BarChartDataEntry(x: 1, y: 5))
        yVals.append(BarChartDataEntry(x: 2, y: 30))
        yVals.append(BarChartDataEntry(x: 3, y: 10))
        yVals.append(BarChartDataEntry(x: 4, y: 50))
        yVals.append(BarChartDataEntry(x: 5, y: 15))
        yVals.append(BarChartDataEntry(x: 6, y: 70))
        yVals.append(BarChartDataEntry(x: 7, y: 20))
        yVals.append(BarChartDataEntry(x: 8, y: 90))
        yVals.append(BarChartDataEntry(x: 9, y: 25))
        yVals.append(BarChartDataEntry(x: 10, y: 110))
        yVals.append(BarChartDataEntry(x: 11, y: 30))
        yVals.append(BarChartDataEntry(x: 12, y: 130))
        yVals.append(BarChartDataEntry(x: 13, y: 35))
        yVals.append(BarChartDataEntry(x: 14, y: 150))
        yVals.append(BarChartDataEntry(x: 15, y: 40))
        yVals.append(BarChartDataEntry(x: 16, y: 170))
        yVals.append(BarChartDataEntry(x: 17, y: 50))
        yVals.append(BarChartDataEntry(x: 18, y: 190))
        
        let barChartDataSet = BarChartDataSet(values: yVals, label: "")
//        barChartDataSet.colors = [UIColor.violetBlue]
        
        let barChartData = BarChartData(dataSet: barChartDataSet)
//        barChartData.barWidth = 0.4
        barChartData.setDrawValues(false)
        
        self.barChartView.data = barChartData
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
        
        barChartView.data = chartData
    
        
    }

}

extension BarChartView {
    
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
    
    func setBarChartData(xValues: [String], yValues: [Double], label: String) {
        
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
        
//        chartData.barWidth = Double(1.0)
        
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
