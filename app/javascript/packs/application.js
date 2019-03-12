import "bootstrap";
import "../plugins/flatpickr";
import  { order }  from "./event-order";
import  { sidebarFormdate }  from "./event-date";

import  { searchButton }  from "./event-search";

import {eventActive} from "../plugins/event_active";
import {eventReload} from "./event_reload";

import  { bookRandom }  from "./event_booking_random";

eventReload();
eventActive();
bookRandom();

