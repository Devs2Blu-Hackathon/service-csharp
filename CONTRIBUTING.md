# Padrões de Contribuição do Projeto (Hackathon)

## 1. Filosofia: Commits Pequenos, PRs Atômicos

Nosso recurso mais valioso neste hackathon é o **tempo de revisão de código**.

- **Regra de Ouro:** Um Pull Request (PR) deve ser **pequeno** e **focado**. Ele deve resolver **apenas uma** funcionalidade ou **apenas um** problema.
- **Tamanho Máximo:** Um PR não deve conter mais do que **~300 linhas de modificação** (excluindo arquivos gerados). Se passar disso, divida em PRs menores.
- **Benefício:** PRs pequenos são revisados em minutos, não em horas. Isso evita gargalos e mantém a branch `develop` sempre estável e atualizada.

---

## 2. Estratégia de Branching (Git Flow Leve)

Teremos duas branches principais e permanentes:

- **`main`**: Representa o código “de produção” – o que será apresentado.
- **`develop`**: Branch principal de integração. **Todo trabalho novo nasce e é integrado aqui.**

### 2.1. Padrão de Nomenclatura de Branch

Sempre crie sua branch a partir da `develop`. Use os seguintes prefixos:

- **Nova funcionalidade:** `feat/`
  - Ex.: `feat/endpoint-login`
- **Correção de bug:** `fix/`
  - Ex.: `fix/cors-error-no-java`
- **Melhoria / Refatoração:** `refactor/`
  - Ex.: `refactor/simplificar-jwt-service`

### 2.2. Fluxo de Trabalho Padrão

1. `git checkout develop`
2. `git pull origin develop`  ← **sempre sincronize antes de começar**
3. `git checkout -b feat/minha-nova-feature`
4. Desenvolva com **commits pequenos e frequentes**
5. `git push origin feat/minha-nova-feature`
6. Abra um **Pull Request** com *target* na branch `develop`.

> **Exceção — Hotfix:**  
> Se um bug **crítico** for encontrado na `main` (por exemplo, após uma demo), crie a branch a partir da `main` usando o prefixo `hotfix/` e abra o PR com alvo na `main`.  
> Ex.: `hotfix/corrigir-crash-demo`

---

## 3. Padrão de Mensagens de Commit (Conventional Commits)

Usaremos **Conventional Commits** para manter o histórico limpo e fácil de entender.

**Formato:**  
`tipo(escopo): mensagem curta`

Principais tipos:

- **`feat`** – nova funcionalidade  
  - `feat(java-api): adiciona endpoint POST /usuarios`
- **`fix`** – correção de bug  
  - `fix(flutter-ui): corrige botão de login que não respondia`
- **`docs`** – documentação  
  - `docs: atualiza README com instruções de setup`
- **`style`** – formatação, lint, sem mudança de lógica  
  - `style(csharp): formata código com dotnet format`
- **`refactor`** – refatoração sem alterar comportamento  
  - `refactor(java-api): extrai lógica de validação para UserValidator`
- **`test`** – inclusão ou ajuste de testes  
  - `test(csharp-service): adiciona teste unitário para CalculoService`

> Dica: pense na mensagem de commit como um **tweet técnico**: curta, clara e focada.

---

## 4. Definition of Done (DoD) para um PR

Um PR só pode ser “mergeado” na `develop` se **todos** os itens abaixo forem verdadeiros:

1. **PR Atômico:** O PR endereça apenas **uma** funcionalidade ou **um** problema.
2. **Título e Descrição Claros:**  
   - O título segue o padrão de **Conventional Commits**.  
   - A descrição explica **o que foi feito** e **por que foi feito**.
3. **Issue Vinculada (quando aplicável):** O PR referencia a issue correspondente.  
   - Ex.: `Resolves #12`
4. **Revisão Aprovada:** O PR tem pelo menos **1 aprovação** de outro membro da equipe (conforme nosso `ruleset`).
5. **Sem Conflitos:** O PR não possui conflitos de merge com a `develop`.
6. **CI Verde (quando disponível):** O pipeline de CI (build, testes, análise) está passando.

> Em caso de dúvida, prefira **quebrar o PR** em algo menor e mais fácil de revisar. PR pequeno quase nunca é problema; PR gigante quase sempre é.