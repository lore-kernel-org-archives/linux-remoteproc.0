Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3618C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C14C62077D
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7z6mupH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgFARvr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 13:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728076AbgFARvr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:51:47 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C48DC08C5C9
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:51:47 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 185so3832916pgb.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B6+pUeAejjtzVfaBN0FavjPBfNkLhu10xe20LReaYXA=;
        b=P7z6mupHizFgqgL7AXpjElLYchS8p4ojFpzVQL8VmARsn64VsmdOongaf+12Ia9uga
         33hW6V9eKYfBSMzd9KEn6T2yiq1k1HSU6iqFiRTdpJoaNf+bBWxBuQOugbrNyh35d6O0
         6K7IF8Gn79C6pckdbuKrauGBz2NWPL8xLxAJaCBonxKCvFLnE3SMevPawMcs5daGU5L6
         wbIm1oFCB9V4jCua9LEGOE1HLYqTOLGk4C9eif/E8R3cAmBoAZ9LE6pZmzvtRxK1Ndeo
         8S1pjzSGAMfmjn99d92ip/qB1qWrC+0Bb11oRaqPPFRvqSVvGnHW3Hm9WUabdDY/PmWe
         lhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B6+pUeAejjtzVfaBN0FavjPBfNkLhu10xe20LReaYXA=;
        b=fZpJA1zUXEEYlKDCuuiqg/YYzhCdU2f+AwvtCrIL2CqIOJAnoEsh4p0Jvx6BfRjzOc
         VwdrGby0bZF+09pJVuKxqjqZ8grNYRuqKEKfqLs0vdOLucG9XYi1mdLS7NlfUOHTTsnh
         0SKeDVnhk8eFbwSpkIxu63VqxauPvzMY4ELZMWloTwrULKEHM8LMq9vQ6bDs0/EWsRoP
         G2eijmUXwqsw6GDR6K3iuFfRkEgNwNhgxrKHvrHePsmCXmPItyZ/g0MQ8rbiOHnqQW9V
         GzVHfyZbn1Tlz5js5PP+Lk6zjp/nBpuEmq/lTLoxmW1hnwWXopR/QFbDEso1ul5Q3IdK
         IvJw==
X-Gm-Message-State: AOAM533p8LKenUVrUWRzD/cBgkBbCa+wKYlPBGQNSVR8SKGJLaxBqKCf
        nawWYR0hEWOysuGm+rJTZe99HndSvcc=
X-Google-Smtp-Source: ABdhPJw6ow2Vt30SZPXJYfXOQB2Gr70Ayo0LDI8dl3mtw6J1ZVM2PdDyfrBFrcmDDH/LyQ5n6Uj2Pw==
X-Received: by 2002:a63:3e46:: with SMTP id l67mr19818480pga.430.1591033906497;
        Mon, 01 Jun 2020 10:51:46 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k12sm58219pfg.177.2020.06.01.10.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:51:46 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com
Subject: [PATCH v4 5/9] remoteproc: Introducing function rproc_validate()
Date:   Mon,  1 Jun 2020 11:51:35 -0600
Message-Id: <20200601175139.22097-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175139.22097-1-mathieu.poirier@linaro.org>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a new function to assert the general health of the remote
processor before handing it to the remoteproc core.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c70fa0372d07..0be8343dd851 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2060,6 +2060,47 @@ struct rproc *rproc_get_by_phandle(phandle phandle)
 #endif
 EXPORT_SYMBOL(rproc_get_by_phandle);
 
+static int rproc_validate(struct rproc *rproc)
+{
+	/*
+	 * When adding a remote processor, the state of the device
+	 * can be offline or detached, nothing else.
+	 */
+	if (rproc->state != RPROC_OFFLINE &&
+	    rproc->state != RPROC_DETACHED)
+		goto inval;
+
+	if (rproc->state == RPROC_OFFLINE) {
+		/*
+		 * An offline processor without a start()
+		 * function makes no sense.
+		 */
+		if (!rproc->ops->start)
+			goto inval;
+	}
+
+	if (rproc->state == RPROC_DETACHED) {
+		/*
+		 * A remote processor in a detached state without an
+		 * attach() function makes not sense.
+		 */
+		if (!rproc->ops->attach)
+			goto inval;
+		/*
+		 * When attaching to a remote processor the device memory
+		 * is already available and as such there is no need to have a
+		 * cached table.
+		 */
+		if (rproc->cached_table)
+			goto inval;
+	}
+
+	return 0;
+
+inval:
+	return -EINVAL;
+}
+
 /**
  * rproc_add() - register a remote processor
  * @rproc: the remote processor handle to register
@@ -2089,6 +2130,10 @@ int rproc_add(struct rproc *rproc)
 	if (ret < 0)
 		return ret;
 
+	ret = rproc_validate(rproc);
+	if (ret < 0)
+		return ret;
+
 	dev_info(dev, "%s is available\n", rproc->name);
 
 	/* create debugfs entries */
-- 
2.20.1

