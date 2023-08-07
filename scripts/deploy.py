from scripts.utils import getAccount,getLatestDeploymentStorage
from brownie import Storage


def main():

    account=getAccount()
    # balance=account.balance().to('ether')
    s=Storage.deploy({'from':account},publish_source=True)

    print(getLatestDeploymentStorage().retrieve())

    
    
    




main()