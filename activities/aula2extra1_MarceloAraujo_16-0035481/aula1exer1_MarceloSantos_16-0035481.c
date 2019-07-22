//Aluno: Marcelo Araujo dos Santos   matricula: 16/0035481

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#define SIZE_INT 41
#define MAX_CARACTER 51

typedef struct CARRO
{
  char modelo[MAX_CARACTER];
  char placa[8];
  char cor[MAX_CARACTER];
  int cpfProprietario;
  struct CARRO *ant;
  struct CARRO *prox;
} carro;

typedef struct registro
{
  char nome[MAX_CARACTER];
  int CPF;
  carro *carros;
  struct registro *ant;
  struct registro *prox;
} Pessoa;

Pessoa *procurarPessoa(Pessoa *l);
void mostraRegistro(Pessoa *pessoa);
void lerString(char *string, int tamanho);
int inteiroValido(char *numero);
int lerInteiro();
char lerChar();
Pessoa *carregaLista(Pessoa *l);
void escreveLista(Pessoa *l);
carro *insereCarro(carro *a, carro *n);
Pessoa *insereEmOrdem(Pessoa *a, Pessoa *n);
void trocaEspaco(char *texto);
Pessoa *insereRegistro(Pessoa *l);
void listaRegistros(Pessoa *l);
void printaString(char *string);
//Pessoa *removeRegistro(Pessoa *l); //=---
void limpaTela();
int mostraMenu();
void pausar();

int main()
{
  int opcao;
  Pessoa *l = NULL, *aux;

  l = carregaLista(l);

  do
  {
    opcao = mostraMenu();
    limpaTela();
    switch (opcao)
    {
    case 1:
      l = insereRegistro(l);
      break;
    case 2:
      listaRegistros(l);
      break;
    case 3:
      aux = procurarPessoa(l);
      limpaTela();
      if (aux == NULL)
      {
        printf("Proprietario nao encontrado :(\n\n");
        pausar();
      }
      else
      {
        printf("Proprietario encontrado\n\n");
        mostraRegistro(aux);
        pausar();
      }
      break;
    case 4:
      //l = removeRegistro(l);
      break;
    case 0:
      break;
    }
  } while (opcao != 0);
  return 0;
}

// ====== funçoes ======

Pessoa *procurarPessoa(Pessoa *l)
{
  //Declarações
  char info[MAX_CARACTER];
  Pessoa *aux = l;
  int CPF;

  //Instruções
  if (l == NULL)
  {
    printf("\nNinguem cadastrado!\n");
    pausar();
    return l;
  }

  printf("Informe o nome ou CPF da pessoa para pesquisar:\n");
  lerString(info, MAX_CARACTER);
  trocaEspaco(info);

  if (inteiroValido(info))
  {
    //caso for pelo CPF
    CPF = atoi(info);
    while (aux != NULL)
    {
      if (CPF == aux->CPF)
      {
        return aux;
      }
      aux = aux->prox;
    }
  }
  else
  {
    //caso for pelo nome
    //fazer busca parcial
    while (aux != NULL)
    {
      if (strcmp(info, aux->nome) == 0)
      {
        return aux;
      }
      aux = aux->prox;
    }
  }
  return NULL;
}

void lerString(char *string, int tamanho)
{
  char lido;
  int tam = 0;

  scanf("%c", &lido);

  while ((lido != '\n') && (tam < tamanho - 1))
  {
    string[tam] = lido;
    tam++;
    lido = getchar();
  }
  string[tam] = '\0';
  if ((lido != '\n') && (tam >= tamanho - 1))
  {
    while (getchar() != '\n')
    {
    }
  }
}

int inteiroValido(char *numero)
{
  int i = 0;
  if (numero[0] == '-')
  {
    i++;
  }
  if (numero[0] == '\0')
  {
    return 0;
  }

  while (numero[i])
  {
    if (!isdigit(numero[i]))
    {
      return 0;
    }
    i++;
  }
  return 1;
}

int lerInteiro()
{
  int i, valido, inteiro = 0;
  char num[SIZE_INT];

  do
  {
    lerString(num, SIZE_INT);
    valido = inteiroValido(num);
    if (!valido)
    {
      printf("Digite apenas numeros:\n");
    }
  } while (!valido);

  return atoi(num);
}

char lerChar()
{
  char c;
  scanf("%c", &c);
  if (c != '\n')
  {
    while (getchar() != '\n')
    {
    }
  }
  return c;
}

Pessoa *carregaLista(Pessoa *l)
{
  //Declarações
  FILE *p_arq;
  FILE *arq_carros;
  carro carroAux;
  Pessoa temp;
  //Instruções

  if ((p_arq = fopen("contatos.txt", "r")) == NULL)
  {
    return NULL;
  }
  if ((arq_carros = fopen("carros.txt", "r")) == NULL)
  {
    fclose(p_arq);
    return NULL;
  }

  while (!feof(p_arq))
  {
    fscanf(p_arq, "%s\n", temp.nome);
    fscanf(p_arq, "%d\n$\n", &temp.CPF);
    temp.carros = NULL;

    rewind(arq_carros);
    while (!feof(arq_carros))
    {
      fscanf(arq_carros, "%s\n", carroAux.modelo);
      fscanf(arq_carros, "%s\n", carroAux.placa);
      fscanf(arq_carros, "%s\n", carroAux.cor);
      fscanf(arq_carros, "%d\n$\n", &carroAux.cpfProprietario);
      if (temp.CPF == carroAux.cpfProprietario)
      {
        temp.carros = insereCarro(temp.carros, &carroAux);
      }
    }

    l = insereEmOrdem(l, &temp);
  }
  fclose(p_arq);
  fclose(arq_carros);
  return l;
}

void escreveLista(Pessoa *l)
{
  //Declarações
  FILE *p_arq;
  FILE *arq_carros;
  Pessoa *pessoa = l;
  carro *carros = NULL, *carroAux;

  //Instruções

  if ((p_arq = fopen("contatos.txt", "w")) == NULL)
  {
    printf("Arquivo nao pode ser aberto.");
    pausar();
  }
  else
  {
    if ((arq_carros = fopen("carros.txt", "w")) == NULL)
    {
      fclose(p_arq);
      printf("Arquivo nao pode ser aberto.");
      pausar();
      return; // fazer
    }
    while (pessoa != NULL)
    {
      fprintf(p_arq, "%s\n%d\n$\n", pessoa->nome, pessoa->CPF);
      carroAux = pessoa->carros;
      while (carroAux)
      {
        carros = insereCarro(carros, carroAux);
        carroAux = carroAux->prox;
      }
      pessoa = pessoa->prox;
    }
    carroAux = carros;
    while (carroAux != NULL)
    {
      fprintf(arq_carros, "%s\n%s\n%s\n%d\n$\n",
              carroAux->modelo, carroAux->placa, carroAux->cor, carroAux->cpfProprietario);

      carroAux = carroAux->prox;
    }
  }
  fclose(arq_carros);
  fclose(p_arq);
}

carro *insereCarro(carro *a, carro *n)
{
  carro *novo = (carro *)malloc(sizeof(carro));
  carro *aux = a;

  if (novo == NULL)
  {
    printf("nao foi possivel alocar memoria\n");
    return a;
  }

  strcpy(novo->modelo, n->modelo);
  strcpy(novo->placa, n->placa);
  strcpy(novo->cor, n->cor);
  novo->cpfProprietario = n->cpfProprietario;

  novo->prox = NULL;
  novo->ant = NULL;

  if (a == NULL)
    return novo;

  while (strcmp(novo->placa, aux->placa) > 0)
  {
    if (aux->prox == NULL)
    {
      aux->prox = novo;
      novo->ant = aux;
      novo->prox = NULL;
      return a;
    }
    aux = aux->prox;
  }

  if (aux->ant != NULL)
  {
    novo->prox = aux;
    novo->ant = aux->ant;
    (novo->ant)->prox = novo;
    (novo->prox)->ant = novo;
    return a;
  }
  else
  {
    aux->ant = novo;
    novo->prox = aux;
    novo->ant = NULL;
    a = novo;
    return a;
  }
}

Pessoa *insereEmOrdem(Pessoa *a, Pessoa *n)
{
  Pessoa *novo = (Pessoa *)malloc(sizeof(Pessoa));
  Pessoa *aux = a;

  if (novo == NULL)
  {
    printf("nao foi possivel alocar memoria\n");
    return a;
  }

  strcpy(novo->nome, n->nome);
  novo->CPF = n->CPF;
  novo->carros = n->carros;
  novo->prox = NULL;
  novo->ant = NULL;

  if (a == NULL)
  {
    return novo;
  }

  while (novo->CPF > aux->CPF)
  {
    if (aux->prox == NULL)
    {
      aux->prox = novo;
      novo->ant = aux;
      novo->prox = NULL;
      return a;
    }
    aux = aux->prox;
  }

  if (aux->ant != NULL)
  {
    novo->prox = aux;
    novo->ant = aux->ant;
    (novo->ant)->prox = novo;
    (novo->prox)->ant = novo;
    return a;
  }
  else
  {
    aux->ant = novo;
    novo->prox = aux;
    novo->ant = NULL;
    a = novo;
    return a;
  }
}

void trocaEspaco(char *texto)
{
  int i;
  for (i = 0; i < strlen(texto); i++)
  {
    if (texto[i] == ' ')
      texto[i] = '_';
  }
}

Pessoa *insereRegistro(Pessoa *l)
{
  //Declarações
  Pessoa pessoa;
  Pessoa *prop;
  carro novoCarro;
  int opcao;

  //Instruções
  limpaTela();
  printf("Cadastro de carro\n");

  printf("Modelo: ");
  lerString(novoCarro.modelo, MAX_CARACTER);
  trocaEspaco(novoCarro.modelo);

  printf("Cor: ");
  lerString(novoCarro.cor, MAX_CARACTER);
  trocaEspaco(novoCarro.cor);

  printf("Placa: ");
  lerString(novoCarro.placa, 8);

  limpaTela();
  printf("A quem deseja adicionar esse carro?\n");
  printf("1 para criar proprietario\n");
  printf("2 para adicionar a proprietario existente\n");
  printf("Digite sua opcao: "); //fazer validar
  opcao = lerInteiro();

  if (opcao == 1)
  {
    printf("\n\nCadastro de proprietario\n");
    printf("Nome: ");
    lerString(pessoa.nome, MAX_CARACTER);
    trocaEspaco(pessoa.nome);
    printf("CPF: ");
    pessoa.CPF = lerInteiro();
    pessoa.carros = NULL;
    novoCarro.cpfProprietario = pessoa.CPF;
    pessoa.carros = insereCarro(pessoa.carros, &novoCarro);
    l = insereEmOrdem(l, &pessoa);

    limpaTela();
    mostraRegistro(&pessoa);
  }
  else if (opcao == 2)
  {
    prop = procurarPessoa(l);
    //fazer if null
    novoCarro.cpfProprietario = prop->CPF;
    prop->carros = insereCarro(prop->carros, &novoCarro);
    limpaTela();
    mostraRegistro(prop);
  }
  else
  {
    printf("opcao invalida\n");
    pausar();
    return l;
  }
  escreveLista(l);
  pausar();
  return l;
}

void listaRegistros(Pessoa *l)
{
  //Declarações
  Pessoa *pessoa = l;
  int pause;
  //Instruções
  int i = 0;
  printf("\n\n=========== lista de contatos =============\n\n");
  while (pessoa != NULL)
  {
    mostraRegistro(pessoa);
    pessoa = pessoa->prox;
  }
  pausar();
}

void printaString(char *string)
{
  char *letra;
  for (letra = string; *letra; letra++)
  {
    if (*letra == '_')
      printf(" ");
    else
      printf("%c", *letra);
  }
  printf("\n");
}

void mostraCarro(carro *c)
{
  printf("%s | %s | %s\n", c->modelo, c->cor, c->placa);
}

void mostraRegistro(Pessoa *pessoa)
{
  carro *carroAux = pessoa->carros;
  int i = 0;
  //Instruções
  printf("Nome: ");
  printaString(pessoa->nome);
  printf("CPF: %d\n", pessoa->CPF);
  printf(">> Carros:\n");
  printf("modelo | cor | placa \n");
  while (carroAux)
  {
    printf("%d: ", ++i);
    mostraCarro(carroAux);
    carroAux = carroAux->prox;
  }

  printf("\n\n");
}
//fazer
/*Pessoa *removeRegistro(Pessoa *l)
{
  //Declarações
  Pessoa *escolha;
  //Instruções
  if (l == NULL)
  {
    printf("\nNinguem cadastrado!\n");
    return l;
  }
  limpaTela();

  escolha = procurarPessoa(l);
  if (escolha->CPF == l->CPF) {
    l->prox = l->prox->prox;
    l = l->prox;
    l->ant = NULL;
    return l;
  }
  if (escolha->ant)
  {
    escolha->ant->prox = escolha->prox;
  }
  if (escolha->prox)
  {
    escolha->prox->ant = escolha->ant;
  }
  //free(escolha);
  
  escreveLista(l);
  
  
  return l;
}*/

void limpaTela()
{
  printf("\033[H\033[J");
}

int mostraMenu()
{
  limpaTela();
  printf(" ========================================\n");
  printf("|         >>>>>>>>> Menu <<<<<<<<<       |\n");
  printf("| 1 - Adicionar carro e seu proprietario |\n");
  printf("| 2 - Visualizar proprietarios e seus carros|\n");
  printf("| 3 - Procurar proprietario              |\n");
  //printf("| 2 - Editar proprietario              |\n");
  //printf("| 4 - Remover proprietario               |\n");
  printf("| 0 - Sair                               |\n");
  printf(" ========================================\n");
  printf("Sua opcao: ");
  return lerInteiro();
}

void pausar()
{
  char aux;
  printf("\nAperte ENTER para continuar");
  aux = lerChar();
}
