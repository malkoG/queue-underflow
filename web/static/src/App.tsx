import * as React from 'react';
import {Header, Section, Footer} from './components';
var styles = require('./app.styl')

class App extends React.Component<{}, {}> {
  render() {
      return (
        <div>
          <Header></Header>
          <Section></Section>
          <Footer></Footer>
        </div>
      );
  }
}

export default App;