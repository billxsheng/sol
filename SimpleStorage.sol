// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {

    // uint256 favoriteNumber = 5;
    // bool favoriteBool = true;
    // string favoriteString = "String";
    // int256 favoriteInt = -5;
    // address favoriteAddress = 0x9EDE5C1D78EDE84A954Ac95778bb6eaa3A4C7811;
    // bytes32 favoriteBytes = "cat";
    
    // public scope can be called by anyone (includes variables)
    // external scope must be called by a different contract
    // private scope can only be called in the contract they are defined in and not in derived contracts
    // internal scope can only be called by other functions in the same derived contract 
    // no variable automatically sets to internal
    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view functions means we want to read state off blockchain (no transaction)
    // pure functions do some type of math (also do not change state of blockchain)
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    // memory means it will only be stored during function execution
    // storage means it will be stored after the function executes
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}