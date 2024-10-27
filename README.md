![image](https://github.com/user-attachments/assets/5a686a89-34ea-474e-993e-cd81edba5304)

# Minato(Soneium Testnet)

## Minato Setup Guide / Container Edition
The explanation is provided on the following page.

### EN:
[Minato Node Setup Guide (Container Edition)](https://medium.com/@cctksarah/minato-node-setup-guide-container-edition-a4803e3a377a)

### JA:

[Minato ノードのセットアップ](https://note.com/tksarahweb3/n/n97bfc88271b7)


# Node Startup Check
You can verify the node startup with the following script.
This is intended for Minato Node by using Docker containers.
The original reference can be found [here](https://github.com/smartcontracts/simple-optimism-node#operating-the-node).

## How to use

### Preparations

1. Copy the progress.sh file in this repository to the same directory as your .env file.
2. Install "cast" by following the instructions at https://getfoundry.sh/.
3. Load the .bashrc file with the source command to update the shell environment variables.
4. Grant execute permissions to progress.sh.

### Checking

After completing the preparations as described above, start the containers and run progress.sh.
If synchronization starts correctly, you will see the following output.

Note: However, if this is the first time you are starting the containers, it is advisable to wait about 30 seconds before executing the script.

```
# ./progress.sh
Chain ID: 1946
Sampling, please wait
Blocks per minute: 14340
Hours until sync completed: 20
```

If the op-node is not running(or it has any problems), you will see a message like the one below.
At this point, op-geth is running.

```
# ./progress.sh
Chain ID: 1946
Sampling, please wait
Blocks per minute: 0
Not syncing
```

If both op-geth is not running, you will see a message like the one below.

```
Error: error sending request for url (http://<your p2p advertise ip address>:8545/)
```

# References
## Official Soneium Repo
https://github.com/Soneium/soneium-node
## OPTIMISM DOCS
https://docs.optimism.io/builders/node-operators/tutorials/node-from-docker
