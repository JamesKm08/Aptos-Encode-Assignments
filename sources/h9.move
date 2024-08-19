module my_addr::h9 {
    use aptos_framework::object;
    use std::signer;
    use std::string::{String};
    use aptos_framework::event;

    #[event]
    struct ExampleObjectEvent has drop, store{
        my_object: address,
    }


    #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
    struct ExampleObject has key {
        name: String,
        balance: u64,
    }

    public entry fun create_example_object(user: &signer, name : String, balance: u64) {
        // create normal object
        let constructor_ref = object::create_object(signer::address_of(user));
        // create signer for object
        let object_signer = object::generate_signer(&constructor_ref);
        // Move resource to signer of the object
        move_to(&object_signer,ExampleObject{name, balance});
        //Get address of object using constructor_ref
        let object_address = object::address_from_constructor_ref(&constructor_ref);

        // Emit event created
        event::emit(ExampleObjectEvent{my_object:object_address});

    }
}