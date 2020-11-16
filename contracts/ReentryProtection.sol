pragma solidity 0.6.4;

import {ReentryProtectionStorage as RPStorage} from "./storage/ReentryProtectionStorage.sol";

contract ReentryProtection {

  modifier noReentry { // 修饰符
    // Use counter to only write to storage once
    RPStorage.StorageStruct storage s = RPStorage.load(); // RP存储
    s.lockCounter++; // 计数器
    uint256 lockValue = s.lockCounter;
    _;
    require(lockValue == s.lockCounter, "ReentryProtection.noReentry: reentry detected");
  }

}
