/**
 * @dev  interface for semi-fungible token
 */

interface ISFT {
    // write-state methods
    function transfer(address to, uint256 cid, uint256 value) external returns (bool);
    
    function transferFrom(address from, address to, uint256 cid, uint256 value) external returns (bool);

    function approve(address oprator, uint256 cid, uint256 value) external returns (bool);
    
    // read-state methods
    function totalSupply() external view returns (uint256);
    
    function classSupply(uint256 cid) external view returns (uint256);
    
    function balanceOf(address owner) external view returns (uint256);

    function balanceOfByClass(address owner, uint256 cid) external view returns (uint256);

    function allowance(address owner, address oprator, uint256 cid) external view returns (uint256);
    
    // events
    event Transfer(address indexed from, address indexed to, uint256 indexed cid, uint256 value);
    
    event Approval(address indexed owner, address indexed oprator, uint256 indexed cid, uint256 value);
}