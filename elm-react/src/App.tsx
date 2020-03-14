import React from 'react';
import './App.css';
import Elm from 'react-elm-components';
import MyElmComponent from './Main.elm';

function App() {
  return (
    <div className="App">
     Hello World
     <Elm src={MyElmComponent.Elm.Main} />
    </div>
  );
}

export default App;
