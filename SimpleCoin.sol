pragma solidity ^0.4.0; // 컴파일러의 지원 버전

contract SimpleCoin {   // 클래스 (컨트랙트 정의)

  /**
  상태 변수를 주소와 정수 사이의 매핑으로 정의한다. 상태변수는 클래스의 멤버 변수와 같다. 매핑은 해시 테이블 또는 해시 맵과 동일
  ex) 키 는 주소(address, 이더리움 사용자 계정 또는 컨트랙트 계정을 나타내는 20바이트 값) 이고 값은 부호가 없는 256 비트 정수인 unit256 이다.
   */
  mapping (address => uint256) public coinBalance; 
 
  constructor() public {  // 생성자
    coinBalance[0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C] = 10000; // 새 컨트랙트가 생성될 때 10,000 SimpleCoin 토큰을 코인 계정 주소에 할당.
  }
 
  /**
    함수 호출자의 계정에서 지정된 계정으로 일정 수의 SimpleCoin 토큰을 전송하는 함수 정의
    스마트 컨트랙트 용어에서 함수 호출자는 transaction sender 이다.
    msg 는 수신된 msg 메시지를 나아태는 용도로 정의된 툭수한 변수. msg 에는 다양한 속성이 있으며 그중 msg.sender 는 호출자인 트랜잭션을 보낸 사람의 주소를 나타낸다.
  */
  function transfer(address _to, uint256 _amount) public { 
    // 메시지 발신자의 잔액을 지정된 토큰 수만큼 줄인다. msg.ender 는 보낸 사람의 주소를 나타낸다. (보내는 사람 잔고 감산)
    coinBalance[msg.sender] -= _amount;
    // 지정된 토큰 수만큼 동전 잔고를 증가시킨다. (받는사람 잔고 증산)
    coinBalance[_to] += _amount;
  }
}