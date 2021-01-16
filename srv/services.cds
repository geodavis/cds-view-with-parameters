using schema from '../db/schema';

service CDSViewWithParamsService {

    @readonly entity People as projection on schema.People;
    @readonly entity DaysOnSite as projection on schema.DaysOnSite;

};