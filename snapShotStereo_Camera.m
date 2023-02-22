%% Permite tomar capturas de dos camaras al mismo tiempo para proporcionar 
% n imagenes a la app Stero Camera Calibrator app con el objetivo de 
% calibrar las dos camaras 5m aprox.


clear
close all
clc
webcamlist % Realiza lista de camaras conectadas o integradas
% Nota: si se tienen multiples camaras con el mismo nombre, usar webcam(n)
% Para crear los objetos de camaras, n= 1, 2, 3


cam1_L=webcam(3);%creando objeto camara izquierda
%cam1_L.AvailableResolutions
cam1_L.Resolution="1280x720"
cam2_R=webcam(1); %creando objeto camara derecha
cam2_R.Resolution="1280x720"

%% Prende las camaras y da imagenes
preview(cam1_L);

preview(cam2_R);



%% Crear Arreglo para guardar las imagenes
n=30;  % cantidad deseada de capturas a tomar
pic_cam1_L=cell(1,n);
pic_cam2_R=cell(1,n);

%% Ruta para guardar las imagenes
path_cam1_L="D:\UAEM\MCI\Primer semestre\Programación\StereoVision\Cam1_Left";
path_cam2_R="D:\UAEM\MCI\Primer semestre\Programación\StereoVision\Cam2_Right";


%% Obteniendo los spnatshots de la camara izquierda y derecha 
pause(3); %pausa para el procesamiento de los comandos
for i=1:n
    pic_cam1_L{i}=snapshot(cam1_L);
    pic_cam2_R{i}=snapshot(cam2_R);

    %muestra una ventana con un plot de la vista previa de cam1 y cam 2
    subplot(1,2,1);
    imshow(pic_cam1_L{i}),title('Camara Izquierda');
    subplot(1,2,2);
    imshow(pic_cam2_R{i}),title('Camara Derecha');

    frame_cam1_L=['Left' num2str(i) '.jpeg'];
    imwrite(pic_cam1_L{i},fullfile(path_cam1_L,frame_cam1_L),'JPEG');
    %disp(['Imagenes camara 1 izquierda, guardadas']);

    frame_cam2_R=['Right' num2str(i) '.jpeg'];
    imwrite(pic_cam2_R{i},fullfile(path_cam2_R,frame_cam2_R),'JPEG');
    %disp(['Imagenes camara 2 derecha, guardadas']);

    pause(3); %Pusa 3 segundos por cada captura

    disp(['Imagen ' num2str(i) ' guardada']);
end

%% Cierra las ventanas

closePreview(cam1_L);
closePreview(cam2_R);
close all;

