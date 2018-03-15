/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 4 Vehicles
private _vehicles = [
["Exile_Locker", [10808.7, 4734.95, 11.931], [-0.087644, -0.996152, 0.000242086], [0.00276214, 0, 0.999996], true],
["Exile_Sign_Locker", [10812.2, 4735.87, 12.9622], [-0.997193, 0.0748748, 0], [0, 0, 1], true],
["Exile_ConcreteMixer", [7650.86, 4479.07, 113.519], [-0.997862, 0.0532963, -0.0378171], [-0.0378893, -0.000344807, 0.999282], true],
["Exile_ConcreteMixer", [5526.86, 9639.47, 247.202], [0, 0.999997, 0.00253707], [0.00138075, -0.00253707, 0.999996], true]
];

{
    private _vehicle = (_x select 0) createVehicle (_x select 1);
    _vehicle allowDamage false;
    _vehicle setPosWorld (_x select 1);
    _vehicle setVectorDirAndUp [_x select 2, _x select 3];
    _vehicle enableSimulationGlobal (_x select 4);
    _vehicle setVariable ["ExileIsLocked", -1, true];
    
    if (_vehicle isKindOf "Exile_RussianRouletteChair") then
    {
        ExileRouletteChairs pushBack _vehicle;
        ExileRouletteChairPositions pushBack [_x select 1, getDir _vehicle];
    };
}
forEach _vehicles;

// 0 Simple Objects
private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
private _simpleObjects = [

];

{
    private _simpleObject = createSimpleObject [_x select 0, _x select 1];
    _simpleObject setVectorDirAndUp [_x select 2, _x select 3];
    
    {
        if ((toLower _x) in _invisibleSelections) then 
        {
            _simpleObject hideSelection [_x, true];
        };
    }
    forEach (selectionNames _simpleObject);
}
forEach _simpleObjects;