//
//  LineViewController.m
//  TestSwift
//
//  Created by Sheshnath on 9/7/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "LineViewController.h"
@import Charts;
#import "ChartsDemo-Swift.h"
//#import "DayAxisValueFormatter.h"
#import "ChartsDemo-Bridging-Header.h"



@interface LineViewController ()<ChartViewDelegate,IChartAxisValueFormatter>
@property (weak, nonatomic) IBOutlet LineChartView *lineChart;
@property (nonatomic, weak) BarChartView *barChartOrdersView;
@property (weak, nonatomic) IBOutlet UIImageView *imgMirror;
@property (nonatomic, strong) NSMutableArray *xVal,*yVal1,*yVal2;
@end

@interface Foo : NSObject
- (void)m:(id _Nullable)p;
@end

@interface Bar : Foo
- (void)m:(id _Nonnull)p;
@end

@implementation LineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.xVal = [[NSMutableArray alloc]initWithObjects:@"03/08",@"03/16",@"03/16",@"03/16", nil];
    self.yVal1 = [[NSMutableArray alloc]initWithObjects:[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.0],nil];
    self.yVal1 = [[NSMutableArray alloc]initWithObjects:[NSNumber numberWithFloat:5.5],[NSNumber numberWithFloat:7.0],[NSNumber numberWithFloat:7.0],[NSNumber numberWithFloat:3.0],nil];
    
    [self lineChartSetUp];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.imgMirror.image = [self getHoriMirror:self.imgMirror.image];
//    });
    
//    _barChartOrdersView.gridBackgroundColor = [UIColor whiteColor];
//    _barChartOrdersView.backgroundColor = [UIColor whiteColor];
//
//    _barChartOrdersView.drawBarShadowEnabled = NO;
//    _barChartOrdersView.drawValueAboveBarEnabled = YES;
//    _barChartOrdersView.chartDescription.enabled = NO;
//    _barChartOrdersView.dragEnabled = NO;
//    [_barChartOrdersView setScaleEnabled:NO];
//    _barChartOrdersView.pinchZoomEnabled = NO;
//
//    _barChartOrdersView.rightAxis.enabled = NO;
//
//    _barChartOrdersView.leftAxis.drawGridLinesEnabled = YES;
//    _barChartOrdersView.leftAxis.drawLabelsEnabled = YES;
//    _barChartOrdersView.leftAxis.labelFont = [UIFont systemFontOfSize:10.f];
//    _barChartOrdersView.leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
//    _barChartOrdersView.leftAxis.spaceTop = 0.15;
//    _barChartOrdersView.leftAxis.axisMinimum = 0.0;
//
//    _barChartOrdersView.xAxis.labelPosition = XAxisLabelPositionBottom;
//    _barChartOrdersView.xAxis.drawGridLinesEnabled = NO;
//    _barChartOrdersView.xAxis.axisMinimum = 0.0;
//    _barChartOrdersView.xAxis.granularity = 1.0;
//    _barChartOrdersView.xAxis.labelFont = [UIFont systemFontOfSize:10.f];
//    _barChartOrdersView.xAxis.drawGridLinesEnabled = NO;
//    _barChartOrdersView.xAxis.granularity = 1.0;
//    _barChartOrdersView.xAxis.labelCount = 7;
//    _barChartOrdersView.leftAxis.xOffset = 20.0;
//    _barChartOrdersView.xAxis.yOffset = 20.0;
////    _barChartOrdersView.xAxis.valueFormatter = [DayAxisValueFormatter new];
//
//    _barChartOrdersView.legend.enabled = YES;
//    _barChartOrdersView.legend.horizontalAlignment = ChartLegendHorizontalAlignmentLeft;
//    _barChartOrdersView.legend.verticalAlignment = ChartLegendVerticalAlignmentBottom;
//    _barChartOrdersView.legend.orientation = ChartLegendOrientationHorizontal;
//    _barChartOrdersView.legend.drawInside = NO;
//    _barChartOrdersView.legend.form = ChartLegendFormSquare;
//    _barChartOrdersView.legend.formSize = 9.0;
//    _barChartOrdersView.legend.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
//    _barChartOrdersView.legend.xEntrySpace = 4.0;
//
////    BalloonMarker *balloonMarker = [[BalloonMarker alloc]
////                                    initWithColor: [UIColor colorWithWhite:180/255. alpha:0.9]
////                                    font: [UIFont systemFontOfSize:10.0]
////                                    textColor: UIColor.whiteColor
////                                    insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)];
////    balloonMarker.chartView = _barChartOrdersView;
////    balloonMarker.minimumSize = CGSizeMake(40.f, 20.f);
//
//
//    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)lineChartSetUp {
    
    //Set Chart Properties.
    self.lineChart.delegate = self;
//    self.lineChart.chartDescription.enabled = NO;
//    self.lineChart.dragEnabled = YES;
//    self.lineChart.pinchZoomEnabled = YES;
//    [self.lineChart setScaleEnabled:YES];
//    self.lineChart.scaleXEnabled = NO;
//    self.lineChart.scaleYEnabled = NO;
//
////    self.lineChart.maxVisibleCount = self.yVal1.count;
//
//    //Set Left Axis into chart.
    ChartYAxis *leftAxis = self.lineChart.leftAxis;
    leftAxis.labelPosition = YAxisLabelPositionInsideChart;
    
    self.lineChart.leftAxis.labelPosition = YAxisLabelPositionInsideChart;
    self.lineChart.rightAxis.labelPosition = YAxisLabelPositionInsideChart;
    
//    [leftAxis removeAllLimitLines];
////    leftAxis.drawGridLinesEnabled = NO;
//    leftAxis.drawLabelsEnabled = YES;
////    leftAxis.labelFont = kAPPSFUIDisplayRagular(10.0);
////    leftAxis.labelTextColor = kAppPrimaryHeading;
//
//    //Set or hide Right Axis into chart.
////    self.lineChart.rightAxis.enabled = NO;
//    self.lineChart.legend.enabled = NO;
//
//    //Set up XAxis into chart.
    ChartXAxis *xAxis = self.lineChart.xAxis;
////    xAxis.labelRotationAngle = -90.0;
////    xAxis.labelCount = self.mutArrTrendsList.count;
////    xAxis.labelFont = kAPPSFUIDisplayRagular(10.0);
////    xAxis.labelTextColor = kAppPrimaryHeading;
    xAxis.labelPosition = XAxisLabelPositionBottom;
//    xAxis.xOffset = 5;
    xAxis.axisMinimum = 0;
//    xAxis.avoidFirstLastClippingEnabled = NO;
    xAxis.granularity = 1.0;
    xAxis.valueFormatter = self;
//    xAxis.drawGridLinesEnabled = NO;
//    xAxis.yOffset = 5;
    
    
    //Set data set for chart.
    [self setTrendsChartData];
    
    //Set Graph Fill animation.
    [self.lineChart animateWithXAxisDuration:2.0];
}

- (void)setTrendsChartData {
    
    NSMutableArray *values1 = [[NSMutableArray alloc] init];
    NSMutableArray *values2 = [[NSMutableArray alloc] init];
    
    
    for (int i =0;i< self.yVal1.count;i++){
        [values1 addObject:[[ChartDataEntry alloc] initWithX:i y:[self.yVal1[i] floatValue]]];
    }
    for (int i =0;i< self.yVal2.count;i++){
        [values2 addObject:[[ChartDataEntry alloc] initWithX:i y:[self.yVal2[i] floatValue]]];
    }
//
//            [values2 addObject:[[ChartDataEntry alloc] initWithX:idx y:[obj[@"closed"] integerValue]]];
    
    
    
    
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    //Remove all old Data Set from chart.
    if (self.lineChart.data.dataSetCount > 0)
    {
        self.lineChart.data = nil;
    }
    
    //DataSet 1
    LineChartDataSet *set1 = [[LineChartDataSet alloc] initWithValues:values1 label:@"value1"];
    set1.axisDependency = AxisDependencyRight;
    set1.lineWidth = 2;
    set1.drawFilledEnabled = YES;
    set1.drawValuesEnabled = NO;
    //    set1.fillAlpha = 0.33f;
//    set1.fill = [ChartFill fillWithColor:kAppLegend1GraphColorForCAP];
//    [set1 setColor:kAppLegend1GraphColorForCAP];
    [set1 setDrawCirclesEnabled:YES];
    [set1 setCircleColor:[UIColor whiteColor]];
//    [set1 setCircleHoleColor:kAppLegend1GraphColorForCAP];
    [set1 setCircleRadius:5.0f];
    [set1 setCircleHoleRadius:4.0f];
    [set1 setHighlightLineWidth:1.0];
//    [set1 setHighlightColor:kAppLegend1GraphColorForCAP];
    [set1 setDrawHorizontalHighlightIndicatorEnabled:NO];
    
    //DataSet 2
    LineChartDataSet *set2 = [[LineChartDataSet alloc] initWithValues:values2 label:@"value2"];
    set2.lineWidth = 2;
     set2.axisDependency = AxisDependencyLeft;
    
    //    set2.fillAlpha = 0.5f;
//    set2.fill = [ChartFill fillWithColor:kAppLegend2GraphColorForCAP];
//    [set2 setColor:kAppLegend2GraphColorForCAP];
    [set2 setCircleColor:[UIColor whiteColor]];
//    [set2 setCircleHoleColor:kAppLegend2GraphColorForCAP];
    
    set2.drawFilledEnabled = YES;
    set2.drawValuesEnabled = NO;
    [set2 setDrawCirclesEnabled:YES];
    [set2 setDrawHighlightIndicators:YES];
    [set2 setCircleRadius:5.0f];
    [set2 setCircleHoleRadius:4.0f];
    [set2 setHighlightLineWidth:1.0];
//    [set2 setHighlightColor:kAppLegend2GraphColorForCAP];
    [set2 setDrawHorizontalHighlightIndicatorEnabled:NO];
    
    
    
    
    [dataSets addObject:set1];
    [dataSets addObject:set2];
    
    
    //Add Line Chart Data inro Chart.
    LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
    self.lineChart.data = data;
    
    //Lets Select Pin Data with Last Point selection on Line Chart
    ChartDataEntry *lastEntry = [values1 lastObject];
    [self.lineChart highlightValueWithX:lastEntry.x y:lastEntry.y dataSetIndex:0 callDelegate:YES];
    
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected index %f", entry.x);
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}

#pragma mark - IChartValueFormatter

- (NSString * _Nonnull)stringForValue:(double)value entry:(ChartDataEntry * _Nonnull)entry dataSetIndex:(NSInteger)dataSetIndex viewPortHandler:(ChartViewPortHandler * _Nullable)viewPortHandler{
    
    if (value>=0) {
        return [NSString stringWithFormat:@"%0.f",value];
    }else{
        return @"";
    }
}


#pragma mark - IAxisValueFormatter

- (NSString *)stringForValue:(double)value
                        axis:(ChartAxisBase *)axis
{
//    if (value>=0) {
//        if (_barChartPins.xAxis == axis) {
//            if (value<_mutArrPinList.count) {
//                NSDictionary *pinObj = [_mutArrPinList objectAtIndex:value];
//                return pinObj[@"pin"];
//            }else{
//                return @"";
//            }
//        }else{
//            NSDictionary *capObj;
//            if (_selectedQuarter == kAppQuarter4 || _selectedQuarter == kAppQuarter8) {
//                capObj = [_mutArrFilterTrendsList objectAtIndex:value];
//            }else{
//                capObj = [_mutArrTrendsList objectAtIndex:value];
//            }
//            return [NSString stringWithFormat:@" %@", capObj[@"quarter"]];
//        }
//    }else{
    
//    }
    
    if (_lineChart.xAxis == axis) {
        return [self.xVal objectAtIndex:value];
    }else{
        return @"";
    }
    
}

-(UIImage*)getHoriMirror:(UIImage*)img
{
    CIImage* cii = [CIImage imageWithCGImage:img.CGImage];
    cii = [cii imageByApplyingTransform:CGAffineTransformMakeScale(1, -1)];
    CIContext *Context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [Context createCGImage:cii fromRect:[cii extent]];
    UIImage* uiImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return uiImage;
}

@end
