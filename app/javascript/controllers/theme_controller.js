import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  themeKey = "maktTheme"

  connect() {
    const themeSwitcher = this.element.firstElementChild
    this.#load(themeSwitcher)
    this.#initThemeSwitchListener(themeSwitcher)
  }

  /* Change theme when click theme switcher */
  toggle(event){
    const theme = event.target.checked ? "dark" : "light"
    this.#set(theme)
  }

  /* Set theme in first aplication load
  ** From:
  ** - https://css-tricks.com/dark-modes-with-css/
  ** - https://dev.to/abbeyperini/dark-mode-toggle-and-prefers-color-scheme-4f3m
  ** - https://codepen.io/marco3w/pen/MWwvpOQ
  */
  #load(themeSwitcher) {
    const theme = localStorage.getItem(this.themeKey)
    if (theme) {
      if (theme === "dark") {
        this.#set("dark")
        themeSwitcher.checked = true
      }

      if (theme === "light") {
        this.#set("light")
        themeSwitcher.checked = false
      }
      return
    }

    const prefersDarkTheme = window.matchMedia("(prefers-color-scheme: dark)")
    if (prefersDarkTheme.matches) {
      this.#set("dark")
      themeSwitcher.checked = true
      return
    }

    const prefersLightTheme = window.matchMedia("(prefers-color-scheme: light)")
    if (prefersLightTheme.matches) {
      this.#set("light")
      themeSwitcher.checked = false
      return
    }

    this.#set("light")
  }

  /* Detect system theme preference changes and update theme
  ** From: https://davidwalsh.name/detect-system-theme-preference-change-using-javascript
  */
  #initThemeSwitchListener(themeSwitcher) {
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change',({ matches }) => {
      if (matches) {
        this.#set("dark")
        themeSwitcher.checked = true
      } else {
        this.#set("light")
        themeSwitcher.checked = false
      }
    })
  }

  #set(theme) {
    localStorage.setItem(this.themeKey, theme)
    document.documentElement.setAttribute("data-theme", theme)
  }
}
