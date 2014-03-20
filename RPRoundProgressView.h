//
//  RPRoundProgressView.h
//  RoundProgress
//
//  Created by Arun Kumar.P on 20/03/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPRoundProgressView : UIView {
    
    float startAngle; // 0..2π
    
}

@property (nonatomic, strong) UIImage * loaderImage;

- (void)startProgress:(CGFloat)value;

@end
