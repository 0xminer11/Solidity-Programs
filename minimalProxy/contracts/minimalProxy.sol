pragma solidity 0.8.20;

import "@openzeppelin/contracts/proxy/Clones.sol";

contract minimalProxy{
address private _implemention;
    function cloneContract() public returns(address){
       return Clones.clone(_implemention);
    }

    function cloneContractWithSalt( bytes32 salt)public returns(address){ 
       return Clones.cloneDeterministic(_implementaion,salt);
    }

    function implemention() view returns(address){
        return _implemention;
    }

}