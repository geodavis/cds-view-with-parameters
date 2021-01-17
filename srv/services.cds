using schema from '../db/schema';

service CDSViewWithParamsService {

    @readonly view PeopleNoEntry(startDate: DateTime)
     as select from schema.PeopleWithNoDaysOnSiteGivenDateRange(startDateUser: :startDate) {*};


};