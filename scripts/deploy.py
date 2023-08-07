from scripts.utils import getAccount,getLatestDeploymentStorage



def main():

    s=getLatestDeploymentStorage()
    print(s.retrieve())

    print("Done")

    
    
    




main()