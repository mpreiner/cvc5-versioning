/******************************************************************************
 * Top contributors (to current version):
 *   Andrew Reynolds
 *
 * This file is part of the cvc5 project.
 *
 * Copyright (c) 2009-2021 by the authors listed in the file AUTHORS
 * in the top-level source directory and their institutional affiliations.
 * All rights reserved.  See the file COPYING in the top-level source
 * directory for licensing information.
 * ****************************************************************************
 *
 * Rewrite database
 */

#include "cvc5_private.h"

#ifndef CVC4__THEORY__REWRITE_DB__H
#define CVC4__THEORY__REWRITE_DB__H

#include <map>
#include <vector>

#include "expr/match_trie.h"
#include "expr/node.h"
#include "expr/term_canonize.h"
#include "rewriter/rewrites.h"
#include "theory/rewrite_proof_rule.h"
#include "theory/rewrite_term_util.h"

namespace cvc5 {
namespace theory {

/** Type class callback */
class IsListTypeClassCallback
{
 public:
  uint32_t getTypeClass(TNode v) override;
};
  
/**
 * A database of conditional rewrite rules.
 */
class RewriteDb
{
 public:
  /**
   * Constructor. The body of this method is auto-generated by the rules
   * defined in the rewrite_rules files.
   */
  RewriteDb();
  ~RewriteDb() {}
  /** Add rule, return its identifier */
  void addRule(rewriter::DslPfRule id,
               const std::vector<Node> fvs,
               Node a,
               Node b,
               Node cond);
  /** get matches */
  void getMatches(Node eq, expr::NotifyMatch* ntm);
  /** get rule for id */
  const RewriteProofRule& getRule(rewriter::DslPfRule id) const;
  /** get ids for conclusion */
  const std::vector<rewriter::DslPfRule>& getRuleIdsForConclusion(
      Node eq) const;

 private:
  /** common constants */
  Node d_true;
  Node d_false;
  /** Callback to distinguish list variables */
  IsListTypeClassCallback d_canonCb;
  /** the term canonization utility */
  expr::TermCanonize d_canon;
  /** The match trie */
  expr::MatchTrie d_mt;
  /** map ids to rewrite db rule information */
  std::map<rewriter::DslPfRule, RewriteProofRule> d_rewDbRule;
  /** map conclusions to proof ids */
  std::map<Node, std::vector<rewriter::DslPfRule> > d_concToRules;
  /** dummy empty vector */
  std::vector<rewriter::DslPfRule> d_emptyVec;
};

}  // namespace theory
}  // namespace cvc5

#endif /* CVC4__THEORY__REWRITE_DB__H */
