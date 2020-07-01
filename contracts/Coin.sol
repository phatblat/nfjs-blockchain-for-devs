pragma solidity >=0.5.0 <0.7.0;

contract Coin {
    address public minter;
    mapping (address => uint) public balances;

    // Events allow clients to react to specific contract changes you declare
    event Sent(address from, address to, uint amount);

    // only run when contract created
    constructor() public {
        minter = msg.sender;
    }

    // Sends an amount of newly created coins to an address.
    // Can only be called by the contract creator.
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter, "Sender == Minter");
        require((amount < 1e60), "Amount isn't too big");

        balances[receiver] += amount;
    }

    // Sends an amount of existing coins from any caller to an address.
    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

    function getBalance(address account) public view returns (uint) {
        return balances[account];
    }
}
