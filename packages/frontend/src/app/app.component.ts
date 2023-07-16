import { Component } from "@angular/core";

import { FancyLogger } from "fancy-logger";

@Component({
  selector: "app-root",
  templateUrl: "./app.component.html",
  styleUrls: ["./app.component.css"],
})
export class AppComponent {
  title = "frontend";

  constructor() {
    FancyLogger.log("Frontend is up and running");
  }
}
