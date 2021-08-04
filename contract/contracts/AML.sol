pragma solidity =0.8.1;

contract AML{
    struct Org{
        uint international_securities_identifier;
        string organization_name;
        bool hasActivityStatus;
        string businessClassifier;
        string RegisteredAddress;
        string isDomiciledIn;
        bool sanStatus;
        address admin;
    }
    
    mapping(address => Org) public orgs;
    
    mapping(address => address[]) public views;
    
    address public sender;
    address payable public receiver;
    
    function addOrg(address org, uint _international_securities_identifier, string calldata _organization_name, bool _hasActivityStatus, string calldata _businessClassifier, string calldata _RegisteredAddress, string calldata _isDomiciledIn, bool _sanStatus) external{
        orgs[org] = Org(_international_securities_identifier, _organization_name, _hasActivityStatus, _businessClassifier, _RegisteredAddress, _isDomiciledIn, _sanStatus, msg.sender);
    }
    
    function showOrg(address org) external view returns(uint international_securities_identifier, string memory organization_name, bool hasActivityStatus, string memory businessClassifier, string memory RegisteredAddress, string memory isDomiciledIn, bool sanStatus){
        return(orgs[org].international_securities_identifier, orgs[org].organization_name, orgs[org].hasActivityStatus, orgs[org].businessClassifier, orgs[org].RegisteredAddress, orgs[org].isDomiciledIn, orgs[org].sanStatus);
    }
    
    function updateOrg(address org, uint _international_securities_identifier, string calldata _organization_name, bool _hasActivityStatus, string calldata _businessClassifier, string calldata _RegisteredAddress, string calldata _isDomiciledIn, bool _sanStatus) external{
        require(msg.sender == orgs[org].admin, "You are not authorized to make this change!");
        orgs[org].international_securities_identifier = _international_securities_identifier;
        orgs[org].organization_name = _organization_name;
        orgs[org].hasActivityStatus = _hasActivityStatus;
        orgs[org].businessClassifier = _businessClassifier;
        orgs[org].RegisteredAddress = _RegisteredAddress;
        orgs[org].isDomiciledIn = _isDomiciledIn;
        orgs[org].sanStatus = _sanStatus;
    }
    
    function deposit(address payable _receiver) external payable {
        require(msg.value > 0, "The deposit should be more than 0!");
        sender = msg.sender;
        receiver = _receiver;
    }
}