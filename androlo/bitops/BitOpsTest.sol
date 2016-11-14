pragma solidity ^0.4.1;

import {BitOps} from "github.com/ethereum/solidity-examples/androlo/bitops/BitOps.sol";

contract BitOpsTest {

    using BitOps for uint;

    function testGetBitSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20) * (i % 2);
            ret = ret && v.bit(i*20) == i % 2;
        }
    }

    function testGetBitFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bit(256);
    }

    function testGetBitsSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20) * (i*43 + 75);
            ret = ret && v.bits(i*20, 6) == (i*43 + 75) & 0x3F;
        }
    }

    // should throw
    function testGetBitsFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bits(255, 2);
    }

    function testSetBitSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = uint(0).setBit(i*20);
            ret = ret && v == 2**(i*20);
        }
    }

    // should throw
    function testSetBitFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).setBit(256);
    }

    function testClearBitSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = uint(~0).clearBit(i*20);
            ret = ret && v.setBit(i*20) == uint(~0);
        }
    }

    // should throw
    function testClearBitFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).clearBit(256);
    }

    function testToggleBitSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = uint(0).toggleBit(i*20);
            ret = ret && v.setBit(i*20) == 2**(i*20);
            v = v.toggleBit(i*20);
            ret = ret && v == 0;
        }
    }

    // should throw
    function testToggleBitFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).toggleBit(256);
    }

    function testBitSetSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20);
            ret = ret && v.bitSet(i*20);
        }
    }

    function testBitNotSetSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20);
            ret = ret && !uint(0).bitSet(i*20);
        }
    }

    // should throw
    function testBitSetFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bitSet(256);
    }

    function testBitsSetSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20) * 31;
            ret = ret && v.bitsSet(i*20, 5);
        }
    }

    function testBitsNotSetSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            ret = ret && !uint(0).bitsSet(i*20, 5);
        }
    }

    // should throw
    function testBitsSetFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bitsSet(255, 2);
    }

    function testBitEqualSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20);
            var u = 2**(i*20);
            ret = ret && v.bitEqual(u, i*20);
        }
    }

    function testBitNotEqualSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var u = 2**(i*20);
            ret = ret && !uint(0).bitEqual(u, i*20);
        }
    }

    // should throw
    function testBitEqualFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bitEqual(0, 256);
    }

    function testBitsEqualSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20) * 31;
            var u = 2**(i*20) * 31;
            ret = ret && v.bitsEqual(u, i*20, 5);
        }
    }

    function testBitsNotEqualSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var u = 2**(i*20) * 31;
            ret = ret && !uint(0).bitsEqual(u, i*20, 5);
        }
    }

    // should throw
    function testBitsEqualFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bitsEqual(0, 255, 2);
    }

    function testBitAndSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20);
            var u = 2**(i*20);
            ret = ret && v.bitAnd(u, i*20) == 1;
        }
    }

    // should throw
    function testBitAndFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bitAnd(0, 256);
    }

    function testBitsAndSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20) * 31;
            var u = 2**(i*20) * 31;
            ret = ret && v.bitsAnd(u, i*20, 5) == 31;
        }
    }

    // should throw
    function testBitsAndFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bitsAnd(0, 255, 2);
    }

    function testBitOrSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20);
            var u = 2**(i*20);
            ret = ret && v.bitOr(u, i*20) == 1;
        }
    }

    // should throw
    function testBitOrFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bitOr(0, 256);
    }

    function testBitsOrSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20) * 31;
            var u = 2**(i*20) * 31;
            ret = ret && v.bitsOr(u, i*20, 5) == 31;
        }
    }

    // should throw
    function testBitsOrFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bitsOr(0, 255, 2);
    }

    function testBitXorSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20);
            var u = 2**(i*20);
            ret = ret && v.bitXor(u, i*20) == 0;
        }
    }

    // should throw
    function testBitXorFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bitXor(0, 256);
    }

    function testBitsXorSuccess() constant returns (bool ret) {
        ret = true;
        for (uint i = 0; i < 10; i++) {
            var v = 2**(i*20) * 31;
            var u = 2**(i*20) * 31;
            ret = ret && v.bitsXor(u, i*20, 5) == 0;
        }
    }

    // should throw
    function testBitsXorFailIndexOOB() constant returns (bool ret) {
        ret = true;
        uint(0).bitsXor(0, 255, 2);
    }

}