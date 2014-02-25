//
//  PasswordInputValidator.m
//  Copyright (c) 2013 WeezLabs, Inc. All rights reserved.
//

#import "PasswordInputValidator.h"

NSString *const kPasswordValidatorRegex = @"[A-Z0-9a-z._%+-]{1,50}";
NSString *const kPasswordValidatorDescription = @"Input validation failed.";
NSString *const kPasswordValidatorReason = @"Password must be under 50 characters.";
NSString *const kEmptyPasswordValidatorReason = @"Password must be provided.";
NSString *const kSpacesInPasswordReason = @"Password field does not support spaces.";

@implementation PasswordInputValidator

- (BOOL)validateError:(NSError *__autoreleasing *)error {
	BOOL validationResult = YES;
	
	if ([self.input isEqualToString:@""]) {
		NSDictionary *userInfo = @{
								   NSLocalizedDescriptionKey: kEmptyValidatorDescription, NSLocalizedFailureReasonErrorKey: kEmptyPasswordValidatorReason
								   };
		*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
		validationResult = NO;
	}
	else
		if ([self.input rangeOfString:@" "].location != NSNotFound) {
			NSDictionary *userInfo = @{
									   NSLocalizedDescriptionKey: kEmptyValidatorDescription, NSLocalizedFailureReasonErrorKey: kSpacesInPasswordReason
									   };
			*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
			validationResult = NO;
		}
		else {
			NSError *regError = nil;
			NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:kPasswordValidatorRegex options:NSRegularExpressionAnchorsMatchLines error:&regError];
			NSUInteger numberOfMatches = [regex numberOfMatchesInString:self.input options:NSMatchingAnchored range:NSMakeRange(0, [self.input length])];
			
			// if there is not a single match
			// then return an error and NO
			if (numberOfMatches != 1) {
				if (error != nil) {
					NSDictionary *userInfo = @{
											   NSLocalizedDescriptionKey: kPasswordValidatorDescription, NSLocalizedFailureReasonErrorKey: kPasswordValidatorReason
											   };
					*error = [NSError errorWithDomain:kErrorDomain code:1001 userInfo:userInfo];
				}
				
				validationResult = NO;
			}
		}
	
	return validationResult;
}

@end
