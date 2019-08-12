type Storage = {
    name: string
}

var M = Contract<Storage>()

function M:init()
    self.storage.name = 'change_other_contract_property_contract'
    print('change_other_contract_property contract inited')
end

function M:start(arg: string)
    print("start api called of change_other_contract_property_contract")
    let simple_contract: object = import_contract 'simple_contract'
    simple_contract.start = self.start
    print("change other contract func success(but should fail)")
    simple_contract.id = '123'
    simple_contract.name = 'abc'
    print("change other contract properties success(but should fail)")
    pprint('simple contract: ', simple_contract)
    return "hello " .. arg
end

return M
