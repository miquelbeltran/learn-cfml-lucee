component accessors="true" {

    property name ="firstName" type="string";
    property name ="lastName" type="string";

    public Person function init(
            required string firstName,
            required string lastName
            )
    {
        setFirstName(arguments.firstName);
        setLastName(arguments.lastName);
        return this;
    }

    public string function getFullName()
    {
        return this.getFirstName() & ' ' & this.getLastName();
    }

}