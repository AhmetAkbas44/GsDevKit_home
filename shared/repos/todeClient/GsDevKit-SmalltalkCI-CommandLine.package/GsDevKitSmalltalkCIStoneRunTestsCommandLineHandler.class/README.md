AUsage: runSmalltalkCITests [ --help] <stone-name> [<smalltalkCI-config-path>]
  <stone-name>              name of the stone to be created
  <smalltalkCI-config-path> Path to the SmalltalkCI configuration file (.smalltalk.ston)
	
Documentation:
Run the #gemstone tests specified in the SmalltalkCI configuration file in the named stone.

Examples:
    runSmalltalkCITests --help
    runSmalltalkCITests sample
    runSmalltalkCITests sample /opt/_home//sys/local/server/templates/myStoneConfig.ston
