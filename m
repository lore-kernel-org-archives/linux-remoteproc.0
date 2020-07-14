Return-Path: <SRS0=gNgS=AZ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AE5C433F2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 20:05:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F93721D80
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 20:05:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BIyPWwdn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730186AbgGNUFI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Jul 2020 16:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730122AbgGNUFB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 16:05:01 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0932FC061794
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 13:05:01 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id l6so943267plt.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 13:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QJEcAvXCkMubZ5CvQAwW4/233WmH+zu/CCD6+/Cfr60=;
        b=BIyPWwdnQqdLgzRx9cNGys4K4Pu3bhZEesGNSVDGZxDEXs2zbZQQZyhbbHp2epIS96
         J+nEoi/pULu61ZtxPYE3Bfjbka5SW/KZjZIoaA3Y+A/U57Rncged53Djhc3g2bXY6z3H
         +85B5dHbMWroWGxKepDR5lOKxzqOL6RdhTUTPoDSf+nDjkp+uiaB+nd1Iog/bnQsOaqd
         9n5JtYVde8Q6jaFb6CEwdHPRFaHg9v1l06V5Qhs9nPHo4Y1PjxI1jl0iVf8K6pgr/eOM
         FM5kIjQkmEbSCe2XJ5lfaGZhvPlk+0xUNhgTmz4ny67/zx5JSFx8+5ml4S+o9Eq6DRc+
         LOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QJEcAvXCkMubZ5CvQAwW4/233WmH+zu/CCD6+/Cfr60=;
        b=AYhmSYjGDh6Py+RsNRZrVr5Hl3UAlnncQKgDrWcf4/fheb5ZM+h+XkPNn7Or6cHvl/
         CZczSArMzvBnHJxFN1Va3IJTTX4oHU7H2nej1xnLB85Wj8wc8CZM9Si3UED2B/T13RX9
         41WXRgTUN7QsZUQeFJrA5O6+0/Q326g8gAocrqfuHxYMe9XsLHoWB094fabsqAn/mKfj
         50N30fMMnzGmRhduqhTbHPjK47HO3MWDOZizJi+8suQOSm0PEoo08YBY2LkRcvEcxaCi
         NPlqh4sMOHmOndFTgOdIXtRPFqRA/tdVYLUUK/TLo2nGaI/YKn0dWLB5v7sf4/kivoh5
         q9DA==
X-Gm-Message-State: AOAM531ElLgTqZKM1SZbZzAAABSWoxmww7eWb3FuvdT/5Mu0QXqFrn93
        uVweJP3V/Wqj07/uiDSU028JOQ==
X-Google-Smtp-Source: ABdhPJwaKsSwOg/f51cv/yU6D2+O0bNi34srVgzYHBWsLtjgqOy83hgxLW3gTKAwMRf8Q/DDyFSVvQ==
X-Received: by 2002:a17:90a:3684:: with SMTP id t4mr6142014pjb.91.1594757100594;
        Tue, 14 Jul 2020 13:05:00 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:05:00 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 10/11] remoteproc: stm32: Introduce new attach() operation
Date:   Tue, 14 Jul 2020 14:04:44 -0600
Message-Id: <20200714200445.1427257-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce new attach function to be used when attaching to a
remote processor.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 882229f3b1c9..7145cd49616e 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -460,6 +460,13 @@ static int stm32_rproc_start(struct rproc *rproc)
 	return stm32_rproc_set_hold_boot(rproc, true);
 }
 
+static int stm32_rproc_attach(struct rproc *rproc)
+{
+	stm32_rproc_add_coredump_trace(rproc);
+
+	return stm32_rproc_set_hold_boot(rproc, true);
+}
+
 static int stm32_rproc_stop(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
@@ -525,6 +532,7 @@ static void stm32_rproc_kick(struct rproc *rproc, int vqid)
 static struct rproc_ops st_rproc_ops = {
 	.start		= stm32_rproc_start,
 	.stop		= stm32_rproc_stop,
+	.attach		= stm32_rproc_attach,
 	.kick		= stm32_rproc_kick,
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
-- 
2.25.1

