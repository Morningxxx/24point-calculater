//
//  main.m
//  24ponit_calculator
//
//  Created by Morning on 2016/02/19.
//  Copyright © 2016年 Morning. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger count = 0 ;
NSInteger sucCount = 0;

void printMethod(int* a, int firstA,int firstB,int firstC,int secendA,int secendB, int secendC,int third){
    int b[3],c[2];
    int flag = 1;
    NSString* fir;
    NSString* sec;
    NSString* thr;
    for (int j = 0 ; j < 4 ; ++j) {
        if (j!=firstA && j!=firstB ) {
            b[flag] = a[j];
            flag++;
        }
    }
    for (int j = 0 ; j < 3 ; ++j) {
        if (j!=secendA && j!=secendB ) {
            c[1]= b[j];
        }
    }
        switch (firstC) {
            case 0:
                fir = [NSString stringWithFormat:@"(%2d + %2d)",a[firstA],a[firstB]];
                break;
            case 1:
                fir = [NSString stringWithFormat:@"(%2d - %2d)",a[firstA],a[firstB]];
                break;
            case 2:
                fir = [NSString stringWithFormat:@"(%2d - %2d)",a[firstB],a[firstA]];
                break;
            case 3:
                fir = [NSString stringWithFormat:@"(%2d * %2d)",a[firstA],a[firstB]];
                break;
            case 4:
                fir = [NSString stringWithFormat:@"(%2d / %2d)",a[firstA],a[firstB]];
                break;
            case 5:
                fir = [NSString stringWithFormat:@"(%2d / %2d)",a[firstB],a[firstA]];
                break;
        }
    if (secendA) {
        switch (secendC) {
            case 0:
                sec=[NSString stringWithFormat:@"(%2d + %2d)",b[secendA],b[secendB]];
                break;
            case 1:
                sec=[NSString stringWithFormat:@"(%2d - %2d)",b[secendA],b[secendB]];
                break;
            case 2:
                sec=[NSString stringWithFormat:@"(%2d - %2d)",b[secendB],b[secendA]];
                break;
            case 3:
                sec=[NSString stringWithFormat:@"(%2d * %2d)",b[secendA],b[secendB]];
                break;
            case 4:
                sec=[NSString stringWithFormat:@"(%2d / %2d)",b[secendA],b[secendB]];
                break;
            case 5:
                sec=[NSString stringWithFormat:@"(%2d / %2d)",b[secendB],b[secendA]];
                break;
        }
        switch (third) {
            case 0:
                thr =[NSString stringWithFormat:@"%@ + %@",sec,fir];
                break;
            case 1:
                thr =[NSString stringWithFormat:@"%@ - %@",sec,fir];
                break;
            case 2:
                thr =[NSString stringWithFormat:@"%@ - %@",fir,sec];
                break;
            case 3:
                thr =[NSString stringWithFormat:@"%@ * %@",sec,fir];
                break;
            case 4:
                thr =[NSString stringWithFormat:@"%@ / %@",sec,fir];
                break;
            case 5:
                thr =[NSString stringWithFormat:@"%@ / %@",fir,sec];
                break;
        }
    }else{
        switch (secendC) {
            case 0:
                sec=[NSString stringWithFormat:@"(%@ + %2d)",fir,b[secendB]];
                break;
            case 1:
                sec=[NSString stringWithFormat:@"(%@ - %2d)",fir,b[secendB]];
                break;
            case 2:
                sec=[NSString stringWithFormat:@"(%2d - %@)",b[secendB],fir];
                break;
            case 3:
                sec=[NSString stringWithFormat:@"(%@ * %2d)",fir,b[secendB]];
                break;
            case 4:
                sec=[NSString stringWithFormat:@"(%@ / %2d)",fir,b[secendB]];
                break;
            case 5:
                sec=[NSString stringWithFormat:@"(%2d - %@)",b[secendB],fir];
                break;
        }
        switch (third) {
            case 0:
                thr =[NSString stringWithFormat:@"%@ + %2d",sec,c[1]];
                break;
            case 1:
                thr =[NSString stringWithFormat:@"%@ - %2d",sec,c[1]];
                break;
            case 2:
                thr =[NSString stringWithFormat:@"%2d - %@",c[1],sec];
                break;
            case 3:
                thr =[NSString stringWithFormat:@"%@ * %2d",sec,c[1]];
                break;
            case 4:
                thr =[NSString stringWithFormat:@"%@ / %2d",sec,c[1]];
                break;
            case 5:
                thr =[NSString stringWithFormat:@"%2d / %@",c[1],sec];
                break;
        }
    }
    printf("%s = 24\n",[thr cStringUsingEncoding:NSASCIIStringEncoding]);
}

int judgeIfCanBe24(int a1,int a2,int a3,int a4){
    int iscan = 0;
    int o[4];
    double a[4];
    double b[3];
    double c[2];
    double d = 0.0;
    a[0]=(double)a1;
    a[1]=(double)a2;
    a[2]=(double)a3;
    a[3]=(double)a4;
    o[0]=a1;
    o[1]=a2;
    o[2]=a3;
    o[3]=a4;
    int firstA,firstB,firstC;
    for (firstA = 0; firstA < 3; ++firstA) {
        for (firstB = firstA + 1; firstB < 4; ++firstB) {
            for (firstC = 0; firstC<6; firstC++) {
                switch (firstC) {
                    case 0:
                        b[0]=a[firstA]+a[firstB];
                        break;
                    case 1:
                        b[0]=a[firstA]-a[firstB];
                        break;
                    case 2:
                        b[0]=a[firstB]-a[firstA];
                        break;
                    case 3:
                        b[0]=a[firstA]*a[firstB];
                        break;
                    case 4:
                        b[0]=a[firstA]/a[firstB];
                        break;
                    case 5:
                        b[0]=a[firstB]/a[firstA];
                        break;
                }
                int secendA,secendB,secendC;
                int flag = 1;
                for (int j = 0 ; j < 4 ; ++j) {
                    if (j!=firstA && j!=firstB ) {
                        b[flag] = a[j];
                        flag++;
                    }
                }
                for (secendA=0; secendA<2; secendA++) {
                    for (secendB=secendA+1; secendB<3; ++secendB) {
                        for (secendC = 0; secendC<6; secendC++) {
                            
                            switch (secendC) {
                                case 0:
                                    c[0]=b[secendA]+b[secendB];
                                    break;
                                case 1:
                                    c[0]=b[secendA]-b[secendB];
                                    break;
                                case 2:
                                    c[0]=b[secendB]-b[secendA];
                                    break;
                                case 3:
                                    c[0]=b[secendA]*b[secendB];
                                    break;
                                case 4:
                                    c[0]=b[secendA]/b[secendB];
                                    break;
                                case 5:
                                    c[0]=b[secendB]/b[secendA];
                                    break;
                                    
                            }
                            for (int j = 0 ; j < 3 ; ++j) {
                                if (j!=secendA && j!=secendB ) {
                                    c[1]= b[j];
                                }
                            }
                            for (int third=0; third<6; third++) {
                                count++;
                                switch (third) {
                                    case 0:
                                        d=c[0]+c[1];
                                        break;
                                    case 1:
                                        d=c[0]-c[1];
                                        break;
                                    case 2:
                                        d=c[1]-c[0];
                                        break;
                                    case 3:
                                        d=c[1]*c[0];
                                        break;
                                    case 4:
                                        d=c[0]/c[1];
                                        break;
                                    case 5:
                                        d=c[1]/c[0];
                                        break;
                                        
                                }
                                if (d == 24) {
//                                    printf("%lf,%lf,%d,\n%lf,%lf,%d\n%d\n",a[firstA],a[firstB],firstC,b[secendA],b[secendB],secendC,third);
                                    if(!iscan)
//                                        printf("%2d,%2d,%2d,%2d\n",o[0],o[1],o[2],o[3]);
                                    iscan++;
//                                    printf("               ");
                                    printMethod(o, firstA, firstB, firstC, secendA, secendB, secendC, third);
                                    return YES;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return iscan;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        for (int i = 1; i < 10; ++i) {
            for (int j = i; j<10; ++j) {
                for (int k =j; k<10; ++k) {
                    for (int l=k; l<10; ++l) {
                        if (judgeIfCanBe24(i, j, k, l)) {
                        }
                    }
                }
            }
        }
        printf("%ld\n",count);
//        int i,j,k,l;
//        scanf("%d %d %d %d",&i,&j,&k,&l);
//        judgeIfCanBe24(i, j, k, l);
    return 0;
    }
    
}
