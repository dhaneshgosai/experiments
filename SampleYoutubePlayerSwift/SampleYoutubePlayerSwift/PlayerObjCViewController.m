//
//  PlayerObjCViewController.m
//  SampleYoutubePlayerSwift
//
//  Created by Sheshnath on 12/02/19.
//  Copyright © 2019 Exp. All rights reserved.
//

#import "PlayerObjCViewController.h"


@interface PlayerObjCViewController ()

@end

@implementation PlayerObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.playerView.webView.allowsInlineMediaPlayback = YES;
    NSDictionary *playvarsDic = @{ @"fs" : @1, @"controls" : @1, @"playsinline" : @0, @"autohide" : @1, @"showinfo" : @1, @"autoplay": @1, @"modestbranding" : @1 };
    [self.playerView loadWithVideoId:@"PQmrmVs10X8" playerVars:playvarsDic];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
