Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:58930
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726417AbfKVKFF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Nov 2019 05:05:05 -0500
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH V5 0/5] Add chrdev and name query support for GLINK
Date: Fri, 22 Nov 2019 10:05:04 +0000
Message-ID: <0101016e92927c3a-ca9dda3b-35da-4104-bf52-d2839f18b8d5-000000@us-west-2.amazonses.com>
Sender: linux-remoteproc-owner@vger.kernel.org
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add support for the GLINK rpmsg transport to register a rpmsg chrdev.
This will create the rpmsg_ctrl nodes for userspace clients to open 
rpmsg epts. The rpmsg chrdev allocation is done by allocating a local
channel which also allocates an ept. We need to add some guards against
edge cases for this chrdev because it will never fully open.

Changes since v4:
- Resending by removing approved patches

Changes since v3:
- Change to device_add_group for rpmsg name attr
- Add patch to unregister the rpmsg device
- Add patch to support compat ioctl for rpmsg char driver

Changes since v2:
- Revert change to make glink attribute table const

Changes since v1:
- Add explanation to dt-bindings commit message
- Add patch complete_all the open_req/ack variables
- Add patch to prevent null pointer dereference in chrdev channel release
- Change chrdev allocation to use glink channel allocation
- Change glink attr struct to const


Arun Kumar Neelakantam (1):
  rpmsg: glink: unregister rpmsg device during endpoint destroy

Chris Lew (4):
  rpmsg: glink: Use complete_all for open states
  rpmsg: Guard against null endpoint ops in destroy
  rpmsg: glink: Add support for rpmsg glink chrdev
  rpmsg: glink: Expose rpmsg name attr for glink

 drivers/rpmsg/qcom_glink_native.c | 79 +++++++++++++++++++++++++++++++++++++--
 drivers/rpmsg/rpmsg_core.c        |  2 +-
 2 files changed, 77 insertions(+), 4 deletions(-)

-- 
1.9.1
