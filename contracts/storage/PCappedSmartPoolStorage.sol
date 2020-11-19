pragma solidity ^0.6.4;

library PCappedSmartPoolStorage {// Capped 封顶   在 smart-pools PV2SmartPool.sol中引入了
  bytes32 public constant pcsSlot = keccak256("PCappedSmartPool.storage.location");

  struct StorageStruct {
    uint256 cap;
  }

  /**
        @notice Load PBasicPool storage
        @return s Pointer to the storage struct
    */
  function load() internal pure returns (StorageStruct storage s) {
    bytes32 loc = pcsSlot;
    assembly {
      s_slot := loc
    }
  }
}
