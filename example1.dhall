
let replicate = https://prelude.dhall-lang.org/List/replicate

let mkName = ./mkName.dhall

let UserInfo : Type =
      { home : Text
      , privateKey : Text
      , publicKey : Text
      , name : Text
      }

let makeUser = \(user : Text) ->
      let home       = "/home/${user}"
      let privateKey = "${home}/.ssh/id_ed25519"
      let publicKey  = "${privateKey}.pub"
      in  { home
          , privateKey
          , publicKey
          , name = mkName user
          }

in  \(i : Natural) ->
      [ makeUser "bill"
      , makeUser "jane"
      ] #
      replicate i UserInfo (makeUser "test")
