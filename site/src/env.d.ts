declare namespace App {
  interface Locals {
    t: Record<string, string>
  }
}

declare namespace astroHTML.JSX {
  interface SourceHTMLAttributes {
    size: string
  }
}
