package v.market

import grails.transaction.Transactional

@Transactional
class NotifierService {

    def mailService

    def emailFromUser(email) {
        mailService.sendMail {
            to "vmarketcolombia@gmail.com"
            from email
            subject "Hello John"
            body 'this is some text'
        }
    }
}
