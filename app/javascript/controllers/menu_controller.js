import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  menuItemClass = "o-menu-item";
  menuItemActiveClass = `${this.menuItemClass}--active`;

  activateMenuItem(event) {
    const menuItem = this.#getMenuItem(event.target)

    // Not is necessary manage active links when turbo is disabled
    if(this.#turboDisabled(menuItem)) return

    this.#deactivateMenuItems(this.element)
    this.#activateMenuItems(menuItem)

    this.#updateUrl(menuItem)
  }

  /* From: https://codepen.io/fauzanmy/pen/dyprKRd
   * Note: Don't work in Firefox
  */
  runMouseWheelHorizontalScrolling(event) {
    let shortcuts = event.target.closest(".menu-bar__shortcuts")
    const race = 15 // How many pixels to scroll

    if (event.deltaY > 0) shortcuts.scrollLeft += race // Scroll right
    else shortcuts.scrollLeft -= race // Scroll left

    event.preventDefault()
  }

  #turboDisabled(menuItem) {
    const turboStatus = this.#getLink(menuItem).getAttribute("data-turbo")
    return turboStatus === "false" ? true : false
  }

  #getMenuItem(eventTarget) {
    return eventTarget.closest(`.${this.menuItemClass}`)
  }

  #getLink(menuItem) {
    return menuItem.querySelector("a")
  }

  #getHref(menuItem) {
    return this.#getLink(menuItem).getAttribute("href")
  }

  #activateMenuItems(menuItem) {
    const href = this.#getHref(menuItem)
    const sameMenuItems = document.querySelectorAll(`a[href='${href}']`);
    Array.from(sameMenuItems).forEach((element) => element.parentNode.classList.add(`${this.menuItemActiveClass}`))
  }

  #deactivateMenuItems(thisElement) {
    const activeMenuItems = thisElement.getElementsByClassName(`${this.menuItemClass} ${this.menuItemActiveClass}`)
    Array.from(activeMenuItems).forEach((element) => element.classList.remove(`${this.menuItemActiveClass}`))
  }

  #updateUrl(menuItem) {
    // From: https://www.30secondsofcode.org/js/s/modify-url-without-reload/
    const origin = window.location.origin
    const pathName = this.#getHref(menuItem)
    const nextURL = origin + pathName
    const nextTitle = ""
    const nextState = { additionalInformation: "Updated the URL with JS" }

    // This will create a new entry in the browser's history, without reloading
    window.history.pushState(nextState, nextTitle, nextURL)
  }
}
