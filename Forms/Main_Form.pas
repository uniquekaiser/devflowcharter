{
   Copyright (C) 2006 The devFlowcharter project.
   The initial author of this file is Michal Domagala.
    
   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation; either version 2
   of the License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
}



{ This unit contains implementation of main form }

unit Main_Form;

interface

uses
  Windows, Graphics, Controls, Forms, StdCtrls, ExtCtrls, Menus, Printers,
  ImgList, Clipbrd, Types, OmniXML, SysUtils, Classes, ShellApi, StrUtils, Base_Form,
  Messages, History, Dialogs;

type

  TMainForm = class(TBaseForm)
    PopupMenu: TPopupMenu;
    ExportDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    miAssign: TMenuItem;
    miMultipleAssign: TMenuItem;
    miIfElse: TMenuItem;
    miWhile: TMenuItem;
    miFor: TMenuItem;
    miRepeat: TMenuItem;
    miFontStyle: TMenuItem;
    miFontSize: TMenuItem;
    miStyleBold: TMenuItem;
    miStyleItalic: TMenuItem;
    miStyleUnderline: TMenuItem;
    miStyleNormal: TMenuItem;
    miSize8: TMenuItem;
    miSize10: TMenuItem;
    miSize12: TMenuItem;
    miInsert: TMenuItem;
    miFont: TMenuItem;
    miRemove: TMenuItem;
    miInput: TMenuItem;
    miOutput: TMenuItem;
    mmMainMenu: TMainMenu;
    miFile: TMenuItem;
    miProject: TMenuItem;
    miAbout: TMenuItem;
    miToolbox: TMenuItem;
    miDeclarations: TMenuItem;
    miGenerate: TMenuItem;
    miNew: TMenuItem;
    miOpen: TMenuItem;
    miSave: TMenuItem;
    miSaveAs: TMenuItem;
    miClose: TMenuItem;
    N2: TMenuItem;
    miExit: TMenuItem;
    N3: TMenuItem;
    miPrint: TMenuItem;
    miSettings: TMenuItem;
    PrintDialog: TPrintDialog;
    N4: TMenuItem;
    miComment: TMenuItem;
    miRoutineCall: TMenuItem;
    miInstr: TMenuItem;
    miLoop: TMenuItem;
    miUndoRemove: TMenuItem;
    miPaste: TMenuItem;
    miCopy: TMenuItem;
    miReopen: TMenuItem;
    N5: TMenuItem;
    miIf: TMenuItem;
    miExplorer: TMenuItem;
    miOptions: TMenuItem;
    miSubRoutines: TMenuItem;
    ImageList1: TImageList;
    miCut: TMenuItem;
    N1: TMenuItem;
    N6: TMenuItem;
    miDataTypes: TMenuItem;
    miFrame: TMenuItem;
    miExport: TMenuItem;
    miImport: TMenuItem;
    miExpFold: TMenuItem;
    miAddBranch: TMenuItem;
    miCase: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    miRemoveBranch: TMenuItem;
    miStyleStrikeOut: TMenuItem;
    miReturn: TMenuItem;
    miExpandAll: TMenuItem;
    miPrint2: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    miAddMain: TMenuItem;
    N13: TMenuItem;
    miNewFlowchart: TMenuItem;
    miNavigator: TMenuItem;
    N12: TMenuItem;
    miText: TMenuItem;
    N14: TMenuItem;
    miForAsc: TMenuItem;
    miForDesc: TMenuItem;
    miMemo: TMenuItem;
    miMemoVScroll: TMenuItem;
    miMemoEdit: TMenuItem;
    N15: TMenuItem;
    miMemoHScroll: TMenuItem;
    miMemoWordWrap: TMenuItem;
    miNewFunction: TMenuItem;
    miFolder: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miNewClick(Sender: TObject);
    procedure miOpenClick(Sender: TObject);
    procedure miSaveAsClick(Sender: TObject);
    procedure miGenerateClick(Sender: TObject);
    procedure miSettingsClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure miSaveClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MyOnException(Sender: TObject; E: Exception);
    procedure miUndoRemoveClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure miCommentClick(Sender: TObject);
    procedure miAssignClick(Sender: TObject);
    procedure miStyleBoldClick(Sender: TObject);
    procedure miSize8Click(Sender: TObject);
    procedure miCopyClick(Sender: TObject);
    procedure miRemoveClick(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure miSubRoutinesClick(Sender: TObject);
    procedure miExportClick(Sender: TObject);
    procedure miImportClick(Sender: TObject);
    procedure miFrameClick(Sender: TObject);
    procedure miExpFoldClick(Sender: TObject);
    procedure miAddBranchClick(Sender: TObject);
    procedure miRemoveBranchClick(Sender: TObject);
    procedure miExpandAllClick(Sender: TObject);
    procedure Localize(const AList: TStringList); override;
    procedure ResetForm; override;
    procedure SetMenu(const AEnabled: boolean);
    procedure miPrint2Click(Sender: TObject);
    procedure miProjectClick(Sender: TObject);
    procedure miAddMainClick(Sender: TObject);
    procedure SetScrollBars;
    procedure miNewFlowchartClick(Sender: TObject);
    procedure ScrollV(var Msg: TWMVScroll); message WM_VSCROLL;
    procedure ScrollH(var Msg: TWMHScroll); message WM_HSCROLL;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure miForAscClick(Sender: TObject);
    procedure miMemoEditClick(Sender: TObject);
    procedure miMemoVScrollClick(Sender: TObject);
    procedure PerformFormsRepaint;
    procedure miNewFunctionClick(Sender: TObject);
    procedure AutoScrollInView(AControl: TControl); override;
  private
    { Private declarations }
    FHistoryMenu: THistoryMenu;
  public
    { Public declarations }
    procedure ExportSettingsToXMLTag(const root: IXMLElement); override;
    procedure ImportSettingsFromXMLTag(const root: IXMLElement); override;
    function ConfirmSave: integer;
    function GetDisplayedRect: TRect;
  end;

var
  MainForm: TMainForm;

implementation

uses
     Toolbox_Form, ApplicationCommon, Settings_Form, About_Form, Main_Block,
     TreeView_Form, Functions_Form, ParseGlobals, DataTypes_Form,
     LocalizationManager, XMLProcessor, UserFunction, ForDo_Block, Return_Block, Project,
     Declarations_Form, SourceEditor_Form, Base_Block, Comment, Case_Block, jpeg,
     CommonInterfaces, Navigator_Form, CommonTypes, LangDefinition,
     EditMemo_Form, BlockFactory;

type
     TDerivedControl = class(TControl);

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
const
   CursorIdsArray: array[TCustomCursor] of PChar = (' ', 'IFELSE', 'FOR', 'REPEAT',
                   'WHILE', 'ASSIGN', 'MULTIASSIGN', 'IF', 'SUBROUTINE', 'INPUT', 'OUTPUT',
                   'CASE', 'RETURN', 'TEXT', 'FOLDER');
var
   lCursor: TCustomCursor;
begin
   lCursor := crNormal;
   repeat
      Inc(lCursor);
      Screen.Cursors[Ord(lCursor)] := LoadCursor(HInstance, CursorIdsArray[lCursor]);
   until lCursor = High(TCustomCursor);
   InitialiseVariables;
   DecimalSeparator := '.';
   SystemParametersInfo(SPI_SETDRAGFULLWINDOWS, Ord(True), nil, 0);
   Application.HintHidePause := HINT_PAUSE;
   Application.OnException := MyOnException;
   Application.Title := PROGRAM_NAME;
   Caption := PROGRAM_NAME;
   FHistoryMenu := THistoryMenu.Create(miReopen, miOpen.OnClick);
   ControlStyle := ControlStyle + [csOpaque];
   FHistoryMenu.Load;
end;

procedure TMainForm.ScrollV(var Msg: TWMVScroll);
begin
   inherited;
   PerformFormsRepaint;
end;

procedure TMainForm.ScrollH(var Msg: TWMHScroll);
begin
   inherited;
   PerformFormsRepaint;
end;

procedure TMainForm.ResetForm;
begin
   miUndoRemove.Enabled := false;
   VertScrollBar.Range := ClientHeight;
   HorzScrollBar.Range := ClientWidth;
   VertScrollbar.Position := 0;
   HorzScrollBar.Position := 0;
   Caption := PROGRAM_NAME;
   SetMenu(false);
end;

procedure TMainForm.SetMenu(const AEnabled: boolean);
begin
   miSave.Enabled      := AEnabled;
   miSaveAs.Enabled    := AEnabled;
   miClose.Enabled     := AEnabled;
   miPrint.Enabled     := AEnabled;
   miToolbox.Enabled   := AEnabled;
   miNavigator.Enabled := AEnabled;
   if AEnabled then
   begin
      miSubRoutines.Enabled := GInfra.CurrentLang.EnabledUserFunctionHeader;
      miDataTypes.Enabled := GInfra.CurrentLang.EnabledUserDataTypes;
      miDeclarations.Enabled := GInfra.CurrentLang.EnabledConsts or GInfra.CurrentLang.EnabledVars;
      miExplorer.Enabled := GInfra.CurrentLang.EnabledExplorer;
      miGenerate.Enabled := GInfra.CurrentLang.EnabledCodeGenerator;
      miAddMain.Enabled := GInfra.CurrentLang.EnabledMainProgram;
   end
   else
   begin
      miDeclarations.Enabled := false;
      miSubRoutines.Enabled := false;
      miDataTypes.Enabled := false;
      miGenerate.Enabled := false;
      miExplorer.Enabled := false;
      miAddMain.Enabled := false;
   end;
end;

procedure TMainForm.AutoScrollInView(AControl: TControl);
begin
   //inherited AutoScrollInView(AControl);
end;

procedure TMainForm.Localize(const AList: TStringList);
begin
   if GProject <> nil then
   begin
      GProject.RepaintFlowcharts;
      GProject.RefreshStatements;
   end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
   SetMenu(false);
   Color := GSettings.DesktopColor;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FHistoryMenu.Save;
   GClpbrd.UndoObject.Free;
   GProject.Free;
   GProject := nil;
   if GSettings <> nil then
      GSettings.WriteToRegistry;
   GSettings.Free;
   GSettings := nil;
   FHistoryMenu.Free;
   i18Manager.Free;
   i18Manager := nil;
end;

procedure TMainForm.miNewClick(Sender: TObject);
var
   lBlock: TMainBlock;
begin
   if GChange = 1 then
   begin
      case ConfirmSave of
         IDYES: miSave.Click;
         IDCANCEL: exit;
      end;
   end;
   TInfra.SetInitialSettings;
   GProject := TProject.GetInstance;
   lBlock := TMainBlock.Create(Self, GInfra.GetMainBlockNextTopLeft(Self));
   lBlock.OnResize(lBlock);
   TUserFunction.Create(nil, lBlock);
   ExportDialog.FileName := '';
end;

procedure TMainForm.miOpenClick(Sender: TObject);
var
   lTmpCursor: TCursor;
   lFileName, lErrMsg: string;
   lStatus: TErrorType;
begin
    if (GChange = 1) and (GProject <> nil) then
    begin
       case ConfirmSave of
          IDYES: miSave.Click;
          IDCANCEL: exit;
       end;
    end;   

    lFileName := '';
    lErrMsg := '';
    if Sender = miOpen then
    begin
       if OpenDialog.Execute then
          lFileName := OpenDialog.FileName;
    end
    else
       lFileName := StripHotKey(TMenuItem(Sender).Caption);

    if FileExists(lFileName) then
    begin
       TInfra.SetInitialSettings;
       lTmpCursor := Screen.Cursor;
       Screen.Cursor := crHourGlass;
       lStatus := errGeneral;
       try
          try
             GProject := TProject.GetInstance;
             GProject.Name := AnsiReplaceText(ExtractFileName(lFileName), '.xml', '');
             lStatus := TXMLProcessor.ImportFromXMLFile(lFileName, GProject.ImportFromXMLTag);
          except on E: Exception do
             lErrMsg := E.Message;
          end;
       finally
          Screen.Cursor := lTmpCursor;
          GChange := 0;
          if lStatus = errNone then
          begin
             Caption := MAIN_FORM_CAPTION + lFileName;
             FHistoryMenu.Add(lFileName);
          end
          else
          begin
             if lErrMsg <> '' then
                lErrMsg := i18Manager.GetFormattedString('FileError', [ExpandFileName(lFileName)]) + CRLF + lErrMsg
             else
                lErrMsg := Gerr_text;
             TInfra.ShowErrorBox(lErrMsg, lStatus);
             TInfra.SetInitialSettings;
          end;
       end;
    end;
end;

procedure TMainForm.miSaveAsClick(Sender: TObject);
var
   status: TErrorType;
   lGraphic: TGraphic;
   lFileName: string;
begin
    ExportDialog.FileName := GProject.Name;
    ExportDialog.Filter := i18Manager.GetString('XMLFilesFilter') + '|' +
                           i18Manager.GetString('BMPFilesFilter') + '|' +
                           i18Manager.GetString('JPGFilesFilter');
    ExportDialog.FilterIndex := 1;

    if ExportDialog.Execute then
    begin
       lFileName := ExportDialog.Filename;
       if ExportDialog.FilterIndex = 1 then
       begin
          if FileExists(lFileName) and FileIsReadOnly(lFileName) then
             TInfra.ShowFormattedErrorBox('SaveReadOnlyFile', [lFileName], errIO)
          else
          begin
             status := TXMLProcessor.ExportToXMLFile(lFileName, GProject.ExportToXMLTag);
             if status = errNone then
             begin
                Caption := MAIN_FORM_CAPTION + lFileName;
                GProject.Name :=  ExtractFileName(lFileName);
                GProject.Name :=  AnsiReplaceText(GProject.Name, '.xml', '');
                FHistoryMenu.Add(lFileName);
                GChange := 0;
             end
             else
                TInfra.ShowFormattedErrorBox('SaveError', [lFileName], status);
          end;
       end
       else
       begin
          if ExportDialog.FilterIndex = 2 then
             lGraphic := TBitmap.Create
          else
             lGraphic := TJPEGImage.Create;
          try
             GProject.ExportToGraphic(lGraphic);
             lGraphic.SaveToFile(lFileName);
          finally
             lGraphic.Free;
          end;
       end
    end;
end;

procedure TMainForm.miGenerateClick(Sender: TObject);
begin
   if SourceEditorForm.Showing then
   begin
      if SourceEditorForm.WindowState = wsMinimized then
         SourceEditorForm.WindowState := wsNormal;
      SourceEditorForm.OnShow(SourceEditorForm);
   end
   else
      SourceEditorForm.Show;
end;

procedure TMainForm.miSettingsClick(Sender: TObject);
begin
   SettingsForm.ShowModal;
end;

procedure TMainForm.miExitClick(Sender: TObject);
begin
   Close;
end;

procedure TMainForm.miCloseClick(Sender: TObject);
begin
   if GChange = 1 then
   begin
      case ConfirmSave of
         IDYES: miSave.Click;
         IDCANCEL: exit;
      end;
   end;
   TInfra.SetInitialSettings;
end;

procedure TMainForm.miSaveClick(Sender: TObject);
var
   fileToWrite: string;
   status: TErrorType;
begin
    if Caption = PROGRAM_NAME then
       miSaveAs.Click
    else if GProject <> nil then
    begin
       fileToWrite := AnsiReplaceText(Caption, MAIN_FORM_CAPTION, '');
       if FileExists(fileToWrite) and FileIsReadOnly(fileToWrite) then
          TInfra.ShowFormattedErrorBox('SaveReadOnlyFile', [fileToWrite], errIO)
       else
       begin
          status := TXMLProcessor.ExportToXMLFile(fileToWrite, GProject.ExportToXMLTag);
          if status <> errNone then
             TInfra.ShowFormattedErrorBox('SaveError', [fileToWrite], status)
          else
             GChange := 0;
       end;
    end;
end;

procedure TMainForm.miPrintClick(Sender: TObject);
var
   lBitmap: TBitmap;
begin
   lBitmap := TBitmap.Create;
   try
      GProject.ExportToGraphic(lBitmap);
      TInfra.PrintBitmap(lBitmap);
   finally
      lBitmap.Free;
   end;
end;

procedure TMainForm.miAboutClick(Sender: TObject);
begin
    AboutForm.ShowModal;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   if (GChange = 1) and (GProject <> nil) then
   begin
      case ConfirmSave of
         IDYES: miSave.Click;
         IDCANCEL: CanClose := false;
      end;
   end;
end;

procedure TMainForm.MyOnException(Sender: TObject; E: Exception);
var
   lExceptMsg: array[0..255] of Char;
begin
   if (ExceptAddr = nil) or (ExceptionErrorMessage(E, ExceptAddr, lExceptMsg, SizeOf(lExceptMsg)) = 0) then
      lExceptMsg := '';
   TInfra.ShowFormattedErrorBox('OtherException', [lExceptMsg], errGeneral);
   TInfra.SetInitialSettings;
end;

procedure TMainForm.miUndoRemoveClick(Sender: TObject);
var
   lBlock: TBlock;
   lActiveObject: IXMLable;
begin
   if (GClpbrd.UndoObject is TBlock) and (TBlock(GClpbrd.UndoObject).ParentBlock <> nil) then
   begin
      lBlock := TBlock(GClpbrd.UndoObject);
      if not lBlock.ParentBlock.CanFocus or
         not lBlock.ParentBlock.Expanded or ((lBlock is TReturnBlock) and (lBlock.ParentBranch.FindInstanceOf(TReturnBlock) <> -1)) then exit;
      lBlock.ParentBranch.UndoRemove(lBlock);
      lBlock.ParentBlock.ResizeWithDrawLock;
      lBlock.Show;
      NavigatorForm.Repaint;
   end
   else if Supports(GClpbrd.UndoObject, IXMLable, lActiveObject) then
      lActiveObject.Active := true;
   if GSettings.UpdateEditor then
      SourceEditorForm.RefreshEditorForObject(GClpbrd.UndoObject);
   GClpbrd.UndoObject := nil;
   miUndoRemove.Enabled := false;
end;

procedure TMainForm.PopupMenuPopup(Sender: TObject);
var
   lComponent: TComponent;
   lBlock: TBlock;
   lFont: TFont;
begin
   lFont := nil;
   miFont.Visible := False;
   miCopy.Visible := False;
   miCut.Visible := False;
   miRemove.Visible := False;
   miInsert.Visible := False;
   miPaste.Enabled := False;
   miInstr.Enabled := False;
   miLoop.Enabled := False;
   miFrame.Visible := False;
   miFrame.Checked := False;
   miExport.Visible := False;
   miImport.Visible := True;
   miExpFold.Visible := False;
   miAddBranch.Visible := False;
   miRemoveBranch.Visible := False;
   miText.Enabled := False;
   miFolder.Enabled := False;
   miExpFold.Caption := i18Manager.GetString('miFoldBlock');
   miReturn.Enabled := False;
   miExpandAll.Visible := False;
   miPrint2.Visible := False;
   miNewFlowchart.Visible := GInfra.CurrentLang = GInfra.DummyLang;
   miNewFunction.Visible := GInfra.CurrentLang.EnabledUserFunctionHeader and GInfra.CurrentLang.EnabledUserFunctionBody;
   miForAsc.Visible := False;
   miForDesc.Visible := False;
   miMemo.Visible := False;


   miStyleBold.Checked := False;
   miStyleItalic.Checked := False;
   miStyleUnderline.Checked := False;
   miStyleStrikeOut.Checked := False;
   miStyleNormal.Checked := False;
   miSize8.Checked := False;
   miSize10.Checked := False;
   miSize12.Checked := False;

   lComponent := PopupMenu.PopupComponent;

   miPaste.Enabled := TInfra.IsValid(GClpbrd.Instance);

   if lComponent is TBlock then
   begin
       lBlock := TBlock(lComponent);
       lFont := lBlock.GetFont;
       if lBlock.Ired >= 0 then
       begin
          miInsert.Visible := True;
          miInstr.Enabled := True;
          miLoop.Enabled := True;
          miText.Enabled := True;
          miFolder.Enabled := True;
          miReturn.Enabled := lBlock.CanInsertReturnBlock;
          if (GClpbrd.Instance is TComment) or ((GClpbrd.Instance is TReturnBlock) and not miReturn.Enabled) then
             miPaste.Enabled := False;
       end
       else if lBlock.IsCursorSelect then
       begin
          miRemove.Visible := True;
          miFont.Visible := True;
          miMemoEdit.Visible := lBlock.GetFrontMemo <> nil;
          if not (lBlock is TReturnBlock) then
             miExport.Visible := True;
          miPrint2.Visible := True;
          if not (lBlock is TMainBlock) then
          begin
             miCopy.Visible := True;
             miCut.Visible := True;
          end;
          if lBlock is TGroupBlock then
          begin
             miExpFold.Visible := true;
             if TGroupBlock(lBlock).Expanded then
             begin
                miExpFold.Caption := i18Manager.GetString('miFoldBlock');
                if lBlock is TCaseBlock then
                   miAddBranch.Visible := True;
             end
             else
                miExpFold.Caption := i18Manager.GetString('miExpandBlock');
          end;
          if (lBlock is TGroupBlock) and TGroupBlock(lBlock).Expanded and TGroupBlock(lBlock).HasFoldedBlocks then
             miExpandAll.Visible := true;
          if lBlock is TForDoBlock then
          begin
             miForAsc.Visible := true;
             miForDesc.Visible := true;
             miForAsc.Checked := TForDoBlock(lBlock).Order = orAsc;
             miForDesc.Checked := not miForAsc.Checked;
          end;
          miMemo.Visible := lBlock.GetFrontMemo <> nil;
          if miMemo.Visible then
          begin
             miMemoVScroll.Checked := lBlock.MemoVScroll;
             miMemoHScroll.Checked := lBlock.MemoHScroll;
             miMemoWordWrap.Checked := lBlock.MemoWordWrap;
          end;
       end
       else
       begin
          miInsert.Visible := True;
          miComment.Enabled := True;
          if GClpbrd.Instance is TBlock then
             miPaste.Enabled := False;
       end;
       miFrame.Visible := True;
       miFrame.Checked := lBlock.FrameInd;
       if (lBlock is TCaseBlock) and (lBlock.Ired > PRIMARY_BRANCH_IND) then
          miRemoveBranch.Visible := True;
   end
   else if lComponent is TComment then
   begin
      lFont := TComment(lComponent).Font;
      miRemove.Visible := True;
      miFont.Visible := True;
      miCopy.Visible := True;
      if GClpbrd.Instance is TBlock then
         miPaste.Enabled := false;
   end
   else
   begin
      miInsert.Visible := True;
      if GClpbrd.Instance is TBlock then
         miPaste.Enabled := false;
   end;
   if lFont <> nil then
   begin
      miStyleBold.Checked := fsBold in lFont.Style;
      miStyleItalic.Checked := fsItalic in lFont.Style;
      miStyleUnderline.Checked := fsUnderline in lFont.Style;
      miStyleStrikeOut.Checked := fsStrikeOut in lFont.Style;
      miStyleNormal.Checked := lFont.Style = [];
      case lFont.Size of
         8:   miSize8.Checked := true;
         10:  miSize10.Checked := true;
         12:  miSize12.Checked := true;
      end;
   end;
end;

procedure TMainForm.miCommentClick(Sender: TObject);
var
   lPoint: TPoint;
begin
   lPoint := ScreenToClient(PopupMenu.PopupPoint);
   TComment.Create(Self, lPoint.X, lPoint.Y, 150, 50);
   GChange := 1;
end;

procedure TMainForm.miAssignClick(Sender: TObject);
var
   lNewBlock, lCurrentBlock: TBlock;
   lBranch: TBranch;
   lParent: TGroupBlock;
   lTmpCursor: TCursor;
   lNewComment: TComment;
   lPoint: TPoint;
   lBlockType: TBlockType;
   lLocked: boolean;
begin

   lParent := nil;

   if PopupMenu.PopupComponent is TBlock then
   begin
      lCurrentBlock := TBlock(PopupMenu.PopupComponent);
      if (lCurrentBlock.Ired > 0) and (lCurrentBlock is TGroupBlock) then
         lParent := TGroupBlock(lCurrentBlock)
      else if lCurrentBlock.Ired = 0 then
         lParent := lCurrentBlock.ParentBlock;
   end;

   if lParent <> nil then
   begin

      lBranch := lParent.GetBranch(lParent.Ired);
      if lBranch <> nil then
         lCurrentBlock := nil
      else
         lBranch := lCurrentBlock.ParentBranch;

      if lBranch <> nil then
      begin
         lLocked := lBranch.ParentBlock.LockDrawing;
         try
            lNewBlock := nil;
            lBlockType := blUnknown;
            if Sender = miAssign then
               lBlockType := blAssign
            else if Sender = miMultipleAssign then
               lBlockType := blMultAssign
            else if Sender = miIfElse then
               lBlockType := blIfElse
            else if Sender = miWhile then
               lBlockType := blWhile
            else if Sender = miFor then
               lBlockType := blFor
            else if Sender = miRepeat then
               lBlockType := blRepeat
            else if Sender = miInput then
               lBlockType := blInput
            else if Sender = miOutput then
               lBlockType := blOutput
            else if Sender = miRoutineCall then
               lBlockType := blFuncCall
            else if Sender = miIf then
               lBlockType := blIf
            else if Sender = miCase then
               lBlockType := blCase
            else if Sender = miReturn then
               lBlockType := blReturn
            else if Sender = miText then
               lBlockType := blText
            else if Sender = miFolder then
               lBlockType := blFolder
            else if (Sender = miPaste) and TInfra.IsValid(GClpbrd.Instance) and (GClpbrd.Instance is TBlock) then
            begin
               lTmpCursor := Screen.Cursor;
               Screen.Cursor := crHourGlass;
               lNewBlock := TBlockFactory.CloneBlock(lBranch, TBlock(GClpbrd.Instance));
               Screen.Cursor := lTmpCursor;
            end;
            if lBlockType <> blUnknown then
               lNewBlock := TBlockFactory.GetBlock(lBranch, lBlockType);
            if lNewBlock <> nil then
            begin
               lBranch.InsertAfter(lNewBlock, lCurrentBlock);
               lParent.ResizeHorz(true);
               lParent.ResizeVert(true);
               if not lNewBlock.Visible then
               begin
                  lNewBlock.Show;
                  lNewBlock.RefreshStatements;
               end;
               if GSettings.UpdateEditor then
                  SourceEditorForm.RefreshEditorForObject(lNewBlock);
               GChange := 1;
            end;
         finally
            if lLocked then
               lBranch.ParentBlock.UnLockDrawing;
         end;
      end;
   end;

   if (Sender = miPaste) and (GClpbrd.Instance is TComment) then
   begin
      lPoint := ScreenToClient(PopupMenu.PopupPoint);
      lNewComment := TComment.Create(Self, lPoint.X, lPoint.Y,
                                 GClpbrd.Instance.Width,
                                 GClpbrd.Instance.Height);
      lNewComment.Text := TComment(GClpbrd.Instance).Text;
      lNewComment.Font.Size := TComment(GClpbrd.Instance).Font.Size;
      lNewComment.Font.Style := TComment(GClpbrd.Instance).Font.Style;
      GChange := 1;
   end;

   NavigatorForm.Repaint;

end;

function TMainForm.ConfirmSave: integer;
begin
   result := IDCANCEL;
   if GProject <> nil then
      result := TInfra.ShowFormattedQuestionBox('ConfirmClose', [GProject.Name]);
end;

procedure TMainForm.miStyleBoldClick(Sender: TObject);
var
   lComponent: TComponent;
   lFontStyles: TFontStyles;
   lFontStyle: TFontStyle;
begin

   lComponent := PopupMenu.PopupComponent;

   if (lComponent is TBlock) or (lComponent is TComment) then
   begin
      if lComponent is TBlock then
         lFontStyles := TBlock(lComponent).GetFont.Style
      else if lComponent is TComment then
         lFontStyles := TComment(lComponent).Font.Style;

      if Sender = miStyleBold then
         lFontStyle := fsBold
      else if Sender = miStyleItalic then
         lFontStyle := fsItalic
      else if Sender = miStyleUnderline then
         lFontStyle := fsUnderline
      else if Sender = miStyleStrikeOut then
         lFontStyle := fsStrikeOut;

      if Sender = miStyleNormal then
         lFontStyles := []
      else if lFontStyle in lFontStyles then
         Exclude(lFontStyles, lFontStyle)
      else
         Include(lFontStyles, lFontStyle);

      if lComponent is TBlock then
         TBlock(lComponent).SetFontStyle(lFontStyles)
      else if lComponent is TComment then
         TComment(lComponent).Font.Style := lFontStyles;
      GChange := 1;
   end;
end;

procedure TMainForm.miSize8Click(Sender: TObject);
var
   lComponent: TComponent;
   lFontSize: integer;
begin
   lComponent := PopupMenu.PopupComponent;
   if (lComponent is TBlock) or (lComponent is TComment) then
   begin
      if Sender = miSize10 then
         lFontSize := 10
      else if Sender = miSize12 then
         lFontSize := 12
      else
         lFontSize := 8;
      if lComponent is TBlock then
         TBlock(lComponent).SetFontSize(lFontSize)
      else if lComponent is TComment then
         TComment(lComponent).Font.Size := lFontSize;
      GChange := 1;
   end;
end;

procedure TMainForm.miCopyClick(Sender: TObject);
var
   lComponent: TComponent;
begin
   lComponent := PopupMenu.PopupComponent;
   if (lComponent is TBlock) or (lComponent is TComment) then
   begin
      if Sender = miCut then
         miRemove.Click;
      GClpbrd.Instance := TControl(lComponent);
   end;
end;

procedure TMainForm.miRemoveClick(Sender: TObject);
var
   lComponent: TComponent;
   lBlock: TBlock;
   lFunction: TUserFunction;
begin
   lComponent := PopupMenu.PopupComponent;
   if (lComponent = GClpbrd.Instance) or (GClpbrd.UndoObject = GClpbrd.Instance) then
      GClpbrd.Instance := nil;
   if lComponent is TBlock then
   begin
      GClpbrd.UndoObject.Free;
      lBlock := TBlock(lComponent);
      if lBlock.ParentBranch <> nil then
      begin
         lBlock.ParentBranch.Remove(lBlock);
         if lBlock.ParentBlock <> nil then
            lBlock.ParentBlock.ResizeWithDrawLock;
         lBlock.Hide;
         GClpbrd.UndoObject := lBlock;
      end
      else
      begin
         lFunction := TUserFunction(TMainBlock(lBlock.TopParentBlock).OwnerUserFunction);
         lFunction.Active := false;
         GClpbrd.UndoObject := lFunction;
      end;
      if GSettings.UpdateEditor then
         SourceEditorForm.RefreshEditorForObject(nil);
      NavigatorForm.Repaint;
   end
   else if lComponent is TComment then
      lComponent.Free;
   GChange := 1;
end;

procedure TMainForm.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
   lWord: Word;
begin
   lWord := VK_DOWN;
   FormKeyDown(Self, lWord, [ssCtrl]);
end;

procedure TMainForm.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
   lWord: Word;
begin
   lWord := VK_UP;
   FormKeyDown(Self, lWord, [ssCtrl]);
end;

procedure TMainForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   lPoint: TPoint;
begin
   if (Button = mbRight) and (GProject <> nil) then
   begin
      lPoint := ClientToScreen(Point(X, Y));
      PopupMenu.PopupComponent := Self;
      PopupMenu.Popup(lPoint.X, lPoint.Y);
   end;
end;

procedure TMainForm.miSubRoutinesClick(Sender: TObject);
begin
   if Sender = miSubRoutines then
      FunctionsForm.Visible := not FunctionsForm.Visible
   else if Sender = miToolbox then
      ToolboxForm.Visible := not ToolboxForm.Visible
   else if Sender = miDeclarations then
      DeclarationsForm.Visible := not DeclarationsForm.Visible
   else if Sender = miExplorer then
      TreeViewForm.Visible := not TreeViewForm.Visible
   else if Sender = miDataTypes then
      DataTypesForm.Visible := not DataTypesForm.Visible
   else if Sender = miNavigator then
      NavigatorForm.Visible := not NavigatorForm.Visible
end;

procedure TMainForm.miExportClick(Sender: TObject);
var
   lBlock: TBlock;
   lGraphic: TGraphic;
   status: TErrorType;
begin
   if PopupMenu.PopupComponent is TBlock then
   begin
      lBlock := TBlock(PopupMenu.PopupComponent);
      ExportDialog.Filename := '';
      ExportDialog.Filter := i18Manager.GetString('XMLFilesFilter') + '|' +
                             i18Manager.GetString('BMPFilesFilter') + '|' +
                             i18Manager.GetString('JPGFilesFilter');
      ExportDialog.FilterIndex := 1;
      if ExportDialog.Execute then
      begin
         if ExportDialog.FilterIndex = 1 then
         begin
            if lBlock is TMainBlock then
               status := TXMLProcessor.ExportToXMLFile(ExportDialog.Filename, TUserFunction(TMainBlock(lBlock).OwnerUserFunction).ExportToXMLTag)
            else
               status := lBlock.ExportToXMLFile(ExportDialog.FileName);
            if status <> errNone then
               TInfra.ShowFormattedErrorBox('SaveError', [ExportDialog.FileName], status);
         end
         else
         begin
            if ExportDialog.FilterIndex = 2 then
               lGraphic := TBitmap.Create
            else
               lGraphic := TJPEGImage.Create;
            try
               lBlock.ClearSelection;
               lblock.ExportToGraphic(lGraphic);
               lGraphic.SaveToFile(ExportDialog.FileName);
            finally
               lGraphic.Free;
            end;
         end;
      end;
   end;
end;

procedure TMainForm.miImportClick(Sender: TObject);
var
   lComponent: TComponent;
   status: TErrorType;
   lPoint: TPoint;
   lFunction: TUserFunction;
begin
   OpenDialog.Filename := '';
   lComponent := PopupMenu.PopupComponent;
   if (GProject <> nil) and OpenDialog.Execute then
   begin
      if (lComponent is TBlock) and (TBlock(lComponent).Ired >= 0) then
         status := TBlock(lComponent).ImportFromXMLFile(OpenDialog.FileName)
      else
      begin
         status := TXMLProcessor.ImportFromXMLFile(OpenDialog.Filename, GProject.ImportUserFunctionsFromXML);
         if status = errNone then
         begin
            lFunction := GProject.LastUserFunction;
            if (lFunction <> nil) and lFunction.Active and (lFunction.Body <> nil) and lFunction.Body.Visible then
            begin
               lPoint := ScreenToClient(PopupMenu.PopupPoint);
               lFunction.Body.Left := lPoint.X;
               lFunction.Body.Top := lPoint.Y;
               lFunction.Body.ParentForm.SetScrollBars;
            end;
         end;
      end;
      if status <> errNone then
         TInfra.ShowFormattedErrorBox('ImportFailed', [CRLF, Gerr_text], errImport)
      else
      begin
         if GSettings.UpdateEditor then
            SourceEditorForm.RefreshEditorForObject(nil);
         GChange := 1;
      end;
   end;
end;

procedure TMainForm.miFrameClick(Sender: TObject);
begin
   if PopupMenu.PopupComponent is TBlock then
      TBlock(PopupMenu.PopupComponent).ChangeFrame;
end;

procedure TMainForm.miExpFoldClick(Sender: TObject);
var
   lBlock: TGroupBlock;
begin
   if PopupMenu.PopupComponent is TGroupBlock then
   begin
      lBlock := TGroupBlock(PopupMenu.PopupComponent);
      lBlock.ClearSelection;
      lBlock.ExpandFold(true);
   end;
end;

procedure TMainForm.miAddBranchClick(Sender: TObject);
var
   lPoint: TPoint;
   lCaseBlock: TCaseBlock;
   lBranch: TBranch;
begin
   if PopupMenu.PopupComponent is TCaseBlock then
   begin
      lCaseBlock := TCaseBlock(PopupMenu.PopupComponent);
      lPoint := Point(lCaseBlock.GetRMostX(lCaseBlock.BranchCount)+60, lCaseBlock.Height-32);
      lBranch := lCaseBlock.AddBranch(lPoint, true);
      if GSettings.UpdateEditor then
         SourceEditorForm.RefreshEditorForObject(lBranch);
   end;
end;

procedure TMainForm.miRemoveBranchClick(Sender: TObject);
var
   res: integer;
   lCaseBlock: TCaseBlock;
begin
   if PopupMenu.PopupComponent is TCaseBlock then
   begin
      res := IDYES;
      if GSettings.ConfirmRemove then
         res := TInfra.ShowQuestionBox(i18Manager.GetString('ConfirmRemove'));
      if res = IDYES then
      begin
         lCaseBlock := TCaseBlock(PopupMenu.PopupComponent);
         lCaseBlock.RemoveBranch;
         if GSettings.UpdateEditor then
            SourceEditorForm.RefreshEditorForObject(lCaseBlock.Branch);
      end;
   end;
end;

procedure TMainForm.miExpandAllClick(Sender: TObject);
var
   lBlock: TGroupBlock;
   lLocked: boolean;
begin
   if PopupMenu.PopupComponent is TGroupBlock then
   begin
      lBlock := TGroupBlock(PopupMenu.PopupComponent);
      lBlock.ClearSelection;
      lLocked := lBlock.LockDrawing;
      try
         lBlock.ExpandAll;
      finally
         if lLocked then
            lBlock.UnLockDrawing;
      end;
   end;
end;

procedure TMainForm.ExportSettingsToXMLTag(const root: IXMLElement);
begin
   root.SetAttribute('scrollrange_h', IntToStr(HorzScrollBar.Range));
   root.SetAttribute('scrollrange_v', IntToStr(VertScrollBar.Range));
   root.SetAttribute('scroll_h', IntToStr(HorzScrollBar.Position));
   root.SetAttribute('scroll_v', IntToStr(VertScrollBar.Position));
end;

procedure TMainForm.ImportSettingsFromXMLTag(const root: IXMLElement);
var
   val: integer;
begin
   val := StrToIntDef(root.GetAttribute('scrollrange_h'), -1);
   if val > -1 then
      HorzScrollBar.Range := val;
   val := StrToIntDef(root.GetAttribute('scroll_h'), -1);
   if val > -1 then
      HorzScrollBar.Position := val;
   val := StrToIntDef(root.GetAttribute('scrollrange_v'), -1);
   if val > -1 then
      VertScrollBar.Range := val;
   val := StrToIntDef(root.GetAttribute('scroll_v'), -1);
   if val > -1 then
      VertScrollBar.Position := val;
end;

procedure TMainForm.miPrint2Click(Sender: TObject);
var
   lBitmap: TBitmap;
   lBlock: TBlock;
begin
   if PopupMenu.PopupComponent is TBlock then
   begin
      lBlock := TBlock(PopupMenu.PopupComponent);
      lBitmap := TBitmap.Create;
      try
         lBlock.ClearSelection;
         lBlock.ExportToGraphic(lBitmap);
         TInfra.PrintBitmap(lBitmap);
      finally
         lBitmap.Free;
      end;
   end;
end;

procedure TMainForm.miProjectClick(Sender: TObject);
begin
   miAddMain.Enabled := GInfra.CurrentLang.EnabledMainProgram and
                        (GProject <> nil) and (GProject.GetMainBlock = nil);
   miUndoRemove.Enabled := GClpbrd.UndoObject <> nil;
end;

procedure TMainForm.miAddMainClick(Sender: TObject);
var
   lBody: TMainBlock;
begin
   if GProject <> nil then
   begin
      lBody := TMainBlock.Create(Self, GInfra.GetMainBlockNextTopLeft(Self));
      TUserFunction.Create(nil, lBody);
      if GSettings.UpdateEditor then
         SourceEditorForm.RefreshEditorForObject(lBody);
      GChange := 1;
   end;
end;

procedure TMainForm.SetScrollBars;
var
   lPoint: TPoint;
begin
   if GProject <> nil then
   begin
      lPoint := GProject.GetBottomRight;
      if lPoint.X > ClientWidth then
         HorzScrollBar.Range := lPoint.X
      else
         HorzScrollBar.Range := ClientWidth;
      if lPoint.Y > ClientHeight then
         VertScrollBar.Range := lPoint.Y
      else
         VertScrollBar.Range := ClientHeight;
      NavigatorForm.Repaint;
   end;
end;

function TMainForm.GetDisplayedRect: TRect;
begin
   with result do
   begin
      Left := HorzScrollBar.Position;
      Top := VertScrollBar.Position;
      Right := Left + ClientWidth;
      Bottom := Top + ClientHeight;
   end;
end;

procedure TMainForm.miNewFlowchartClick(Sender: TObject);
var
   lBlock: TMainBlock;
begin
   lBlock := TMainBlock.Create(Self, ScreenToClient(PopupMenu.PopupPoint));
   lBlock.OnResize(lBlock);
   TUserFunction.Create(nil, lBlock);
   GChange := 1;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
const
   STEP = 15;
   MULTP = 20;
var
   lPos: integer;
   lScrollBar: TControlScrollBar;
begin
   lPos := 0;
   if Sender = Self then
   begin
      if ssCtrl in Shift then
      begin
         case Key of
            VK_DOWN, VK_RIGHT: lPos := STEP;
            VK_UP, VK_LEFT:    lPos := -STEP;
         end;
      end;
   end
   else
   begin
      case Key of
         VK_DOWN, VK_RIGHT: lPos := STEP;
         VK_UP, VK_LEFT:    lPos := -STEP;
      end;
   end;
   case Key of
      VK_NEXT:  lPos := STEP * MULTP;
      VK_PRIOR: lPos := -STEP * MULTP;
   end;
   if lPos <> 0 then
   begin
      if Key in [VK_LEFT, VK_RIGHT] then
         lScrollBar := HorzScrollBar
      else
         lScrollBar := VertScrollBar;
      lScrollBar.Position := lScrollBar.Position + lPos;
      Key := 0;
      PerformFormsRepaint;
   end;
end;

procedure TMainForm.miForAscClick(Sender: TObject);
var
   lBlock: TForDoBlock;
begin
   if PopupMenu.PopupComponent is TForDoBlock then
   begin
      lBlock := TForDoBlock(PopupMenu.PopupComponent);
      if Sender = miForAsc then
         lBlock.Order := orAsc
      else
         lBlock.Order := orDesc;
   end;
end;

procedure TMainForm.miMemoEditClick(Sender: TObject);
var
   lBlock: TBlock;
begin
   if PopupMenu.PopupComponent is TBlock then
   begin
      lBlock := TBlock(PopupMenu.PopupComponent);
      if lBlock.GetFrontMemo <> nil then
      begin
         MemoEditorForm.SourceBlock := lBlock;
         MemoEditorForm.ShowModal;
      end;
   end;

end;

procedure TMainForm.miMemoVScrollClick(Sender: TObject);
var
   lBlock: TBlock;
begin
   if PopupMenu.PopupComponent is TBlock then
   begin
      lBlock := TBlock(PopupMenu.PopupComponent);
      if Sender = miMemoVScroll then
         lBlock.MemoVScroll := miMemoVScroll.Checked
      else if Sender = miMemoHScroll then
         lBlock.MemoHScroll := miMemoHScroll.Checked
      else if Sender = miMemoWordWrap then
         lBlock.MemoWordWrap := miMemoWordWrap.Checked;
   end;
end;

procedure TMainForm.PerformFormsRepaint;
begin
   if GSettings.EnableDBuffering or NavigatorForm.Visible then
      Repaint;
   NavigatorForm.Repaint;
end;

procedure TMainForm.miNewFunctionClick(Sender: TObject);
begin
   TInfra.GetFunctionsForm.AddUserFunction(ScreenToClient(PopupMenu.PopupPoint));
end;

end.

