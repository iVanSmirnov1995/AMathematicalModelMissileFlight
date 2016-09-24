//
//  ISTest.h
//  srNomder2
//
//  Created by Smirnov Ivan on 09.04.15.
//  Copyright (c) 2015 Ivan Smirnov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ISTest : NSObject

-(CGFloat)linIntepol:(CGFloat)x;
-(CGFloat)nuton:(NSArray*)ar x:(CGFloat)x tabl:(BOOL)tabl;
-(CGFloat)naimKv:(NSArray*)ar poradok:(NSInteger)p x:(CGFloat)x koef:(BOOL)koef showMatr:(BOOL)showMatr;
-(CGFloat)funk:(CGFloat)x;
@end
