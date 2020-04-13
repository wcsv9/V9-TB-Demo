BEGIN_SYMBOL_DEFINITIONS
	
	<!-- The table for noun WidgetDefinition  -->
	
	    <!-- PLWIDGETDEF table -->
		COLS:PLWIDGETDEF = PLWIDGETDEF:* 	
		COLS:PLWIDGETDEF:PLWIDGETDEF_ID = PLWIDGETDEF:PLWIDGETDEF_ID
		COLS:PLWIDGETDEF:IDENTIFIER = PLWIDGETDEF:IDENTIFIER
		
		
END_SYMBOL_DEFINITIONS

BEGIN_XPATH_TO_SQL_STATEMENT
	name=/WidgetDefinition[WidgetDefinitionIdentifier[WidgetDefinitionExternalIdentifier[(Identifier=)]]]
	base_table=PLWIDGETDEF
	sql=
			SELECT 
	     				PLWIDGETDEF.$COLS:PLWIDGETDEF:PLWIDGETDEF_ID$,
	     				PLWIDGETDEF.$COLS:PLWIDGETDEF:IDENTIFIER$
	     	FROM
	     				PLWIDGETDEF		    
	     				JOIN PLSTOREWIDGET ON (PLWIDGETDEF.PLWIDGETDEF_ID = PLSTOREWIDGET.PLWIDGETDEF_ID)          
			WHERE
			        PLWIDGETDEF.IDENTIFIER IN (?Identifier?) AND
			        PLWIDGETDEF.STATE = 1 AND
			        PLSTOREWIDGET.STOREENT_ID in ($STOREPATH:view$,0)
			        
END_XPATH_TO_SQL_STATEMENT
