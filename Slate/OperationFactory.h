//
//  OperationFactory.h
//  Slate
//
//  Created by Jigish Patel on 5/28/11.
//  Copyright 2011 Jigish Patel. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see http://www.gnu.org/licenses

#import <Foundation/Foundation.h>
#import "Operation.h"

@interface OperationFactory : NSObject {}

+ (id)createOperationFromString:(NSString *)opString;

+ (id)createMoveOperationFromString:(NSString *)moveOperation;
+ (id)createResizeOperationFromString:(NSString *)resizeOperation;
+ (id)createPushOperationFromString:(NSString *)pushOperation;
+ (id)createNudgeOperationFromString:(NSString *)nudgeOperation;
+ (id)createThrowOperationFromString:(NSString *)throwOperation;
+ (id)createCornerOperationFromString:(NSString *)cornerOperation;
+ (id)createChainOperationFromString:(NSString *)chainOperation;
+ (id)createLayoutOperationFromString:(NSString *)layoutOperation;
+ (id)createFocusOperationFromString:(NSString *)focusOperation;
+ (id)createSnapshotOperationFromString:(NSString *)snapshotOperation;
+ (id)createActivateSnapshotOperationFromString:(NSString *)activateSnapshotOperation;
+ (id)createDeleteSnapshotOperationFromString:(NSString *)deleteSnapshotOperation;
+ (id)createHintOperationFromString:(NSString *)hintOperation;

@end
