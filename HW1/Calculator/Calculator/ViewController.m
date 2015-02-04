//
//  ViewController.m
//  Calculator
//
//  Created by Christian Boman on 2/1/15.
//  Copyright (c) 2015 Christian Boman. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringNumber;
@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation ViewController
@synthesize Display;
@synthesize userIsInTheMiddleOfEnteringNumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if(!_brain)
    {
        _brain =  [[CalculatorBrain alloc] init];
    }
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];
    if(self.userIsInTheMiddleOfEnteringNumber)
    {
        self.Display.text =[self.Display.text stringByAppendingString:digit];
    }
    else
    {
        self.Display.text = digit;
        self.userIsInTheMiddleOfEnteringNumber  = YES;
    }
}

- (IBAction)enterPressed {
    
    
    [self.brain pushOperand:[self.Display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringNumber = NO;
}


- (IBAction)operationPressed:(UIButton *)sender {
    
    if(userIsInTheMiddleOfEnteringNumber)
    {
        [self enterPressed];
    }
    
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.Display.text = [NSString stringWithFormat:@"%g", result];
    
}
@end