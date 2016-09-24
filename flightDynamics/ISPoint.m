//
//  ISPoint.m
//  srNomder2
//
//  Created by Smirnov Ivan on 09.04.15.
//  Copyright (c) 2015 Ivan Smirnov. All rights reserved.
//

#import "ISPoint.h"

@implementation ISPoint



+(ISPoint*)criatePointNomber:(NSInteger)i{
    
    CGFloat M[]= {1.4,2.0, 2.5, 3.0,3.5,4.0, 4.5,5.0};
    CGFloat Cx[]={0.1173,0.1035,0.0918,0.0828,0.0762,0.0708,0.0672,0.0648};
    ISPoint* point=[[ISPoint alloc]init];
    point.M=M[i];
    point.Cx=Cx[i];
    
    return point;
}

@end
