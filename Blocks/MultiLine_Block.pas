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



unit MultiLine_Block;

interface

uses
   Controls, StdCtrls, Graphics, Classes, Base_Block, SysUtils, CommonInterfaces,
   ExtCtrls, StatementMemo;

type

   TMultiLineBlock = class(TBlock)
      public
         function GetTextControl: TCustomEdit; override;
         procedure ChangeColor(const AColor: TColor); override;
         function GetFrontMemo: TMemo; override;
         procedure UpdateCodeEditor(AEdit: TCustomEdit); override;
      protected
         FStatements: TStatementMemo;
         constructor Create(const ABranch: TBranch; const ASource: TMultiLineBlock); overload;
         constructor Create(const ABranch: TBranch; const ALeft, ATop, AWidth, AHeight: integer; const AId: integer = ID_INVALID); overload;
         procedure Paint; override;
         procedure MyOnDblClick(Sender: TObject);
         procedure MyOnCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean); override;
   end;

implementation

uses
   ApplicationCommon, StrUtils, CommonTypes, Forms, LangDefinition, SourceEditor_Form;

constructor TMultiLineBlock.Create(const ABranch: TBranch; const ALeft, ATop, AWidth, AHeight: integer; const AId: integer = ID_INVALID);
begin

   inherited Create(ABranch, ALeft, ATop, AWidth, AHeight, AId);

   FStatements := TStatementMemo.Create(Self);
   FStatements.Parent := Self;
   FStatements.SetBounds(0, 0, AWidth, Height-31);
   FStatements.OnDblClick := MyOnDblClick;
   FStatements.OnMouseDown := OnMouseDown;
   FStatements.OnChange := OnChangeMemo;
   if FStatements.CanFocus then
      FStatements.SetFocus;

   BottomPoint.X := AWidth div 2;
   BottomPoint.Y := Height - 31;
   IPoint.X := BottomPoint.X + 30;
   IPoint.Y := FStatements.Height + 10;
   BottomHook := BottomPoint.X;
   TopHook.X := BottomPoint.X;
   Constraints.MinWidth := 140;
   Constraints.MinHeight := 48;
   FStatement.Visible := false;         // statement isn't used in this block
   FStatement := nil;

end;

constructor TMultiLineBlock.Create(const ABranch: TBranch; const ASource: TMultiLineBlock);
begin
   Create(ABranch, ASource.Left, ASource.Top, ASource.Width, ASource.Height);
   ChangeFontSize(ASource.FStatement.Font.Size);
   ChangeFontStyle(ASource.FStatement.Font.Style);
   Visible := ASource.Visible;
   FStatements.Text := ASource.FStatements.Text;
end;

procedure TMultiLineBlock.MyOnDblClick(Sender: TObject);
begin
   FStatements.SelectAll;
end;


procedure TMultiLineBlock.Paint;
begin
   inherited;
   TInfra.DrawArrowLine(Canvas, Point(BottomPoint.X, Height-31), Point(BottomPoint.X, Height-1));
   DrawI;
end;

function TMultiLineBlock.GetTextControl: TCustomEdit;
begin
   result := FStatements;
end;

function TMultiLineBlock.GetFrontMemo: TMemo;
begin
   result := FStatements;
end;

procedure TMultiLineBlock.MyOnCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
   Resize := (NewWidth >= Constraints.MinWidth) and (NewHeight >= Constraints.MinHeight);
   if HResizeInd and Resize then
   begin
      BottomPoint.X := Width div 2;
      IPoint.X := BottomPoint.X + 30;
      TopHook.X := BottomPoint.X;
   end;
   if VResizeInd and Resize then
      IPoint.Y := FStatements.Height + 10;
end;

procedure TMultiLineBlock.ChangeColor(const AColor: TColor);
begin
   inherited ChangeColor(AColor);
   if GSettings.RectColor = GSettings.DesktopColor then
      FStatements.Color := AColor
   else
      FStatements.Color := GSettings.RectColor;
   FStatements.OnChange(FStatements);
end;

procedure TMultiLineBlock.UpdateCodeEditor(AEdit: TCustomEdit);
var
   lRange: TCodeRange;
   lTemplateLines: TStringList;
   i: integer;
begin
   lRange := SourceEditorForm.SelectCodeBlock(Self, false);
   if lRange.FirstLineIdx <> -1 then
   begin
      lTemplateLines := TStringList.Create;
      try
         GenerateCode(lTemplateLines, GInfra.CurrentLang.Name, SourceEditorForm.GetIndentLevel(lRange.FirstLineIdx));
         with SourceEditorForm.memCodeEditor do
         begin
            Lines.BeginUpdate;
            for i := 0 to lRange.LastLineIdx - lRange.FirstLineIdx do
               Lines.Delete(lRange.FirstLineIdx);
            for i := lTemplateLines.Count-1 downto 0 do
               Lines.InsertObject(lRange.FirstLineIdx, lTemplateLines[i], lTemplateLines.Objects[i]);
            GotoLineAndCenter(lRange.FirstLineIdx);
            Lines.EndUpdate;
            OnChange(SourceEditorForm.memCodeEditor);
         end;
      finally
         lTemplateLines.Free;
      end;
   end;
end;

end.
