table 50100 "CSD Seminar Setup"

{
    DataClassification = ToBeClassified;
    Caption = 'Seminar Setup';

    fields
    {
        field(10; "CSD Primary Key"; Code[10])
        {
            Caption = 'Primary Key';

        }
        field(20; "CSD Semniar Nos."; Code[20])
        {
            Caption = 'Semniar Nos.';
            TableRelation = "No. Series";

        }
        field(30; "CSD Seminar Registration Nos."; Code[20])
        {
            Caption = 'Seminar Registration Nos.';
            TableRelation = "No. Series";

        }
        field(40; "Posted Seminar Reg. Nos."; Code[20])
        {
            Caption = 'Seminar Reg. Nos.';
            TableRelation = "No. Series";

        }
    }

    keys
    {
        key(PK; "CSD Primary Key")
        {
            Clustered = true;
        }
    }

}