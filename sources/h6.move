module encode:: h6 {

    struct TokenAsset has key{
        //add value field
         value: u8
    }

    public entry fun create_Asset(account : &signer){
    // create a TokenAsset
        let t_asset = create();
    // move the TokenAsset to the account address 
        move_to<TokenAsset>(account, t_asset);

    }

    fun create() : TokenAsset {
    // return a Token Asset with 0 value
    TokenAsset{value : 0}
    }

}