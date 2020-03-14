import React from 'react';
import './App.css';
import Elm from 'react-elm-components';
import { Main } from './elm/Main'

function App() {
  return (
    <div className="App">
     Hello World
     <Elm src={Main} />
    </div>
  );
}

export default App;
