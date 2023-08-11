// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20{
    uint256 internal supply;
    uint256 internal leftsupply;
    uint256 internal tokenPrice;

    mapping(address=>uint) internal owners;
    address private myAddress=0x669406ff143A2869D3709c888AF6eA15a419c498;

    constructor(uint _initSupply) ERC20("MyToken","MTK"){

        supply=_initSupply;
        tokenPrice=200000000000000000;
        
        _mint(myAddress,_initSupply);
        uint256 forMe=_initSupply/10;
        owners[myAddress]+=forMe;
        leftsupply=supply-forMe;
        emit Transfer(msg.sender, myAddress, owners[myAddress]);

    }
    function totalSupply() public view override  returns (uint){
        return uint(leftsupply);
    }
    function balanceOf(address tokenOwner) public view override returns (uint balance){
        return owners[tokenOwner];
    }

    function transfer(address to, uint tokens) public override returns (bool success){
        owners[msg.sender]+=tokens;
        leftsupply-=tokens;
        emit  Transfer(address(this), to, tokens);
        success=true;
        

    }

    function transferFrom(address from, address to, uint tokens) public override returns (bool success){
        uint256 own=owners[from];
        require(own>tokens,"sender dose not have enough tokens to send");
        owners[to]+=tokens;
        owners[from]-=tokens;

        emit Transfer(from, to, tokens);
        success=true;
    }

    function name() public pure override returns (string memory){
        return "MyToken";
    }
    function symbol() public pure override returns(string memory){
        return "MTK";
    }




}