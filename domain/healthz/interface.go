package healthz

type RepositoryPsql interface {
	CheckStatus() (string, error)
	CheckSong(name string) (string, error)
	InsertSong(name string) (string, error)
	
	// Method for retrieval of list of 20 elements
	RetrieveAssetList(assetType int) ([]string, error)
	SearchAsset(objectType string, params []string) ([]string, error)
}

type UseCase interface {
	GetHealthz() (string, error)
	CreateSong(name string) (string, error)
	
	// Method for retrieval of list of 20 elements
	GetAssetList(assetType int) ([]string, error)
	SearchObject(objectType string, params []string) ([]string, error)
}
