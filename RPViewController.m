//
//  RPViewController.m
//  RoundProgress
//
//  Created by Arun Kumar.P on 20/03/14.
//  Copyright (c) 2014 Dev. All rights reserved.
//

#import "RPViewController.h"

@interface RPViewController ()

@property (nonatomic, retain) UIButton *startButton;
@property (nonatomic, retain) NSArray *sampleImageArray;
@property (nonatomic, assign) int sampleImagePointer;

@end

@implementation RPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.sampleImageArray = [NSArray arrayWithObjects:@"RoundGraphBg1",
                                 @"RoundGraphBg2",
                                 @"RoundGraphBg3",
                                 @"RoundGraphBg4",
                                 @"RoundGraphBg5",
                                 @"RoundGraphBg6", nil];
        self.sampleImagePointer = 0;
    }
    return self;
}

#pragma mark - getter Methods

- (RPRoundProgressView *)roundProgressView{
    if (_roundProgressView == nil) {
        _roundProgressView = [[RPRoundProgressView alloc] initWithFrame:CGRectMake(150, 150, 215, 210)];
        _roundProgressView.backgroundColor = [UIColor redColor];
        _roundProgressView.loaderImage = [UIImage imageNamed:@"RoundGraphBg"];
    }
    return _roundProgressView;
}

- (UIButton *)startButton{
    if (_startButton == nil) {
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _startButton.frame = CGRectMake(150, 375, 100, 50);
        [_startButton setTitle:@"Start" forState:UIControlStateNormal];
        _startButton.backgroundColor = [UIColor greenColor];
        [_startButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(startRandomAnimation) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startButton;
}

#pragma mark - custom Functions

- (void)startRandomAnimation{
    CGFloat random = (rand()%10)/10.0;
    NSLog(@"random = %f",random);
    if (self.sampleImagePointer > (self.sampleImageArray.count -1)) {
        self.sampleImagePointer++;
    }else{
        self.sampleImagePointer = 0;
    }
    NSString *RoundGraphBgString = [self.sampleImageArray objectAtIndex:self.sampleImagePointer];
    self.roundProgressView.loaderImage = [UIImage imageNamed:RoundGraphBgString];
    [self.roundProgressView startProgress:random];
}

#pragma mark - View functions

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.roundProgressView];
    [self.view addSubview:self.startButton];
    [self.roundProgressView startProgress:0.50];
    // Do any additional setup after loading the view.
}

#pragma mark - Memory functions

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
