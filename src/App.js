import './App.css';
import Navbar from './components/navbar';

import {BrowserRouter as Router} from 'react-router-dom'
import Cards from './components/cards';
function App() {
  return (
    <Router>
        <Navbar/>
        <Cards/>
    </Router>
  );
}

export default App;
