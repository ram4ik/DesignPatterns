//
//  CommandExample.swift
//  DesignPatterns
//
//  Created by ramil on 07.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

class Account {
    
    var accountName: String
    var balance: Int
    
    init(accountName: String, balance: Int) {
        self.accountName = accountName
        self.balance = balance
    }
}


protocol CommandExample {
    func execute()
    var isComplete: Bool { get set }
}

class Deposit: CommandExample {
    
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        _account.balance += _amount
        isComplete = true
    }
}

class Withdraw: CommandExample {
    
    private var _account: Account
    private var _amount: Int
    var isComplete = false
    
    init(account: Account, amount: Int) {
        self._account = account
        self._amount = amount
    }
    
    func execute() {
        if _account.balance >= _amount {
            _account.balance -= _amount
            isComplete = true
        } else {
            print("Not enough money")
        }
    }
}

class TransactionManager {
    
    static let shared = TransactionManager()
    private init() {}
    private var _transactions: [CommandExample] = []
    
    var pendingTransactions: [CommandExample] {
        get {
            return self._transactions.filter{ $0.isComplete == false }
        }
    }
    
    func addTransactions(command: CommandExample) {
        self._transactions.append(command)
    }
    
    func processingTransactions() {
        _transactions.filter{ $0.isComplete == false }.forEach{ $0.execute() }
    }
}


class CommandExamleExecutor {
    func execute() {
        
        let account = Account(accountName: "Akulov Ivan", balance: 1000)
        let transactionManager = TransactionManager.shared
        transactionManager.addTransactions(command: Deposit(account: account, amount: 100))
        transactionManager.addTransactions(command: Withdraw(account: account, amount: 500))
        transactionManager.pendingTransactions
        print(account.balance)
        transactionManager.processingTransactions()
        print(account.balance)
    }
}






















