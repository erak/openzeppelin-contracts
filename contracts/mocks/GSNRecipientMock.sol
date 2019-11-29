pragma solidity >=0.5.0 <0.7.0;

import "./ContextMock.sol";
import "../GSN/GSNRecipient.sol";

// By inheriting from GSNRecipient, Context's internal functions are overridden automatically
contract GSNRecipientMock is ContextMock, GSNRecipient {
    function withdrawDeposits(uint256 amount, address payable payee) public {
        _withdrawDeposits(amount, payee);
    }

    function acceptRelayedCall(address, address, bytes calldata, uint256, uint256, uint256, uint256, bytes calldata, uint256)
        external
        override
        view
        returns (uint256, bytes memory)
    {
        return (0, "");
    }

    function _preRelayedCall(bytes memory) internal override returns (bytes32) {
        // solhint-disable-previous-line no-empty-blocks
    }

    function _postRelayedCall(bytes memory, bool, uint256, bytes32) internal override {
        // solhint-disable-previous-line no-empty-blocks
    }

    function upgradeRelayHub(address newRelayHub) public {
        return _upgradeRelayHub(newRelayHub);
    }

    function _msgSender() internal override(Context, GSNRecipient) view returns (address payable) {
        return super._msgSender();
    }

    function _msgData() internal override(Context, GSNRecipient) view returns (bytes memory) {
        return super._msgData();
    }
}
