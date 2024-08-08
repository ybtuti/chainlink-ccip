// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import {XNFT} from "../src/XNFT.sol";

contract DeployXNFTArbitrum is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address ccipRouterAddressArbitrumSepolia = 0xe4Dd3B16E09c016402585a8aDFdB4A18f772a07e;
        address linkTokenAddressArbitrumSepolia = 0xb1D4538B4571d411F07960EF2838Ce337FE1E80E;
        uint64 chainSelectorArbitrumSepolia = 3478487238524512106;

        XNFT xNft = new XNFT(
            ccipRouterAddressArbitrumSepolia,
            linkTokenAddressArbitrumSepolia,
            chainSelectorArbitrumSepolia
        );

        console.log("XNFT deployed to ", address(xNft));

        vm.stopBroadcast();
    }
}
