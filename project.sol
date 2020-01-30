pragma solidity ^0.5.0;

contract Mall{
    address owner;
    uint numberOfUsers;
    
    constructor() public{
        owner=msg.sender;
        numberOfUsers=0;
    }
    //Storing Data
    struct users{
        uint id;
        string password;
        string field;
        bool active;
        bool registered;
    }
    
    mapping (address => users) public credentials;
    
    uint noOfOrders=0;
    
    struct grocery{
        string list;
        string Address;
        string date;
        uint id;
        address customer;
        address payable partner;
        bool status;
        uint ref;
        bool paid;
        bool active;
        uint price;
    }
    
    mapping(uint => grocery) public groceries;
    
    struct grocers{
        string name;
        string licenseNo;
        uint positiveFeedback;
        uint negativeFeedback;
        bool active;
    }
    
    mapping(address => grocers) public grocersList;
    
    uint noOfVehicleInsurance=0;
    
    struct VehicleInsure{
        string registrationNumber;
        string registrationDate;
        bool status;
        uint referenceNumber;
        uint id;
        bool active;
        address customer;
        address payable partner;
        uint price;
        bool paid;
    }
    
    mapping(uint => VehicleInsure) public VehicleInsurance;
    
    uint noOfHealthInsurance=0;
    
    struct HealthInsure{
        string name;
        uint age;
        string history;
        uint budget;
        bool status;
        uint referenceNumber;
        uint id;
        bool active;
        address customer;
        address payable partner;
        uint price;
        bool paid;    
    }
    
    mapping(uint => HealthInsure) public healthInsurance;
    
    struct vehicleInsure{
        string name;
        string licenseNo;
        uint positiveFeedback;
        uint negativeFeedback;
        bool active;
    }
    
    mapping(address => vehicleInsure) public vehicleInsurers;

    struct healthInsure{
        string name;
        string licenseNo;
        uint positiveFeedback;
        uint negativeFeedback;
        bool active;
    }
    
    mapping(address => healthInsure) public healthInsurers;
    
    uint noOfDeals=0;
    
    struct deal{
        string likes;
        string availability;
        uint numberOfPeople;
        uint budget;
        uint id;
        address customer;
        address payable seller;
        bool status;
        uint referenceNumber;
        uint price;
        bool paid;
        bool active;
    }
    
    mapping(uint => deal) public deals;
    
    struct dealer{
        string name;
        string licenseNo;
        uint positiveFeedback;
        uint negativeFeedback;
        bool active;
    }
    
    mapping(address => dealer) public dealers;
    
    //Registration and Validation
    function register(string memory password, string memory field) public {
        numberOfUsers++;
        credentials[msg.sender].password=password;
        credentials[msg.sender].field=field;
        credentials[msg.sender].active=true;
        credentials[msg.sender].id=numberOfUsers;
    }
    
    function registerGrocer(string memory licenseNo, string memory name) public {
        bool flag=false;
        for(uint i=0; i<numberOfUsers; i++){
            if(credentials[msg.sender].active==true && credentials[msg.sender].registered==false){
                //Need to check the above condition for initialization
                flag=true;
                credentials[msg.sender].registered=true;
                break;
            }
        }
        require(flag==true);
        grocersList[msg.sender].licenseNo=licenseNo;
        grocersList[msg.sender].name=name;
        grocersList[msg.sender].active=true;
    } 
    
    function registerHealthInsurer(string memory licenseNo, string memory name) public {
        bool flag=false;
        for(uint i=0; i<numberOfUsers; i++){
            if(credentials[msg.sender].active==true){
                flag=true;
                credentials[msg.sender].registered=true;
                break;
            }
        }
        require(flag==true);
        healthInsurers[msg.sender].licenseNo=licenseNo;
        healthInsurers[msg.sender].name=name;
        healthInsurers[msg.sender].active=true;
    }
    
    function registerVehicleInsurer(string memory licenseNo, string memory name) public {
        bool flag=false;
        for(uint i=0; i<numberOfUsers; i++){
            if(credentials[msg.sender].active==true){
                flag=true;
                credentials[msg.sender].registered=true;
                break;
            }
        }
        require(flag==true);
        vehicleInsurers[msg.sender].licenseNo=licenseNo;
        vehicleInsurers[msg.sender].name=name;
        vehicleInsurers[msg.sender].active=true;
    }
    
    function companyRegister(string memory licenseNo, string memory name) public {
        bool flag=false;
        for(uint i=0; i<numberOfUsers; i++){
            if(credentials[msg.sender].active==true){
                flag=true;
                credentials[msg.sender].registered=true;
                break;
            }
        }
        require(flag==true);
        dealers[msg.sender].licenseNo=licenseNo;
        dealers[msg.sender].name=name;
        dealers[msg.sender].active=true;
    }
    
    //Grocery
    function orderGrocery(string memory list, string memory Address, string memory date) public {
        noOfOrders++;
        groceries[noOfOrders].customer=msg.sender;
        groceries[noOfOrders].list=list;
        groceries[noOfOrders].Address=Address;
        groceries[noOfOrders].date=date;
        groceries[noOfOrders].status=false;
        groceries[noOfOrders].active=true;
        groceries[noOfOrders].id=noOfOrders;
        
    }
    
    function packGrocery(uint id, uint referenceNumber, uint price) public{
        require(grocersList[msg.sender].active==true);
        require(groceries[id].active==true);
        groceries[id].partner=msg.sender;
        groceries[id].ref=referenceNumber;
        groceries[id].price=price;
        groceries[id].status=true;
    }
    
    function payGrocer(uint id, uint referenceNumber) public payable{
        require(groceries[id].price==msg.value);
        require(groceries[id].ref==referenceNumber);
        groceries[id].partner.transfer(msg.value);
        groceries[id].paid=true;
    }
    
    function viewGroceryRef(uint id) public view returns(uint,uint) {
        require(groceries[id].customer==msg.sender);
        require(groceries[id].paid==true);
        return (groceries[id].ref,groceries[id].price);
    }
    
    //VehicleInsurance
    function requireVehicleInsurance(string memory registrationNumber, string memory registrationDate) public {
        noOfVehicleInsurance++;
        VehicleInsurance[noOfVehicleInsurance].registrationNumber=registrationNumber;
        VehicleInsurance[noOfVehicleInsurance].registrationDate=registrationDate;
        VehicleInsurance[noOfVehicleInsurance].customer=msg.sender;
        VehicleInsurance[noOfVehicleInsurance].status=false;
        VehicleInsurance[noOfVehicleInsurance].active=true;
        VehicleInsurance[noOfVehicleInsurance].id=noOfVehicleInsurance;
    }
    
    function insureVehicle(uint referenceNumber, uint id, uint price) public {
        require(vehicleInsurers[msg.sender].active==true);
        require(VehicleInsurance[id].active==true);
        VehicleInsurance[id].partner=msg.sender;
        VehicleInsurance[id].referenceNumber=referenceNumber;
        VehicleInsurance[id].price=price;
        VehicleInsurance[id].status=true;
    }
    
    function payVehicleInsurace(uint id, uint referenceNumber) public payable{
        require(VehicleInsurance[id].customer==msg.sender);
        require(VehicleInsurance[id].referenceNumber==referenceNumber);
        require(VehicleInsurance[id].price==msg.value);
        VehicleInsurance[id].partner.transfer(msg.value);
        VehicleInsurance[id].paid=true;
    }
    
    function viewVehicleRef(uint id) public view returns(uint,uint) {
        require(VehicleInsurance[id].customer==msg.sender);
        return (VehicleInsurance[id].referenceNumber,VehicleInsurance[id].price);
    }
    
    //healthInsurance
    function requireHealthInsurance(string memory name, string memory history, uint age, uint budget) public {
        noOfHealthInsurance++;
        healthInsurance[noOfHealthInsurance].name=name;
        healthInsurance[noOfHealthInsurance].history=history;
        healthInsurance[noOfHealthInsurance].age=age;
        healthInsurance[noOfHealthInsurance].budget=budget;
        healthInsurance[noOfHealthInsurance].customer=msg.sender;
        healthInsurance[noOfHealthInsurance].status=false;
        healthInsurance[noOfHealthInsurance].active=true;
    }
    
    function insureHealth(uint referenceNumber, uint id, uint price) public {
        require(healthInsurers[msg.sender].active==true);
        require(healthInsurance[id].active==true);
        healthInsurance[id].partner=msg.sender;
        healthInsurance[id].referenceNumber=referenceNumber;
        healthInsurance[id].price=price;
        healthInsurance[id].status=true;
    }
    
    function payHealthInsurace(uint id, uint referenceNumber) public payable{
        require(healthInsurance[id].customer==msg.sender);
        require(healthInsurance[id].referenceNumber==referenceNumber);
        require(healthInsurance[id].price==msg.value);
        healthInsurance[id].partner.transfer(msg.value);
        healthInsurance[id].paid=true;
    }
    
    function viewHealthRef(uint id) public view returns(uint,uint) {
        require(healthInsurance[id].customer==msg.sender);
        return (healthInsurance[id].referenceNumber,healthInsurance[id].price);
    }
    
    //Post deals
    function postDeal(string memory likes, string memory availability, uint noOfPeople, uint budget) public {
        noOfDeals++;
        deals[noOfDeals].likes=likes;
        deals[noOfDeals].availability=availability;
        deals[noOfDeals].numberOfPeople=noOfPeople;
        deals[noOfDeals].budget=budget;
        deals[noOfDeals].customer=msg.sender;
        deals[noOfDeals].status=false;
        deals[noOfDeals].active=true;
        deals[noOfDeals].id=noOfDeals;
    }
    
    function offerDeal(uint referenceNumber, uint id, uint price ) public {
        require(dealers[msg.sender].active==true);
        require(deals[id].active==true);
        deals[id].status=true;
        deals[id].seller=msg.sender;
        deals[id].referenceNumber=referenceNumber;
        deals[id].price=price;
    }
    
    function payDeal(uint id, uint referenceNumber) public payable{
        require(deals[id].customer==msg.sender);
        require(deals[id].referenceNumber==referenceNumber);
        require(deals[id].price==msg.value);
        deals[id].seller.transfer(msg.value);
        deals[id].paid=true;
    }
    
    function consentGrocery(uint id) public {
        require(groceries[id].customer==msg.sender);
        groceries[id].active=false;
    }
    
    function consentVehicleInsurance(uint id) public{
        require(VehicleInsurance[id].customer==msg.sender);
        VehicleInsurance[id].active=false;
    }
    
    function consenthealthInsurance(uint id) public{
        require(healthInsurance[id].customer==msg.sender);
        healthInsurance[id].active=false;
    }
    
    function consentDeals(uint id) public {
        require(deals[id].customer==msg.sender);
        deals[id].active=false;    
    }
    
}
