from brownie import network,accounts,config,Storage

def getAccount():
    
    if network.show_active()=='development':
        return accounts[0]
    else:
        return accounts.add(config['wallets']['from_key'])

def getLatestDeploymentStorage():

    if network.show_active()!='development':
        return Storage[-1]
    else:
        return Storage.deploy({'from':getAccount()})