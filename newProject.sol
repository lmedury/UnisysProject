pragma solidity ^0.5.0;

contract Health_care{
    
    uint noOfCustomers=0;
    struct customer{
        uint id;
        address customerAddress;
        string name;
        uint age;
        string[] hashOfMedicalReports;
        string[] hashOfInsurancePolicies;
        string mobileNo;
        bool active;
    }
    
    mapping(uint => customer) public customerDetails;
    
    uint noOfHospitals=0;
    struct hospitals{
        uint id;
        address hospitalAddress;
        string name;
        address[] patientsVisited;
        bool active;
        string[] reports;
    }
    
    mapping(uint => hospitals) public hospitalDetails;
    
    uint noOfInsurers=0;
    
    struct insurers {
        uint id;
        address insurerAddress;
        string name;
        address[] customersInsured;
        string[] hashOfPolicyDocument;
        bool active;
    }
    
    mapping(uint => insurers) public insurerDetails;
    
    uint noOfTrainers=0;
    
    struct trainers{
        uint id;
        address trainerAddress;
        string name;
        uint numberOfPatients;
        bool active;
    }
    
    mapping(uint=>trainers) public trainerDetails;
    
    uint noOfDoctors=0;
    struct doctors{
        uint id;
        address doctorAddress;
        string name;
        uint numberOfPatients;
        bool active;
    }
    
    mapping(uint => doctors) public doctorDetails;
    
    uint insuranceId=0;
    struct RequireInsurance{
        uint customerId;
        uint insurerId;
        uint id;
        string nameOfPerson;
        uint ageOfPerson;
        address customer;
        address payable insurer;
        bool active;
        string hash;
        bool paid;
        uint price;
    }
    
    uint noOfMedicalReports=0;
    struct medical{
        uint customerId;
        uint hospitalId;
        uint id;
        address patient;
        address payable hospital;
        string insuranceHash;
        string reportHash;
        uint billAmount;
        bool paid;
        bool active;
        uint time;
    }
    
    mapping(uint => medical) public medicalReports;
    
    mapping(uint => RequireInsurance) public insuranceRequests;
    //Registration
    function register(uint choice, string memory name) public {
        if(choice==1){
            noOfCustomers++;
            customerDetails[noOfCustomers].name=name;
            customerDetails[noOfCustomers].id=noOfCustomers;
        }
        else if(choice==2){
            noOfHospitals++;
            hospitalDetails[noOfHospitals].name=name;
            hospitalDetails[noOfHospitals].id=noOfHospitals;
        }
        else if(choice==3){
            noOfInsurers++;
            insurerDetails[noOfInsurers].name=name;
            insurerDetails[noOfInsurers].id=noOfInsurers;
        }
        else if(choice==4){
            noOfTrainers++;
            trainerDetails[noOfTrainers].name=name;
            trainerDetails[noOfTrainers].id=noOfTrainers;
        }
        else if(choice==5){
            noOfDoctors++;
            doctorDetails[noOfDoctors].name=name;
            doctorDetails[noOfDoctors].id=noOfDoctors;
        }
    }
    
    uint noOfConsent=0;
    struct consent{
        uint id;
        address givenBy;
        address givenTo;
        uint givenFor;
        string hash;
        bool active;
        
    }
    
    mapping(uint => consent) public Consent;
    
    function giveConsent(address receiver, uint noOfSeconds, string memory hash) public {
        noOfConsent++;
        Consent[noOfConsent].givenBy=msg.sender;
        Consent[noOfConsent].givenTo=receiver;
        Consent[noOfConsent].givenFor=now+noOfSeconds;
        Consent[noOfConsent].active=true;
        Consent[noOfConsent].hash=hash;
    }
    
    function postInsurance(string memory name, uint age, uint customerId) public {
        require(customerDetails[customerId].active==true);
        insuranceId++;
        insuranceRequests[insuranceId].nameOfPerson=name;
        insuranceRequests[insuranceId].ageOfPerson=age;
        insuranceRequests[insuranceId].customer=msg.sender;
        insuranceRequests[insuranceId].customerId=customerId;
    }
    
    function issueInsurance(uint id, string memory hash, uint price, uint insurerId) public {
        require(insurerDetails[insurerId].active==true);
        insuranceRequests[id].insurer=msg.sender;
        insuranceRequests[id].hash=hash;
        insuranceRequests[id].price=price;
        insuranceRequests[id].insurerId=insurerId;
    }
    
    function payInsurance(uint id) public payable {
        require(insuranceRequests[id].customer==msg.sender);
        require(insuranceRequests[id].price==msg.value);
        insuranceRequests[id].paid=true;
        customerDetails[insuranceRequests[id].customerId].hashOfInsurancePolicies.push(insuranceRequests[id].hash);
        insurerDetails[insuranceRequests[id].insurerId].hashOfPolicyDocument.push(insuranceRequests[id].hash);
        insurerDetails[insuranceRequests[id].insurerId].customersInsured.push(insuranceRequests[id].customer);
        insuranceRequests[id].insurer.transfer(msg.value);
    }
    
    function revokeConsent(uint consentId) public {
        require(Consent[consentId].givenBy==msg.sender);
        Consent[consentId].active=false;
    }
    
    function retriveDocumentHash(uint consentId) public view returns(string memory) {
        require(Consent[consentId].givenTo == msg.sender);
        require(Consent[consentId].givenFor > now);
        require(Consent[consentId].active==true);
        return (Consent[consentId].hash);
    }
    
    function visitHospital(string memory insuranceHash, address payable hospitalAddress, uint time, uint customerId) public {
        noOfMedicalReports++;
        medicalReports[noOfMedicalReports].customerId=customerId;
        medicalReports[noOfMedicalReports].patient=msg.sender;
        medicalReports[noOfMedicalReports].active=true;
        medicalReports[noOfMedicalReports].insuranceHash=insuranceHash;
        medicalReports[noOfMedicalReports].hospital=hospitalAddress;
        medicalReports[noOfMedicalReports].time=now+time;
    }
    
    function hospitalInsuranceView(uint id) public view returns(string memory){
        require(medicalReports[id].hospital==msg.sender);
        require(medicalReports[id].active==true);
        require(medicalReports[id].time>now);
        return (medicalReports[id].insuranceHash);
    }
    
    function hospitalUpdate(string memory medicalHash, uint bill, uint id, uint hospitalId) public{
        require(medicalReports[id].hospital==msg.sender);
        medicalReports[id].billAmount=bill;
        medicalReports[id].hospitalId=hospitalId;
        medicalReports[id].reportHash=medicalHash;
    }
    
    function payHospital(uint id) public payable{
        require(medicalReports[id].patient==msg.sender);
        require(medicalReports[id].billAmount==msg.value);
        medicalReports[id].paid=true;
        customerDetails[medicalReports[id].customerId].hashOfMedicalReports.push(medicalReports[id].reportHash);
        hospitalDetails[medicalReports[id].hospitalId].patientsVisited.push(medicalReports[id].patient);
        hospitalDetails[medicalReports[id].hospitalId].reports.push(medicalReports[id].reportHash);
    }
    //Getter Functions
    function getNumberOfCustomers() public view returns(uint){
        return noOfCustomers;
    }
    
    function getNumberOfHospitals() public view returns(uint){
        return noOfHospitals;
    }
    
    function getNumberOfInsurers() public view returns(uint){
        return noOfInsurers;
    }
    
    function getNumberOfTrainers() public view returns(uint){
        return noOfTrainers;
    }
    
    function getNumberOfDoctors() public view returns(uint){
        return noOfDoctors;
    }
    
    function getNumberOfConsent() public view returns(uint){
        return noOfConsent;
    }
    
    function getNumberOfInsurance() public view returns(uint){
        return insuranceId;
    }
}
    
