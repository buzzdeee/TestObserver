/*
   Project: TestObserver

   Copyright (C) 2024 Free Software Foundation

   Author: Sebastian Reitenbach

   Created: 2024-10-02 15:21:25 +0200 by sebastia

   This application is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This application is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111 USA.
*/

#import <Foundation/Foundation.h>
#import "SpellObserver.h"
#import "DSASpell.h"



@implementation SpellObserver

- (instancetype)init {
    if (self = [super init]) {
        _spellItem = [[DSASpell alloc] init];
    }
    return self;
}

- (void)startObserving {
    // Add observer for the computed property `isActiveSpell`
    [self.spellItem addObserver:self
                     forKeyPath:@"isActiveSpell"
                        options:NSKeyValueObservingOptionNew
                        context:nil];
    
    NSLog(@"Observer added for isActiveSpell.");
}

// KVO Change Notification Handler
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"isActiveSpell"]) {
        NSLog(@"isActiveSpell changed: %@", change[NSKeyValueChangeNewKey]);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
