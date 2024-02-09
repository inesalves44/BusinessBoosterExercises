page 50120 ChickenCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Chicken;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Description; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Description of the chicken';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Chicken Type Code"; Rec."Chicken Type Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chicken Type Code field.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Picture field.';
                }
                field("Chicken Type Description"; rec."Chicken Type Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chicken Type Description.';
                }
                field(NumberOfEggsProduced; Rec.NumberOfEggsProduced)
                {
                    ToolTip = 'Specifies the number of eggs produced';
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