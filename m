Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82284C63798
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 06:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3449422258
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 06:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgKSGpS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 01:45:18 -0500
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:40468 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725888AbgKSGpS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 01:45:18 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.5215877|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0133038-6.33072e-05-0.986633;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047187;MF=fuyao@allwinnertech.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.IygQvnF_1605768303;
Received: from localhost.localdomain(mailfrom:fuyao@allwinnertech.com fp:SMTPD_---.IygQvnF_1605768303)
          by smtp.aliyun-inc.com(10.147.40.233);
          Thu, 19 Nov 2020 14:45:03 +0800
From:   fuyao@allwinnertech.com
To:     mripard@kernel.org, wens@csie.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     fuyao <fuyao@allwinnertech.com>
Subject: [PATCH 0/2] introduce sunxi hwspinlock
Date:   Thu, 19 Nov 2020 14:44:51 +0800
Message-Id: <cover.1605767679.git.fuyao@allwinnertech.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <y>
References: <y>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: fuyao <fuyao@allwinnertech.com>

this series add hwspinlock of sunxi. it provides hardware assistance for
synchronization between the multiple processors in the system.
(Or1k, Cortex-A7, Cortex-A53, Xtensa)

fuyao (2):
  dt-bindings: hwlock: add sunxi hwlock
  hwspinlock: add SUNXI implementation

 .../bindings/hwlock/sunxi,hwspinlock.yaml     |  46 ++++
 MAINTAINERS                                   |   6 +
 drivers/hwspinlock/Kconfig                    |  10 +
 drivers/hwspinlock/Makefile                   |   1 +
 drivers/hwspinlock/sunxi_hwspinlock.c         | 205 ++++++++++++++++++
 5 files changed, 268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/sunxi,hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/sunxi_hwspinlock.c

-- 
2.29.2

