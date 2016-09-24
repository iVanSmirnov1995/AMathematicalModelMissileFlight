//
//  ISPoint.h
//  srNomder2
//
//  Created by Smirnov Ivan on 09.04.15.
//  Copyright (c) 2015 Ivan Smirnov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ISPoint : NSObject
@property(assign,nonatomic)CGFloat M;
@property(assign,nonatomic)CGFloat Cx;
+(ISPoint*)criatePointNomber:(NSInteger)i;
@end
