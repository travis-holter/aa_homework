const selectLocation = (city, jobs) => {
    return {
        type: "SWITCH_LOCATIONS",
        city,
        jobs,
    };
};

export default selectLocation;