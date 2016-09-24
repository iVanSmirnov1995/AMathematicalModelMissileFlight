//
//  func.h
//  dz№2
//
//  Created by Smirnov Ivan on 12.02.15.
//  Copyright (c) 2015 Ivan Smirnov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface func : NSObject

-(void) sistem4X0:(CGFloat)x0  y0:(CGFloat)y0 V0:(CGFloat)V0  TT0:(CGFloat)TT0 to:(CGFloat)t0 tk:(CGFloat)tk
               we:(CGFloat)we m0:(CGFloat)m0 mt:(CGFloat)mt wx:(CGFloat)wx tolkoAut:(BOOL)tolkoAut tolkoPut:(BOOL)tolkoPut activ:(BOOL) activ aut:(BOOL)aut;

-(CGFloat) Cxa_MAlfa:(CGFloat)alfa M:(CGFloat)M;
-(CGFloat) Cya_M_alf:(CGFloat)x ;

@property(strong,nonatomic)NSMutableArray* mArry;
@property(strong,nonatomic)NSString* pointPad;
@property(strong,nonatomic)NSMutableArray* mArryDic;

@end
