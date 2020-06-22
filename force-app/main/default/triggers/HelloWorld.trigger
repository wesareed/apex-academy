trigger HelloWorld on Lead (before insert) {
    for (Lead l : Trigger.new) {
        l.FirstName = 'Hello';
        l.LastName = 'World';
    }
}