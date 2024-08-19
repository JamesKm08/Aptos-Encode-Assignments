module encode::homework{

    use std::signer;
    // use std::string;
    // use std::u64;
    use std::error;
    const ENOT_VALUE  : u64 = 17;

    struct Asset has drop{
        value: u64,
        flag: u8
    }

    public entry fun create(value : u64, flag : u8): Asset{
        
    }

    fun build_asset(){
        assert!(value: u64 > 100 && flag: u8 =< 1, error::not_found(ENOT_VALUE))

        let asset = borrow_global<Asset>(account:&signer, value:u64, flag:u8);
    }

}