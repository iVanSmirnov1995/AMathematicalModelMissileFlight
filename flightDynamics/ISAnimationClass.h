//
//  ISAnimationClass.h
//  flightDynamics
//
//  Created by Smirnov Ivan on 05.11.15.
//  Copyright © 2015 Ivan Smirnov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ISAnimationClass : UIViewController

@property (assign, nonatomic) CGFloat v;
@property (assign, nonatomic) CGFloat tt;
@property (assign, nonatomic) CGFloat mo;
@property (assign, nonatomic) CGFloat mt;
@property (assign, nonatomic) CGFloat we;
@property (assign, nonatomic) CGFloat tk;
@property (assign, nonatomic) CGFloat wx;
@property (assign, nonatomic) BOOL tolkoAut;
@property (assign, nonatomic) BOOL tolkoPut;
@property (weak, nonatomic) IBOutlet UIImageView *imageWind;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;


@end
