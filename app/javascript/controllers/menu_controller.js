import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  menuItemClass = "o-menu-item"
  menuItemActiveClass = `${this.menuItemClass}--active`

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
  runShortcutsMouseWheelHorizontalScrolling(event) {
    let shortcuts = event.target.closest(".c-menu-bar__shortcuts")
    this.#runMouseWheelHorizontalScrolling(event, shortcuts)
  }

  runMenuItemTextMouseWheelHorizontalScrolling(event) {
    this.#runMouseWheelHorizontalScrolling(event, event.target)
  }

  #runMouseWheelHorizontalScrolling(event, scrollableContainer) {
    const race = 15 // How many pixels to scroll

    if (event.deltaY > 0) scrollableContainer.scrollLeft += race // Scroll right
    else scrollableContainer.scrollLeft -= race // Scroll left

    event.preventDefault()
  }

  #turboDisabled(menuItem) {
    const turboStatus = menuItem.getAttribute("data-turbo")
    return turboStatus === "false" ? true : false
  }

  #getMenuItem(eventTarget) {
    return eventTarget.closest(`.${this.menuItemClass}`)
  }

  #activateMenuItems(menuItem) {
    const href = menuItem.getAttribute("href")
    const sameMenuItems = document.querySelectorAll(`a[href='${href}']`);
    Array.from(sameMenuItems).forEach((element) => element.classList.add(`${this.menuItemActiveClass}`))
  }

  #deactivateMenuItems(thisElement) {
    const activeMenuItems = thisElement.getElementsByClassName(`${this.menuItemClass} ${this.menuItemActiveClass}`)
    Array.from(activeMenuItems).forEach((element) => element.classList.remove(`${this.menuItemActiveClass}`))
  }

  #updateUrl(menuItem) {
    // From: https://www.30secondsofcode.org/js/s/modify-url-without-reload/
    const origin = window.location.origin
    const pathName = menuItem.getAttribute("href")
    const nextURL = origin + pathName
    const nextTitle = ""
    const nextState = { additionalInformation: "Updated the URL with JS" }

    // This will create a new entry in the browser's history, without reloading
    window.history.pushState(nextState, nextTitle, nextURL)
  }
}
