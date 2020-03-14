/// <reference types="react-scripts" />
//elm.d.ts
declare module "*.elm" {
    export const Elm: any;
}
  
  //react-elm-component.d.ts
declare module 'react-elm-components' {
    import { Component } from "react";
    type ElmProps = {
        src: any  
    };
    class Elm extends Component<ElmProps> {};
    export = Elm;
}