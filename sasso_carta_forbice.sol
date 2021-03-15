pragma solidity 0.8;

contract SassoCartaForbici {
 enum hand {SASSO, CARTA, FORBICI}
 enum result {VINTO, PERSO, PAREGGIO}


 //Return result in string form
 function resultToString(result res) public pure returns(string memory) {
   if (res == result.VINTO) {
     return "Hai Vinto! :)";
   }
   if (res == result.PERSO) {
     return "Hai Perso! :(";
   }
   if (res == result.PAREGGIO) {
     return "PAREGGIO! :O";
   }
   return "";
 }
 
  // Get a random hand
 function generateHand() public view returns(hand){
   // uint8 rand = uint8(uint256(keccak256(block.timestamp))%3 + 1);
   uint rand = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 3;
   if (rand == 1) {
     return hand.CARTA;
   }
   if (rand == 2) {
     return hand.FORBICI;
   }
   if (rand == 3) {
     return hand.SASSO;
   }
 }


 // Convert int to hand
 function convertHand(uint256 choice) public pure returns(hand){
   if (choice == 1) {
     return hand.CARTA;
   }
   if (choice == 2) {
     return hand.FORBICI;
   }
   if (choice == 3) {
     return hand.SASSO;
   }
 }

 // Determine winning
 function determineWin(hand SoftStrategy,hand TU) public pure returns(result) {
   // Check tie
   if (SoftStrategy == TU) {
     return result.PAREGGIO;
   }
   // Check win/lose
   if (SoftStrategy == hand.SASSO) {
     if (TU == hand.CARTA) {
       return result.VINTO;
     } else {
       return result.PERSO;
     }
   }
   if (SoftStrategy == hand.CARTA) {
     if (TU == hand.FORBICI) {
       return result.VINTO;
     } else {
       return result.PERSO;
     }
   }
   if (SoftStrategy == hand.FORBICI) {
     if (TU == hand.SASSO) {
       return result.VINTO;
     } else {
       return result.PERSO;
     }
   }
 }
}