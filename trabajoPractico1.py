## importar librerias PASO 1
import pandas as pd
from sqlalchemy import create_engine


## configuracion de la/las bases de datos PASO 2
source_engine = create_engine('mysql+mysqlconnector://root:20041963@127.0.0.1/hospital') #BASE DE DATOS ORIGEN

destination_engine = create_engine('postgresql+psycopg2://postgres:20041963@localhost:5432/trabajopractico1')# BASE DE DATOS DESTINO

## funcion para extraer datos de MySql PASO 3
def extract_from_mysql (query,engine):
    try:
        return pd.read_sql(query,engine) ## ejecuta una consulta
    
    except Exception as e:
        print (f"error al extraer datos de MYSQL:{e}")        
        return pd.DataFrame() #DEVUELVE UN DATA FRAME VACIO EN CASO DE QUE HAYA ALGUN ERROR


# FUNCION PARA CARGAR DATOS A POSTGRE

def load_to_postgre (df,query,engine):
    try:
        df.to_sql("todos_los_pacientes",engine,if_exists='append',index=False) ## recibe un data frame
    except Exception as e: 
        print (f"error al cargar datos a la tabla {"todos_los_pacientes"}:{e}")
tables = [
    'pacientes'
    ]

#PASO 4
def etl_process():
    for table in tables:
    
        print (f"procesando tablas: {table}")

        # query = f"SELECT id_doctor,nombre FROM {table} WHERE id_doctor < 4 " QUERY USANDO UN WHERE PARA PONER CONDICIONES
        # query = f"SELECT id_doctor,id_paciente,nombre FROM {table} WHERE id_paciente <= 4 " 2DA QUERY PONIENDO CONDICIONES
        # query = f"SELECT * FROM {table} " QUERY PASANDO TODA LA TABLA DE LOS DOCTORES
        # query = f"SELECT * FROM {table} " QUERY PASANDO TODA LA TABLA DE LOS PACIENTES
        
        df = extract_from_mysql (query,source_engine)
        
        load_to_postgre (df,table.lower(),destination_engine)
        
        print (f"tabla {table} procesada y cargada con exito.")
        
if __name__ == "__main__":
    etl_process()    