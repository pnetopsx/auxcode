# auxcode

Skill para o [Claude Code](https://code.claude.com/docs/en/skills) que mantém o trabalho num aplicativo ligado ao objetivo, às regras e à etapa do roadmap do projeto. Três efeitos:

- **Nada sem motivo.** Antes de tocar em código, o Claude escreve uma linha ligando o pedido a um item do roadmap, a uma regra do projeto ou a um defeito comprovado. Sem isso, o pedido vai para o backlog e vira pergunta, não código.
- **Nada pronto sem evidência.** "Pronto" é o critério observável cumprido no fluxo real, relatado em três estados: feito, verificado, publicado. O que não foi verificado é dito, não escondido.
- **Retomar lendo o mínimo.** Um mapa de fontes e um checkpoint curto vivem no próprio projeto. A sessão nova lê os dois, confere o estado real e segue, sem reler a documentação inteira.

Serve para começar um aplicativo do zero, continuar um em andamento e revisar ou adequar o código de um aplicativo existente. Projeto sem roadmap ou regras escritas não trava: a skill deriva o mínimo do que existe, propõe, grava depois do aceite e segue.

A [apresentação em PDF](docs/auxcode-apresentacao.pdf), ainda na 0.4.1, explica com diagramas os mecanismos daquela versão.

## Instalação

Clone o repositório direto na pasta de skills. Só `SKILL.md` entra em uso a cada invocação; `checkpoint.md`, `projeto.md` e `revisao.md` são lidos sob demanda; o resto é documentação e não custa contexto.

| Uso | Comando |
| --- | --- |
| Pessoal, em todos os projetos | `git clone https://github.com/pnetopsx/auxcode.git ~/.claude/skills/auxcode` |
| Só num projeto | na raiz do projeto: `git clone https://github.com/pnetopsx/auxcode.git .claude/skills/auxcode` |

Para atualizar, `git pull` na mesma pasta. Se a pasta de skills não existia quando a sessão começou, reinicie o Claude Code. Estes são os [locais documentados para skills locais](https://code.claude.com/docs/en/skills#where-skills-live).

## Uso

Abra o Claude Code na raiz do aplicativo e invoque `/auxcode <pedido>`. A skill só carrega por comando: o `SKILL.md` traz `disable-model-invocation: true`, então o Claude não a aciona sozinho e a descrição dela não ocupa contexto enquanto você não a chama. Se preferir seleção automática por frases como "retoma" ou "revise este app", remova essa linha do `SKILL.md` instalado; um `git pull` futuro pode pedir para você manter a remoção.

```text
/auxcode Quero começar um aplicativo de agenda. Defina comigo propósito,
regras e a primeira etapa antes de escolher funcionalidades.
```

```text
/auxcode revisar o fluxo de cadastro contra as regras deste projeto.
Corrija os desvios comprovados e valide o fluxo.
```

```text
/auxcode Verifique o cálculo do fechamento. Só diagnóstico, com evidências;
não altere arquivos.
```

```text
/auxcode retomar
```

O que você vai ver:

1. Antes de qualquer código, uma linha `Alinhamento: <pedido> atende <item | regra | defeito> em <fonte>. Pronto quando: <critério>`. Se ela não fechar, o Claude anota o pedido no backlog do projeto e pergunta, em vez de implementar.
2. Numa revisão, achados com evidência e classe (viola regra, defeito, risco ou recomendação); correções validadas uma a uma quando o pedido foi adequar, e só relatório quando foi diagnóstico.
3. No fim, um relato em três estados (feito, verificado, publicado), o que ficou sem verificar, e o checkpoint substituído no arquivo de estado do projeto.
4. Na retomada, leitura de mapa de fontes, checkpoint e só as fontes da tarefa ativa, com o checkpoint conferido contra o estado real antes de continuar.

Não é preciso reorganizar a documentação do aplicativo. A skill usa o arquivo de estado que o projeto já tem e só cria `docs/contexto-de-trabalho.md` quando não há equivalente. Os modelos de mapa, checkpoint e linha de alinhamento estão em [checkpoint.md](checkpoint.md); o formato do achado de revisão, em [revisao.md](revisao.md).

## Como funciona

Um ciclo de cinco passos por pedido: **retomar** lendo o mínimo e conferindo o estado real; **alinhar** com a linha de alinhamento; **executar** só o que a linha cobre; **provar** pelo critério, no fluxo afetado; **checkpoint** substituindo o anterior. Mudança de abordagem ou trabalho extra volta ao passo 2. As regras completas estão em [SKILL.md](SKILL.md), que é o que o Claude lê.

Regras contra erros que passam despercebidos: teste criado junto com a mudança, correção ou funcionalidade nova, tem que falhar sem ela; afirmação de ausência exige contagem completa, não saída cortada; inspecionar não é executar; ferramenta que não roda não é veredito, e vermelho que já aparecia no estado anterior não é da sua mudança; "verificado" exige o portão de verificação do projeto rodado sobre o que mudou, com resultado, data e o estado medido.

Regras contra a suposição: o que o modelo precisar assumir para seguir vai como `Suposição:` no chat e no checkpoint, e nada com suposição aberta conta como verificado; regras e decisões são citadas pelo identificador; item do roadmap sem critério observável não entra em execução; trabalho visual só começa com referência aceita; efeito fora do repositório (deploy, migração, PR) só depois de o alvo lido de um arquivo do projeto aparecer no chat. O briefing mínimo do projeto, com glossário, regras com identificador e roadmap com critério, está em [projeto.md](projeto.md).

## Sessões longas e compactação

O conteúdo da skill entra na conversa como uma mensagem e fica lá nos turnos seguintes. Na compactação automática, o Claude Code reanexa a invocação mais recente de cada skill, guardando os primeiros 5.000 tokens dela, com orçamento combinado de 25.000 tokens entre skills. Esta skill tem cerca de 3,4 mil tokens e sobrevive inteira. O que não sobrevive à compactação é o raciocínio da sessão; por isso o estado fica no checkpoint em disco. Reinvocar a skill numa sessão nova é o gesto de retomada. [Ciclo de vida da skill](https://code.claude.com/docs/en/skills#skill-content-lifecycle).

Como a skill não carrega sozinha, o gesto de início de sessão num aplicativo é digitar `/auxcode retomar` antes de qualquer pedido. Uma nota no `CLAUDE.md` do aplicativo não substitui isso: o Claude não pode invocar a skill por conta própria. O que vale registrar no `CLAUDE.md` é onde fica o arquivo de estado (mapa de fontes e checkpoint), para que a retomada o encontre de primeira.

## Limites e estado atual

A skill orienta decisões e registros. Não é um monitor automático, não mede tokens nem percentuais de contexto e não garante ausência de erro ou cumprimento de prazo. A economia vem de ler menos na retomada, não repetir tentativas descartadas e não escrever código fora do escopo.

Versão 0.5.0, setembro de 2026. Estrutura validada. Duas sessões de uso real na 0.3.x, retomada e revisão diagnóstica, geraram os ajustes da 0.3.1; a 0.4.0 saiu sem uso real e a 0.4.1 veio de uma única observação de uso; as 29 entradas da 0.5.0 vieram da leitura do `github/spec-kit` com verificação adversarial, e **nenhuma foi exercitada em sessão real ainda**. Detalhes em [docs/VALIDACAO.md](docs/VALIDACAO.md) e no [histórico de versões](CHANGELOG.md).

## Relatar o que observou

Abra uma issue com o pedido feito, a linha de alinhamento que o Claude produziu, o que ele leu na retomada e o que saiu errado. Esse relato é a próxima evidência para evoluir a skill.

## Licença

[MIT](LICENSE).
