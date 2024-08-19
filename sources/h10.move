module my_addr::h10 {
    use aptos_framework::object;
    use std::signer;
    use std::string::{String};
    use std::vector;
    use aptos_framework::event;

    // Create a seed for named object
    const NAME: vector<u8> = b"ObjectSeed";

    #[event]
    struct ExampleObjectEvent has drop, store{
        my_object: address,
    }


    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct ExampleObject has key {
        name: String,
        balance: u64,
    }

    public entry fun create_example_named_object(user: &signer, name : String, balance: u64) {
        // Create named object
        let constructor_ref = object::create_named_object(user, NAME);
        // Create signer for named object
        let object_signer = object::generate_signer(&constructor_ref);
        // Move resource to signer
        move_to(&object_signer,ExampleObject{name, balance});
        // Get object address from constructor ref
        let object_address = object::address_from_constructor_ref(&constructor_ref);

        event::emit(ExampleObjectEvent{my_object:object_address});

    }

    // Get address from a view function
    #[view]
    public fun check_address(creator: address): address{
        object::create_object_address(&creator,NAME)
    }


}