pragma solidity ^0.5.0;

contract Project{
        
        address private owner;
        
        constructor() public{
            owner=msg.sender;
        }
        
        uint public noOfDrugs;
        
        struct drug{
            string nameOfDrug;
            uint mrp;
            
            string ingredients;
        }
        
        mapping(uint => drug) public drugs;
        
        struct pack{
            address supplier;
            address manufacturer;
            address retailer;
            address buyer;
            string dateOfPurchase;
            int drugId;
        }
        
        mapping(uint =>pack) public packaging;
        
        struct customer{
            string name;
            int noOfPurchases;
        }
        
        mapping(address => customer) public customers;
    
        struct supply{
            uint drugId;
            string ingredients;
            uint quantity;
        }
        
        mapping(address => supply) public suppliers;
        
        struct manufacture{
            uint drugId;
            uint quantity;
        }
        
        mapping(address => manufacture) public manufacturers;
        
        struct retail{
            uint count;
            uint[] medicines;
            uint[] quantity;
        }
        
        mapping(address => retail) public retailers;
        
        modifier write(bool _condition) {
        require(_condition);
        _;
        }
        
        function insert(string memory name, string memory ingredients, uint mrp) public write(msg.sender==owner) {
            noOfDrugs++;
            drugs[noOfDrugs].nameOfDrug=name;
            drugs[noOfDrugs].mrp=mrp;
            drugs[noOfDrugs].ingredients=ingredients;
           
        }
        
        function nameofDrug(uint drugId) public view returns(string memory){
            return drugs[drugId].nameOfDrug;
        }
        
        function ingredientsofDrug(uint drugId) public view returns(string memory){
            return drugs[drugId].ingredients;
        }
        
        function mrpOfDrug(uint drugId) public view returns(uint){
            return drugs[drugId].mrp;
        }
        
        function supplierUpdate(uint _drugId, uint _quantity, string memory _ingredients) public{
            suppliers[msg.sender].drugId=_drugId;
            suppliers[msg.sender].quantity+=_quantity;
            suppliers[msg.sender].ingredients=_ingredients;
        }
        
        function buyManufacturer(uint _drugId, address payable supplierAddress, uint _quantity) public payable {
            require(msg.value == drugs[_drugId].mrp*_quantity);
            require(_quantity>=1000);
            require(_drugId<noOfDrugs);
          
            if(suppliers[supplierAddress].drugId==_drugId) {
                if(suppliers[supplierAddress].quantity>=_quantity){
                    suppliers[supplierAddress].quantity-=_quantity;
                    manufacturers[msg.sender].drugId=_drugId;
                    manufacturers[msg.sender].quantity+=_quantity;
                    supplierAddress.transfer(msg.value);
                }
            }
          
        }
        
        function buyRetailer(uint _drugId, address payable manufacturerAddress, uint _quantity) public payable {
            require(msg.value == drugs[_drugId].mrp*_quantity);
            require(_quantity<=50);
            require(_drugId<noOfDrugs);
          
            if(manufacturers[manufacturerAddress].drugId==_drugId) {
                if(manufacturers[manufacturerAddress].quantity>=_quantity){
                    manufacturers[manufacturerAddress].quantity-=_quantity;
                    retailers[msg.sender].count++;
                    uint value=retailers[msg.sender].count;
                    retailers[msg.sender].medicines[value]=_drugId;
                    retailers[msg.sender].quantity[value]+=_quantity;
                    manufacturerAddress.transfer(msg.value);
                }
            }
          
        }
        
        function buyCustomer(uint drugId, uint _quantity, address payable retailerAddress) public payable{
            require(msg.value == drugs[drugId].mrp*_quantity);
            require(_quantity<=50);
            require(drugId<noOfDrugs);
            bool available=false;
            uint variable;
            for(uint i=1; i<10; i++){
                if(retailers[retailerAddress].medicines[i]==drugId) {
                    variable=i;
                    available=true;
                }
            }
            if(available){
                if(retailers[retailerAddress].quantity[variable] >= _quantity){
                    retailers[retailerAddress].quantity[variable] -= _quantity;
                    retailerAddress.transfer(msg.value);   
                }
                  
            }
        }
        
        
}   
