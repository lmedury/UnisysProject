pragma solidity ^0.5.0;

contract Mall{
    address owner;
    uint numberOfUsers;
    
    constructor() public{
        owner=msg.sender;
        numberOfUsers=0;
    }
    
    struct users{
        uint id;
        string password;
        string field;
        bool active;
        bool registered;
    }
    
    mapping (address => users) public credentials;
    
    uint numberOfMovies=0;
    
    struct movie{
        address payable buyer;
        address payable seller;
        uint id;
        string name;
        string date;
        string venue;
        uint price;
        uint count;
        bool status;
        bool active;
        string referenceNumber;
    }
    
    mapping(uint => movie) public movies;
    
    uint noOfOrders=0;
    
    struct grocery{
        string list;
        string Address;
        string date;
        uint id;
        address customer;
        address partner;
        bool status;
        uint ref;
        bool paid;
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
    
    struct deal{
        string likes;
        string availability;
        uint numberOfPeople;
        uint budget;
        uint id;
        address customer;
        address payable seller;
        bool status;
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
    
    struct electricity{
        string accountNo;
        uint price;
        uint id;
    }
    
    mapping(uint => electricity) public ebill;
    
    struct ebillCollector{
        string name;
        string licenseNo;
        uint positiveFeedback;
        uint negativeFeedback;
        bool active;
    }
    
    mapping(address => ebillCollector) public ebillCollectors;
    
    struct dth{
        string accountNo;
        uint price;
        uint id;
    }
    
    mapping(uint => dth) public dbill;
    
    struct dbillCollector{
        string name;
        string licenseNo;
        uint positiveFeedback;
        uint negativeFeedback;
        bool active;
    }
    
    mapping(address => dbillCollector) public dbillCollectors;
    
    struct mobile{
        string mobileNo;
        uint price;
        uint id;
    }
    
    mapping(uint => mobile) public mbill;
    
    struct mbillCollector{
        string name;
        string licenseNo;
        uint positiveFeedback;
        uint negativeFeedback;
        bool active;
    }
    
    mapping(address => mbillCollector) public mbillCollectors;
    
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
    
    function ebillRegister(string memory licenseNo, string memory name) public {
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
    
    function mbillRegister(string memory licenseNo, string memory name) public {
        bool flag=false;
        for(uint i=0; i<numberOfUsers; i++){
            if(credentials[msg.sender].active==true){
                flag=true;
                credentials[msg.sender].registered=true;
                break;
            }
        }
        require(flag==true);
        mbillCollectors[msg.sender].licenseNo=licenseNo;
        mbillCollectors[msg.sender].name=name;
    }
    
    function dbillRegister(string memory licenseNo, string memory name) public {
        bool flag=false;
        for(uint i=0; i<numberOfUsers; i++){
            if(credentials[msg.sender].active==true){
                flag=true;
                credentials[msg.sender].registered=true;
                break;
            }
        }
        require(flag==true);
        dbillCollectors[msg.sender].licenseNo=licenseNo;
        dbillCollectors[msg.sender].name=name;
        dbillCollectors[msg.sender].active=true;
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
        dbillCollectors[msg.sender].licenseNo=licenseNo;
        dbillCollectors[msg.sender].name=name;
        dbillCollectors[msg.sender].active=true;
    }
    
    function RMovie(string memory name, string memory date, string memory venue, uint price, uint count, string memory referenceNumber) public {
        numberOfMovies++;
        movies[numberOfMovies].name=name;
        movies[numberOfMovies].date=date;
        movies[numberOfMovies].venue=venue;
        movies[numberOfMovies].price=price;
        movies[numberOfMovies].status=true;
        movies[numberOfMovies].seller=msg.sender;
        movies[numberOfMovies].id=numberOfMovies;
        movies[numberOfMovies].count=count;
        movies[numberOfMovies].active=true;
        movies[numberOfMovies].referenceNumber=referenceNumber;
    }
    
    function purchaseMovie(uint id, uint quantity) public payable{
        require(movies[id].price*quantity == msg.value);
        require(movies[id].active==true);
        movies[id].active=false;
        movies[id].buyer=msg.sender;
    }
    
    function viewMovieRef(uint id) public view returns(string memory) {
        require(movies[id].buyer==msg.sender);
        return (movies[id].referenceNumber);
    }
    
    function orderGrocery(string memory list, string memory Address, string memory date) public {
        noOfOrders++;
        groceries[noOfOrders].customer=msg.sender;
        groceries[noOfOrders].list=list;
        groceries[noOfOrders].Address=Address;
        groceries[noOfOrders].date=date;
        groceries[noOfOrders].status=true;
        groceries[noOfOrders].id=noOfOrders;
        
    }
    
    function packGrocery(uint id, uint referenceNumber, uint price) public{
        require(grocersList[msg.sender].active=true);
        groceries[id].partner=msg.sender;
        groceries[id].ref=referenceNumber;
        groceries[id].price=price;
    }
    
    function payGrocer(uint id, uint referenceNumber) public payable{
        require(groceries[id].price==msg.value);
        require(groceries[id].ref==referenceNumber);
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
        VehicleInsurance[noOfVehicleInsurance].status=true;
    }
    
    function insureVehicle(uint referenceNumber, uint id, uint price) public {
        require(vehicleInsurers[msg.sender].active=true);
        VehicleInsurance[id].partner=msg.sender;
        VehicleInsurance[id].referenceNumber=referenceNumber;
        VehicleInsurance[id].price=price;
    }
    
    function payVehicleInsurace(uint id, uint referenceNumber) public payable{
        require(VehicleInsurance[id].customer==msg.sender);
        require(VehicleInsurance[id].referenceNumber==referenceNumber);
        require(VehicleInsurance[id].price==msg.value);
        VehicleInsurance[id].paid==true;
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
        healthInsurance[noOfHealthInsurance].status=true;
    }
    
    function insureHealth(uint referenceNumber, uint id, uint price) public {
        require(healthInsurers[msg.sender].active=true);
        healthInsurance[id].partner=msg.sender;
        healthInsurance[id].referenceNumber=referenceNumber;
        healthInsurance[id].price=price;
    }
    
    function payHealthInsurace(uint id, uint referenceNumber) public payable{
        require(healthInsurance[id].customer==msg.sender);
        require(healthInsurance[id].referenceNumber==referenceNumber);
        require(healthInsurance[id].price==msg.value);
        healthInsurance[id].paid==true;
    }
    
    function viewHealthRef(uint id) public view returns(uint,uint) {
        require(healthInsurance[id].customer==msg.sender);
        return (healthInsurance[id].referenceNumber,healthInsurance[id].price);
    }
}
