//
//  ViewController.m
//  Anton
//
//  Created by Master-Student on 31.10.13.
//  Copyright (c) 2013 Master-Student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property int number1;
@property int number2;

@end

@implementation ViewController
@synthesize number1;
@synthesize number2;
NSMutableArray* operations;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    operations = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}
- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    NSLog(@"Gedrückt: %@", digit);
    _Display.text = [_Display.text stringByAppendingString:digit];
    
}
- (IBAction)EnterTaste:(UIButton *)sender {
    if (number1 == 0) {
    number1 = [_Display.text intValue];
    _Display.text = @"";
    }
    else {
    number2 = [_Display.text intValue];
    _Display.text = @"";
    }
    
}
- (IBAction)result:(UIButton *)sender {
    NSString *operator = [sender currentTitle];
    
    
    if ([operator isEqual: @"+"]) {
    _Display.text = [NSString stringWithFormat:@"%d", (number1 + number2)];
    }
    if ([operator isEqual: @"-"]) {
    _Display.text = [NSString stringWithFormat:@"%d", (number1 - number2)];
    }
    if ([operator isEqual: @"/"]) {
    _Display.text = [NSString stringWithFormat:@"%d", (number1 / number2)];
    }
    if ([operator isEqual: @"*"]) {
    _Display.text = [NSString stringWithFormat:@"%d", (number1 *number2)];
    }
    
    
    number1 = [_Display.text intValue];
    if (number1 > 0) {
        _plusminus.text = @"p";
    
    }
    else if (number1 < 0) {
        _plusminus.text = @"n";
    
    }
    
    
    if ([operations count] > 9) {
        [operations removeObjectAtIndex:0];
    }
    
    [operations addObject:operator];
    _Operator.text = [operations componentsJoinedByString:@""];
    
    

}




@end
