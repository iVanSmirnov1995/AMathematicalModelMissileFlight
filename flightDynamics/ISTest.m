//
//  ISTest.m
//  srNomder2
//
//  Created by Smirnov Ivan on 09.04.15.
//  Copyright (c) 2015 Ivan Smirnov. All rights reserved.
//

#import "ISTest.h"
#import "ISPoint.h"

@implementation ISTest

-(CGFloat)nuton:(NSArray*)ar x:(CGFloat)x tabl:(BOOL)tabl
{
    CGFloat  razdRazn [1000][1000];
    NSInteger count=ar.count;
   
    
    for (int k=0; k<ar.count; k++) {
        razdRazn[0][k]=[[ar objectAtIndex:k] M];
        razdRazn[1][k]=[[ar objectAtIndex:k] Cx];
    }
    
    
    for (int i=2; i<ar.count+2; i++) {
        
        for (int j=0; j<count-1; j++) {
            
            razdRazn[i][j]=(razdRazn[i-1][j+1]-razdRazn[i-1][j])/(razdRazn[0][j+1+i-2]-razdRazn[0][j]);
          //  NSLog(@"%f=(%f-%f)/(%f-%f)",razdRazn[i][j],razdRazn[i-1][j+1],razdRazn[i-1][j],razdRazn[0][j+1],razdRazn[0][j]);
            
        }
        count=count-1;
    
    }
    
    CGFloat sum=razdRazn[1][0];
    CGFloat pr=1;
    for (NSInteger i=0; i<ar.count; i++) {
        
        pr=pr*(x-razdRazn[0][i]);
        sum=sum+razdRazn[i+2][0]*pr;
        
    }
    
    
    
    if (!tabl) {
        return sum;
    }
    
    
    
    
    //vivod
    NSString* s=@"";
    for (int i=0; i<ar.count; i++) {
        for (int j=0; j<ar.count+1; j++){
            
            s=[s stringByAppendingString:[NSString stringWithFormat:@" %f",razdRazn[j][i]]] ;
            
        }
               NSLog(@"%@",s);
               s=@"";
    }
     return sum;
}




-(CGFloat)linIntepol:(CGFloat)x{
    
    
    NSMutableArray *ar=[NSMutableArray array];
    CGFloat x1,x2,y1,y2;
    
    for (int i=0; i<7; i++) {
        
        ISPoint* p=[ISPoint criatePointNomber:i];
        [ar addObject:p];
    }
    
    for (int i=0 ;i<ar.count-1; i++) {
        
        if ((x>=[[ar objectAtIndex:i]M] )&&(x<[[ar objectAtIndex:i+1]M])) {
            
            x1=[[ar objectAtIndex:i]M]; x2=[[ar objectAtIndex:i+1]M];
            y1=[[ar objectAtIndex:i]Cx]; y2=[[ar objectAtIndex:i+1]Cx];
        }
    }
    
    CGFloat y=(x-x1)*(y2-y1)/(x2-x1)+y1;
    return y;
}





-(CGFloat)naimKv:(NSArray *)ar poradok:(NSInteger)p x:(CGFloat)x koef:(BOOL)koef showMatr:(BOOL)showMatr {
    CGFloat matr[1000][1000];
    CGFloat sum=0;
    for (int i=0; i<p; i++) {
        
        for (int j=0; j<p; j++) {
            
            for (int k=0; k<ar.count; k++) {
                sum=sum+pow([[ar objectAtIndex:k] M], j)*pow([[ar objectAtIndex:k] M], i);
            }
            matr[i][j]=sum;
            sum=0;
        }}
    for (int i=0; i<p; i++) {
        for (int k=0; k<ar.count; k++) {
            sum=sum+pow([[ar objectAtIndex:k] M], i)*[[ar objectAtIndex:k] Cx];
        }
        matr[p][i]=sum;
        sum=0;
    }
    
  
    NSString* s=@"";
    for (int i=0; i<p; i++) {
        for (int j=0; j<p+1; j++){
            
            s=[s stringByAppendingString:[NSString stringWithFormat:@" %f",matr[j][i]]] ;
            
        }
        if (showMatr) {
            NSLog(@"%@",s);
        }
      //  NSLog(@"%@",s);
        
        s=@"";
    }
  //  NSLog(@" ");
    
    // метод гауса
    CGFloat m=0;
    for (int k=1; k<p; k++) {
        for (int j=k; j<p; j++) {
            m=matr[k-1][j]/matr[k-1][k-1];
            for (int i=0; i<p+1; i++) {
                matr[i][j]=matr[i][j]-m*matr[i][k-1];
               // NSLog(@"%f",matr[i][j-1]);
            }
        }
    }
    
    
    NSString* ss=@"";
    for (int i=0; i<6; i++) {
        for (int j=0; j<6; j++){
            
            ss=[ss stringByAppendingString:[NSString stringWithFormat:@" %f",matr[j][i]]] ;
            
        }
      //  NSLog(@"%@",ss);
        ss=@"";
    }
    
    
    CGFloat c[1000];
    //обратный ход
    for(int i=p-1;i>=0;i=i-1)
    {
        c[i]=matr[p][i]/matr[i][i];
       // NSLog(@"hh %f- %f =%f",matr[p][i],matr[i][i],c[i]);
        if (i!=p-1) {
            
            for (int u=i; u<p; u++) {
                
            
                c[i]=c[i]- matr[u+1][i]*c[u+1]/matr[i][i];}
        }
    }
    
    for (int i=0; i<p; i++) {
        if (koef) {
            NSLog(@"C%d*x^%d= %f",i+1,i,c[i]);
        }
    }
    
    CGFloat proiz=1;
    CGFloat summa=0;
    for (int i=0; i<p; i++) {
        proiz=c[i]*pow(x, i);
        summa=summa+proiz;
    }
    return summa;
    
   
    
   
}


-(CGFloat)funk:(CGFloat)x{
    CGFloat y=0;
    if ((x>=0)&&(x<0.6)) {y=0.314;}
    if ((x>=0.6)&&(x<0.8)) {y=0.296+x*0.03;}
    if ((x>=0.8)&&(x<1.0)) {y=7.4-17.25*x+10.5*pow(x, 2);}
    if ((x>=1.0)&&(x<1.3)) {y=-20.87+52.953333*x-43.10*pow(x, 2)+11.666667*pow(x, 3);}
    if ((x>=1.3)&&(x<2.2)) {y=1.620619-1.672413*x+1.357222*pow(x, 2)-0.558730*pow(x, 3)+0.087302*pow(x, 4);}
    if ((x>=2.2)&&(x<=3.1)){y=2.243777-0.711124*x-0.450803*pow(x, 2)+0.285607*pow(x, 3)-0.039809*pow(x, 4);}
    
    return y;
}

@end
