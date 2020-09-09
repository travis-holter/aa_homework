import React from 'react';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather';

const tabs = () =>{
    let titles = ["one", "two", "three"]
    let contents = ["First Tab", "Second Tab", "ThirdTab"]
    let tabsArray = []
    for(let i = 0; i < titles.length; i++){
        let newObject = {}
        newObject["title"] = titles[i];
        newObject["content"] = contents[i];
        tabsArray.push(newObject);
    }
    return tabsArray;
}

const Root = () =>{
    return <div>
        <Clock/>
        <Tabs tabs={tabs()}/>
        <Weather />
        </div>
};

export default Root;