// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
import ModalController from "./modal_controller"
const application = Application.start()
application.register("modal", ModalController)
eagerLoadControllersFrom("controllers", application)
