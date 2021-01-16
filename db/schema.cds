using {
    cuid,
    managed,
    User,
} from '@sap/cds/common';

namespace schema;

entity People {
    key ID         : Integer;
        employeeId : String;
        email      : String;
        firstName  : String;
        lastName   : String;
        daysOnSite : Composition of many DaysOnSite
                         on daysOnSite.person = $self;
}

entity DaysOnSite : managed {
    key ID         : Integer;
        startDate  : DateTime;
        endDate    : DateTime;
        person     : Association to one People;
}

define view PeopleWithNoDaysOnSiteGivenDateRange(startDateUser : DateTime) as
    select from People p {
        key ID,
        firstName,
        lastName
    } where p.ID not in (select from DaysOnSite {person.ID} where startDate >: startDateUser);

 define view DaysOnSitePeople as
    select from DaysOnSite {person.ID};