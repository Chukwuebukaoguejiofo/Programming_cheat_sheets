# rspec stub (replace a method with code that returns a specific result )
zombie.weapon.stub(:slice)
    .with("parameter")
    .and_return("value")  # the slice method will not be executed!!!
method_that_calls_the_slice_method_above
assertion_method

# rspec mock (mock is a stub with an expectation that the method gets called!)

zombie.weapon.should_receive(:slice)
    .with("parameter")
    .and_return("value")
method_that_calls_the_slice_method_above
assertion_method

# rspec doubles 'like a fake object'
foo = stub(name: "brian", age: 27)




# sublime:


Cmd + Shift + p  + "Package Control: Install Package"
