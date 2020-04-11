/*********************                                                        */
/*! \file proof_manager.h
 ** \verbatim
 ** Top contributors (to current version):
 **   Andrew Reynolds
 ** This file is part of the CVC4 project.
 ** Copyright (c) 2009-2019 by the authors listed in the file AUTHORS
 ** in the top-level source directory) and their institutional affiliations.
 ** All rights reserved.  See the file COPYING in the top-level source
 ** directory for licensing information.\endverbatim
 **
 ** \brief Strings proof manager utility
 **/

#include "cvc4_private.h"

#ifndef CVC4__THEORY__STRINGS__PROOF_MANAGER_H
#define CVC4__THEORY__STRINGS__PROOF_MANAGER_H

#include <map>
#include <vector>

#include "expr/node.h"
#include "theory/strings/proof.h"

namespace CVC4 {
namespace theory {
namespace strings {

/**
 * A proof manager for strings
 */
class ProofManager
{
 public:
  ProofManager() {}
  ~ProofManager() {}
  /** Get proof for fact, or nullptr if it does not exist */
  ProofNode* getProof(Node fact) const;
  /** Register step
   *
   * @param fact The intended conclusion of this proof step.
   * @param id The identifier for the proof step.
   * @param children The antecendant of the proof step. Each children[i] should
   * be a fact previously registered as conclusions of a registerStep call
   * when ensureChildren is true.
   * @param args The arguments of the proof step.
   *
   * This returns true if indeed the proof step proves fact. This can fail
   * if the proof has a different conclusion than fact, or if one of the
   * children does not have a proof.
   */
  bool registerStep(Node fact,
                    ProofStep id,
                    const std::vector<Node>& children,
                    const std::vector<Node>& args,
                    bool ensureChildren = false);

  // ----------------------- standard proofs
  void rew(Node a);
  void subs(Node a, const std::vector<Node>& exp, bool ensureChildren = false);
  void subsRew(Node a, const std::vector<Node>& exp, bool ensureChildren = false);
  void equalBySubsRew(Node a, Node b, const std::vector<Node>& exp,
                    bool ensureChildren = false);
  void conflictBySubsRew(Node pred, const std::vector<Node>& exp,
                    bool ensureChildren = false);
  // ----------------------- end standard proofs
 private:
  /** The nodes of the proof */
  std::map<Node, std::unique_ptr<ProofNode> > d_nodes;
};

}  // namespace strings
}  // namespace theory
}  // namespace CVC4

#endif /* CVC4__THEORY__STRINGS__PROOF_MANAGER_H */
