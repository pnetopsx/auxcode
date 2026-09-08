# Validação — auxcode

## 0.5.0 — 7 de setembro de 2026

**Origem.** Uma cópia do `github/spec-kit` (commit `4a7341a`, main, 4 de setembro de 2026) foi clonada numa pasta temporária e lida. **Nada do repositório foi executado**: nem a CLI, nem os testes, nem os scripts. A mecânica de 18 unidades do spec-kit foi extraída em paralelo, comparada com os três arquivos da skill, fundida sem repetições e submetida a três verificadores independentes por candidata: fidelidade à fonte (o spec-kit realmente prescreve isto, no trecho citado?), encaixe (contradiz alguma regra do auxcode, é procedimento com saída conferível, cabe no orçamento de contexto?) e valor (muda o comportamento numa sessão real, contra uma lista de falhas já observadas?). Um crítico de completude apontou 16 mecanismos não cobertos e abriu uma rodada extra.

**Resultado.** 22 candidatas refutadas por inteiro e 50 aceitas em algum grau, fundidas em 29 mudanças. Onde uma lente refutou, o texto entrou com o corte que ela exigiu, registrado na coluna de votos. Também foram medidos 73 mecanismos que o auxcode já tinha, 32 em que ele é mais preciso que o spec-kit, 24 conflitos de filosofia e 21 mecanismos recusados por desenho (TDD obrigatório, especificação como fonte da verdade, diretório por funcionalidade, marcadores de paralelismo, cadência de commit, entre outros).

**Procedência.** As 81 citações de origem apontam para texto, não para código: 34 para `templates/commands/*.md`, 23 para comandos das extensões, 11 para modelos de documento, 5 para agentes da CI do próprio spec-kit, 7 para o ensaio e os guias, e 1 para um script de shell. **Nenhuma para código Python.**

**Segurança do material lido.** Uma auditoria separada, sobre nove superfícies do spec-kit, não encontrou código malicioso: a instalação não executa nada do repositório, importar o pacote não tem efeito colateral, e `specify init` não faz chamada de rede nem cria subprocesso. Três achados reais sobrevivem, todos dependentes de instalar extensão de terceiro ou de rodar a ferramenta dentro de repositório alheio. Nada disso afeta esta skill, que só reutilizou texto.

**Origem e votação de cada mudança:**

| Entrada | Arquivo | Votos | Fonte no spec-kit |
| --- | --- | --- | --- |
| `C08+X43` | SKILL.md | C08 3/3 · X43 3/3 | docs/guides/evolving-specs.md:55-56; extensions/git/commands/speckit.git.validate.md:19-23,33-41; templates/commands/analyze.md:54,162-172; extensions/bug/commands/speckit.bug.fix.md:21-32 |
| `C37` | SKILL.md | 2/3 (value refutou: conveniência, não prevenção — adotado só o resíduo de 8 palavras) | extensions/agent-context/commands/speckit.agent-context.update.md:18; extensions/agent-context/README.md:7,13 |
| `C20` | SKILL.md | 2/3 (value refutou: escrituração barata — adotado só a releitura do índice na hora) | templates/commands/converge.md:203-206; templates/commands/taskstoissues.md:67,69-70; scripts/bash/create-new-feature.sh:112-133,299,301 |
| `C10+X15` | SKILL.md | C10 2/3 (value refutou o teto de 3 e o excedente-vira-Suposição, cortados) · X15 2/3 (fit refutou "pare e espere", cortado) | templates/commands/specify.md:204-230; templates/commands/clarify.md:131-133,141-147,170-173; templates/commands/implement.md:79-84 |
| `C32` | SKILL.md | 2/3 (value refutou o motivo de recusa; adotado o inverso, "o que falta") | extensions/assess/commands/speckit.assess.decide.md:7,40-41,96; extensions/assess/README.md:22 |
| `C05` | SKILL.md | 3/3 | templates/commands/taskstoissues.md:58-65,73; extensions/git/commands/speckit.git.remote.md:19-45 |
| `C12+X18+X48` | SKILL.md | C12 2/3 · X18 2/3 · X48 2/3 (value refutou os três: risco não observado — adotado só o resíduo de proveniência) | .github/workflows/bug-fix.md:111-124; extensions/bug/commands/speckit.bug.assess.md:40-45; extensions/assess/commands/speckit.assess.research.md:30 |
| `X26+X33+X41+X16` | SKILL.md | X26 2/2 · X33 2/3 · X41 2/3 · X16 2/3 (value refutou os três últimos como redundantes; fundidos numa cláusula só) | .github/workflows/bug-fix.md:165-167,176-181,194-196,301; extensions/bug/commands/speckit.bug.fix.md:51,110; templates/commands/implement.md:163-168 |
| `C16+C17+X110` | SKILL.md | C16 2/3 · C17 2/3 · X110 2/3 (value refutou a varredura de 5 classes e o portão de interface; adotado o caso de erro e o de gravação de dados) | templates/commands/checklist.md:209,218-222; templates/commands/plan.md:146-150 |
| `C11+C22` | SKILL.md | C11 2/3 · C22 2/3 (value refutou o roteamento e a busca por ID; adotado o prazo e o resíduo reaberto) | templates/commands/clarify.md:182-196; spec-driven.md:395-398; templates/constitution-template.md:44 |
| `X11+C27+X21+X45` | SKILL.md | X11 2/2 · C27 2/2 · X21 2/3 · X45 2/3 (value refutou a proibição de sobrescrever; adotado só "não apague o anterior") | templates/commands/checklist.md:28,150,158-167,224-226,242-248; templates/commands/converge.md:77-78,159-160,219-220; templates/commands/analyze.md:168-172,243; extensions/bug/commands/speckit.bug.test.md:38,116 |
| `C01+C18+X27` | SKILL.md | C01 3/3 · X27 2/3 · C18 2/3 (value refutou X27/C18; adotada só a suíte já existente do fluxo tocado) | templates/commands/plan.md:152-157; templates/commands/implement.md:171-174; extensions/bug/commands/speckit.bug.test.md:46-52,54-57,74; docs/guides/existing-projects.md:56-62 |
| `C02+X24+X44` | SKILL.md | C02 2/3 (fit refutou o vocabulário; corrigido) · X24 3/3 · X44 2/3 (value refutou a obrigação de teste; fundida na prova do vermelho) | templates/tasks-template.md:85,182,249; spec-driven.md:312-316; extensions/bug/commands/speckit.bug.test.md:61-64,117; extensions/bug/commands/speckit.bug.fix.md:49 |
| `X54+C06+X23+X47` | SKILL.md | X54 3/3 · C06 2/3 · X23 2/3 · X47 2/3 (value refutou os três de consentimento; adotada meia linha, sem "serviço externo") | .github/workflows/feature-assess.md:143-148,271-275; extensions/bug/commands/speckit.bug.test.md:56-57; .github/workflows/bug-fix.md:185-194 |
| `C04` | SKILL.md | 2/3 (value refutou o escopo aberto; limitado às regras que a linha cita ou que tocam os arquivos alterados) | templates/commands/analyze.md:58,60,249; templates/plan-template.md:41 |
| `C13+X49` | SKILL.md | C13 2/3 · X49 2/3 (value refutou o portão de dependência e a proibição de merge; adotado só o relato) | templates/commands/implement.md:149-154; .github/workflows/bug-fix.md:221-222,269,294-297 |
| `C14` | SKILL.md | 3/3 | templates/commands/converge.md:60-63,68-69,137-139,145-158 |
| `C01+C31+C38` | checkpoint.md | C01 3/3 · C31 2/3 · C38 2/3 (value refutou C31/C38; adotado apontar em vez de copiar a stack) | templates/plan-template.md:21-37; templates/commands/plan.md:163; extensions/agent-context/commands/speckit.agent-context.update.md:20 |
| `C09+C25+X53` | checkpoint.md | C09 3/3 · C25 2/2 · X53 2/3 (value refutou o gatilho amplo; preso a "mudou depois de você ler") | extensions/git/commands/speckit.git.validate.md:19-23; extensions/git/commands/speckit.git.commit.md:18,61; docs/guides/evolving-specs.md:48-49; extensions/agent-context/README.md:5; extensions/assess/commands/speckit.assess.intake.md:46 |
| `C19-checkpoint` | checkpoint.md | 2/3 (value refutou a parada para aceite e o bullet no SKILL.md; adotada só a extensão do campo) | templates/commands/plan.md:126,131-133; templates/plan-template.md:106-110; spec-driven.md:224,378 |
| `C21b+X24b+C02b` | checkpoint.md | herda C21 2/3, X24 3/3, C02 2/3 (correção de exemplo, sem regra nova) | extensions/bug/commands/speckit.bug.test.md:61-64,117; templates/commands/converge.md:137-139,219-220; templates/commands/checklist.md:209 |
| `C24` | checkpoint.md | 2/3 (value refutou a varredura antes de salvar; adotada só a marcação no próprio modelo) | templates/checklist-template.md:13-21; templates/tasks-template.md:31,44; templates/plan-template.md:61; templates/commands/analyze.md:127 |
| `C23+C33` | projeto.md | C23 2/3 · C33 2/3 (value refutou a conferência por classes e a linha `Contra:`; adotada a fonte por campo) | templates/commands/specify.md:146-197; spec-driven.md:186-187,190; extensions/assess/commands/speckit.assess.research.md:66,93 |
| `C26` | projeto.md | 2/3 (value refutou o gatilho no fechamento de etapa e a dicotomia; adotado o terceiro estado "etapa futura") | templates/commands/analyze.md:142-144,156 |
| `C19-projeto` | projeto.md | 2/3 (value refutou a versão com parada para aceite; adotada só a coluna) | templates/plan-template.md:106-110; templates/commands/plan.md:131-133 |
| `C21` | projeto.md | 2/3 (value refutou a governança de regras; adotada só a coluna de ID no roadmap) | templates/commands/converge.md:73-78,219-220; templates/commands/constitution.md:100-104; templates/commands/analyze.md:110 |
| `C16+X110-projeto` | projeto.md | C16 2/3 · X110 2/3 (value refutou a varredura obrigatória no SKILL.md; movida para leitura sob demanda) | templates/commands/checklist.md:209,218-222 |
| `X13` | projeto.md | 2/3 (value refutou o parágrafo e a conferência antes de salvar; adotada só a marcação) | templates/checklist-template.md:13-21; templates/tasks-template.md:44 |
| `X11+C27+X21-detalhe` | new-file:revisao.md | X11 2/2 · C27 2/2 · X21 2/3 · X45 2/3 | templates/commands/checklist.md:28,150,158-167,224-226,242-248; templates/commands/converge.md:159-160,219-220; templates/commands/analyze.md:168-172,243; extensions/bug/commands/speckit.bug.fix.md:37,112 |


**Conferência estrutural.** Frontmatter reanalisado com `YAML.safe_load` (Ruby/Psych): cinco chaves, `disable-model-invocation` lido como booleano verdadeiro, descrição com 439 caracteres e `when_to_use` com 301, combinado de 740 (teto de 1.536 do listing). Corpo com 1.880 palavras e cerca de 3,5 mil tokens, dentro do teto de 5.000 por skill na compactação. Os dezesseis links relativos de `SKILL.md`, `README.md` e `revisao.md` resolvem. Nenhum script ou dependência de execução foi acrescentado.

```text
c6b9066968720c371606292ec24bf5a7f20d69edca8792a62242afe8cecccccf  SKILL.md
55c291a6e04198e8a59e2708ec85c6fb51e79b768a7b0cc400dc1afcc208428d  checkpoint.md
1f0a30935fd17e33068c81eaddea1563501df9baf8795936a9192212efe3397f  projeto.md
34f17add8a7ccc836109c6d9a1f1a70baafdc6f5b0ddbf5131b68a523d38f1f0  revisao.md
```

**O que esta versão NÃO tem.** Nenhuma das 29 entradas foi exercitada numa sessão real. Elas vêm de leitura e verificação adversarial, não de uso. As duas sessões de uso real registradas na seção da 0.3.1 e a observação que motivou a 0.4.1 valem para o texto anterior. Depois da 0.4.1, cinco sessões reais no projeto Leilões exercitaram aquele texto (retomada; pedido sem sustentação mandado ao backlog; correção com o teste falhando antes e o portão no runtime exigido; pergunta em vez de chute; recusa de trabalho visual sem referência) e nenhuma delas foi registrada aqui na época; os três ajustes que elas sugeriram continuam não aplicados. O primeiro uso recomendado é uma retomada e uma revisão diagnóstica num projeto pequeno, observando especificamente: se a conferência da retomada aparece no chat, se o portão de verificação é procurado no mapa de fontes, e se a resposta a "o que falta para fechar a etapa" percorre as cláusulas em vez de repetir a coluna Estado.

## 0.4.1 — 6 de setembro de 2026

Mudança de invocação: `disable-model-invocation: true`. Observação de uso real que a motivou: a skill carregava sozinha ao abrir qualquer projeto, pelo gatilho amplo de `when_to_use`. Pela documentação do Claude Code (consultada em 6 de setembro de 2026), com esse campo a descrição não entra no contexto e só o usuário invoca, por `/auxcode`. O campo consta no binário 2.1.263 instalado (busca textual). `when_to_use` foi mantido para quem remover a linha.

- Frontmatter reanalisado com `YAML.safe_load`: cinco chaves, `disable-model-invocation` lido como booleano verdadeiro. Corpo com 1136 palavras. Sem outra mudança na skill.

```text
1f16713e4858ff7449eff10d0b50e2cb9e1877fafdaaba5e3458ae9d88ef3f03  SKILL.md
d84b254eaee9cff1a4f4182f75428db3f3ef173f14e0b8a3800edd42ae62941d  checkpoint.md
b1e61f67b8ea77c73649dc33d62782a02ade958a458b4b133926781be18f7164  projeto.md
```

## 0.4.0 — 6 de setembro de 2026

Acréscimo de corpo de informação do projeto (`projeto.md`) e de quatro regras contra suposição. **Sem nova evidência de uso real nesta versão.** As regras vêm de lições registradas em projetos do autor (trabalho visual sem referência custou rodadas em duas ocasiões; regras com identificador foram o que tornou a revisão da 0.3.x citável), não de ensaio desta skill.

- Frontmatter reanalisado com `YAML.safe_load` (Ruby/Psych): `name` igual a `auxcode`, descrição com 439 caracteres, `when_to_use` com 301, combinado de 740. Corpo com 1136 palavras. Links para `checkpoint.md` e `projeto.md` resolvem.
- Custo por invocação subiu com o corpo; `projeto.md` não entra no contexto até ser lido.

```text
f2f4920f965289abd2c807e232549bd7144a3b742422ebcc39c25ca6b5382376  SKILL.md
d84b254eaee9cff1a4f4182f75428db3f3ef173f14e0b8a3800edd42ae62941d  checkpoint.md
b1e61f67b8ea77c73649dc33d62782a02ade958a458b4b133926781be18f7164  projeto.md
```

## 0.3.1 — 6 de setembro de 2026

Primeiras evidências de uso real, em duas sessões novas do Claude Code sobre um projeto privado com `docs/STATUS.md` e roadmap, observadas pelo autor e avaliadas pelo agente que escreveu a skill:

- **Retomada** (`/auxcode` sem argumento). Leu um arquivo, uma listagem e um comando antes de falar; conferiu git, tipos e testes em vez de aceitar o "PASSED" do STATUS; do plano, leu só as seções apontadas; não escreveu código porque o plano esperava aceite do proprietário. Não escreveu a linha de alinhamento (não houve código), não regravou o checkpoint (nada mudou) e não disse em que versão do Node os testes rodaram, num projeto que exige versão diferente da instalada no sistema.
- **Revisão diagnóstica** (`/auxcode revisar`; alvo escolhido pelo usuário entre opções da sessão: uma entrega inteira). Perguntou o alvo antes de começar; conferiu o STATUS; classificou cada achado em viola regra, defeito ou decisão do usuário, com arquivo e linha, medição e reprodução; verificou de forma independente os achados dos subagentes; fez teste de mutação numa regra sem cobertura; não alterou nada. Custo alto pelo alvo amplo, que a própria sessão recomendou. O relatório ficou só na pasta de trabalho da sessão.

Cada ajuste da 0.3.1 responde a uma dessas observações; ver o histórico de versões. Duas sessões não são amostra, não houve medição de tokens, e os limites registrados na 0.2.0 continuam.

- Frontmatter reanalisado com `YAML.safe_load` (Ruby/Psych) após as edições: `name` igual a `auxcode`, descrição com 439 caracteres, `when_to_use` com 301, combinado de 740. Corpo com 984 palavras. Apresentação regenerada com a versão e duas frases novas nas páginas 9 e 12.

```text
cd97d60e5796ac19826decbfd6d8c85092118d2330313823c7e5927815cbb453  SKILL.md
2d1d7b4d6e80375ffd21aa9d917e19076e5f453b1ef8e296dff5f9d80bfedc3d  checkpoint.md
```

## 0.3.0 — 6 de setembro de 2026

Mudança desta versão: o nome do comando e do repositório passa de `foco-no-roadmap` para `auxcode`; o conteúdo da skill é o da 0.2.0. Não houve avaliação de comportamento; ver "Ainda requer uso real" na seção da 0.2.0, que continua valendo.

- Frontmatter analisado de novo com `YAML.safe_load` (Ruby/Psych) após a troca de nome: `name` igual a `auxcode`, descrição com 439 caracteres, `when_to_use` com 301; combinado de 740, abaixo do limite de 1.536 do listing. Corpo com 894 palavras. Link para `checkpoint.md` resolve.
- Nenhuma ocorrência restante de `foco-no-roadmap` em `SKILL.md`, `checkpoint.md`, na apresentação ou no script; o nome antigo permanece só neste relatório e no histórico de versões, como registro.
- A apresentação em PDF foi regenerada a partir do HTML renomeado e as páginas alteradas foram conferidas como imagem.
- O pacote ZIP deixou de existir: o repositório `github.com/pnetopsx/auxcode` é a distribuição, e a instalação é `git clone` na pasta de skills.

SHA-256 dos arquivos da skill nesta versão:

```text
ff276b9331aec13337d6fc688479f62e54fa38ffd10ecfc468f1565e0ca17849  SKILL.md
2d1d7b4d6e80375ffd21aa9d917e19076e5f453b1ef8e296dff5f9d80bfedc3d  checkpoint.md
```

## Validação da 0.2.0 (nome antigo: foco-no-roadmap)

Realizada em 6 de setembro de 2026, por Claude Code, sobre a reescrita da skill. Escopo: estrutura da skill, guia, integridade do pacote. **Não houve avaliação de comportamento nesta versão**; ver "Ainda requer uso real". O relatório da 0.1.0 está preservado ao final.

### Estrutura

- Frontmatter analisado com `YAML.safe_load` (Ruby 4.0.6/Psych): mapa com `name`, `description`, `when_to_use` e `argument-hint`. Nome igual ao da pasta. Descrição com 439 caracteres, `when_to_use` com 301; combinado de 740, abaixo do limite de 1.536 do listing. Os quatro campos constam no binário do Claude Code 2.1.263 instalado (busca textual), o que indica reconhecimento, não comportamento testado.
- **Defeito encontrado e corrigido durante esta validação:** a primeira redação do `when_to_use` continha dois-pontos seguido de espaço dentro do valor, o que tornava o YAML inválido ("mapping values are not allowed in this context"). Reescrito sem o dois-pontos; parser passou.
- Corpo com 896 palavras (0.1.0: 1.384). Marcadores de restrição ("não", "sem", "nem", "apenas", "somente", "só"): 54 (0.1.0: 70). Palavras de calibragem ("proporcional", "suficiente", "pertinente", "relevante", "necessário", "rotineiro", "significativo"): 2 (0.1.0: 29). O link para `checkpoint.md` resolve. Sem placeholders de autoria.
- A pasta da skill contém `SKILL.md` e `checkpoint.md`; nenhum script ou dependência de execução.

### Guia

- Âncoras das páginas oficiais conferidas por download do HTML em 6 de setembro de 2026: as quatro de `/docs/en/skills` existem. A âncora citada pelo guia 0.1.0 para a página de memória (`#instructions-seem-lost-after-compact`) **não existe**; a página usa `#instructions-seem-lost-after-/compact`. Corrigida no guia 0.2.0.
- Os fatos sobre compactação (reanexo da invocação mais recente, 5.000 tokens por skill, 25.000 combinados) foram lidos da página `/docs/en/skills` na mesma data.
- O link relativo para `../templates/parametros-do-projeto.md` resolve a partir da pasta `skills/`; após extrair o ZIP fora do guia ele deixa de resolver, como já ocorre com qualquer referência ao guia.

### Pacote

O ZIP `dist/foco-no-roadmap-0.2.0.zip` contém `foco-no-roadmap/SKILL.md`, `foco-no-roadmap/checkpoint.md`, `README.md` e `VALIDACAO.md`, cada um conferido byte a byte contra a autoria após a criação. Um arquivo `.sha256` acompanha o ZIP. O pacote 0.1.0 não foi alterado nem removido.

SHA-256 dos arquivos da skill avaliada:

```text
0b19b23ad22d3505c1b3b16a8aa15d0009e201db942a9d8ffbf73e4d11e1735d  foco-no-roadmap/SKILL.md
2d1d7b4d6e80375ffd21aa9d917e19076e5f453b1ef8e296dff5f9d80bfedc3d  foco-no-roadmap/checkpoint.md
```

### Ainda requer uso real

Nada da 0.2.0 foi ensaiado em comportamento: os seis cenários da 0.1.0 não foram repetidos, e a seção de revisão e o caminho para projeto em andamento sem roadmap são novos e sem qualquer ensaio. Não houve instalação, reconhecimento do comando, seleção automática, sessão longa ou compactação real no Claude Code.

Primeiro uso recomendado, nesta ordem, num projeto pequeno: instalar; `/foco-no-roadmap revisar <uma área pequena>` e observar se cada achado vem com evidência e classe, e se nada fora do escopo virou código; `/foco-no-roadmap retomar` numa sessão nova e observar se a leitura ficou restrita a mapa, checkpoint e fontes da tarefa. Só essa experiência diz se a skill economiza tokens e reduz erros no seu fluxo; este relatório não estabelece essas garantias.

### Histórico: validação da 0.1.0

Realizada em 6 de setembro de 2026. Escopo: estrutura da skill, guia para Claude Code, integridade do pacote e comportamento em seis cenários pequenos. A pasta da skill contém somente [SKILL.md](foco-no-roadmap/SKILL.md), sem scripts ou dependências de execução.

#### Estrutura e documentação

- Frontmatter analisado com `YAML.safe_load` do Ruby/Psych: mapa com apenas `name` e `description`, ambos textos não vazios. Nome igual ao da pasta, caracteres válidos e descrição com 369 caracteres. Delimitadores, corpo e ausência de placeholders de autoria conferidos.
- O validador auxiliar `quick_validate.py` não executou por falta de PyYAML no ambiente. A verificação estrutural foi feita com o parser YAML acima e checagens explícitas; não se atribui aprovação ao validador indisponível.
- Links relativos do guia e deste relatório conferidos na origem e no conteúdo do ZIP. Páginas e seções oficiais citadas no [guia](README.md) foram abertas e conferidas. Instalação, invocação e ressalvas de contexto estão documentadas somente para Claude Code.
- Revisão adicional dos dois arquivos não identificou contradições materiais entre autonomia, evidência, checagem recorrente e limites de diagnóstico/adequação.

#### Avaliação de comportamento

Três agentes receberam a skill, pedidos realistas e arquivos mínimos em diretórios temporários separados. Cada agente executou dois casos, sem receber solução esperada, editar a skill, acessar serviços externos ou alterar aplicativos reais. Perguntas necessárias foram registradas no relatório da simulação, sem enviá-las ao usuário. Todos conferiram a versão final das instruções; seus relatórios e os arquivos produzidos foram revisados.

| Cenário e pedido | Comportamento observado | Evidência |
| --- | --- | --- |
| Projeto novo, só um README: implementar uma agenda | Registrou contexto e perguntou pelo público e pela tarefa essencial. Não inventou funcionalidades ou roadmap aprovado. | Nenhuma implementação criada; ausência de requisitos confirmada no único arquivo inicial. |
| Suspeita de recibos duplicados por retry | Investigou o caminho disponível, preservou o código e pediu um exemplo da ocorrência e dados do armazenamento. | Um teste passou; execução A/B/A reutilizou o recibo de A. Não alegou ausência universal de duplicação. |
| Aplicativo existente: adequar fechamento às regras adotadas | Localizou regras e etapa em arquivos de nomes diferentes, corrigiu o filtro de vendas e reaproveitou o checkpoint. | Antes: 1 falha em 3 testes, 800 em vez de 500. Depois: 4 testes passaram, incluindo somente canceladas → zero. |
| Mesmo desvio: apenas diagnóstico, sem alterar arquivos | Expôs a violação com fonte e causa comprovada, mantendo os arquivos do caso intactos. | 1 falha em 3 testes; execução adicional confirmou somente canceladas → 300 em vez de zero. A falha é evidência do diagnóstico, não falha da avaliação. |
| Retomada com checkpoint dizendo que o bug estava corrigido | Conferiu o estado real, refutou o registro antigo, corrigiu o defeito e atualizou os registros. Não iniciou o relatório mensal ainda não aprovado. | Falha inicial 800 em vez de 500; 4 testes passaram após a correção. |
| Usuário troca prioridade online por exportação CSV local | Implementou a função pedida, reaproveitou validação de itens e biblioteca padrão, substituiu decisões afetadas e preservou a regra de quantidades. | 6 testes passaram, incluindo os 2 anteriores, acentos e escape CSV. Não pediu novamente a autorização dada. |

Os resultados são coerentes com os limites propostos. São execuções de cenários por agentes fora do Claude Code, com testes reais nas pequenas implementações temporárias. Não são testes de correspondência de palavras nem execução nativa da skill no host de destino.

#### Pacote

O ZIP contém exatamente `foco-no-roadmap/SKILL.md`, `README.md` e `VALIDACAO.md`. Foram verificados CRC, nomes seguros, ausência de entradas duplicadas, identidade byte a byte com os arquivos de autoria e resolução dos links relativos após extração temporária. Um arquivo `.sha256` acompanha o ZIP para conferir sua integridade.

SHA-256 da skill avaliada:

```text
75a218af51ffba7da69ad6e71ed1a700697b5c69ced90c4da12161580827b395
```

#### Ainda requer uso real

Não foram testados instalação ou reconhecimento do comando no Claude Code, seleção automática, persistência ao longo de sessões extensas, compactação real ou integração opcional com `CLAUDE.md`. Também não houve cenário com interface visual; sua orientação foi revisada, sem ensaio visual de aplicação.

Uma primeira experiência no Claude Code deve confirmar `/foco-no-roadmap` em um projeto pequeno, acompanhar uma tarefa com critério observável e retomar o trabalho conferindo o checkpoint. Essa experiência continua necessária para avaliar a utilidade no fluxo do usuário. Não houve medição de economia de tokens, desempenho ou taxa de erros, e esta avaliação não estabelece essas garantias.
