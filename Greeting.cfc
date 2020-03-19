/*
    accessors="true":
    This will allow the component to provide explicit accessor (getter) and mutator (setter)
    functions for the properties we define. This means we can call getBaseGreeting or
    setBaseGreeting to fetch or update the value without having to write specific
    functions within the component ourselves.
*/
component accessors="true" {

	// property name ="person" type="Person";
	// property name ="baseGreeting" type="string" default="Hello, ";
	property String baseGreeting default="Hello, ";
	property Person person;

	/*
This is the constructor method which will set the baseGreeting value
with whatever value we choose to send in, or it will use the property
default value, before returning the component itself.
*/
	public function init( required Person person, string baseGreeting = variables.baseGreeting ){
		setPerson( arguments.person );
		// generated with accessors=true from the property baseGreeting
		setBaseGreeting( arguments.baseGreeting );
		return this;
	}

	public string function getFullName(){
		return getPerson().getFullName();
	}

	public string function getGreeting( string baseGreeting = getBaseGreeting() ){
		var fullName = getFullName();
		var greeting = arguments.baseGreeting & fullName;

		return greeting;
	}

}
