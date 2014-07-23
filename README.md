Insurance
=========
This repository is designed for summer practical work of four students. 
The practical task is creating a prototype of CRM system for an undefine insurance company.

The system has 4 roles: administrator, manager, seller and the call center
employee.

Managers has sellers that obey him. Managers can choose sellers that does not have manager.

The system has 13 main basic entities: accident, certificate, company, contact,
license, manufacturer, passport, payment, person, price, product, vehicle and
warrant.

Person and company are entities that represents clients of insurance company.
Each client is connected to one seller. Seller can register clients of both
types and the registered client would be automatically assigned to
the registering seller. Administrator can register clients of both types
and assign to any seller. Administrator and call center employee can see all
clients, manager can see only clients that assigned to sellers that obeys
the manager. Seller can see only clients that assigned to him.

Any client can have a list of contacts. There are three types of contacts:
address, telephone number and email. 

Any client can have a list of vehicles that the clients owns.

Clients with type "person" can have a list of passports.
Passport with the latest issue date is the current passport of the client. 

Clients with type "person" can have a list of driver licenses that the client
had during the lifecycle of the client in the system.

Vehicles can have a list of accidents that happened with it.
Accidents are registered by call center employees or administrator and contains
information about the date of accident and the money equivalent of damage
to the vehicle.

Vehicles can have a list of certificates that contains information about
the states of vehicle (like VIN-number, color, owner). The certificate with
the latest issue date represents the current state of vehicle.

Vehicle have information about the manufacturer. The list of manufacturers
can be edited by the administrator.

There are list of products that company offers to clients. This list can be
edited by managers and administrators.

Products can have a list of prices that it had during the lifecycle in the
system. The price with the latest date is the current recommended price for
the product.

Sellers can register a warrants. They choose what kind of product they sell
and the final price of the warrant. Each warrant is assigned to a client.

If accidents occur seller should register all payments that company pays
to the client. Information about the payment includes information about
the warrant, the accident and amount of money that is payed.
