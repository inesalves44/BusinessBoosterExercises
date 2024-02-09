page 50129 EggProductionLineList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = EggProductionLine;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Chicken No."; Rec."Chicken No.")
                {
                    ToolTip = 'Specifies the value of the Chicken no. field.';
                }
                field(ChickenDescription; Rec.ChickenDescription)
                {
                    ToolTip = 'Specifies the value of the Chicken Description field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Egg Production Date"; Rec."Egg Production Date")
                {
                    ToolTip = 'Specifies the value of the Egg Production Date field.';
                }
                field("Egg type code"; Rec."Egg type code")
                {
                    ToolTip = 'Specifies the value of the Egg Type Code field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}