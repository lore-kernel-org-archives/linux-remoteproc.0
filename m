Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF95C433DB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 17:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C080422C9C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jan 2021 17:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406618AbhARRBw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jan 2021 12:01:52 -0500
Received: from mga09.intel.com ([134.134.136.24]:12962 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406841AbhARRBK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jan 2021 12:01:10 -0500
IronPort-SDR: DYjaTLejSPec1iAzQdpCwmPz+iFxVHBiwmQfeQdEdJ4RX/6YbksV/g5CDGGd0bCfBDTPvTySZS
 7FIOcwqycIpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="178975870"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="178975870"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 08:59:24 -0800
IronPort-SDR: CXSFdV4Q9bDGj2Jln8b4N+biemLRmF5qGrgzmZbwNVKMJZiXwAcdKvegvSw0pxNyRblQokgvE0
 28Bl3Ydk5+wQ==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="383626886"
Received: from asmit6-mobl4.ger.corp.intel.com (HELO dalessan-mobl1.ir.intel.com) ([10.252.7.221])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 08:59:22 -0800
From:   Daniele Alessandrelli <daniele.alessandrelli@linux.intel.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH] remoteproc: core: Fix rproc->firmware free in rproc_set_firmware()
Date:   Mon, 18 Jan 2021 16:59:04 +0000
Message-Id: <20210118165904.719999-1-daniele.alessandrelli@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Daniele Alessandrelli <daniele.alessandrelli@intel.com>

rproc_alloc_firmware() (called by rproc_alloc()) can allocate
rproc->firmware using kstrdup_const() and therefore should be freed
using kfree_const(); however, rproc_set_firmware() frees it using the
simple kfree(). This causes a kernel oops if a constant string is passed
to rproc_alloc() and rproc_set_firmware() is subsequently called.

Fix the above issue by using kfree_const() to free rproc->firmware in
rproc_set_firmware().

Signed-off-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 2394eef383e3..ab150765d124 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1988,7 +1988,7 @@ int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
 		goto out;
 	}
 
-	kfree(rproc->firmware);
+	kfree_const(rproc->firmware);
 	rproc->firmware = p;
 
 out:

base-commit: 8cc8eeffd058f3e7e2d8710a514ffcbc2bd69d28
-- 
2.26.2

