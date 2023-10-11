import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  activateSubmenu(event) {
    const submenuItem = this.#getSubmenuItem(event.target)
    const menuItem = this.#getMenuItem(submenuItem)

    // Not is necessary manage active links when turbo is disabled
    if(this.#turboDisabled(submenuItem)) return;

    this.#deactivateMenus(this.element)
    this.#deactivateSubmenus(this.element)

    this.#activateSubmenuItem(submenuItem)
    this.#activateMenuItem(menuItem)

    this.#updateUrl(submenuItem)
  }

  #turboDisabled(submenuItem) {
    const link = this.#getSubmenuLink(submenuItem)
    const turboStatus = link.getAttribute("data-turbo")
    return turboStatus === "false" ? true : false
  }

  #getSubmenuItem(eventTarget) {
    return eventTarget.closest(".submenu-item")
  }

  #activateSubmenuItem(submenuItem) {
    submenuItem.classList.add("active")
  }

  #getMenuItem(submenuItem) {
    return submenuItem.closest(".sidebar-item")
  }

  #activateMenuItem(menuItem) {
    menuItem.classList.add("active");
  }

  #deactivateMenus(thisElement) {
    const activeMenus = thisElement.getElementsByClassName("sidebar-item active")
    Array.from(activeMenus).forEach((element) => element.classList.remove("active"))
  }

  #deactivateSubmenus(thisElement) {
    const activesubmenus = thisElement.getElementsByClassName("submenu-item active")
    Array.from(activesubmenus).forEach((element) => element.classList.remove("active"))
  }

  #updateUrl(submenuItem) {
    // From: https://www.30secondsofcode.org/js/s/modify-url-without-reload/
    const origin = window.location.origin
    const pathName = this.#getSubmenuLinkHref(submenuItem)
    const nextURL = origin + pathName
    const nextTitle = ""
    const nextState = { additionalInformation: "Updated the URL with JS" }

    // This will create a new entry in the browser's history, without reloading
    window.history.pushState(nextState, nextTitle, nextURL);
  }

  #getSubmenuLink(submenuItem) {
    return submenuItem.getElementsByClassName("submenu-link")[0]
  }

  #getSubmenuLinkHref(submenuItem) {
    return this.#getSubmenuLink(submenuItem).getAttribute("href")
  }
}
