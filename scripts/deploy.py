from scripts.utils import getAccount,getDeployedOrDeployNewContract
from brownie import GetPrice,network,config,Contract,web3,MyToken


def deploy_contract():
    deploy_mytoken_contract()

    

def deploy_mytoken_contract():
    account=getAccount()

    if(not len(MyToken)>0):
        print('deploying contract')
        mytoken=MyToken.deploy(10000,{'from':account})
    else:
        print("getting already deplyed contract")
        mytoken=MyToken[-1]
    
    send_address='0x5BCCD45a9607BC12ecc9ACeeE55b67cE0EA5A264'
    print("balance of ",mytoken.balanceOf(account))
    
    tx=mytoken.transferFrom(account,send_address,150,{'from':account})
    tx.wait(1)
    
    print("balance of ",send_address, mytoken.balanceOf(send_address))


def main():
    deploy_contract()