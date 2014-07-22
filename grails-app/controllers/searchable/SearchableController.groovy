/*
 * Copyright 2007 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package searchable

import org.compass.core.engine.SearchEngineQueryParseException
/**
 * Basic web interface for Grails Searchable Plugin 
 *
 * @author Maurice Nicholson
 */
class SearchableController {
    def searchableService

    /**
     * Index page with search form and results
     */
    def index = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            return [searchResult: searchableService.search(params.q, params)/*.findAll {

                if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
                    return true
                } else if (SpringSecurityUtils.ifAnyGranted('ROLE_CALL_CENTER')) {
                    return !((it.getClass() == Certificate)
                            || (it.getClass() == License)
                            || (it.getClass() == Manufacturer))
                } else if (SpringSecurityUtils.ifAnyGranted('ROLE_MANAGER')) {
                    def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
                    switch (it) {
                        case Accident: return (it as Accident).vehicle.owner.seller?.manager == me; break;
                        case Certificate: return (it as Certificate).vehicle.owner.seller?.manager == me; break;
                        case Company: return (it as Company).seller?.manager == me; break;
                        case Contact: return (it as Contact).client.seller?.manager == me; break;
                        case License: return (it as License).owner.seller?.manager == me; break;
                        case Manufacturer: return false; break;
                        case Passport: return (it as Passport).person.seller?.manager == me; break;
                        case Payment: return (it as Payment).warrant.client.seller?.manager == me; break;
                        case Person: return (it as Person).seller?.manager == me; break;
                        case Price: return true; break;
                        case Product: return true; break;
                        case Vehicle: return (it as Vehicle).owner.seller?.manager == me; break;
                        case Warrant: return (it as Warrant).client.seller?.manager == me; break;
                    }
                } else if (SpringSecurityUtils.ifAnyGranted('ROLE_SELLER')) {
                    def me = User.findByUsername(SecurityContextHolder.getContext().getAuthentication().getPrincipal().username)
                    switch (it) {
                        case Accident: return (it as Accident).vehicle.owner.seller == me; break;
                        case Certificate: return (it as Certificate).vehicle.owner.seller == me; break;
                        case Company: return (it as Company).seller == me; break;
                        case Contact: return (it as Contact).client.seller == me; break;
                        case License: return (it as License).owner.seller == me; break;
                        case Manufacturer: return false; break;
                        case Passport: return (it as Passport).person.seller == me; break;
                        case Payment: return (it as Payment).warrant.client.seller == me; break;
                        case Person: return (it as Person).seller == me; break;
                        case Price: return true; break;
                        case Product: return true; break;
                        case Vehicle: return (it as Vehicle).owner.seller == me; break;
                        case Warrant: return (it as Warrant).client.seller == me; break;
                    }
                }
            }*/]
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }

    /**
     * Perform a bulk index of every searchable object in the database
     */
    def indexAll = {
        Thread.start {
            searchableService.index()
        }
        render("bulk index started in a background thread")
    }

    /**
     * Perform a bulk index of every searchable object in the database
     */
    def unindexAll = {
        searchableService.unindex()
        render("unindexAll done")
    }
}
