{
    "id":1,
    "title":"Button",
    "expanded": false,
    "basic": false,
    "items":[
       {
          "title":"Text Button",
          "sub_items":[
             {
                "id":1,
                "subtitle":false,
                "title":"Foreground Color",
                "key":"key_txt_btn_foreground_color",
                "value_type":"string",
                "input":"color",
                "dark":{
                   "id":0,
                   "value":[ 
                     {
                        "id": 0,
                        "label":"color",
                        "selected": true,
                        "value": "#FFFFFFFF",
                        "selected_value": "#FFFFFFFF"
                     }
                   ]
                },
                "light":{
                   "id":1,
                   "value":[ 
                     {
                        "id": 0,
                        "label":"color",
                        "selected": true,
                        "value": "#FF000000",
                        "selected_value": "#FF000000"
                     }
                   ]
                }
             },
             {
                "id":1,
                "subtitle":false,
                "title":"Background Color",
                "key":"key_txt_btn_background_color",
                "value_type":"string",
                "input":"color",
                "dark":{
                   "id":0,
                   "value":[ 
                     {
                        "id": 0,
                        "label":"color",
                        "selected": true,
                        "value": "#FF000000",
                        "selected_value": "#FF000000"
                     }
                   ]
                },
                "light":{
                   "id":1,
                   "value":[ 
                     {
                        "id": 0,
                        "label":"color",
                        "selected": true,
                        "value": "#FFFFFFFF",
                        "selected_value": "#FFFFFFFF"
                     }
                   ]
                }
             }
            
          ]
       }
    ]
 }




 {
   "id":1,
   "subtitle":false,
   "title":"Elevation",
   "key":"key_card_elevation",
   "value_type":"string",
   "input":"number",
   "dark":{
      "id":0,
      "value":[ 
        {
           "id": 0,
           "label":"Elevation",
           "selected": true,
           "value": "3",
           "selected_value": "3"
        }
      ]
   },
   "light":{
      "id":1,
      "value":[ 
        {
           "id": 0,
           "label":"Elevation",
           "selected": true,
           "value": "3",
           "selected_value": "3"
        }
      ]
   }
} 


// child: ListView.builder(
                //   itemCount: item.subItems.length,
                //   scrollDirection: Axis.horizontal,
                //   itemBuilder: (context, index) {
                //     final subItem = item.subItems[index];
                //     Widget widget = Container();
                //     if (subItem.input == 'color') {
                //       widget = _color(uiModel, subItem, dark, state);
                //     }
                //     if (subItem.input == 'dropdown') {
                //       widget = _dropDown(uiModel, subItem, dark, state);
                //     }
                //     if (subItem.input == 'boolean') {
                //       widget = _toggle(context, uiModel, subItem, dark, state);
                //     }
                //     if (subItem.input == 'number') {
                //       widget = _number(context, uiModel, subItem, dark, state);
                //     }
                //     return Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Container(
                //           height: controlsDimen,
                //           width: 250,
                //           alignment: Alignment.centerLeft,
                //           padding: const EdgeInsets.only(right: 30),
                //           child: widget,
                //         ),
                //       ],
                //     );
                //   },
                // ),