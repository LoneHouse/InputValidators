//
//  ConfirmEmailInputValidator.h
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "InputValidator.h"

extern NSString *const kConfirmEmailValidatorDescription;
extern NSString *const kConfirmEmailValidatorReason;

@interface ConfirmEmailInputValidator : InputValidator
@property (nonatomic, strong) NSString *patternString;
- (id)initWithInput:(NSString *)inputString andPatternString:(NSString *)pattern;

@end
