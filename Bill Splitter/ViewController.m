//
//  ViewController.m
//  Bill Splitter
//
//  Created by Ali Barış Öztekin on 2017-02-19.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UISlider *splitterSlider;
@property (weak, nonatomic) IBOutlet UILabel *splitAmountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculateSplitAmount:(id)sender {
    
    NSNumberFormatter* numberFormatter = [NSNumberFormatter new];

    NSNumber* billAmount = [numberFormatter numberFromString:self.billTextField.text];
    NSDecimalNumber* billForCalculation =[NSDecimalNumber decimalNumberWithDecimal:[billAmount decimalValue]];
    NSLog(@"%@",[NSNumber numberWithInt:(int) self.splitterSlider.value] );

    NSDecimalNumber* splitAmount = [billForCalculation decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithInt:(int) self.splitterSlider.value] decimalValue]]];
    NSLog(@"split amount %@",splitAmount);
    numberFormatter.numberStyle= NSNumberFormatterCurrencyStyle;

    self.splitAmountLabel.text =[numberFormatter stringFromNumber:splitAmount];
    
}


@end
