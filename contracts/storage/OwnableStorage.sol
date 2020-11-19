pragma solidity 0.6.4;
// storage文件夹下创建库，在test 文件夹下 的自定义合约中 使用库
library OwnableStorage {
  bytes32 public constant oSlot = keccak256("Ownable.storage.location");
  struct StorageStruct {
    address owner;
  }

  /**
        @notice Load pool token storage
        @return s Storage pointer to the pool token struct
    */
  function load() internal pure returns (StorageStruct storage s) {
    bytes32 loc = oSlot;
    assembly {
      s_slot := loc
    }
  }
}
