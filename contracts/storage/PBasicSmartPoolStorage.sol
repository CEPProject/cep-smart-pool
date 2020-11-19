pragma solidity ^0.6.4;
// storage文件夹下创建库，在 libraries 文件夹下 的合约中 使用库
import "../interfaces/IBPool.sol"; // 从 接口 引入 IBPool.sol

library PBasicSmartPoolStorage {
  bytes32 public constant pbsSlot = keccak256("PBasicSmartPool.storage.location");

  struct StorageStruct {
    IBPool bPool;
    address controller;
    address publicSwapSetter;
    address tokenBinder;
  }

  /**
        @notice Load PBasicPool storage
        @return s Pointer to the storage struct
    */
  function load() internal pure returns (StorageStruct storage s) {
    bytes32 loc = pbsSlot;
    assembly {
      s_slot := loc
    }
  }
}
