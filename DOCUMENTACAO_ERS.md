# Documentação (ERS): Especificação de Requisitos do Sistema

## 1. Visão Geral

Este projeto consiste em uma base de engine/framework para desenvolvimento de jogos 2D em Lua, utilizando a biblioteca Love2D. A estrutura foi organizada em módulos focados em reutilização de lógica, composição de objetos e manipulação de entidades no ciclo de execução do jogo.

O sistema tem como objetivo principal fornecer uma arquitetura leve e extensível para:

- criar objetos de jogo (GameObject);
- aplicar comportamentos dinâmicos (BehaviorObject);
- compor entidades por meio de componentes;
- controlar cenas e atualizações por quadro;
- manipular transformações e vetores 2D;
- servir como base para expansão em outros sistemas, como sprites, física e IA.

### 1.1 Contexto do Sistema

O projeto está estruturado em camadas para separar responsabilidades e facilitar manutenção:

- `src/core/classes/`: classes fundamentais do sistema (`Object`, `BehaviorObject`, `GameObject`, `Scene`);
- `src/core/components/`: componentes reutilizáveis (`Component`, `Transform`);
- `src/math/`: utilitários matemáticos (`Vector2`, `Timer`);
- `src/rendering/`: estrutura para renderização visual (`Sprite`);
- `src/data/`: enums e catalogação de tipos do sistema.

### 1.2 Tecnologias e Premissas

- Linguagem: Lua;
- Motor: Love2D;
- Arquitetura: orientação a objetos leve por herança e composição;
- Paradigma principal: entidades + componentes + cenas.

### 1.3 Objetivos do Sistema

- manter uma base modular e escalável;
- permitir criação de objetos e personagens reutilizáveis;
- garantir atualização contínua de lógicas por frame;
- possibilitar extensão por subclasses e componentes;
- apoiar desenvolvimento de jogos 2D com organização clara de código.

---

## 2. Requisitos Funcionais (RF)

### RF01 - Criação de objetos base
O sistema deve permitir a criação de objetos genéricos a partir da classe `Object`.

- Cada objeto deve possuir identificador único;
- Deve ser possível armazenar atributos dinâmicos em um dicionário;
- Deve haver suporte para verificar o tipo ou hierarquia da classe.

### RF02 - Herança entre classes
O sistema deve oferecer suporte a herança entre classes por meio da função `extends()`.

- Classes podem herdar características de uma classe pai;
- Objetos devem ser capazes de identificar a classe atual e sua hierarquia;
- A estrutura deve evitar uso indevido de instâncias em lugar de classes.

### RF03 - Inicialização e destruição de objetos
Cada objeto deve permitir ciclo de vida básico.

- Deve existir uma rotina de inicialização (`init()`);
- Deve haver suporte para destruição de objetos (`destroy()`);
- O sistema deve permitir execução de comportamento específico no momento da destruição (`onDestroy()`).

### RF04 - Atributos dinâmicos
O sistema deve permitir a criação de atributos personalizados em objetos durante a execução.

- O código deve permitir `setAttribute(key, value)`;
- Deve oferecer `getAttribute(key)` para leitura;
- Deve existir acesso ao conjunto completo de atributos por meio de `getAttributes()`.

### RF05 - Definição de objetos com comportamento
O sistema deve permitir classes que executam lógica por quadro através da classe `BehaviorObject`.

- Objetos comportamentais devem possuir estado ativo/inativo;
- Deve haver uma função de atualização por frame (`update(dt)`);
- O método deve ser sobrescrevível para comportamentos específicos.

### RF06 - Criação de objetos do jogo
O sistema deve permitir instâncias de `GameObject` para representar entidades do cenário.

- Cada `GameObject` deve conter estado de visibilidade;
- O objeto deve aceitar componentes vinculados;
- Deve ser possível verificar se um componente já está presente;
- Deve existir acesso a componentes por tipo/classe.

### RF07 - Gestão de componentes
O sistema deve suportar a composição de entidades por meio de componentes.

- Deve ser possível adicionar componentes a um `GameObject`;
- O sistema deve verificar duplicidade de componentes;
- Componentes devem ter referência ao `GameObject` ao qual pertencem;
- Deve haver leitura do objeto pai do componente.

### RF08 - Gestão de cenas
O sistema deve possibilitar a criação de cenas com coleção de objetos.

- Uma cena deve armazenar objetos ativos;
- Deve permitir adição de objetos (`addObject`);
- Deve percorrer os objetos em atualização;
- Deve invocar a lógica de atualização dos objetos pertencentes à cena.

### RF09 - Transformação de entidades
O sistema deve fornecer suporte a transformações espaciais em entidades.

- O componente `Transform` deve conter posição (`position`);
- Deve armazenar rotação (`rotation`);
- Deve conter escala (`scale`);
- A posição deve ser representada por `Vector2`.

### RF10 - Operações matemáticas com vetor 2D
O sistema deve suportar manipulação básica de vetores 2D.

- Deve permitir criação de vetores com coordenadas `x` e `y`;
- Deve suportar magnitude do vetor;
- Deve permitir normalização do vetor;
- Deve oferecer operações aritméticas como soma, subtração, multiplicação e divisão;
- Deve suportar representação textual do vetor.

### RF11 - Enumeração de tipos do sistema
O sistema deve definir enumerações para classes e categorias do motor.

- Deve existir lista de tipos como `Object`, `BehaviorObject`, `GameObject`, `Component`, `Transform`, `Sprite`, `Tag` e `Vector2`;
- Esses tipos devem servir como referência para validações de herança e identificação de classes.

### RF12 - Estrutura de renderização visual
O sistema deve prever componentes para renderização gráfica.

- O projeto inclui suporte para `Sprite` como representação visual de um objeto;
- O framework deve permitir que objetos gráficos sejam associados a entidades do jogo;
- A renderização deve estar preparada para extensão futura do sistema de sprites e animação.

---

## 3. Requisitos Não Funcionais (RNF)

### RNF01 - Modularidade
O sistema deve manter separação clara entre camadas e responsabilidades.

- Classes e componentes devem ser organizados em módulos;
- Mudanças em uma parte do sistema não devem depender diretamente de detalhes internos de outra camada;
- O projeto deve facilitar extensão por novas funcionalidades.

### RNF02 - Reusabilidade
A arquitetura deve priorizar reutilização de código e composição de comportamento.

- Objetos base devem ser reaproveitados por subclasses;
- Componentes devem poder ser compartilhados entre diferentes entidades;
- Lógica comum deve permanecer em abstrações centrais.

### RNF03 - Manutenibilidade
O código deve ser legível e organizado para facilitar correções e evoluções futuras.

- Classes devem seguir convenções simples e nomeações consistentes;
- Comentários e anotações de documentação devem descrever propósito das estruturas principais;
- O uso de herança e composição deve ser claro para o desenvolvedor.

### RNF04 - Desempenho do loop de jogo
O sistema deve operar de forma eficiente dentro do ciclo de atualização do Love2D.

- Atualizações devem ocorrer por quadro (`dt`);
- Iterações sobre objetos e componentes devem evitar processamento excessivo;
- A lógica deve ser adequada para cenários de jogos 2D em escala moderada.

### RNF05 - Compatibilidade com Love2D
O sistema deve manter compatibilidade com o ambiente de execução do Love2D.

- Os scripts devem seguir a estrutura de execução esperada por essa biblioteca;
- O projeto deve funcionar de forma integrada ao ciclo `love.load`, `love.update` e `love.draw`;
- A arquitetura deve ser compatível com projetos simples e com expansão futura.

### RNF06 - Extensibilidade
O sistema deve permitir crescimento sem reescrita completa da base.

- Novos tipos de objeto e componentes devem poder ser criados sem alterar a estrutura principal;
- A adição de novos comportamentos deve ser suportada por subclasses e sobrescrita de métodos;
- O sistema deve comportar-se como base para jogos maiores.

### RNF07 - Robustez de integração
As classes do sistema devem tratar corretamente a identidade e o estado dos objetos.

- A atribuição de identificadores únicos deve ser consistente;
- Verificações de instância e herança devem funcionar corretamente;
- O sistema deve evitar erros de tipo em operações fundamentais.

### RNF08 - Facilidade de testes e validação
A estrutura deve permitir validação de comportamento por módulo.

- Objetos devem poder ser testados individualmente;
- Operações matemáticas e de composição devem ser verificáveis;
- Novos comportamentos devem poder ser exercitados por testes unitários ou de integração.

---

## 4. Requisitos de Alto Nível (Resumo)

O sistema deve funcionar como uma base para desenvolvimento de jogos 2D com organização por objetos, comportamento, componentes e cenas. Sua estrutura permite que o desenvolvedor crie entidades com identidade própria, aplique lógica por frame, gerencie transformações espaciais e mantenha uma arquitetura extensível para futuros recursos como colisão, renderização avançada, música, partículas e IA.

---

## 5. Observações

A documentação acima foi elaborada com base na arquitetura presente no código do projeto, especialmente nos módulos de classes, componentes e utilitários matemáticos. O projeto ainda apresenta algumas partes em desenvolvimento, como a gestão completa de filhos de objetos e o módulo de sprite, mas a base do motor já oferece os conceitos fundamentais para expansão do sistema.
