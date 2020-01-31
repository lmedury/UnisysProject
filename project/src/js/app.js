App = {
  web3Provider: null,
  contracts: {},
  contract: null,
  web3: null,

  init: function() {
    return App.initWeb3();
  },

  initWeb3: function() {
    if (typeof web3 !== 'undefined') {
      App.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    } else {
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
      web3.eth.defaultAccount = web3.eth.accounts[0]
      web3 = new Web3(App.web3Provider);
    }
    return App.initContract();
      
  },

  initContract: function() {
    /*
    $.getJSON("Booking.json", function(booking) {
      // Instantiate a new truffle contract from the artifact
      App.contracts.Booking = contract..at(0xfd59f127b4b700e07f5d4f5027b5068633fe4985);
      // Connect provider to interact with contract
      App.contracts.Booking.setProvider(App.web3Provider);
      return App.render();
    });*/
    
    var abi=[{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"constant":true,"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"VehicleInsurance","outputs":[{"internalType":"string","name":"registrationNumber","type":"string"},{"internalType":"string","name":"registrationDate","type":"string"},{"internalType":"bool","name":"status","type":"bool"},{"internalType":"uint256","name":"referenceNumber","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"bool","name":"active","type":"bool"},{"internalType":"address","name":"customer","type":"address"},{"internalType":"address payable","name":"partner","type":"address"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"bool","name":"paid","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"licenseNo","type":"string"},{"internalType":"string","name":"name","type":"string"}],"name":"companyRegister","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"consentDeals","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"consentGrocery","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"consentVehicleInsurance","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"consenthealthInsurance","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"credentials","outputs":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"string","name":"password","type":"string"},{"internalType":"string","name":"field","type":"string"},{"internalType":"bool","name":"active","type":"bool"},{"internalType":"bool","name":"registered","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"dealers","outputs":[{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"licenseNo","type":"string"},{"internalType":"uint256","name":"positiveFeedback","type":"uint256"},{"internalType":"uint256","name":"negativeFeedback","type":"uint256"},{"internalType":"bool","name":"active","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"deals","outputs":[{"internalType":"string","name":"likes","type":"string"},{"internalType":"string","name":"availability","type":"string"},{"internalType":"uint256","name":"numberOfPeople","type":"uint256"},{"internalType":"uint256","name":"budget","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"address","name":"customer","type":"address"},{"internalType":"address payable","name":"seller","type":"address"},{"internalType":"bool","name":"status","type":"bool"},{"internalType":"uint256","name":"referenceNumber","type":"uint256"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"bool","name":"paid","type":"bool"},{"internalType":"bool","name":"active","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"groceries","outputs":[{"internalType":"string","name":"list","type":"string"},{"internalType":"string","name":"Address","type":"string"},{"internalType":"string","name":"date","type":"string"},{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"address","name":"customer","type":"address"},{"internalType":"address payable","name":"partner","type":"address"},{"internalType":"bool","name":"status","type":"bool"},{"internalType":"uint256","name":"ref","type":"uint256"},{"internalType":"bool","name":"paid","type":"bool"},{"internalType":"bool","name":"active","type":"bool"},{"internalType":"uint256","name":"price","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"grocersList","outputs":[{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"licenseNo","type":"string"},{"internalType":"uint256","name":"positiveFeedback","type":"uint256"},{"internalType":"uint256","name":"negativeFeedback","type":"uint256"},{"internalType":"bool","name":"active","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"healthInsurance","outputs":[{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"age","type":"uint256"},{"internalType":"string","name":"history","type":"string"},{"internalType":"uint256","name":"budget","type":"uint256"},{"internalType":"bool","name":"status","type":"bool"},{"internalType":"uint256","name":"referenceNumber","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"bool","name":"active","type":"bool"},{"internalType":"address","name":"customer","type":"address"},{"internalType":"address payable","name":"partner","type":"address"},{"internalType":"uint256","name":"price","type":"uint256"},{"internalType":"bool","name":"paid","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"healthInsurers","outputs":[{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"licenseNo","type":"string"},{"internalType":"uint256","name":"positiveFeedback","type":"uint256"},{"internalType":"uint256","name":"negativeFeedback","type":"uint256"},{"internalType":"bool","name":"active","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"referenceNumber","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"uint256","name":"price","type":"uint256"}],"name":"insureHealth","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"referenceNumber","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"uint256","name":"price","type":"uint256"}],"name":"insureVehicle","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"referenceNumber","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"uint256","name":"price","type":"uint256"}],"name":"offerDeal","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"list","type":"string"},{"internalType":"string","name":"Address","type":"string"},{"internalType":"string","name":"date","type":"string"}],"name":"orderGrocery","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"uint256","name":"referenceNumber","type":"uint256"},{"internalType":"uint256","name":"price","type":"uint256"}],"name":"packGrocery","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"uint256","name":"referenceNumber","type":"uint256"}],"name":"payDeal","outputs":[],"payable":true,"stateMutability":"payable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"uint256","name":"referenceNumber","type":"uint256"}],"name":"payGrocer","outputs":[],"payable":true,"stateMutability":"payable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"uint256","name":"referenceNumber","type":"uint256"}],"name":"payHealthInsurace","outputs":[],"payable":true,"stateMutability":"payable","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"},{"internalType":"uint256","name":"referenceNumber","type":"uint256"}],"name":"payVehicleInsurace","outputs":[],"payable":true,"stateMutability":"payable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"likes","type":"string"},{"internalType":"string","name":"availability","type":"string"},{"internalType":"uint256","name":"noOfPeople","type":"uint256"},{"internalType":"uint256","name":"budget","type":"uint256"}],"name":"postDeal","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"password","type":"string"},{"internalType":"string","name":"field","type":"string"}],"name":"register","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"licenseNo","type":"string"},{"internalType":"string","name":"name","type":"string"}],"name":"registerGrocer","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"licenseNo","type":"string"},{"internalType":"string","name":"name","type":"string"}],"name":"registerHealthInsurer","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"licenseNo","type":"string"},{"internalType":"string","name":"name","type":"string"}],"name":"registerVehicleInsurer","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"history","type":"string"},{"internalType":"uint256","name":"age","type":"uint256"},{"internalType":"uint256","name":"budget","type":"uint256"}],"name":"requireHealthInsurance","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"registrationNumber","type":"string"},{"internalType":"string","name":"registrationDate","type":"string"}],"name":"requireVehicleInsurance","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"vehicleInsurers","outputs":[{"internalType":"string","name":"name","type":"string"},{"internalType":"string","name":"licenseNo","type":"string"},{"internalType":"uint256","name":"positiveFeedback","type":"uint256"},{"internalType":"uint256","name":"negativeFeedback","type":"uint256"},{"internalType":"bool","name":"active","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"viewGroceryRef","outputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"viewHealthRef","outputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"id","type":"uint256"}],"name":"viewVehicleRef","outputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"}]
    var MallContract=web3.eth.contract(abi)
    App.contract= MallContract.at('0x1100096bED5Ca9C363A41f0e8a119979a0285ab8');
    //var contract= Bookingcontract.at('0xced9ce45b8376f42c1bf68cff9fdd57eb747191f');

    return App.render();

  },

  render: function() {
    //var bookingInstance;
    var loader = $("#loader");
    var content = $("#content");

    

    
    web3.eth.getCoinbase(function(err, account) {
      if (err === null) {
        App.account = account;
        $("#accountAddress").html("Account: " + account);
      }
    });

    App.newOffer();
    //App.makeNewOffer();
    //App.contract.getNumberOfEvents().then(async function(numberOfEvents) {
    loader.hide();
    content.show();

  },
  /*
  makeNewOffer: function() {
    
  }
  */

  newOffer: function() {
    var reference;
    
    $("#groceryUpdate").click(async function() {
      var glist=$("#glist").val();
      var gAddress=$("#gAddress").val();
      var gdate=$("#gdate").val();
      App.contract.orderGrocery(glist,gAddress,gdate,{from: App.account},function(error,result){
      if(error) console.log(error);
      else console.log(result);
      });
    });

    $("#insuranceRequest").click(async function() {
      var name=$("#hname").val();
      var history=$("#hhistory").val();
      var age =$("#hage").val();
      var budget=$("#hbudget").val();
      App.contract.requireHealthInsurance(name,history,age,budget,{from: App.account},function(error,result){
      if(error) console.log(error);
      else console.log(result);
      });
    });

    $("#vehicleInsuranceRequest").click(async function() {
      var id=$("#vrid").val();
      var date=$("#vrdate").val();
      
      //var etherAmount = web3.toBigNumber($("#sendWei").val());
      //var weiValue = web3.toWei(etherAmount,'wei');
      //App.contract.confirmPurchase(id,quantity,{from: App.account,value: weiValue},function(error,result){
      App.contract.requireVehicleInsurance(id,date,{from: App.account},function(error,result){
      if(error) console.log(error);
      else console.log(result);
      }); 
      //$("#cnfno").html("Your ticket number is: " + result);
      /*
      App.contract.refID.call(2,function(error,result){
        if(!error){
         $("#cnfno").html("Your ticket number is: " + result);
        }
        else{
          console.log(error);
        }
      })
      */
      
    });

    $("#postDeal").click(async function() {
      var event=$("#dlikes").val();
      var available=$("#davailability").val();
      var quantity=$("#dnoOfPeople").val();
      var budget=$("#dbudget").val();
      App.contract.postDeal(event,available,quantity,budget,{from: App.account},function(error,result){
      if(error) console.log(error);
      else console.log(result);
      });
    });
    
    $("#invalid").click(async function() {
      var id=$("#evId").val();
      var address=$("#address").val();
      App.contract.invalidItinerary(id,address,{from: App.account},function(error,result){
      if(error) console.log(error);
      else console.log(result);
      });
    });

    $("#claim").click(async function() {
      var id=$("#id").val();
      var quantity=$("#quantity").val();
      App.contract.FreeTransfer(id,quantity,{from: App.account},function(error,result){
      if(error) console.log(error);
      else console.log(result);
      });
    });

    $("#cnfReceived").click(async function() {
      var id=$("#eventId").val();
      var address=$("#ThisAddress").val();
      App.contract.confirmReceived(id,address,{from: App.account},function(error,result){
      if(error) console.log(error);
      else console.log(result);
      });
    });

  var thisAccount;

  web3.eth.getCoinbase(function(err, account) {
      if (err === null) {
        thisAccount = account;
        $("#thisAddress").html("Your Account: " + account);
      }
    });
  web3.eth.getCoinbase(function(err,account){
    if(!err){

  App.contract.dataStoring.call(account, function(error,thisData){
    if(!error){
      var thisEvents = $("#MyEvents");
      var id=thisData[0];
      var quantity=thisData[1];
      var refId=thisData[2];
      var sellerAddress=thisData[3];

      var template= "<tr><th>" + id + "</th><td>" + quantity + "</td><td>" + refId + "</td><td>" + sellerAddress + "</td></tr>" 
      if(quantity!=0) thisEvents.append(template);
    }
    else console.log(error);
      });
    }
  })

  App.contract.getNumberOfEvents(function(error,value){
    if(error) 
      console.log(error);
    else{
  
    var bookingEvents = $("#BookingEvents");
    

    for (var i = 1; i <= value; i++) {
          
          App.contract.Events.call( i, function(error,event) {
          if(!error){

          var id=event[0];
          var name = event[1];
          var price = event[5];
          var status = event[6];
          var time=event[7];
          var date=event[8];
          var quantity=event[9];
          var venue=event[10];
          var add=event[3];

          var thisStatus;
          if(quantity==0 && status==false){
            thisStatus="Inactive";
          }
          else if(price!=0 && status==false){
            thisStatus="Available for free";
          }
          else if(price!=0 && status==true && add==0x0000000000000000000000000000000000000000){
            thisStatus="Active";
          }

          else if(add!=0x0000000000000000000000000000000000000000){
            thisStatus="Booked";
          }      
          var bookingTemplate = "<tr><th>" + id + "</th><td>" + name + "</td><td>" + price + "</td><td>" + date + "</td><td>" + time + "</td><td>" + quantity + "</td><td>" + venue + "</td><td>" + thisStatus + "</td></tr>" ;
          
          if(quantity!=0) bookingEvents.append(bookingTemplate);
          }
          else{
            console.log(error);
          }        
        });
    }
    

    }
  });

  }
}  
   
$(function() {
  $(window).load(function() {
    App.init();
  });
});
