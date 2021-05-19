Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A862C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 May 2021 18:03:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 655B9611BF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 19 May 2021 18:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbhESSEf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 19 May 2021 14:04:35 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44162 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbhESSEf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 19 May 2021 14:04:35 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14JI38kt105931;
        Wed, 19 May 2021 13:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1621447388;
        bh=qEAoTagAYs24UhGH26uRmjZCwpHp+mDCczMSu52fcDc=;
        h=From:To:CC:Subject:Date;
        b=nA/V6DmGjr3QAfJDL1rU98ZojfUyss1nMHlRWgtPXpVilJ9ef0vGEdQhKlkzx09gp
         dzDmFLWNr7gzvR3WCTRu3CIUTjzOm/LlmCwj5Edgmp11wfYTyV9w5fym2lTCwbHpWB
         B4oIoIzHl/GoPDTKR40i5b7slfyDcD92IGj/Y2TQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14JI38LC053290
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 May 2021 13:03:08 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 19
 May 2021 13:03:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 19 May 2021 13:03:08 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14JI38LT091512;
        Wed, 19 May 2021 13:03:08 -0500
Received: from localhost ([10.250.32.40])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 14JI384r104523;
        Wed, 19 May 2021 13:03:08 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] Minor remoteproc cleanups
Date:   Wed, 19 May 2021 13:03:02 -0500
Message-ID: <20210519180304.23563-1-s-anna@ti.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn, Mathieu,

The following series is minor document related cleanups. Some
of the warnings look to be very old, and these are not functional
issues, so I am not expecting these to be -stable content, and so
I did not split or add any Fixes: tags.

Patch 1 fixes a warning when building remoteproc core files with W=1,
and Patch 2 fixes all the existing kernel-doc warnings.

Patches are on top of v5.13-rc1.

regards
Suman

Suman Anna (2):
  remoteproc: Add kernel-doc comment for is_iomem
  remoteproc: Fix various kernel-doc warnings

 drivers/remoteproc/remoteproc_core.c       | 45 +++++++++++++------
 drivers/remoteproc/remoteproc_elf_loader.c | 12 ++++--
 drivers/remoteproc/remoteproc_virtio.c     |  6 ++-
 include/linux/remoteproc.h                 | 50 ++++++++++++----------
 4 files changed, 70 insertions(+), 43 deletions(-)

-- 
2.30.1

