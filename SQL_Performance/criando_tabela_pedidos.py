from random import uniform
import pandas as pd
from faker import Faker

class Tabela_pedidos:

    def __init__(self):
        self.Estrutura()

    def Estrutura(self):
        fk = Faker()
        df = pd.DataFrame(
            {
                "id_pedido": [x for x in range(0, 500)],
                "data_pedido": [fk.date_time() for _ in range(0, 500)],
                "codigo_produto": [fk.country() for _ in range(0, 500)]
            }
        )

        print(df.head())





instanciador = Tabela_pedidos()