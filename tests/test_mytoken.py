from brownie import MyToken

from scripts.utils import getAccount


def test_mytoken_contract():
    account=getAccount()
    if(len(MyToken)>0):
        mytoken=MyToken.deploy(10000,{'from':account})
    else:
        mytoken=MyToken[-1]
    
    totoal=mytoken.totalSupply()
    expected=10000

    assert totoal==expected