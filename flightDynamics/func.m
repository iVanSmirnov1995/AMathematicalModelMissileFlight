//
//  func.m
//  dz№2
//
//  Created by Smirnov Ivan on 12.02.15.
//  Copyright (c) 2015 Ivan Smirnov. All rights reserved.
//

#import "func.h"
#import "ISTabl.h"
#import "ISTest.h"
#import "ISPoint.h"

@implementation func


const CGFloat PI = 3.1415926535897932384626433832795; //константы
CGFloat d_m=0.17f;
CGFloat d_a=0.16f;
//CGFloat m_0=175.f;
CGFloat m_k=141.f;
CGFloat t_k=4.4f;
//CGFloat W_e=2430.f;
//CGFloat W_x=0.f;
CGFloat g=9.80665;
CGFloat h=0.1;
bool tolkoAut=NO;
bool tolkoPut=NO;



-(CGFloat) Cxa_Mput:(CGFloat)x       //Метод нахождения функции аэродинамического коэффициента Cxa(M)//
{
    CGFloat y=0;
    CGFloat M[]= {0.f,0.25f, 0.5f, 0.75f,0.9f,1.f, 1.1f,1.25f,1.5f,2.0f,3.0f};
    CGFloat Cx[]={0.32f,0.32f,0.33f,0.41f,0.54f,0.60f,0.63f,0.62f,0.56f,0.49f,0.46f};
    for (int i=0; i<11; i++) {
        if ((x>=M[i])&&(x<M[i+1])) {
            
            y=(x-M[i])*(Cx[i+1]-Cx[i])/(M[i+1]-M[i])+Cx[i];
            
        }
    }
    
    return y;
    
}

-(CGFloat) Cxa_M_ayt:(CGFloat)x             //Метод нахождения функции аэродинамического коэффициента CYa(M) по α//
{
    CGFloat y=0;
    CGFloat M[]= {0.f,0.25f, 0.5f, 0.75f,0.9f,1.f, 1.1f,1.25f,1.5f,2.0f,3.0f};
    CGFloat Cx[]={0.3f,0.3f,0.31f,0.38f,0.51f,0.56f,0.59f,0.58f,0.52f,0.44f,0.42f};
    for (int i=0; i<11; i++) {
        if ((x>=M[i])&&(x<M[i+1])) {
            
            y=(x-M[i])*(Cx[i+1]-Cx[i])/(M[i+1]-M[i])+Cx[i];
           
        }
    }
    
    return y;
    
}

-(CGFloat) f1X:(CGFloat)x Y:(CGFloat)y  TT:(CGFloat)TT V:(CGFloat)v t:(CGFloat)t    //Метод нахождения функции dx/dt//

{
    
    
    CGFloat f=v*cos(TT);
    
    return f;
    
}

-(CGFloat) f2X:(CGFloat)x Y:(CGFloat)y  TT:(CGFloat)TT V:(CGFloat)v t:(CGFloat)t    //Метод нахождения функции dy/dt//

{
    
    
    CGFloat f=v*sin(TT);
    
    return f;
    
}

-(CGFloat) f3X:(CGFloat)x Y:(CGFloat)y  TT:(CGFloat)TT V:(CGFloat)v t:(CGFloat)t activ:(BOOL) activ
            m0:(CGFloat)m_0 mk:(CGFloat)m_k t_k:(CGFloat)t_k Wx:(CGFloat)W_x We:(CGFloat)W_e//Метод нахождения функции dθс/dt//

{
    /////////////////
    CGFloat P,m,X;
    CGFloat m_sek=(m_0-m_k)/t_k;
    CGFloat s_a=M_PI*powf(d_a, 2)/4;
    CGFloat s_m=M_PI*powf(d_m, 2)/4;
    ISTabl* tabl=[[ISTabl alloc]init];
    CGFloat P_h=[[tabl h:y type:geomertrik]P];
    CGFloat T=[[tabl h:y type:geomertrik]T];
    CGFloat ro=[[tabl h:y type:geomertrik]ro];
    CGFloat q=0.5*ro*pow(v,2);
    CGFloat a=20.046796*pow(T, 0.5);
    CGFloat a_w=atan((W_x*sin(TT))/(v-W_x*cos(TT)));
    if (tolkoAut&&!activ) {
        a_w=atan((0*sin(TT))/(v-0*cos(TT)));
    }
    if (tolkoAut&&activ) {
        a_w=atan((W_x*sin(TT))/(v-W_x*cos(TT)));
    }
    if (tolkoPut&&!activ) {
        a_w=atan((W_x*sin(TT))/(v-W_x*cos(TT)));
    }
    if (tolkoPut&&activ) {
        a_w=atan((0*sin(TT))/(v-0*cos(TT)));
    }
    
    if (!activ) {
        P=0;
        m=m_0-m_sek*t_k;
        X=s_m*q*[self Cxa_Mput:v/a];
        
        
    }else
    {
        P=W_e*m_sek-s_a*P_h;
        m=m_0-m_sek*t;
        X=s_m*q*[self Cxa_M_ayt:v/a];
    }
    CGFloat f=((P-X)*sin(a_w)-m*g*cos(TT))/(m*v);
    
    return f;
    
}

-(CGFloat) f4X:(CGFloat)x Y:(CGFloat)y  TT:(CGFloat)TT V:(CGFloat)v t:(CGFloat)t activ:(BOOL) activ
  m0:(CGFloat)m_0 mk:(CGFloat)m_k t_k:(CGFloat)t_k Wx:(CGFloat)W_x We:(CGFloat)W_e
//Метод нахождения функции dV/dt//

{
    /////////////////
    CGFloat P,m,X;
    CGFloat m_sek=(m_0-m_k)/t_k;
    CGFloat s_a=M_PI*powf(d_a, 2)/4;
    CGFloat s_m=M_PI*powf(d_m, 2)/4;
    ISTabl* tabl=[[ISTabl alloc]init];
    CGFloat P_h=[[tabl h:y type:geomertrik]P];
    CGFloat T=[[tabl h:y type:geomertrik]T];
    CGFloat ro=[[tabl h:y type:geomertrik]ro];
    CGFloat vkk=pow(pow(v,2)+pow(W_x, 2)-2*v*W_x*cos(TT), 0.5);
    CGFloat q=0.5*ro*pow(vkk,2);
    CGFloat a=20.046796*pow(T, 0.5);
    CGFloat a_w=atan((W_x*sin(TT))/(v-W_x*cos(TT)));
    if (tolkoAut&&!activ) {
        
        a_w=atan((0*sin(TT))/(v-0*cos(TT)));
    }
    if (tolkoAut&&activ) {
        a_w=atan((W_x*sin(TT))/(v-W_x*cos(TT)));
    }
    if (tolkoPut&&!activ) {
        a_w=atan((W_x*sin(TT))/(v-W_x*cos(TT)));
    }
    if (tolkoPut&&activ) {
        a_w=atan((0*sin(TT))/(v-0*cos(TT)));
    }
    
    if (!activ) {
        P=0;
        m=m_0-m_sek*t_k;
        X=s_m*q*[self Cxa_Mput:vkk/a];
        
        
    }else
    {
        P=W_e*m_sek-s_a*P_h;
        m=m_0-m_sek*t;
        X=s_m*q*[self Cxa_M_ayt:vkk/a];
    }
    CGFloat f=((P-X)*cos(a_w)-m*g*sin(TT))/(m);
    
    
    return f;
    
    
}



-(void) sistem4X0:(CGFloat)x0  y0:(CGFloat)y0 V0:(CGFloat)V0  TT0:(CGFloat)TT0 to:(CGFloat)t0 tk:(CGFloat)tk
               we:(CGFloat)we m0:(CGFloat)m0 mt:(CGFloat)mt wx:(CGFloat)wx tolkoAut:(BOOL)tolkoAut tolkoPut:(BOOL)tolkoPut activ:(BOOL) activ aut:(BOOL)aut   //Реализация метода Рунге-Кутта 4-го порядка//
{
    CGFloat dx=0;
    CGFloat dy=0;
    CGFloat dTT=0;
    CGFloat dV=0;
    BOOL fin=NO;
    CGFloat m_sek=(m0-mt)/tk;
    CGFloat s_a=PI*powf(d_a, 2)/4;
    CGFloat s_m=PI*powf(d_m, 2)/4;
    BOOL stop=NO;
   
   
    //for (int i=1; i<n; i++)
    while (!stop)
    {
        CGFloat P,m,X;
        
        ISTabl* tabl=[[ISTabl alloc]init];
        CGFloat P_h=[[tabl h:y0 type:geomertrik]P];
        
        CGFloat ro=[[tabl h:y0 type:geomertrik]ro];
        CGFloat T=[[tabl h:y0 type:geomertrik]T];
        CGFloat q=0.5*ro*pow(V0,2);

        
        CGFloat a=20.046796*pow(T, 0.5);
        
        if (t0<tk) {
            P=we*m_sek-s_a*P_h;
            m=m0-m_sek*t0;
            X=s_m*q*[self Cxa_M_ayt:V0/a];
        }else
        {
            P=0;
            m=m0-m_sek*aut;
            X=s_m*q*[self Cxa_Mput:V0/a];
        }
        
        CGFloat nx=[self f4X:x0 Y:y0 TT:TT0 V:V0 t:t0 activ:activ m0:m0 mk:m_k t_k:t_k Wx:wx We:we ]/g+sin(TT0);
           // NSLog(@"%.5f %.5f %.5f %.5f %.5f %.5f",t0,x0,y0,V0,TT0,nx);
        NSString* st=[NSString stringWithFormat:@"t=%.2f x=%.5f y=%.5f v=%.5f тета=%.5f nx=%.5f",t0,x0,y0,V0,TT0,nx];
        [self.mArry addObject:st];
        NSDictionary* d=[NSDictionary dictionaryWithObjectsAndKeys:
          @(x0), @"x",
          @(y0),@"y",
          @(TT0),@"TT",
          @(t0),@"t",
          nil];
        [self.mArryDic addObject:d];
           // NSLog(@"%.5f %.5f",x0,y0);
        if (y0<0) {
            stop=YES;
            CGFloat xc=x0-y0/tan(TT0);
          //  NSLog(@"точка падения:(%.5f,0)",xc);
            self.pointPad=[NSString stringWithFormat:@"точка падения:(%.5f,0)",xc];
        }
        
        
///////////////    
  // тесты
        
  //   NSLog(@"%f %f %f %f ",t0,V0,DvDt,P);
 ///////////////////
        if (t0<=tk-0.1) {
            activ=YES;
        }else activ=NO;
        
        CGFloat k[5],l[5],n[5],p[5],h1;
        k[0]=0;l[0]=0;n[0]=0;p[0]=0;
        dx=0;dy=0;dTT=0;dV=0;
        CGFloat coef[]={1.,2.,2.,1.};
        for (NSInteger i=0; i<4; i++) {
            if (i==0) {
                h1=0;
            }else
                h1=h;
            k[i+1]=h*[self f1X:x0+k[i]/coef[i] Y:y0+l[i]/coef[i] TT:TT0+n[i]/coef[i] V:V0+p[i]/coef[i] t:t0+h1/coef[i]];
            l[i+1]=h*[self f2X:x0+k[i]/coef[i] Y:y0+l[i]/coef[i] TT:TT0+n[i]/coef[i] V:V0+p[i]/coef[i] t:t0+h1/coef[i]];
            n[i+1]=h*[self f3X:x0+k[i]/coef[i] Y:y0+l[i]/coef[i] TT:TT0+n[i]/coef[i] V:V0+p[i]/coef[i] t:t0+h1/coef[i] activ:activ m0:m0 mk:m_k t_k:t_k Wx:wx We:we];
            p[i+1]=h*[self f4X:x0+k[i]/coef[i] Y:y0+l[i]/coef[i] TT:TT0+n[i]/coef[i] V:V0+p[i]/coef[i] t:t0+h1/coef[i] activ:activ m0:m0 mk:m_k t_k:t_k Wx:wx We:we];
            dx+=k[i+1]*coef[i]/6.f;
            dy+=l[i+1]*coef[i]/6.f;
            dTT+=n[i+1]*coef[i]/6.f;
            dV+=p[i+1]*coef[i]/6.f;
            
        }
        
        y0+=dy;
        x0+=dx;
        TT0+=dTT;
        V0+=dV;
        t0+=h;
        
    }

}

@end
