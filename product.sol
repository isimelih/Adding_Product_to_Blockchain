// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Products is Ownable {
    string public productName;
    string[] public product;
    int256 private serialNumber;
    

    constructor(string memory _productName, int256 _serialNumber){
        productName = _productName;
        product.push(_productName);
        serialNumber = _serialNumber;
        
        
    }
    function addProduct(string memory _product) public{
        product.push(_product);
        

    }
    function displayProduct() public view returns (string[] memory){
        return product;
    }
    function isAdded(string memory _name) public view returns(bool){
        for(uint256 i = 0; i < product.length; i++){
            if(
                keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked((product[i])))
                ) return true;
        }
        return false;
    }
    function productCount() public view returns (uint256){
        return product.length;
    }
    function changeProductName(string memory _newName) public onlyOwner{
        productName = _newName;
    }
}
