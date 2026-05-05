local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('technology.disuko', 'eclipse-disuko') {
  settings+: {
    description: "",
    members_can_change_project_visibility: false,
    members_can_change_repo_visibility: false,
    members_can_create_teams: false,
    members_can_delete_repositories: false,
    name: "Eclipse Disuko",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
      default_workflow_permissions: "write",
    },
  },
  _repositories+:: [
    orgs.newRepo('disuko-cli') {
      has_wiki: false,
      auto_init: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          requires_pull_request: true,
          required_approving_review_count: 1,
          dismisses_stale_reviews: true,
        },
      ],
    },
    orgs.newRepo('disuko') {
      has_wiki: false,
      auto_init: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          requires_pull_request: true,
          required_approving_review_count: 1,
          dismisses_stale_reviews: true,
        },
      ],
    },
    orgs.newRepo('.github') {
      has_wiki: false,
      auto_init: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          requires_pull_request: true,
          required_approving_review_count: 1,
          dismisses_stale_reviews: true,
        },
      ],
    },
  ],
}

# some comment
