// Apply to view:
// <div data-controller="static--index"></div>


import { Controller } from 'stimulus'
import '../../../stylesheets/static.scss'

export default class extends Controller {
  static targets = ['name']

  greet() {
    const element = this.nameTarget
    const name = element.value
    console.log(`Hello, ${name}!`)
  }
}
