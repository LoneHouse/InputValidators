//
//  ConfirmPasswordInputValidator.h
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "InputValidator.h"

extern NSString *const kConfirmPasswordValidatorDescription;
extern NSString *const kConfirmPasswordValidatorReason;

@interface ConfirmPasswordInputValidator : InputValidator
@property (nonatomic, strong) NSString *patternString;

- (id)initWithInput:(NSString *)inputString andPatternString:(NSString *)pattern;
@end
