clear;

global data_folder_path ;
data_folder_path = 'C:\ResearchCode\BT_SIGNAL_ANALYSIS\SL_House_Data_Visualization\Raw_Data_SL_House';

global AUS_floor_map_image_path ;
AUS_floor_map_image_path = 'C:\ResearchCode\BT_SIGNAL_ANALYSIS\SL_House_Data_Visualization\Resources\Floor_Maps\AUS_Studio.png';

global BT_Icons_folder_path ;
BT_Icons_folder_path = 'C:\ResearchCode\BT_SIGNAL_ANALYSIS\SL_House_Data_Visualization\Resources\BT_Icons\';

global Walking_direction_Icons_folder_path ;
Walking_direction_Icons_folder_path = 'C:\ResearchCode\BT_SIGNAL_ANALYSIS\SL_House_Data_Visualization\Resources\Direction_Icons\'


BT_1_Icon_Location_KitchenCeilings = [];
BT_2_Icon_Location_BathroomCeilings = [];
BT_3_Icon_Location_KitchenFridge = [];
BT_4_Icon_Location_BathroomSink = [];

BT_icon_location_list = [BT_1_Icon_Location_KitchenCeilings,
                    BT_1_Icon_Location_KitchenCeilings,
                    BT_1_Icon_Location_KitchenCeilings,
                    BT_2_Icon_Location_BathroomCeilings,
                    BT_2_Icon_Location_BathroomCeilings,
                    BT_3_Icon_Location_KitchenFridge,
                    BT_3_Icon_Location_KitchenFridge,
                    BT_4_Icon_Location_BathroomSink];
                

BT_icon_list = {'BT_Left.png', 
                'BT_Right.png', 
                'BT_Up.png',
                'BT_Right.png', 
                'BT_Up.png'
                'BT_Right.png', 
                'BT_Right.png', 
                'BT_Down.png'}

Walking_Direction_Icon_Location_P1_Up = [650, 286];
Walking_Direction_Icon_Location_P1_Down = [750, 1200];
Walking_Direction_Icon_Location_P2_Up = [240, 70];
Walking_Direction_Icon_Location_P2_Down = [330, 1150];
Walking_Direction_Icon_Location_P3_Left = [5, 570];
Walking_Direction_Icon_Location_P3_Right = [800, 500];
Walking_Direction_Icon_Location_P4_Left = [5, 948];
Walking_Direction_Icon_Location_P4_Right = [400, 830];            
            
            
walking_direction_icon_list = [Walking_Direction_Icon_Location_P1_Up,
                               Walking_Direction_Icon_Location_P1_Down,
                               Walking_Direction_Icon_Location_P2_Up,
                               Walking_Direction_Icon_Location_P2_Down,
                               Walking_Direction_Icon_Location_P3_Left,
                               Walking_Direction_Icon_Location_P3_Right,
                               Walking_Direction_Icon_Location_P4_Left,
                               Walking_Direction_Icon_Location_P4_Right];
             

walking_direction_icon_image_list = {'Walk_Up.png', 
                                     'Walk_Down.png', 
                                     'Walk_Up.png',
                                     'Walk_Down.png', 
                                     'Walk_Left.png'
                                     'Walk_Right.png', 
                                     'Walk_Left.png', 
                                     'Walk_Right.png'};


Heat_Map_Location_P1_Up = [726, 200];
Heat_Map_Location_P1_Down = [770, 200];
Heat_Map_Location_P2_Up = [296, 5];
Heat_Map_Location_P2_Down = [330, 5];
Heat_Map_Location_P3_Left = [1, 556];
Heat_Map_Location_P3_Right = [1, 606];
Heat_Map_Location_P4_Left = [1, 920];
Heat_Map_Location_P4_Right = [1, 958];


heat_map_location_list = [Heat_Map_Location_P1_Up,
                          Heat_Map_Location_P1_Down,
                          Heat_Map_Location_P2_Up,
                          Heat_Map_Location_P2_Down,
                          Heat_Map_Location_P3_Left,
                          Heat_Map_Location_P3_Right
                          Heat_Map_Location_P4_Left,
                          Heat_Map_Location_P4_Right];



heat_map_rotation_list = [270, 90,  270, 90, 0, 180, 0, 180]
heat_map_length_list = [1100, 1100,  1300, 1300, 850, 850, 500, 500]

[ folder_list, folder_path_list, number_of_folders ] = get_folder_list(data_folder_path);

for folder_index = 1:number_of_folders   
    heat_map_location_index = 1
    visualization_image_save_name = folder_list(folder_index);
    visualization_image_save_name = visualization_image_save_name{1}
    visualization_image_save_name = strcat(visualization_image_save_name , '.png')
    %floor_map_image = Load_Floor_Map('AUS'); 
    h = figure;
    floor_map_image = imread('C:\ResearchCode\BT_SIGNAL_ANALYSIS\AUS_Studio_Data_Visualization\Resources\Floor_Maps\AUS_Studio.png');
    imshow(floor_map_image);
    hold on

    paint_BT_icon(BT_icon_list(folder_index),...        
                  BT_icon_location_list(folder_index,1),...     
                  BT_icon_location_list(folder_index,2));
    paint_all_direction_icons(walking_direction_icon_image_list,...
                              walking_direction_icon_list);
    
    folder_path = folder_path_list(folder_index,1);
    [ file_list, number_of_files ] = get_file_list(folder_path);
    file_index = 0;
    while file_index < number_of_files
        file_index = file_index + 1;
        filepath_1 = file_list(file_index,1);
        
        file_index = file_index + 1;
        filepath_2 = file_list(file_index,1);
        
        filepath_1 = char(filepath_1);
        filepath_2 = char(filepath_2);
        
        [ Raw_Data_Y1_transposed, Raw_Data_Y2_transposed ] = Data_Analyzer_Smooth(filepath_1, filepath_2);
        %hmo = HeatMap(Raw_Data_Y1_transposed);
        %colormap('hot')
        paint_heat_map(Raw_Data_Y1_transposed,...
                       heat_map_rotation_list(heat_map_location_index),...
                       heat_map_length_list(heat_map_location_index),...
                       heat_map_location_list(heat_map_location_index, 1),...
                       heat_map_location_list(heat_map_location_index, 2));
                   
        heat_map_location_index = (heat_map_location_index + 1)
        
        paint_heat_map(Raw_Data_Y2_transposed,...
                       heat_map_rotation_list(heat_map_location_index),...
                       heat_map_length_list(heat_map_location_index),...
                       heat_map_location_list(heat_map_location_index, 1),...
                       heat_map_location_list(heat_map_location_index, 2));
                   
        heat_map_location_index = (heat_map_location_index + 1)
        
    end
    saveas(h, visualization_image_save_name,'png');
    close(h)
end
