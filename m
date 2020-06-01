Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0C9C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:52:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAD03206E2
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:52:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="koUUxIAJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgFARwG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 13:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbgFARvt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:51:49 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1261DC05BD43
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:51:49 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n9so260050plk.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HuK+8lYq2MurWahP0YDt+ZKf6I/9GaLpDEv4/D3a90U=;
        b=koUUxIAJB8sNAZ/BIgVmeJjrfw7ai/Y7R0/F0CDKaSTqluC4KHJERTw83l37owKl+u
         si/lOnIB8HfwzIwKrA6mx7oczePRijGsawk6uHFwdZMfExTe/TZktA75HEebMZq2gDHw
         wRZKNZYs9qxyuQ10Wv63hELl91OhPnSx95HrCMZ+Tcr2HFVLdjJZjO1WNY7m1D7NSxaM
         OFkO2i8aVsD6AnnQQGQ1AODa2PKcHJo9LWMRALOdj0+GWZ4MRqMP7TMsf3jOqkewVH5F
         4QFMCBQSCmTIy9sEUjxTzHqMBNKk9Vd7dORwFGUWDh4k9WjKeYTIS4EprHV7oToG0ceP
         B+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HuK+8lYq2MurWahP0YDt+ZKf6I/9GaLpDEv4/D3a90U=;
        b=C5JcoLe4sRyVerQw+7vRFbogUN9RHpKTVJMuOUHL84/P93qlwv+W2sPRc8M7y30NxW
         PTFEtzFEtHNZfOBgy0hgNJIzaNUO64wLGiFYC0/DwhDI3GbYu8p1u4wjNvtPt/Iw5Cy0
         47uSo7hbObX7LWHpsxyHfodNuNGyo50XS2cOgQP48eik7m7yXzAI0cWC1//pMHLqgssr
         VaiITQYsazawwcfNLmmX9JMJwUxnB43XIDiamxDXBW7xxGpjcrAYpO5vIKJAFRokfA1l
         weOUqCZu34VIHgKdfJXe5mHuXGb36SqJaoCVvW0UMZqpIL1FUzkKNFuxcwKrIZRX5Vbm
         v7kw==
X-Gm-Message-State: AOAM5306BGIX5g1kQTrzmmMoY98CYIWMbktPXjvvKkIMECZZ/psIcisu
        OjFARiN0l0HocP90ERgbSiMVDw==
X-Google-Smtp-Source: ABdhPJwX0c8InqxDLHSYUpgobxDg57wx0RGXH2kegjZmGSR+B8TSixZWGNT3dhCGZM+KwEyxDCJdWg==
X-Received: by 2002:a17:90a:d3d6:: with SMTP id d22mr585255pjw.184.1591033908665;
        Mon, 01 Jun 2020 10:51:48 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k12sm58219pfg.177.2020.06.01.10.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:51:48 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com
Subject: [PATCH v4 7/9] remoteproc: Refactor function rproc_trigger_auto_boot()
Date:   Mon,  1 Jun 2020 11:51:37 -0600
Message-Id: <20200601175139.22097-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175139.22097-1-mathieu.poirier@linaro.org>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_trigger_auto_boot() to properly deal
with scenarios where the remoteproc core needs to attach with a
remote processor that has already been booted by an external
entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 48ddc29814be..d32ac8f0c872 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1586,6 +1586,15 @@ static int rproc_trigger_auto_boot(struct rproc *rproc)
 {
 	int ret;
 
+	/*
+	 * Since the remote processor is in a detached state, it has already
+	 * been booted by another entity.  As such there is no point in waiting
+	 * for a firmware image to be loaded, we can simply initiate the process
+	 * of attaching to it immediately.
+	 */
+	if (rproc->state == RPROC_DETACHED)
+		return rproc_boot(rproc);
+
 	/*
 	 * We're initiating an asynchronous firmware loading, so we can
 	 * be built-in kernel code, without hanging the boot process.
-- 
2.20.1

