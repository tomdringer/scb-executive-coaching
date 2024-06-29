import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "slide" ]

  initialize() {
    this.showSlide(0)
  }

  nextSlide() {
    this.showSlide((this.currentIndex + 1) % this.slideTargets.length)
  }

  previousSlide() {
    this.showSlide((this.currentIndex - 1 + this.slideTargets.length) % this.slideTargets.length)
  }

  showSlide(index) {
    this.slideTargets.forEach((el, i) => {
      el.style.display = i === index ? 'block' : 'none'
    })
    this.currentIndex = index
  }
}