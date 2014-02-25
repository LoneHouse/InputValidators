//
//  ConfirmPasswordInputValidator.m
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "ConfirmPasswordInputValidator.h"

NSString *const kConfirmPasswordValidatorDescription = @"Input validation failed.";
NSString *const kConfirmPasswordValidatorReason = @"Passwords do not match. Please try again.";

@implementation ConfirmPasswordInputValidator

- (id)initWithInput:(NSString *)inputString andPatternString:(NSString *)pattern {
	if (self = [self initWithInput:inputString]) {
		self.patternString = pattern;
	}
	
	return self;
}

- (BOOL)validateError:(NSError *__autoreleasing *)error {
	BOOL validationResult = YES;
	
	if (![self.input isEqualToString:self.patternString]) {
		validationResult = NO;
		NSDictionary *userInfo = @{
								   NSLocalizedDescriptionKey: kConfirmPasswordValidatorDescription, NSLocalizedFailureReasonErrorKey: kConfirmPasswordValidatorReason
								   };
		*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
	}
	
	return validationResult;
}

@end
