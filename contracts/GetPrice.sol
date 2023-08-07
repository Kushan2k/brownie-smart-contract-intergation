// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
contract GetPrice{

    AggregatorV3Interface internal priceFeeds;

    constructor(address _interface){
        priceFeeds=AggregatorV3Interface(_interface);

    }

    function convert(int256 dollers) public view returns(int256){
        int256 ans=0;
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        )=priceFeeds.latestRoundData();

        ans=dollers/answer;


        return int256(answer);

    }
    

}
