use railroad3;
DELIMITER //
DROP PROCEDURE IF EXISTS get_avail_trains //
/* this assumes an auxiliary table avail_trains see schema in separate file*/
/* this procedure assumes you ask your client for day of week (MF or SSH) in addition to date which is sort of cheating but ok by me*/
/* this uses railroad3 but with an attribute passenger_mop (method of payment) added to passengers and attribute segment_fare added to segments */
/* this procedure outputs a bool train_avail which you reference as @some_trains when calling the proc to be accessed from session which is 0 if no available trains, 1 if trains*/
/* for instance get_avail_trains ('2017-07-07', 'BOST', 'NRCH','AFT', 'MF', @some_trains); where time of day in  MOR AFT EVE NIT */

create procedure get_avail_trains(IN trip_date date, IN trip_start varchar(4), IN trip_end varchar(4), IN time_of_day char(3), IN day_of_week char(3),OUT train_avail tinyint)
find_trains:  /*label to allow us to leave*/
BEGIN

                declare trip_direction tinyint; /* 0 for south 1 for north*/
                declare seg0 int;
                declare seg1 int;  /* for between logic direction does not matter*/
                declare tod_start_time time; /*range between eg 12 noon and 8 pm*/
                declare tod_end_time time;
                declare trip_start_id int;
                declare trip_end_id int;  /*assumes you are calling sp with station code, a varchar or text, not station id*/
                                                                          /*assumes you are computing the station ids*/

        /* don't need this if you pass in station_ids in which case change parms */
                set trip_start_id=(select station_id from Stations where station_code=trip_start);
                set trip_end_id=(select station_id from Stations where station_code=trip_end);

                                /*now get direction*/
                if trip_start_id < trip_end_id
                        then set trip_direction=0; /*south*/
                        else set trip_direction=1; /*north*/
                end if;
        /*get start and end segments but store in vars without reference to direction since using 'between'*/
                if trip_direction=0
                        then
                        set seg0=(select segment_id from Segments where segment_north=trip_start_id);
                        set seg1=(select segment_id from Segments where segment_south=trip_end_id);
                                                                               else
                                                                                             set seg0=(select segment_id from Segments where segment_south=trip_start_id);
                                                                                                     set seg1=(select segment_id from Segments where segment_north=trip_end_id);
                                                                               end if;
                                                                               /* get time range when client wants to board the train -- somewhat arbitrary*/

                if time_of_day='MOR'
                        then
                                set tod_start_time='06:00';
                                set tod_end_time='12:00';
                elseif time_of_day='AFT'
                        then                                                        set tod_start_time='12:00';                                                 

                                set tod_end_time='18:00';
                                                                                
               elseif time_of_day='EVE'
                        then                                                                                                set tod_start_time='18:00';
                                                                                                             set tod_end_time='00:00';
               else  /*night*/
                                                                                                                            set tod_start_time='00:00';
                                                                                                    set tod_end_time='06:00';
                end if;

        /*show variables*/
                select "variables";
                select trip_direction, seg0, seg1, tod_start_time, tod_end_time, trip_start, trip_end, trip_start_id, trip_end_id;

       insert into avail_trains (train_id) select distinct( tr.train_id) from Trains tr inner join stops_at sa on tr.train_id=sa.train_id inner join Seats_Free sf on tr.train_id=sf.sf_train_id WHERE sa.time_out between tod_start_time and tod_end_time AND tr.direction=trip_direction AND tr.train_days=day_of_week  AND (select min(sf_seats_free) from Seats_Free where sf_seg_id between seg0 and seg1 and sf_date=trip_date)>0;
        /*now test for available trains*/
        if (select count(*) from avail_trains)=0
        then /* there is no train with seats free on those segments at that date and range of hours*/
                set train_avail=0;
                leave find_trains;
        else
                set train_avail=1;
        /*now create a record in avail_trains for each train and trip matching criteria--needs to be tested*/
        update avail_trains set start_station=trip_start_id, end_station=trip_end_id, travel_date=trip_date, time_of_day=time_of_day, seats_free=1 where train_id is not NULL;
        end if;
  select "train_avail", train_avail;
  END//
  delimiter ;
