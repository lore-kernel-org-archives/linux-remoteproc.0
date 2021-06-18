Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F835C49361
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Jun 2021 11:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 663A661248
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Jun 2021 11:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhFRLTN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Jun 2021 07:19:13 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:30850 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhFRLTM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Jun 2021 07:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1624015020;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=rhvzPUoy1gNqmrZDxuhO9+sLG2FzGsSTlo5eQseu4XU=;
    b=aGlWZ80ciSgP0U4W+gVDepGpCW/NdaB02HExmTVVfODaVE9RrqNNh2dUFzEM+IE1sK
    j6xNSfEigFzVAkQPfqClBQ7aqiKyhwTQqJO3qQf3DbBJ+2hRbsuQkfQg4VFih3XWWr3u
    7ctF7DEhoAS+bdf+/TL8qqout7IQtj+ic4KUtLwsHt3SnXaA2tJue1NmpbMixUv4+6QH
    WRVx57v3CIurhm2uQsmFzXqt7sDuKHaoAFN2qXFgyUurtz1V+HKQHAvdzrH/DPqv3rTE
    c0886o+6LK0N/xSdKMuAr6anTiGnuDix4x6W3x6Or/9Tzsk3AQ+PkaNX4hp/kM1bBSXq
    IobA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxA626EOg=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.27.3 DYNA|AUTH)
    with ESMTPSA id 000885x5IBH05MO
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 18 Jun 2021 13:17:00 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/3] remoteproc: qcom_q6v5: Use devm_qcom_smem_state_get() to fix missing put()
Date:   Fri, 18 Jun 2021 13:15:55 +0200
Message-Id: <20210618111556.53416-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210618111556.53416-1-stephan@gerhold.net>
References: <20210618111556.53416-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

qcom_q6v5 is requesting a smem state with qcom_smem_state_get() but
qcom_smem_state_put() is not called anywhere. Use the new devm_()
variant to fix this without making the code more complicated.

Fixes: 051fb70fd4ea ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/remoteproc/qcom_q6v5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 9627a950928e..7e9244c748da 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -280,7 +280,7 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 		return ret;
 	}
 
-	q6v5->state = qcom_smem_state_get(&pdev->dev, "stop", &q6v5->stop_bit);
+	q6v5->state = devm_qcom_smem_state_get(&pdev->dev, "stop", &q6v5->stop_bit);
 	if (IS_ERR(q6v5->state)) {
 		dev_err(&pdev->dev, "failed to acquire stop state\n");
 		return PTR_ERR(q6v5->state);
-- 
2.32.0

