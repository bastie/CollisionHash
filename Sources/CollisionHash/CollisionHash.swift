/*
 * SPDX-FileCopyrightText: 2023 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: MIT
 */

import CryptoKit

/// Implementation of CollisionsHash
public protocol CollisionHashImpl {
  // see default implementation in the extension
  func hash (_ base: (UInt8, UInt8)) -> (UInt8,UInt8)
}

extension CollisionHashImpl {
  public func hash (_ base: (UInt8,UInt8)) -> (UInt8,UInt8) {
    let pearson = PearsonHash.hash(input: [base.0,base.1])
    var collisionOffset = -1
    for first in 0 ... base.0 as ClosedRange<UInt8> {
      for second in 0 ... 255 as ClosedRange<UInt8> {
        let actually = PearsonHash.hash(input: [first,second])
        if pearson == actually {
          collisionOffset += 1
        }
        if first == base.0 && second == base.1 {
          return (pearson, UInt8(collisionOffset))
        }
      }
    }
    fatalError("no perfect hash algorithm for input used")
  }
}



@available(macOS 10.15, *)
// since macOS 10.15 place this algorithm in Insecure are best
// Let a protocol abstract the implementation over unsupported macOS versions
extension Insecure {
  ///
  /// The CollisionHash wrapper struct for macOS 10.15 or newer
  /// The implementation is in the CollisionHashImpl extension.
  ///
  public struct CollisionHash : CollisionHashImpl {
    public init (){
    }
  }
}

///
/// The CollisionHash wrapper struct for macOS before 10.15
/// The implementation is in the CollisionHashImpl extension.
///
public struct CollisionHash : CollisionHashImpl {
  public init () {
  }
}

