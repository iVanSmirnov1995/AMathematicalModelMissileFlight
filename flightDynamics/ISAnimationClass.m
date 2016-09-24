//
//  ISAnimationClass.m
//  flightDynamics
//
//  Created by Smirnov Ivan on 05.11.15.
//  Copyright © 2015 Ivan Smirnov. All rights reserved.
//

#import "ISAnimationClass.h"
#import "func.h"



@interface ISAnimationClass ()

@property(strong,nonatomic)NSMutableArray* ar;
@property(strong,nonatomic)UIImageView*  raket;
@property(assign,nonatomic)NSInteger i;
@property(strong,nonatomic)NSTimer* timer;
@property(strong,nonatomic)AVAudioPlayer*player;


@end

@implementation ISAnimationClass

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString* st=[[NSBundle mainBundle] pathForResource:@"rr" ofType:@"mp3"];
    self.player=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:st] error:nil];

    
    
    func* f=[[func alloc]init];
    f.mArryDic=[NSMutableArray array];
    
    [f sistem4X0:0 y0:0 V0:self.v TT0:self.tt*M_PI/180 to:0 tk:self.tk we:self.we m0:self.mo mt:self.mt wx:self.wx tolkoAut:self.tolkoAut tolkoPut:self.tolkoPut activ:0 aut:0];
    
    self.ar=f.mArryDic;
    self.raket=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Spaceship"]];
    self.raket.frame=CGRectMake(0, 0, self.raket.frame.size.width/7, self.raket.frame.size.height/7);
    
    
    CGAffineTransform tr1=self.raket.transform;
    CGAffineTransform tr2=CGAffineTransformRotate(tr1,-
                                            [[[self.ar objectAtIndex:0] objectForKey:@"TT"]floatValue]);
    self.raket.transform=tr2;
    
    [self.view addSubview:self.raket];
    self.i=-1;
    [self.player play];
    NSTimer* timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timer:) userInfo:nil repeats:YES];

    self.timer=timer;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)timer:(NSTimer*)tm{
     self.i++;
    if (self.i+1==self.ar.count) {
        [tm invalidate];
        NSString* st=[[NSBundle mainBundle] pathForResource:@"vz" ofType:@"mp3"];
        self.player=[[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:st] error:nil];
        [self.player play];
        [UIView animateWithDuration:5 animations:^{
            self.raket.alpha=0;
            self.imageWind.alpha=0;
            self.endLabel.alpha=1;
        }];
        
        
        
    }else{
    NSDictionary* dic=[self.ar objectAtIndex:self.i];
    CGFloat xScrin=CGRectGetMaxY(self.view.frame);
    CGPoint centr=CGPointMake([[dic objectForKey:@"x"] floatValue]/20,
                      xScrin-[[dic objectForKey:@"y"] floatValue]/20);
    self.raket.center=centr;
    CGAffineTransform tr1=self.raket.transform;
    CGAffineTransform tr2=CGAffineTransformRotate(tr1,
                        [[[self.ar objectAtIndex:self.i] objectForKey:@"TT"]floatValue]-
                          [[[self.ar objectAtIndex:self.i+1] objectForKey:@"TT"]floatValue]);
    self.raket.transform=tr2;
        
        if ([[[self.ar objectAtIndex:self.i] objectForKey:@"t"]floatValue]>=self.tk) {
             [self.player stop];
            
        }
        
        
    }
    


}





@end
