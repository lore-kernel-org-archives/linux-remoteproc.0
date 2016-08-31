Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 00/19] remoteproc: Allow platform-specific drivers to request resources
Date: Wed, 31 Aug 2016 22:50:03 +0200
Message-ID: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
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

Lee Jones (6):
  remoteproc: core: New API to add new resources to the resource table
  remoteproc: core: Add function to dump resource table
  remoteproc: core: Add function to amend an existing resource table
    entry
  remoteproc: core: Add function to append a new resource table entry
  remoteproc: core: Add function to over-ride current resource table
  remoteproc: core: Support empty resource tables

Loic Pallardy (13):
  remoteproc: core: Add explicit message error if cached table failed
  remoteproc: Add new resource type for resource table spare bytes
  remoteproc: core: Associate action to resource request
  remoteproc: core: Finalize dump resource table function
  remoteproc: core: Add function to verify an existing resource in rsc
    table
  remoteproc: core: Add function to get resource table spare bytes
    information
  remoteproc: core: Add vdev support and force mode to resource amending
    function
  remoteproc: core: Append resource only if spare resource present
  remoteproc: core: Add resource request action support
  remoteproc: core: Add function to verify resource table consistency
  remoteproc: core: Clean-up resource table sanity checks
  remotecore: core: Add resource table pointer argument to
    rproc_handle_resource
  remoteproc: core: Add function to create remoteproc local resource
    table

 drivers/remoteproc/remoteproc_core.c | 683 ++++++++++++++++++++++++++++++++---
 include/linux/remoteproc.h           |  59 ++-
 2 files changed, 691 insertions(+), 51 deletions(-)

-- 
1.9.1
