

-- Populate deviceTypes table
insert into deviceTypes (name) 
value ('motion');
insert into deviceTypes (name) 
value ('openclose');



-- Populate sites table
insert into sites (siteName, streetNumber, streetName, apartmentNumber, city, state, zip5dig) 
value ('home', 1441, '9th Avenue', '1701', 'San Diego', 'CA', 92101);

-- Populate rooms table
insert into rooms (name, description, siteId) 
value ('kitchen','kitchen in front of stove', (select Id from sites where sites.siteName = 'home'));
insert into rooms (name, description, siteId) 
value ('masterbath','on counter in master bath', (select Id from sites where sites.siteName = 'home'));
insert into rooms (name, description, siteId) 
value ('guestbath','on counter in guest bath', (select Id from sites where sites.siteName = 'home'));
insert into rooms (name, description, siteId) 
value ('masterbed','on counter cabinets in master bedroom', (select Id from sites where sites.siteName = 'home'));
insert into rooms (name, description, siteId) 
value ('kapri','on mirror in kapri room', (select Id from sites where sites.siteName = 'home'));
insert into rooms (name, description, siteId) 
value ('living','under tv in living room', (select Id from sites where sites.siteName = 'home'));
insert into rooms (name, description, siteId) 
value ('unithallway','hallways in the apartment', (select Id from sites where sites.siteName = 'home'));
insert into rooms (name, description, siteId) 
value ('buildinghallway','hallway outside of the apartment', (select Id from sites where sites.siteName = 'home'));

-- Populate objects table
insert into objects (name, description) 
value ('frontdoor','openclose switch on front door');
insert into objects (name, description) 
value ('refrigeratordoor','openclose switch on refrigerator door');


-- Populate devices table
insert into devices 
(id, indigoId, devTypeId, roomId, objectId, manufacturer, model, hardware_ver, firmware_ver, indigoDescription, dateInstalled, batteryLow) 
value (0x21dea1, 1852331767, 
(select Id from deviceTypes where deviceTypes.name = 'motion'),
(select Id from rooms where rooms.name = 'masterbath'), 
NULL,
'Insteon',
'2842-222',
'2.2',
'41',
'Motion sensor in master bath',
now(),
FALSE);

insert into devices (id, indigoId, devTypeId, roomId, objectId, manufacturer, model, hardware_ver, firmware_ver, indigoDescription, dateInstalled, batteryLow)  
value (0x21de9c, 423570584,
(select Id from deviceTypes where deviceTypes.name = 'motion'),
(select Id from rooms where rooms.name = 'guestbath'), 
NULL,
'Insteon',
'2842-222',
'2.2',
'41',
'Motion sensor in guest bath',
now(),
FALSE);

insert into devices (id, indigoId, devTypeId, roomId, objectId, manufacturer, model, hardware_ver, firmware_ver, indigoDescription, dateInstalled, batteryLow)  
value (0x21de99, 1194603994,
(select Id from deviceTypes where deviceTypes.name = 'motion'),
(select Id from rooms where rooms.name = 'kitchen'), 
NULL,
'Insteon',
'2842-222',
'2.2',
'41',
'Motion sensor in kitchen',
now(),
FALSE);

insert into devices (id, indigoId, devTypeId, roomId, objectId, manufacturer, model, hardware_ver, firmware_ver, indigoDescription, dateInstalled, batteryLow) 
value (0x21de95, 898841346,
(select Id from deviceTypes where deviceTypes.name = 'motion'),
(select Id from rooms where rooms.name = 'masterbed'), 
NULL,
'Insteon',
'2842-222',
'2.2',
'41',
'Motion sensor in master bedroom',
now(),
FALSE);

insert into devices (id, indigoId, devTypeId, roomId, objectId, manufacturer, model, hardware_ver, firmware_ver, indigoDescription, dateInstalled, batteryLow) 
value (0x21de7f, 1523942470,
(select Id from deviceTypes where deviceTypes.name = 'motion'),
(select Id from rooms where rooms.name = 'kapri'), 
NULL,
'Insteon',
'2842-222',
'2.2',
'41',
'Motion sensor in kapris room',
now(),
FALSE);

insert into devices (id, indigoId, devTypeId, roomId, objectId, manufacturer, model, hardware_ver, firmware_ver, indigoDescription, dateInstalled, batteryLow) 
value (0x21cfd8, 1362479118,
(select Id from deviceTypes where deviceTypes.name = 'openclose'),
(select Id from rooms where rooms.name = 'kitchen'), 
(select Id from objects where objects.name = 'refrigeratordoor'),
'Insteon',
'2843-222',
'?',
'?',
'OpenClose sensor on fridge door',
now(),
FALSE);

insert into devices (id, indigoId, devTypeId, roomId, objectId, manufacturer, model, hardware_ver, firmware_ver, indigoDescription, dateInstalled, batteryLow) 
value (0x14d7d4, 1667585419,
(select Id from deviceTypes where deviceTypes.name = 'openclose'),
(select Id from rooms where rooms.name = 'unithallway'), 
(select Id from objects where objects.name = 'frontdoor'),
'Insteon',
'2842-222',
'2.2',
'41',
'OpenClose sensor on the front door',
now(),
FALSE);

insert into devices (id, indigoId, devTypeId, roomId, objectId, manufacturer, model, hardware_ver, firmware_ver, indigoDescription, dateInstalled, batteryLow) 
value (0x14c241, 71791822,
(select Id from deviceTypes where deviceTypes.name = 'motion'),
(select Id from rooms where rooms.name = 'living'), 
NULL,
'Insteon',
'2842-222',
'2.2',
'41',
'Motion sensor under tv in living room',
now(),
FALSE);

insert into devices (id, indigoId, devTypeId, roomId, objectId, manufacturer, model, hardware_ver, firmware_ver, indigoDescription, dateInstalled, batteryLow) 
value (0x14c238, 414855758,
(select Id from deviceTypes where deviceTypes.name = 'motion'),
(select Id from rooms where rooms.name = 'buildinghallway'), 
NULL,
'Insteon',
'2842-222',
'?',
'?',
'Motion sensor outside of the front door',
now(),
FALSE);
