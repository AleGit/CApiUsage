import CYices

func version() {

    guard let version = String.fromCString(yices_version)
    else { 
	print("Yices is not installed.")
	return 
    }

    print("Yices",version,"installed.")
    print("======================")
}

func status(context:COpaquePointer, term: term_t) {
	defer { print("-----------------------------------------------") }
	guard let string = String(term: term) else { return }
	print("assert", string)

	yices_assert_formula(context, term)

	switch (yices_check_context(context, nil)) {
    case STATUS_SAT:
        print("Satisfiable");
        
	// build the model and print it
	let mdl = yices_get_model(context, 1)
	guard mdl != nil else { return }
	defer { yices_free_model(mdl) }
      
        guard let model_string = String(model:mdl) else { return }
	print(model_string)
        break;
        
    case STATUS_UNSAT:
        print("Unsatisfiable");
        break;
        
    case STATUS_UNKNOWN:
        print("Status is unknown");
        break;
        
    case STATUS_IDLE:
        fallthrough
    case STATUS_SEARCHING:
        fallthrough
    case STATUS_INTERRUPTED:
        fallthrough
    case STATUS_ERROR:
        fallthrough
    default:
        // these codes should not be returned
        print("Bug: unexpected status returned");
        break;
    }
}

func demo() {
	yices_init()
	defer { yices_exit() }

	let context = yices_new_context(nil)
	defer { yices_free_context(context) }

	let bool_tau = yices_bool_type()
	let free_tau = yices_int_type()

	let a = yices_new_uninterpreted_term(free_tau)
	yices_set_term_name(a, "a")
	let b = yices_new_uninterpreted_term(free_tau)
	yices_set_term_name(b, "b")

	let f_domain = [type_t](count:2, repeatedValue:free_tau)
	let f_tau = yices_function_type(UInt32(f_domain.count), f_domain, free_tau)
	let f = yices_new_uninterpreted_term(f_tau)
	yices_set_term_name(f, "f")

	var args = [a,b]
	let fab = yices_application(f,UInt32(args.count), args)

	let p_domain = [ free_tau, free_tau, free_tau ]
	let p_tau = yices_function_type(UInt32(p_domain.count), p_domain, bool_tau)
	let p = yices_new_uninterpreted_term(p_tau)
	yices_set_term_name(p, "p")

	args = [fab,a,b]
	let pfab = yices_application(p,UInt32(args.count), args)
	let npfab = yices_not(pfab)
	let clause = yices_or2(pfab,npfab)
	
	status(context, term:clause)
	status(context, term:pfab)
	status(context, term:npfab)

}

version()

demo()
