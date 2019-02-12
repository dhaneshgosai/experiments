//
//  PlayerObjCViewController.h
//  SampleYoutubePlayerSwift
//
//  Created by Sheshnath on 12/02/19.
//  Copyright © 2019 Exp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerObjCViewController : UIViewController
@property(nonatomic, strong) IBOutlet YTPlayerView *playerView;
@end

NS_ASSUME_NONNULL_END
