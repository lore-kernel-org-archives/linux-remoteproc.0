Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A952C4167B
	for <linux-remoteproc@archiver.kernel.org>; Sun, 20 Feb 2022 20:19:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244811AbiBTUUI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 20 Feb 2022 15:20:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244804AbiBTUUH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 20 Feb 2022 15:20:07 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8444B40B;
        Sun, 20 Feb 2022 12:19:45 -0800 (PST)
Received: from localhost.localdomain (ip-213-127-118-180.ip.prioritytelecom.net [213.127.118.180])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4094AC83E4;
        Sun, 20 Feb 2022 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1645388384; bh=51LuFVgIZkGLp0cvF1VJd4FoTZfux5ZUIeGevs1331Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Vqz6VL276LGq9hgiFdKFPONWDngg0SgxvXq0l1n+LORG+RR08fotHhn9lZNt7t5g7
         bGQosh6TV8qF7s2DJibmHVw8p9ht66CllPx6SZxZQMfnAbOdx54nF2eMQSh8Abrlw+
         eOg2n5fKsbHFYqsHFyHgM/8pDhnpPvQREV47TJMQ=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] rpmsg: smd: allow opening rpm_requests even if already opened
Date:   Sun, 20 Feb 2022 21:18:58 +0100
Message-Id: <20220220201909.445468-6-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220201909.445468-1-luca@z3ntu.xyz>
References: <20220220201909.445468-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On msm8953 the channel seems to be already opened when booting Linux but
we still need to open it for communication with regulators etc.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes in v2:
- rework original patch, don't drop condition completely but allow force
  opening rpm_requests channel

 drivers/rpmsg/qcom_smd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 540e027f08c4..887e21ca51f2 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1288,9 +1288,14 @@ static void qcom_channel_state_worker(struct work_struct *work)
 		if (channel->state != SMD_CHANNEL_CLOSED)
 			continue;
 
+		/*
+		 * Always open rpm_requests, even when already opened which is
+		 * required on some SoCs like msm8953.
+		 */
 		remote_state = GET_RX_CHANNEL_INFO(channel, state);
 		if (remote_state != SMD_CHANNEL_OPENING &&
-		    remote_state != SMD_CHANNEL_OPENED)
+		    remote_state != SMD_CHANNEL_OPENED &&
+		    strcmp(channel->name, "rpm_requests"))
 			continue;
 
 		if (channel->registered)
-- 
2.35.1

