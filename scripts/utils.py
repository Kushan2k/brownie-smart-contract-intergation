from brownie import network,accounts,config,Storage,FundMe,GetPrice

def getAccount():
    
    if network.show_active()=='development':
        return accounts[0]
    else:
        return accounts.add(config['wallets']['from_key'])

contracts={
    'fund_me':FundMe,
    'storage':Storage,
    'get_price':GetPrice
}

def getDeployedOrDeployNewContract(name:str):
    
    contract=contracts.get(name,None)
    if(contract==None):
        return
    
    if(len(contract)>0):
        return contract[-1]
    else:
        if(name=='get_price'):
            c=contract.deploy(
                config['networks'][network.show_active()]['aggregatorv3interface'],
                {
                'from':getAccount()
                }
            )
            return c
        else:
            c=contract.deploy(
                {
                'from':getAccount()
                }
            )
            return c
