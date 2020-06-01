Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E98C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 19:01:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5599207DA
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 19:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dkI7qDJy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbgFARz7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 13:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbgFARz6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:55:58 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F998C08C5C0
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:55:57 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o6so3851942pgh.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ly/+lULxncE0Hv/XKPdsdbKvQX3A5UmakKCmLALYjq0=;
        b=dkI7qDJyx89vpnpMR9RvXRcPeeBf1zFWx/8GgGMnZHyTtL5pipzTvNVHo3FGncZVYp
         Q7Y9OGgwFDlGDkHj7dXap5cwa0mPWzPieIeTTIoUzGl+fW7h3aF95HXddQjs0fsROJrA
         P528DEuQDIA7QACQVabOPNA0v632XS/lQMgR4b1qXKrkSqaKCYcMKk5J05O3srOpFIXY
         dUrHzjzEx2EkUO7RCMrWu181kDtXBfkA0iO0u59DOUweyH/+HKER5DQSaT4lrzGdRhMa
         gyt9sn5ZugY43f4OnB3ZlAL/eKeILEk7u/Tb+l7MBh0tkjdiYM99wXTLXsnK0qC4sIJM
         qzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ly/+lULxncE0Hv/XKPdsdbKvQX3A5UmakKCmLALYjq0=;
        b=FJ206HC8VrEyiHvHEjNEajGJnx+kFzkaIJvJOgINhLqeH4g5IFCY3qjW1wqfUEam9r
         iokkTWJlq7AUXctii9FxyWRgwVPuGECZNsJTIt7dYf57p8gIMRkh6Yf1zNfkIoDIjP+S
         cQkEeuFRWw9WRRnic1OtiSOi+mz7yvnBdCbkGP2tYiFexMJsID3bNCZ8ZYn5yvPZs+5e
         XE754HalUtQHjemZPL0eKoBkhTbAxkznyqqqe5d7kts4+1mq21Ma03z0tiN+S1kplMAj
         GvSFmTDMidjdZby/7lOIW3bJuzT1HeAlYkK+K1qa2IrQM8/GLMMf0wNDgL6mgiphWwW5
         Ww4A==
X-Gm-Message-State: AOAM532fSDN6d6YqNIeC4tIvoYQbf0P9FjZNO7qHcvCn3ZgccDMX1Y+Y
        C/r2TeGy0dLUXmDclATq2PktNQ==
X-Google-Smtp-Source: ABdhPJyfHXNxc1V3Yc+P6I77d41jXD45DyYRGH8UfzswQ1/Fjb0Q/j2fYXA57kZwWD2pF4ngIEehYg==
X-Received: by 2002:a05:6a00:148c:: with SMTP id v12mr21200684pfu.171.1591034156896;
        Mon, 01 Jun 2020 10:55:56 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:55:56 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 02/11] remoteproc: stm32: Request IRQ with platform device
Date:   Mon,  1 Jun 2020 11:55:43 -0600
Message-Id: <20200601175552.22286-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Request IRQ with platform device rather than remote proc in order to
call stm32_rproc_parse_dt() before rproc_alloc().  That way we can
know whether we need to synchronise with the MCU or not.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a80733fb08e7..94fd687fb5b2 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -261,7 +261,8 @@ static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
-	struct rproc *rproc = data;
+	struct platform_device *pdev = data;
+	struct rproc *rproc = platform_get_drvdata(pdev);
 
 	rproc_report_crash(rproc, RPROC_WATCHDOG);
 
@@ -553,7 +554,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	if (irq > 0) {
 		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
-				       dev_name(dev), rproc);
+				       dev_name(dev), pdev);
 		if (err) {
 			dev_err(dev, "failed to request wdg irq\n");
 			return err;
-- 
2.20.1

