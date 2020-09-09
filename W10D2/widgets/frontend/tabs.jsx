import React from 'react';

class Tabs extends React.Component{

    constructor(props){
        super(props);

        this.state = {
            selectedTab: 0
        }
        this.clicked = this.clicked.bind(this);
    }

    clicked(e, i){
        this.setState({selectedTab: i})
    }


    render(){
        const tabContent = this.props.tabs.map(tab => {
            return <div class="parent-tab-content"><article>{tab.content}</article></div>;
        });

        const tabTitles = [];
        for(let i = 0; i < this.props.tabs.length; i++){
            tabTitles.push(<h2 onClick = {(e) => this.clicked(e,i)} key ={i} class="header">{this.props.tabs[i]["title"]}</h2>)
        }

        return(
            <div>
                <div class="parent-tabs">
                    {tabTitles}
                </div>
                {tabContent[this.state.selectedTab]}
            </div>
        )
    }

}

export default Tabs;