# Personal Gas Token Proxy
The contract that allows you to save ETH for your transactions. It burns Gas Token after each transation and saves up to 42% of the network fees.

## Install
1. `npm i`

## Deploy
1. `cp .env.example .env` and specify your account `PRIVATE_KEY`, this account will be owner of the proxy.
2. `npx truffle migrate --network mainnet --reset` You can specify other networks as well (`kovan`, `ropsten`, etc)
3. Send some GST2 to the deployed proxy. You can [`mint`](https://etherscan.io/address/0x0000000000b3F879cb30FE243b4Dfee438691c04#writeContract) it or buy at [uniswap.io](https://v1.uniswap.exchange/swap)

## Usage
Encode calldata to following format:
```
[
    [
        "0xbD68E8226d753d4534e6DdE1c7C875D221e0ce4d" // target
        "0x34d83b4200000000000000000000000000000000000000000000000000000000000003e8" // calldata
    ],
    [
        "0xA62993BFb0f1C8a505b07240d6518D9C0342444C" "0x34d83b420000000000000000000000000000000000000000000000000000000000000008"
    ]
]
```

and call the `execute` method.

## TODO
1. JS library or UI that helps encode calldata