page 50125 ChickenManagmentRoleCenter
{
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(HeadLineOrderProcessor; "HeadLine RC Order Processor")
            {
                ApplicationArea = all;
            }
            part(O365CustomerActivity; "O365 Customer Activity Page")
            {
                ApplicationArea = all;
            }
            part(O365Activities; "O365 Activities")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(MasterData)
            {
                Caption = 'Master Data';
                Image = RegisteredDocs;

                action(ChickenList)
                {
                    RunObject = Page ChickenList;
                    ApplicationArea = all;
                    Caption = 'Chicken List';
                }
                action(ChickenTypes)
                {
                    RunObject = Page ChickenTypes;
                    ApplicationArea = all;
                    Caption = 'Chicken Types';
                }
            }
            group(Documents)
            {
                action(EggProduction)
                {
                    RunObject = Page EggProductionList;
                    ApplicationArea = all;
                    Caption = 'Egg Production';
                }
                action(Eggtypes)
                {
                    RunObject = Page EggTypes;
                    ApplicationArea = all;
                    Caption = 'Egg Types';
                }
            }
        }
        area(Embedding)
        {
            action(eChickenList)
            {
                RunObject = Page ChickenList;
                ApplicationArea = all;
                Caption = 'Chicken List';
            }
            action(eChickenTypes)
            {
                RunObject = Page ChickenTypes;
                ApplicationArea = all;
                Caption = 'Chicken types';
            }
            action(eEggProduction)
            {
                RunObject = Page EggProductionList;
                ApplicationArea = all;
                Caption = 'Egg Production';
            }
            action(eEggTypes)
            {
                RunObject = Page EggTypes;
                ApplicationArea = all;
                Caption = 'Egg types';
            }
        }
    }
}