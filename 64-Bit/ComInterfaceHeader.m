function [methodinfo,structs,enuminfo,ThunkLibName]=ComInterfaceHeader
%COMINTERFACEHEADER Create structures to define interfaces found in 'ComInterface'.

%This function was generated by loadlibrary.m parser version  on Mon Apr 22 11:03:40 2019
%perl options:'ComInterface.i -outfile=ComInterfaceHeader.m -thunkfile=AMC4030_thunk_pcwin64.c -header=ComInterface.h'
ival={cell(1,0)}; % change 0 to the actual number of functions to preallocate the data.
structs=[];enuminfo=[];fcnNum=1;
fcns=struct('name',ival,'calltype',ival,'LHS',ival,'RHS',ival,'alias',ival,'thunkname', ival);
MfilePath=fileparts(mfilename('fullpath'));
ThunkLibName=fullfile(MfilePath,'AMC4030_thunk_pcwin64');
% int COM_API_SetComType ( int nType ); 
fcns.thunkname{fcnNum}='int32int32Thunk';fcns.name{fcnNum}='COM_API_SetComType'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32'};fcnNum=fcnNum+1;
% int COM_API_OpenLink ( int nID , int nBound ); 
fcns.thunkname{fcnNum}='int32int32int32Thunk';fcns.name{fcnNum}='COM_API_OpenLink'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;
% int COM_API_GetMachineStatus ( unsigned char * unStatus ); 
fcns.thunkname{fcnNum}='int32voidPtrThunk';fcns.name{fcnNum}='COM_API_GetMachineStatus'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'uint8Ptr'};fcnNum=fcnNum+1;
% int COM_API_ReadFileData ( int nSrc , int StartAdd , int len , unsigned char * pOutput ); 
fcns.thunkname{fcnNum}='int32int32int32int32voidPtrThunk';fcns.name{fcnNum}='COM_API_ReadFileData'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32', 'uint8Ptr'};fcnNum=fcnNum+1;
% int COM_API_WriteFileData ( int nSrc , int StartAdd , int len , unsigned char * pInput ); 
fcns.thunkname{fcnNum}='int32int32int32int32voidPtrThunk';fcns.name{fcnNum}='COM_API_WriteFileData'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32', 'uint8Ptr'};fcnNum=fcnNum+1;
% int COM_API_Jog ( int nAxis , float fDis , float Speed ); 
fcns.thunkname{fcnNum}='int32int32floatfloatThunk';fcns.name{fcnNum}='COM_API_Jog'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'single', 'single'};fcnNum=fcnNum+1;
% int COM_API_Home ( int nXAxisSet , int nYAxisSet , int nZAxisSet ); 
fcns.thunkname{fcnNum}='int32int32int32int32Thunk';fcns.name{fcnNum}='COM_API_Home'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32'};fcnNum=fcnNum+1;
% int COM_API_StartAutoRun ( int nType , int nID ); 
fcns.thunkname{fcnNum}='int32int32int32Thunk';fcns.name{fcnNum}='COM_API_StartAutoRun'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;
% int COM_API_StopAxis ( int nXAxisSet , int nYAxisSet , int nZAxisSet ); 
fcns.thunkname{fcnNum}='int32int32int32int32Thunk';fcns.name{fcnNum}='COM_API_StopAxis'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32', 'int32'};fcnNum=fcnNum+1;
% int COM_API_StopAll (); 
fcns.thunkname{fcnNum}='int32Thunk';fcns.name{fcnNum}='COM_API_StopAll'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}=[];fcnNum=fcnNum+1;
% int COM_API_SetOutputBit ( int OutputID , int nStatus ); 
fcns.thunkname{fcnNum}='int32int32int32Thunk';fcns.name{fcnNum}='COM_API_SetOutputBit'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'int32'};fcnNum=fcnNum+1;
% int COM_API_GetLastError ( unsigned int * dwErr ); 
fcns.thunkname{fcnNum}='int32voidPtrThunk';fcns.name{fcnNum}='COM_API_GetLastError'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'uint32Ptr'};fcnNum=fcnNum+1;
% int COM_API_DowloadSystemCfg ( char * iniPath ); 
fcns.thunkname{fcnNum}='int32cstringThunk';fcns.name{fcnNum}='COM_API_DowloadSystemCfg'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring'};fcnNum=fcnNum+1;
% int COM_API_DowloadFile ( char * szPath , int nType , int ShowProcess ); 
fcns.thunkname{fcnNum}='int32cstringint32int32Thunk';fcns.name{fcnNum}='COM_API_DowloadFile'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'cstring', 'int32', 'int32'};fcnNum=fcnNum+1;
% int COM_API_SendData ( int nLen , unsigned char * pData ); 
fcns.thunkname{fcnNum}='int32int32voidPtrThunk';fcns.name{fcnNum}='COM_API_SendData'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'uint8Ptr'};fcnNum=fcnNum+1;
% int COM_API_ReadData ( int nLen , unsigned char * pInput , unsigned char * pOutput ); 
fcns.thunkname{fcnNum}='int32int32voidPtrvoidPtrThunk';fcns.name{fcnNum}='COM_API_ReadData'; fcns.calltype{fcnNum}='Thunk'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'int32', 'uint8Ptr', 'uint8Ptr'};fcnNum=fcnNum+1;
methodinfo=fcns;