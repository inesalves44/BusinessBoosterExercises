page 50127 EggProductionSubpage
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EggProductionLine;
    AutoSplitKey = true; //AutoSplitKey will work on the last field of the primary key, if that field is an Integer
    DelayedInsert = true; //DelayedInsert will wait to execute the Insert statement after all fields have their value and a new line is selected.

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Chicken No."; Rec."Chicken No.")
                {
                    ToolTip = 'Specifies the value of the Chicken no. field.';
                    ApplicationArea = All;
                }
                field(ChickenDescription; Rec.ChickenDescription)
                {
                    ToolTip = 'Specifies the value of the Chicken Description field.';
                    ApplicationArea = All;
                }
                field("Egg Production Date"; Rec."Egg Production Date")
                {
                    ToolTip = 'Specifies the value of the Egg Production Date field.';
                    ApplicationArea = All;
                }
                field("Egg type code"; Rec."Egg type code")
                {
                    ToolTip = 'Specifies the value of the Egg Type Code field.';
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}