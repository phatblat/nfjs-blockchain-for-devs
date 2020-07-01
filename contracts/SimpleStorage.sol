pragma solidity >=0.5.0 <0.7.0;

contract SimpleStorage {
    uint storedData;

    constructor() public {
        set(10);
    }

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}
