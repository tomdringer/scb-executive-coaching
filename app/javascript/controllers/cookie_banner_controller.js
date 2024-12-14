import { Controller } from "@hotwired/stimulus"

export default class CookieBannerController extends Controller {
  connect() {
    console.log("Cookie banner connected!")
    this.checkCookieConsent()
  }

  dismiss() {
    localStorage.setItem('cookieConsent', 'true')
    this.element.style.display = 'none'
    const event = new CustomEvent('cookieConsent', { bubbles: true })
    document.dispatchEvent(event)
  }

  checkCookieConsent() {
    if (localStorage.getItem('cookieConsent') === 'true') {
      this.element.style.display = 'none'
    }
  }
}