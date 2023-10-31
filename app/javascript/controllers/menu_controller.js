import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  activateMenuItem(event) {
    const menuItem = this.#getMenuItem(event.target)
    //debugger

    // Not is necessary manage active links when turbo is disabled
    if(this.#turboDisabled(menuItem)) return;

    this.#deactivateMenuItems(this.element)
    console.log(this.element)
    this.#activateMenuItem(menuItem)

    this.#updateUrl(menuItem)
    console.log(menuItem)
  }

  #turboDisabled(menuItem) {
    const turboStatus = menuItem.getAttribute("data-turbo")
    return turboStatus === "false" ? true : false
  }

  #getMenuItem(eventTarget) {
    return eventTarget.closest(".menu-item")
  }

  #activateMenuItem(menuItem) {
    menuItem.classList.add("menu-item--active")
  }

  #deactivateMenuItems(thisElement) {
    const activeMenuItems = thisElement.getElementsByClassName("menu-item menu-item--active")
    Array.from(activeMenuItems).forEach((element) => element.classList.remove("menu-item--active"))
    console.log(activeMenuItems)
  }

  #updateUrl(menuItem) {
    // From: https://www.30secondsofcode.org/js/s/modify-url-without-reload/
    const origin = window.location.origin
    const pathName = menuItem.getAttribute("href")
    const nextURL = origin + pathName
    const nextTitle = ""
    const nextState = { additionalInformation: "Updated the URL with JS" }

    // This will create a new entry in the browser's history, without reloading
    window.history.pushState(nextState, nextTitle, nextURL);
  }
}
