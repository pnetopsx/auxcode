# Validação — auxcode

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
