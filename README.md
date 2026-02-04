## 🐶 NFT-Collection
# 📖 Description

NFT Collection is a creative NFT project that allows users to mint a Puppy Dog NFT into a wallet of their choice and also mint another NFT which dynamically changes the NFT’s appearance based on mood.

After minting, the NFT can display either:

a Happy face, or

a Sad face,

depending on the user’s selected mood.

This project was built as a hands-on exploration of ERC721 NFTs, metadata handling, testing, and secure deployment practices. It was both a technical learning experience and a genuinely fun project to build.

# 📑 Table of Contents

- Getting Started

- Project Structure

- What I Learned

- Future Improvements

## 🚀 Getting Started
# Prerequisites

Ensure you have the following installed:

- Git

- Foundry

- Node.js (optional)

- MetaMask wallet

- Alchemy account

- Etherscan account
- 
- IPFS desktop application
  
## Setup & Installation
```
# Clone the repository
git clone https://github.com/Joshkovu/NFT-Collection.git
cd NFT-Collection

# Install dependencies
forge install

# Compile contracts
forge build

# Run tests
forge test -vvv
```
Wallet & Environment Setup
# Securely import your private key (DO NOT expose it)
```
cast wallet import <wallet-name> --interactive
```

# ⚠️ Security Note
- You should never ever expose your private key in code, commits, or environment files.
- Always use interactive wallet imports or environment variables for sensitive data.

# 🗂 Project Structure

Sample structure — adjust to match your repository.

```
├── src/
│   ├── MoodNft.sol            # ERC721 NFT contract of the different moods
|   ├── BasicNft.sol           # Dog NFT contract
│   
│
├── script/
│   ├── DeployMoodScript.s.sol    # Deployment mood script
|   ├── DeployScript.s.sol        #Deploy basic NFT contract
│   └── Interactions.s.sol      # Use of devops tools
│
├── test/
│   ├── unit/
│   │   └── DeployMoodNftTest.t.sol  # Unit tests
|   |   ├── MoodNftTest.t.sol 
│   └── integration/
│       └── BasicNftTest.t.sol
|       ├── MoodNftIntegration.t.sol 
│
├── lib/
│   └── forge-std
|   └── foundry-devops/
|   └── openzeppelin-contracts/
│
├── foundry.toml
└── README.md
```
# 🧠 What I Learned

- This project significantly strengthened my understanding of NFT development, testing, and secure deployment workflows.

# 🖼 ERC721 NFTs

- Learned how to use OpenZeppelin’s ERC721 contract

- Successfully minted NFTs directly into a MetaMask wallet

- Implemented dynamic NFT behavior (happy vs sad states)

# 🧱 Project Structure & Code Organization

- Gained clarity on where functions should live

- Learned how to organize contracts, scripts, and tests properly

- Improved overall code readability and maintainability

# 📝 NatSpec Documentation

Learned how to use NatSpec to document:

- Title

- author

- notice

Made the contracts easier to understand for auditors and other developers

# 🔐 Secure Deployment Practices

Learned how to:

- Use an Etherscan API key for contract verification

- Configure a Sepolia RPC URL using Alchemy

- Securely encrypt and manage private keys using

- cast wallet import <name> --interactive
  
- To use a Makefile properly

- Understood why exposing private keys is one of the biggest security mistakes in Web3

# 🧪 Testing with Foundry Cheatcodes

Used Foundry cheatcodes to:

- Simulate real-world scenarios

- Write better unit tests

- Create meaningful integration tests

- Developed a deeper appreciation for why testing is critical in smart contract development—especially for immutable code

# 🔮 Future Improvements

- Increase test coverage with more edge-case tests

- Extend the project to mint additional NFT types

- Add support for multiple moods or traits

- Build a simple NFT marketplace for trading the NFTs

## Below are just some URI's i was using in order to store them in ipfs and they helped in the minting process of the NFT's
```

data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdo
dD0iNTAwIj4KICAgIDx0ZXh0IHg9IjAiIHk9IjE1IiBmaWxsPSJibGFjayI+WW91IGNvZGVkIHRo
aXMgPC90ZXh0PgoKICAgIDxzdmc+

Happy SVG:
data:image/svg+xml;base64,
PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgaGVpZ2h0PSI0MDAiIHhtbG5z
PSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8Y2lyY2xlIGN4PSIxMDAiIGN5PSIx
MDAiIGZpbGw9InllbGxvdyIgcj0iNzgiIHN0cm9rZT0iYmxhY2siIHN0cm9rZS13aWR0aD0iMyIg
Lz4KICAgIDxnIGNsYXNzPSJleWVzIj4KICAgICAgICA8Y2lyY2xlIGN4PSI3MCIgY3k9IjgyIiBy
PSIxMiIgLz4KICAgICAgICA8Y2lyY2xlIGN4PSIxMjciIGN5PSI4MiIgcj0iMTIiIC8+CiAgICA8
L2c+CiAgICA8cGF0aCBkPSJtMTM2LjgxIDExNi41M2MuNjkgMjYuMTctNjQuMTEgNDItODEuNTIt
LjczIiBzdHlsZT0iZmlsbDpub25lOyBzdHJva2U6IGJsYWNrOyBzdHJva2Utd2lkdGg6IDM7IiAv
Pgo8L3N2Zz4=

Sad SVG:
data:image/svg+xml;base64,
PHN2ZyB3aWR0aD0iMTAyNHB4IiBoZWlnaHQ9IjEwMjRweCIgdmlld0JveD0iMCAwIDEwMjQgMTAy
NCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGZpbGw9IiMz
MzMiCiAgICAgICAgZD0iTTUxMiA2NEMyNjQuNiA2NCA2NCAyNjQuNiA2NCA1MTJzMjAwLjYgNDQ4
IDQ0OCA0NDggNDQ4LTIwMC42IDQ0OC00NDhTNzU5LjQgNjQgNTEyIDY0em0wIDgyMGMtMjA1LjQg
MC0zNzItMTY2LjYtMzcyLTM3MnMxNjYuNi0zNzIgMzcyLTM3MiAzNzIgMTY2LjYgMzcyIDM3Mi0x
NjYuNiAzNzItMzcyIDM3MnoiIC8+CiAgICA8cGF0aCBmaWxsPSIjRTZFNkU2IgogICAgICAgIGQ9
Ik01MTIgMTQwYy0yMDUuNCAwLTM3MiAxNjYuNi0zNzIgMzcyczE2Ni42IDM3MiAzNzIgMzcyIDM3
Mi0xNjYuNiAzNzItMzcyLTE2Ni42LTM3Mi0zNzItMzcyek0yODggNDIxYTQ4LjAxIDQ4LjAxIDAg
MCAxIDk2IDAgNDguMDEgNDguMDEgMCAwIDEtOTYgMHptMzc2IDI3MmgtNDguMWMtNC4yIDAtNy44
LTMuMi04LjEtNy40QzYwNCA2MzYuMSA1NjIuNSA1OTcgNTEyIDU5N3MtOTIuMSAzOS4xLTk1Ljgg
ODguNmMtLjMgNC4yLTMuOSA3LjQtOC4xIDcuNEgzNjBhOCA4IDAgMCAxLTgtOC40YzQuNC04NC4z
IDc0LjUtMTUxLjYgMTYwLTE1MS42czE1NS42IDY3LjMgMTYwIDE1MS42YTggOCAwIDAgMS04IDgu
NHptMjQtMjI0YTQ4LjAxIDQ4LjAxIDAgMCAxIDAtOTYgNDguMDEgNDguMDEgMCAwIDEgMCA5Nnoi
IC8+CiAgICA8cGF0aCBmaWxsPSIjMzMzIgogICAgICAgIGQ9Ik0yODggNDIxYTQ4IDQ4IDAgMSAw
IDk2IDAgNDggNDggMCAxIDAtOTYgMHptMjI0IDExMmMtODUuNSAwLTE1NS42IDY3LjMtMTYwIDE1
MS42YTggOCAwIDAgMCA4IDguNGg0OC4xYzQuMiAwIDcuOC0zLjIgOC4xLTcuNCAzLjctNDkuNSA0
NS4zLTg4LjYgOTUuOC04OC42czkyIDM5LjEgOTUuOCA4OC42Yy4zIDQuMiAzLjkgNy40IDguMSA3
LjRINjY0YTggOCAwIDAgMCA4LTguNEM2NjcuNiA2MDAuMyA1OTcuNSA1MzMgNTEyIDUzM3ptMTI4
LTExMmE0OCA0OCAwIDEgMCA5NiAwIDQ4IDQ4IDAgMSAwLTk2IDB6IiAvPgo8L3N2Zz4=
```
# 🙌 Appreciation

If you appreciate this project and my work, feel free to connect with me on my socials:

[![Joash_Kuteesa Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://x.com/JoashKutee80790)
[![Joash_Kuteesa Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/joshkovu/)
