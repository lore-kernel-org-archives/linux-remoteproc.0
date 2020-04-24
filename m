Return-Path: <SRS0=nfGK=6I=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A0AC54FD0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C22A0214AF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOtPZXyi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbgDXUZN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Apr 2020 16:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729431AbgDXUZL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:25:11 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B36C09B048
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:10 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g6so5146643pgs.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DgEz+wJcufUUG+teXaGNehTQCeHAZ7uJeYQ2NWLbdjg=;
        b=NOtPZXyitW1le/NvzqyO9UJvTrYAYkLFNPC5AwNo3bL0PVXogbJCl6/dVM5KWMZs36
         AQJbWdPGjvUpntXrlRaguNzGZ8aLKe/4sxDm7VniYpZJ/cLHiFA8QO6i8gFG4nSzxnQn
         VyorVL5RRNnxMxGrG95VDkNeBgfsZ4hHEl+hKZdj489+2Nk+xbfIM71/U/QYVsh3ptkX
         cn7fU4XIsj8mcTPghu1b+GGHpri9b9ix4FSMu7pekIoOLzjpb4TYkNH3JLjh4scZhuIn
         nCz0IA5ZlFaiE5dKld6FqcyTd8y55n2ve0uyvwzkx5oQYzDyASHLvE5jsofE7Rh/NCv/
         C5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DgEz+wJcufUUG+teXaGNehTQCeHAZ7uJeYQ2NWLbdjg=;
        b=g257hbDHIIRSpgGSdl2CpvOsDfkZl1RXujtG1CTEWbG0ocPxdQ+znhsSrDpexsdhw0
         Znnu+aQ4cSNaPFamc3WSnOwYNceMRkBmK4qHezDFVD9qJe1Jw0eMcfdnL3O6FiywWQYQ
         v12nR2cNnAw1y86HMXcbqXr3QIu5pbf2NXzjIzvgbMWcCEoSPj1lTLzDlSDF/ucDW7iX
         ljaRgnebTKfjC5WASYsIveqenqetOlWMWIIz4QMTa+53uc4DenPSbUKGFIffgm0Vh8up
         g1/EP5Jjx3pdS2K4NEGUCk6hD4EzGO7ebOv1vcvr2snAdFhhifv8hbM6ML59WtOMcpLp
         YhFw==
X-Gm-Message-State: AGi0PuZi8BTebwI+Hpwp8DEOVylqVyjiWWXkCDeDAXEIPCE2K3yZ127h
        orTGe9KNjishY9hUFyBbTDIdOw==
X-Google-Smtp-Source: APiQypJ1+f1MKeuUHrNcy2uquiy/RcZuGW6+iD8YyVNAH1nrYXeD8ZJsVVn/D5TeIgUXYDhFWGo24w==
X-Received: by 2002:a63:40f:: with SMTP id 15mr10958456pge.57.1587759909609;
        Fri, 24 Apr 2020 13:25:09 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:25:09 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/12] remoteproc: stm32: Request IRQ with platform device
Date:   Fri, 24 Apr 2020 14:24:55 -0600
Message-Id: <20200424202505.29562-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
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
---
 drivers/remoteproc/stm32_rproc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 91fd59af0ffe..1ac90adba9b1 100644
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

