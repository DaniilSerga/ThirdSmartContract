// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo {
    // require
    // revert
    // assert

    address owner;

    // Конструктор
    constructor() 
    {
        owner = msg.sender;
    }

    // indexed реализует возможность поиска в журнале событий
    event Paid(address indexed _from, uint _amount, uint _timestamp);

    // Модификатор
    modifier onlyOwner(address _to)
    {
        // Panic
        // assert(msg.sender == owner);

        // Альтернативная и более удобная форма:        
        // require(msg.sender == owner, "You are not the owner.");

        // Проверка на то, является ли инициатор контракта владельцем денежных средств
        // if (msg.sender != owner)
        // {
        //     revert("You are not the owner.");
        // }

        require(msg.sender == owner, "You are not the owner.");

        require(_to != address(0), "Incorrect address!");
        // Выход из модификатора и переход к телу функции (обязательная часть модификатора)
        _;
    }

    // Можно оставить без тела, т.к. денежные средства и так будут начислены
    function pay() external payable
    { 
        // Порождение события Paid
        emit Paid(msg.sender, msg.value, block.timestamp);
    }

    // Модификатор onlyOwner избавляет от лишнего кода в теле функции
    function withdraw(address payable _to) external onlyOwner (_to)
    {
        _to.transfer(address(this).balance);
    }

    function balance() public view returns(uint _balance) 
    {
        _balance = address(this).balance;
    }
}