Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 00/20] remoteproc: Allow platform-specific drivers to request resources
Date: Wed, 12 Oct 2016 18:00:18 +0200
Message-ID: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Once this patch-set has been applied; platform-specific remoteproc
drivers will be able to amend existing resource table entries,
provide new entries to be appended to an existing resource table
(if one already exists), start a new resource table (if one does
not already exist), and dump out resource table contents during
development/debugging.  It will also be possible to start remote
processors which do not require a resource table without being
forced to provide a fake one.

We're also taking the liberty to provide some simple fix-ups.

V2 is rebased on "auto-boot" series. It also includes following addons:
- associate an action to the resource request. This allows platform-specific
  driver to verify firmware resources, update or append resources in firmware
  resource table or create a local resource table.
- introduce spare resource to define room for resource table extension
- centralize resource table sanity checks.

V3 is rebased on remoteproc kernel 4.9 pull request. It integrates following
modifications:
- split patches per features
- fix Lee Jones's comments
- remove local resource management

Lee Jones (5):
  remoteproc: core: New API to add new resources to the resource table
  remoteproc: core: Add function to amend an existing resource table
    entry
  remoteproc: core: Add function to append a new resource table entry
  remoteproc: core: Add function to over-ride current resource table
  remoteproc: core: Support empty resource tables

Loic Pallardy (15):
  remoteproc: core: Add function to dump resource table
  remoteproc: core: Associate action to resource request
  remoteproc: core: Add RSC_VDEV support to rproc_request_resource
  remoteproc: core: Complete VDEV support in rproc_dump_resource_table
    function
  remoteproc: core: Unify rproc_dump_resource_table debug messages
  remoteproc: core: Call rproc_dump_resource_table only if debug is
    activated
  remoteproc: core: Correction carveout name comparison in
    rproc_update_resource_table_entry
  remoteproc: core: Add function to verify an existing resource in rsc
    table
  remoteproc: core: Add vdev support to resource amending function
  remoteproc: core: Add force mode to resource amending function
  remoteproc: core: Append resource only if .resource_table section is
    large enough
  remoteproc: core: Add resource request action support
  remoteproc: core: Add function to verify resource table consistency
  remoteproc: core: Clean-up resource table sanity checks
  remotecore: core: Add resource table pointer argument to
    rproc_handle_resource

 drivers/remoteproc/remoteproc_core.c | 575 ++++++++++++++++++++++++++++++++---
 include/linux/remoteproc.h           |  42 +++
 2 files changed, 569 insertions(+), 48 deletions(-)

-- 
1.9.1
