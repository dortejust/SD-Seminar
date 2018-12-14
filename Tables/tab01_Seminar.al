table 50101 "CSD Seminar"
{
    Caption = 'Seminar';
    DataClassification = CustomerContent;
    
    fields
    {
        field(10;"CSD No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';
        }
        field(20;"CSD Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';
            
        }
        field(30;"CSD Seminar Duration"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Seminar Duration';
            DecimalPlaces = 0:1;
            
        }
        field(40;"CSD Minimum Participants"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Seminar D uration';
            
        }
        field(1;MyField; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(1;MyField; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(1;MyField; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(1;MyField; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
    }
    
    keys
    {
        key(PK; MyField)
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}