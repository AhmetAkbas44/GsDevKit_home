activations
doCreateStone
	super doCreateStone.
	self arguments size > 2
		ifTrue: [ 
			| ci |
			ci := self readSmalltalkCISpec: (self arguments at: 3).
			projectDirectoryPath := ci projectDirectory asFileReference.
			(ci compatibleConfigurationsFor: #gemstone) do: [ :configSpec | self applyOptionsFromConfigurationSpec: configSpec ] ]