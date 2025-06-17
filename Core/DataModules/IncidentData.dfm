object IncidentDataModule1: TIncidentDataModule1
  Height = 271
  Width = 640
  object IncidentsTable: TFDTable
    Connection = FDConnection1
    TableName = 'Incidents'
    Left = 56
    Top = 112
  end
  object FDConnection1: TFDConnection
    Left = 56
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 168
    Top = 24
  end
end
