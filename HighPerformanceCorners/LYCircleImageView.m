//
//  LYCircleImageView.m
//  HighPerformanceCorners
//
//  Created by 雷源 on 2018/6/12.
//  Copyright © 2018年 Yuanjihua. All rights reserved.
//

#import "LYCircleImageView.h"
#import "UIImage+addRadius.h"
@implementation LYCircleImageView
-(void)addCorners:(CGFloat)radius
{
    if(self.image)
    {
        self.image = [self.image imageAddCornerRadius:radius andSize:self.bounds.size];
    }
    return;
}


@end
