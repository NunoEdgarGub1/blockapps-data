
module Blockchain.DB.MemStorageDB (
  DB.HasStorageDB(..),
  putStorageKeyVal',
  deleteStorageKey',
  getStorageKeyVal',
  getAllStorageKeyVals'
  ) where


import Blockchain.ExtWord
import Blockchain.Data.Address
import Blockchain.DB.HashDB
import Blockchain.DB.StateDB
import qualified Blockchain.Database.MerklePatricia as MP

import qualified Blockchain.DB.StorageDB as DB

putStorageKeyVal'::(DB.HasStorageDB m, HasStateDB m, HasHashDB m)=>
                  Address->Word256->Word256->m ()
putStorageKeyVal' owner key val = DB.putStorageKeyVal' owner key val

deleteStorageKey'::(DB.HasStorageDB m, HasStateDB m, HasHashDB m)=>
                   Address->Word256->m ()
deleteStorageKey' owner key = DB.deleteStorageKey' owner key

getStorageKeyVal'::(DB.HasStorageDB m, HasStateDB m, HasHashDB m)=>
                   Address->Word256->m Word256
getStorageKeyVal' owner key = DB.getStorageKeyVal' owner key

getAllStorageKeyVals'::(DB.HasStorageDB m, HasStateDB m, HasHashDB m)=>
                       Address->m [(MP.Key, Word256)]
getAllStorageKeyVals' owner = getAllStorageKeyVals' owner