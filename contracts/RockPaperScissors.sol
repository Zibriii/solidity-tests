// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";


/**
 * @title RockPaperScissors
 * @dev A little Rock Paper Scissors smart contract game
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract RockPaperScissors{ 

    event GameCreated();
    event GameStarted();
    event GameComplete(address winner);


    uint256 gameStarterBet;
    address gameStarter;
    address gameParticipant;
    address whitelistedGameParticipant;
    address gameWinner;
    uint moveGameStarter;
    string stringMoveGameStarter;
    uint moveGameParticipant;
    string stringMoveGameParticipant;



    function createGame(address participant) public payable {
        require(msg.value > 0, "The bet value should be greater than zero");
        gameStarterBet = msg.value;
        gameStarter = msg.sender;
        whitelistedGameParticipant = participant;
        moveGameStarter=0;
        moveGameParticipant=0;
        emit GameCreated();
    }

    function joinGame() public payable {
        require(msg.sender == whitelistedGameParticipant, "Sorry you are not whitelisted");
        require(msg.value >= gameStarterBet, "The bet value should be equal to the one from the game starter");
        gameParticipant = msg.sender;
        console.log("gameStarterBet ",gameStarterBet);
        if(msg.value>gameStarterBet){
            console.log("Amount provided too high, starting transfer of ", msg.value-gameStarterBet," back to : ", gameParticipant);
            payable(gameParticipant).transfer(msg.value-gameStarterBet);
            console.log("Amount provided too high : ", msg.value-gameStarterBet," transfered back to : ", gameParticipant);
        }
        emit GameCreated();
    }


    function makeMove(uint move) public {
        require(move == 1 || move == 2 || move == 3, "The move value should be equal to 1, 2 or 3");
        string memory stringMove;
        if(move==1){
            stringMove="rock";
        }
        else if(move==2){
            stringMove="paper";
        }
        else if(move==3){
            stringMove="scissors";
        }

        if(msg.sender==gameStarter){
            moveGameStarter=move;
            stringMoveGameStarter=stringMove;
        }else if(msg.sender==gameParticipant){
            moveGameParticipant=move;
            stringMoveGameParticipant=stringMove;
        }

        console.log(gameParticipant," played :", stringMoveGameParticipant);
        console.log(gameStarter," played :", stringMoveGameStarter);


        if(moveGameStarter!=0 && moveGameParticipant!=0){
            if (moveGameStarter==1){
                if (moveGameParticipant == 1){
                    gameWinner=address(0);
                }
                else if (moveGameParticipant == 2){
                    gameWinner=gameParticipant;
                }
                else if (moveGameParticipant == 3){
                    gameWinner=gameStarter;
                }
            }
            else if (moveGameStarter == 2){
                if (moveGameParticipant == 1){
                    gameWinner=gameStarter;
                }
                else if (moveGameParticipant == 2){
                    gameWinner=address(0);
                }
                else if (moveGameParticipant == 3){
                    gameWinner=gameParticipant;
                }
            }
            else if (moveGameStarter == 3){
                if (moveGameParticipant == 1){
                    gameWinner=gameParticipant;
                }
                else if (moveGameParticipant == 2){
                    gameWinner=gameStarter;
                }
                else if (moveGameParticipant == 3){
                    gameWinner=address(0);
                }
            }
            console.log(gameParticipant," played :", stringMoveGameParticipant);
            console.log(gameStarter," played :", stringMoveGameStarter);
            console.log("Game winner :  ", gameWinner);

            if(gameWinner!=address(0)){
                payable(gameWinner).transfer(gameStarterBet*2);
                console.log(gameStarterBet*2," transfered to : ", gameWinner);
            }else{
                payable(gameStarter).transfer(gameStarterBet);
                payable(gameParticipant).transfer(gameStarterBet);
                console.log(gameStarterBet," transfered to : ", gameStarter);
                console.log(gameStarterBet," transfered to : ", gameParticipant);
            }

            moveGameStarter=0;
            moveGameParticipant=0;
            emit GameComplete(gameWinner);
        }
        

    }

}
