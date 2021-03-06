//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Christian Boman on 2/1/15.
//  Copyright (c) 2015 Christian Boman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@end
