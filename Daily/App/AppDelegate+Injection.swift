//
//  AppDelegate+Injection.swift
//  Daily
//
//  Created by Jason Gilmour on 21/12/2020.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
//    register { TestDataTaskRepository() as TaskRepository }.scope(application)
    register { LocalTaskRepository() as TaskRepository }.scope(application)
  }
}
