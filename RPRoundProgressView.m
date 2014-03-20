//
//  RPRoundProgressView.m
//  RoundProgress
//
//  Created by Arun Kumar.P on 20/03/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "RPRoundProgressView.h"

@interface RPRoundProgressView()

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat maxProgress;
@property (nonatomic, retain) NSTimer *graphTimer;

@end

@implementation RPRoundProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        startAngle =  1.50;//-1.55;
        self.progress = 0.0f;
        self.maxProgress = 1.0f;
        self.loaderImage = [UIImage imageNamed:@"RoundGraphBg"];
        
    }
    return self;
}

- (void)startProgress:(CGFloat)value{
    self.progress = 0.0f;
    self.maxProgress = value;
    self.graphTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target: self selector: @selector(updateProgress) userInfo: nil repeats: YES];
    
    
    
}

- (void)updateProgress{
    if (self.progress < self.maxProgress ) {
        self.progress+=0.01;
        [self setNeedsDisplay];
    }else{
        [self.graphTimer invalidate];
    }
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    
    //Create a path - CGContextBeginPath
    //Add an arc using CGContextAddArc
    //Fill the path using CGContextFillPath
    //Close the path - CGContextClosePath
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height)/2.0;
    CGPoint center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
    // Elapsed arc
    CGContextAddArc(context, center.x, center.y, radius, startAngle, startAngle + self.progress*2.0*M_PI, 0);
    CGContextAddLineToPoint(context, center.x, center.y);
    CGContextClosePath(context);
    
    UIColor * myGrassPatternColor = [UIColor colorWithPatternImage: self.loaderImage];
    
    CGContextSetFillColorWithColor(context, myGrassPatternColor.CGColor);
    CGContextFillPath(context);
}

@end
