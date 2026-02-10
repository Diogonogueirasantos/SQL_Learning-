from faker import Faker
import pandas as pd


class Dados_ficticios:

    def __init__(self):
        self.estrutura_Dados()


    def estrutura_Dados(self):
        df = pd.DataFrame(
            {
                "id_funcionario": [x for x in range(0, 500)],
                "nome": [Faker.name for _ in range(0, 500)],
                "cpf": [Faker.cpf for _ in range(0, 500)]

            }
        )

        print(df.head())



instanciador = Dados_ficticios()