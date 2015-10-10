//
//  TXLoginRegisterTextField.m
//  BSBDJ
//
//  Created by TimXu on 10/5/15.
//  Copyright © 2015 TimXu. All rights reserved.
//

#import "TXLoginRegisterTextField.h"


@implementation TXLoginRegisterTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*

- (void)awakeFromNib{
    
    self.tintColor = [UIColor whiteColor];
    self.textColor = [UIColor whiteColor];
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
    [self addTarget:self action:@selector(editingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
}

- (void)editingDidBegin{
    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
}

- (void)editingDidEnd{
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
}
*/

/*

- (void)awakeFromNib{
    self.tintColor = [UIColor whiteColor];
    self.textColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidBegin) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editingDidEnd) name:UITextFieldTextDidEndEditingNotification object:self];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)editingDidBegin{
    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
}

- (void)editingDidEnd{
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
}
 
*/

/*
- (void)awakeFromNib{
    self.tintColor = [UIColor whiteColor];
    self.textColor = [UIColor whiteColor];
    
    [self setValue:[UIColor grayColor] forKeyPath:TXPlaceholderColorKey];
    
}

- (BOOL)becomeFirstResponder{
    [self setValue:[UIColor whiteColor] forKeyPath:TXPlaceholderColorKey];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder{
    [self setValue:[UIColor grayColor] forKeyPath:TXPlaceholderColorKey];
    return [super resignFirstResponder];
}
*/

- (void)awakeFromNib{
    self.tintColor = [UIColor whiteColor];
    self.textColor = [UIColor whiteColor];
    
    self.placeholderColor = [UIColor grayColor];
}

- (BOOL)becomeFirstResponder{
    self.placeholderColor = [UIColor whiteColor];
    return  [super becomeFirstResponder];
}

-(BOOL)resignFirstResponder{
    self.placeholderColor = [UIColor grayColor];
    return [super resignFirstResponder];
}
@end
