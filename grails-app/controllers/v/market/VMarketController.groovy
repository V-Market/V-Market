package v.market

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class VMarketController {

    def index() { }
}
