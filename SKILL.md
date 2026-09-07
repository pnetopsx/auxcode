---
name: auxcode
disable-model-invocation: true
description: Use ao iniciar um aplicativo do zero, retomar um em andamento, revisar ou adequar o código às regras do projeto, ou corrigir defeitos nele. Mantém cada mudança rastreável a um item do roadmap, a uma regra do projeto ou a um defeito comprovado, exige evidência para dar algo por pronto e guarda um checkpoint curto para retomar sem reler a documentação. Projeto sem roadmap ou regras escritas ganha o mínimo deles a partir do que já existe.
when_to_use: Gatilhos típicos são "retoma", "continua de onde parou", "o que falta para fechar a etapa", "revise este app", "adeque às regras do projeto", "implemente X" ou "corrija X" num aplicativo. Não use para dúvidas conceituais, tarefas fora de um aplicativo ou quando o usuário pediu só uma resposta rápida.
argument-hint: <pedido, "retomar" ou "revisar">
---

# auxcode

Meta: nenhum código sem item do roadmap, regra do projeto ou defeito comprovado que o sustente; nada dado por pronto sem evidência; retomada lendo o mínimo. Os instrumentos são a **linha de alinhamento** e o **checkpoint**; modelos em [checkpoint.md](checkpoint.md). O briefing mínimo do projeto, com glossário, regras com identificador e roadmap com critério, está em [projeto.md](projeto.md).

## 1. Começar ou retomar: leia o mínimo

1. Leia só isto, nesta ordem: o mapa de fontes e o checkpoint do projeto; depois apenas as fontes que o checkpoint aponta para a tarefa ativa. Do roadmap, só a etapa atual e a seguinte. Não varra a árvore de docs nem releia histórico. Busca ampla em muitos arquivos: delegue a um subagente e traga só a conclusão.
2. Checkpoint é atalho, não prova. Confira tarefa ativa, branch/commit, testes e deploy contra o estado real antes de continuar; corrija a divergência no registro.
3. Sem mapa ou checkpoint: localize propósito, regras/decisões e roadmap pelos arquivos de instrução e índices do projeto e crie os dois no local que o projeto já usa para estado de trabalho; se não houver, `docs/contexto-de-trabalho.md`. Se o projeto segue o Guia de aplicativos, o documento de parâmetros do projeto é a fonte de propósito e regras. Não edite CLAUDE.md, configurações ou hooks para isso.
4. Projeto em andamento sem roadmap, regras ou estado escritos: não pare nem exija reorganização. Derive do que existe (código, docs, commits recentes, issues) uma proposta mínima no formato do briefing de [projeto.md](projeto.md): propósito em uma linha, público, regras que o código já pratica com identificador, glossário dos termos do domínio, etapa atual e a seguinte com critério observável, mapa de fontes. Apresente para aceite, grave no projeto e siga. Aplicativo do zero: preencha o briefing com o usuário (problema e resultado, público, jornadas, fora do escopo, restrições, referências visuais) antes de escolher funcionalidades; grave e só então implemente.
5. Antes de tocar em código, escreva uma linha no chat:
   `Alinhamento: <pedido> atende <item do roadmap | regra | defeito> em <fonte>. Pronto quando: <critério observável>.`
   Sem item, regra ou defeito que sustente o pedido: não implemente. Anote em "fora do escopo" e pergunte só o que decide. Regra e decisão entram pelo identificador (DT-12, ADR-009, R-03); o que não tem identificador ganha um ao ser registrado.
6. Se faltar propósito, regra ou etapa para escolher a direção: faça a menor pergunta que destrava uma decisão real e siga com o que não depende dela. Proposta sua é proposta até ser aceita. Não invente público, prazo, prioridade nem funcionalidade.

## 2. Executar: só o que a linha cobre

- Faça o pedido e as dependências técnicas necessárias. Melhoria, limpeza, refatoração, abstração ou dependência nova sem necessidade demonstrável para esta tarefa: uma linha no backlog/roadmap do projeto, zero código.
- Reaproveite os padrões do projeto. Escolha rotineira de implementação: decida sozinho. Ambiguidade que muda produto, público, comportamento ou escopo: pergunte só isso e continue o resto.
- Defeito entra sem estar no roadmap quando quebra o fluxo da etapa atual ou uma regra do projeto. Antes de corrigir, registre esperado (com fonte) e observado (com evidência). Hipótese autoriza investigar, não implementar. Escolha a menor investigação que separe as hipóteses e corrija a causa sustentada por evidência.
- Separe sempre fato verificado, hipótese e decisão pendente. Tentativa descartada vai para o checkpoint com o motivo, para não repetir.
- Precisou assumir algo para seguir: escreva `Suposição: <o quê> · confirma: <quem ou fonte>` no chat e no checkpoint. Nada com suposição aberta conta como verificado; confirmada ou refutada, ela sai do checkpoint.
- Item do roadmap sem critério observável não entra em execução: escreva o critério com o usuário e registre no roadmap antes de começar.
- Trabalho visual (tela nova, identidade, componente) só começa com uma referência aceita pelo usuário: qual aplicativo, tela ou imagem seguir e o que copiar dela. Sem referência, peça-a antes de desenhar; direção inventada custa rodadas.
- Mudou a abordagem ou surgiu trabalho extra: refaça a linha de alinhamento. Mudança explícita do usuário substitui a direção anterior: registre o que substitui, atualize a fonte afetada e não peça de novo autorização já dada.

## 3. Revisar ou adequar um aplicativo existente

- Revisão sem alvo definido: proponha o menor recorte útil como padrão e deixe o usuário ampliar. Revisar tudo custa caro e raramente é o pedido.
- Base de comparação, nesta ordem: regras e decisões do projeto; diretrizes do Guia de aplicativos que o projeto adotou; padrões que o próprio código já pratica. Norma genérica ou preferência sua não é regra do projeto.
- Percorra só a área pedida. Cada achado traz evidência (arquivo e trecho, teste ou reprodução) e uma classe. **Viola regra do projeto**: corrija. **Defeito**, com esperado e observado: corrija se quebra a etapa atual ou uma regra, senão backlog. **Risco ou recomendação**: relate, proponha como regra ou item de roadmap e, sem aceite, zero código. Regra praticada mas não escrita é proposta de regra, não desvio.
- Priorize por objetivo, etapa e dependência. Pedido de adequação: corrija e valide cada item; não termine só com recomendações. Pedido só de diagnóstico: não altere a implementação, mas grave o relatório de achados no local de evidências ou de estado do projeto, salvo pedido explícito de não gravar nada; relatório só no chat some com a sessão.
- Não amplie a inspeção além da área pedida; o que viu fora dela vira uma linha no backlog.

## 4. Pronto: só com evidência

- Valide pelo critério da linha, no fluxo afetado. Compilar não prova; inspecionar não é executar. Interface: verifique funcional e visualmente quando houver ferramenta.
- Teste criado junto com a correção: prove que falha sem ela antes de confiar no verde.
- Evidência vale no ambiente que o projeto exige (versão de runtime, variáveis, flags). Se rodou em outro, diga qual e não conte como verificado.
- Afirmação de ausência ("não há X") exige contagem completa, não saída cortada. Agregue saídas com contagem ou filtro; não despeje logs no contexto.
- Revise o diff contra o pedido e remova acréscimos seus sem justificativa. Preserve trabalho preexistente do usuário.
- Relate em três estados: feito, verificado, publicado. Diga o que ficou sem verificar e por quê.
- Roadmap: marque concluído só com evidência; constar no plano não é conclusão.

## 5. Marco ou encerramento: um checkpoint, sempre atual

Substitua o checkpoint anterior; não crie diário. Se nada mudou desde o último, não o regrave e diga isso no relato. Campos e formato em [checkpoint.md](checkpoint.md). Decisão durável vai para o documento de decisões do projeto; o checkpoint só a referencia. Sem logs, código ou segredos. O próximo passo é o próximo item da etapa, salvo bloqueio registrado. Se não puder gravar arquivos, entregue o registro ao usuário e diga que a retomada depende dele.
