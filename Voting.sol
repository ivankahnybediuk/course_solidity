// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Voting {
    
    address owner;
    uint public party_id;
    uint public voter_id;
    
 
    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
         _;
      }
     
     modifier isAlreadyVotes() {
        require(Voters[msg.sender] == 0, "You have already voted!");
         _;
      }
      
    constructor() {
       owner = msg.sender;    
    }

    struct party {
        string name;
        uint id;
    }
    
    struct candidat {
        string name;
        uint partyId;
        uint amount;
    }
   
    mapping(uint => party) public Party;
    
    mapping(uint => candidat) public Candidats;
    
    mapping(address => uint) public Voters; 
    
    
    function addParty(string memory _name) public isOwner{
        party_id += 1;
        Party[party_id] = party(_name, party_id);
    }
    
    function addCandidat(string memory _name, uint _party_id) public isOwner{
        Candidats[_party_id] = candidat (_name, _party_id, 0);
    }
    
    function voteProcess(uint _id_candidat) public isAlreadyVotes{
            voter_id += 1;
            Voters[msg.sender] = voter_id;
            Candidats[_id_candidat].amount += 1;
    }
    
    /* Вибори мера версія 1.00
   1.  Партии структура (название, ID)
   2. Структура кандидатов (имя, партия (id), количество голосов) - мапинг структуры -> ID
       struct  candidat {
                          String name;
                          Uint partita;
                          Uint amount;
   }
   mapping(id -> candidat) Candidats;
   3. Мапинг (адресс -> id) [(address, id), (address, id)] voiting[address] = 0 !=0 уже проголосовал
   4. Функцию по добавлению партий
   5. Функцию по добавлению кандидатов в меры
   6. Функция по голосованию address = msg.sender; id кандидата voteProcess(id) { 
           6.0 Проверить голосовал ли этот человек уже
           6.1 Добавить голос в структуру кандидатов в соответствии с ID кандидата 
           6.2 Добавить голосовавшего в мапинг address->id */
    
}
