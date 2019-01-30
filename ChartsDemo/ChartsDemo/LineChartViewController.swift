//
//  LineChartViewController.swift
//  TestSwift
//
//  Created by Amit Bhonsle on 20/06/17.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import Charts

class LineChartViewController: UIViewController {
    
    
    //Varibales
    @IBOutlet weak var lineChartView: LineChartView!
    var months: [String]!
    var unitsSold:[Double]!
    var unitsSold1:[Double]!
    var unitsSold2:[Double]!
    var swims: [Array<Any>]!
    
    

    @IBOutlet weak var lineSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Line Chart"
        // Do any additional setup after loading the view.
        
        swims = [["Dec 1,2017",241.1],["Feb 4,2018",237.23],["Feb 21,2018",233.1],["Mar 23,2018",222.1],["Apr 1,2018",240.23],["Apr 15,2018",199.34]]
        
//        let xVal = swims.map { $0 }
//        let yVal = swims.map { $0 }
        

        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        unitsSold = [26.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        unitsSold1 = [10.0, 14.0, 26.0, 23.0, 2.0, 6.0, 24.0, 1.0, 22.0, 14.0, 25.0, 14.0]
        unitsSold2 = [6.0, 24.0, 16.0, 13.0, 22.0, 26.0, 14.0, 8.0, 12.0, 24.0, 15.0, 24.0]
//        let unitsSold = [121.0,85.0,104.0,113.0,212.0,1.0]
        
        let colors = [UIColor.red,UIColor.green,UIColor.blue]
        lineChartView.delegate = self
        lineChartView.noDataText = "Data will load soon..."
        lineChartView.xAxis.labelCount = swims.count
        lineChartView.leftAxis.labelCount = swims.count
        lineChartView.setLineChartData(xValues: months,
                                       labels: ["Monthly Sales","Quarterly Sales","Yearly Sales"],
                                       dataSets: [unitsSold,unitsSold1,unitsSold2],
                                       colors: colors)
        lineChartView.xAxis.labelFont = UIFont.systemFont(ofSize: 8.0, weight: UIFont.Weight.bold)
        lineChartView.xAxis.labelTextColor = .orange
        lineChartView.xAxis.granularity = 1
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.drawBordersEnabled = true
        lineChartView.leftAxis.drawTopYLabelEntryEnabled = true
//        lineChartView.leftAxis.forceLabelsEnabled = true
        lineChartView.leftAxis.drawZeroLineEnabled = true
        lineChartView.setVisibleYRangeMaximum(300, axis: .left)
        lineChartView.leftAxis.xOffset = 20.0
        lineChartView.xAxis.yOffset = 20.0
        
        lineChartView.leftAxis.labelPosition = .insideChart
        lineChartView.rightAxis.labelPosition = .insideChart
        
        
        
//        lineChartView.setViewPortOffsets(left: 10, top: 10, right: 10, bottom: 10)
        
//        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
//        let globalQueue = DispatchQueue.global()
//
//        let additionalTime: DispatchTimeInterval = .seconds(10)
//
//        globalQueue.asyncAfter(deadline: .now() + additionalTime) {
//            self.months = ["Jan1", "Feb1", "Mar1", "Apr1", "May1", "Jun1"]
//            let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
//            DispatchQueue.main.async {
//                self.lineChartView.setLineChartData(xValues: self.months, yValues: unitsSold, label: "Monthly Sales1")
//            }
//
//        }
        
//        DispatchQueue.global().async {
//
//        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnConvertToPDFClick(_ sender: Any) {
        createPdfFromView(aView: lineChartView, saveToDocumentsWithFileName: "LineChartPDF.pdf")
    }
    
    func createPdfFromView(aView: UIView, saveToDocumentsWithFileName fileName: String)
    {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, aView.bounds, nil)
        UIGraphicsBeginPDFPage()
        
        guard let pdfContext = UIGraphicsGetCurrentContext() else { return }
        
        aView.layer.render(in: pdfContext)
        UIGraphicsEndPDFContext()
        
        if let documentDirectories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            let documentsFileName = documentDirectories + "/" + fileName
            debugPrint(documentsFileName)
            pdfData.write(toFile: documentsFileName, atomically: true)
        }
    }
    @IBAction func segmentValueChanged(_ sender: Any) {
        
        switch self.lineSegment.selectedSegmentIndex {
        case 0:
            let colors = [UIColor.red,UIColor.green,UIColor.blue]
            lineChartView.setLineChartData(xValues: months,
                                           labels: ["Monthly Sales","Quarterly Sales","Yearly Sales"],
                                           dataSets: [unitsSold,unitsSold1,unitsSold2],
                                           colors: colors)
            break
        case 1:
            lineChartView.setLineChartData(xValues: months,
                                           labels: ["Monthly Sales"],
                                           dataSets: [unitsSold],
                                           colors: [UIColor.red])
            break
        case 2:
            lineChartView.setLineChartData(xValues: months,
                                           labels: ["Quarterly Sales"],
                                           dataSets: [unitsSold1],
                                           colors: [UIColor.green])
            break
        case 3:
            lineChartView.setLineChartData(xValues: months,
                                           labels: ["Yearly Sales"],
                                           dataSets: [unitsSold2],
                                           colors: [UIColor.blue])
            break
            
        default:
            break
        }
        
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

extension LineChartView {
    
    private class LineChartFormatter: NSObject, IAxisValueFormatter {
        
        var labels: [String] = []
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            return labels[Int(value)]
        }
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    }
    
//    func setLineChartData(xValues: [String], yValues: [Double], label: String, otherVal: [Array<Any>],dataSets:[Array<Double>]) {
//
//
//        var dataSetsArray: [LineChartDataSet] = []
//        let dataSetCount = self.lineData?.dataSets.count
//        if dataSetCount != nil && dataSetCount! > 0 {
//           self.data = nil
//        }
//
//        for yVals in dataSets {
//
//            var dataEntries: [ChartDataEntry] = []
//
////            for i in 0..<otherVal.count {
////                let yVal = otherVal[i]
////                let dataEntry = ChartDataEntry(x: Double(i), y: yVal[1] as! Double)
////                dataEntries.append(dataEntry)
////            }
//
//            for i in 0..<yVals.count {
//                let dataEntry = ChartDataEntry(x: Double(i), y: yVals[i])
//                dataEntries.append(dataEntry)
//            }
//
//            let chartDataSet = LineChartDataSet(values: dataEntries, label: label)
//
//            chartDataSet.highlightEnabled = true
//            chartDataSet.drawHorizontalHighlightIndicatorEnabled = false
//            chartDataSet.highlightColor = .blue
//            chartDataSet.highlightLineWidth = 1
//            chartDataSet.mode = .horizontalBezier
//            chartDataSet.circleColors = Array(repeating: .blue, count: 12)
//            chartDataSet.colors = [UIColor(red: 0.192, green: 0.686, blue: 0.980, alpha: 1.00), UIColor(red: 0.212, green: 0.863, blue: 0.318, alpha: 1.00), UIColor(red: 0.996, green: 0.867, blue: 0.275, alpha: 1.00), UIColor(red: 0.980, green: 0.090, blue: 0.157, alpha: 1.00)]
//            //        chartDataSet.gradientPositions = [35.0, 36.6, 38.0, 40.0]
//            chartDataSet.drawCircleHoleEnabled = false
//            //        chartDataSet.drawFilledEnabled = true
//            chartDataSet.lineWidth = 3.0
//            chartDataSet.drawValuesEnabled = true
//            chartDataSet.axisDependency = .left
//            //        chartDataSet.setDrawHighlightIndicators(true)
//            chartDataSet.valueFormatter = self as? IValueFormatter
//            chartDataSet.valueColors = [UIColor(red: 0.192, green: 0.686, blue: 0.980, alpha: 1.00),
//                                        UIColor(red: 0.212, green: 0.863, blue: 0.318, alpha: 1.00),
//                                        UIColor(red: 0.996, green: 0.867, blue: 0.275, alpha: 1.00),
//                                        UIColor(red: 0.980, green: 0.090, blue: 0.157, alpha: 1.00)]
//
//            dataSetsArray.append(chartDataSet)
//
//        }
//
//
//
//
////        var idArray = [String]()
////        for employee in otherVal {
////            idArray.append(employee[0] as! String)
////        }
////        let chartFormatter = LineChartFormatter(labels: idArray)
////        let xAxis = XAxis()
////        xAxis.valueFormatter = chartFormatter
////        self.xAxis.valueFormatter = xAxis.valueFormatter
//
//        let chartData = LineChartData(dataSets: dataSetsArray)
//        self.data = chartData
//
//        self.animate(xAxisDuration: 5.0,easingOption: .easeInExpo)
//
//
//    }
    
    func setLineChartData(xValues: [String], labels: [String],dataSets:[Array<Double>],colors:[UIColor]) {
        
        var dataSetsArray: [LineChartDataSet] = []
        let dataSetCount = self.lineData?.dataSets.count
        if dataSetCount != nil && dataSetCount! > 0 {
            self.data = nil
        }
        
        for i in 0..<dataSets.count {
            let yVals = dataSets[i]
            var dataEntries: [ChartDataEntry] = []
            
            for i in 0..<yVals.count {
                let dataEntry = ChartDataEntry(x: Double(i), y: yVals[i])
                dataEntries.append(dataEntry)
            }
            
            let chartDataSet = LineChartDataSet(values: dataEntries, label: labels[i])
            chartDataSet.highlightEnabled = true
            chartDataSet.drawHorizontalHighlightIndicatorEnabled = false
            chartDataSet.highlightColor = .blue
            chartDataSet.highlightLineWidth = 1
            chartDataSet.lineWidth = 3.0
            chartDataSet.mode = .horizontalBezier
            chartDataSet.drawCircleHoleEnabled = true
            chartDataSet.drawValuesEnabled = true
            chartDataSet.axisDependency = .left
            chartDataSet.circleHoleColor = colors[i]
            chartDataSet.highlightColor = colors[i]
            chartDataSet.colors = [colors[i]]
            
            
            if(i == 0){
                let gradientColors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor] as CFArray // Colors of the gradient
                let colorLocations:[CGFloat] = [1.0, 0.5, 0.0] // Positioning of the gradient
                let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) // Gradient Object
                chartDataSet.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0) // Set the Gradient
                chartDataSet.drawFilledEnabled = true // Draw the Gradient
            }
            
            //Add Data Set Into Sets array
            dataSetsArray.append(chartDataSet)
            
            
            
        }
        
        let chartData = LineChartData(dataSets: dataSetsArray)
        self.data = chartData
        self.animate(xAxisDuration: 1.0,easingOption: .easeInExpo)
        
    }
    
    
    
}

extension LineChartViewController: ChartViewDelegate{
    public func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
    }
}
