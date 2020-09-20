import React from 'react';
import { Provider } from 'react-redux';
import App from './App';
import { HashRouter } from 'react-router-dom';

export const Root = ({store}) => (
    <Provider store={store}>
        <HashRouter>
            <App />
        </HashRouter>
    </Provider>
);