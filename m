Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1715FC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEA5C2073B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:52:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lg+3hcJ4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgFARwV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 13:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbgFARvp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:51:45 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E32C08C5C9
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:51:44 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k2so146628pjs.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FItOKgdj0uldhq4ThGfwK1TNrUS2A/jMnQRmSCeHCgM=;
        b=lg+3hcJ4uWV77YK1218h714AN6E1Y48qGMiFQ6RgI3YGMxx4yf+DSbsdjFIU6DI4VB
         v2uks0KMjYfjzc+VGgdeGxpwmNX9fbhjtG9jG5nUzbfYx6BO5uHZtMxpT9JgBEvYf0Yd
         zbOgym5mr+oJMp7CFoj8jTWHWJfbavzYE3HjDvsorp5GVn5UXh7tx6+pRHxB5/rhGT+3
         8uVl5Yl8xjf+s518G/KLq5Gvmbf5NUDn3wcERtZLIzDCkzTpMPFI4qwAkdpCTpNTpEmk
         KQpZeGsEjcBAL8I5qmGUzKSn2wYhdkcVN9allh6etYaUUM62K0v1e1bQUdUfCa+QxpcL
         O4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FItOKgdj0uldhq4ThGfwK1TNrUS2A/jMnQRmSCeHCgM=;
        b=Uq9lwKK4CZyg+u0dA7YUen45nhCKz8VLdo5QJWwLogvcecm1d9a5MZgvvbQUxOv+EL
         /ApiQmaqTNn7VTbR18gI0tOQRT6SzSb0jXLD19vVgP8orVgWPFrhe1oT/lASh0VS+Sjk
         kQF6ldJM9Px20lueZNQ+/deimRICaIk5m20lXOfpymZZmIh/Rjjlb1Ku8qyKx4ABNoSr
         fjc8gKzOyWQaTCK49vUkoZLDc7ZYsca9PiwBbF80dQ28fyu2b69LTNe79aKv+un09LzT
         xxKyk1AUOSbq+ZWBu/tHsIk4znoHC8luZzV0Y6qwTyBeXQ93ayZbSrx5dwNbqTSS0ctF
         9Kkg==
X-Gm-Message-State: AOAM530T/ox0BwGNGViHo7fY0kly8CttpHOQbAbsbitfAPJ8e1sq1Qt4
        i2jZutmPo/jTAybRVKPxmv1LSyeXXJ0=
X-Google-Smtp-Source: ABdhPJytXJC13MoeIXNHI+CzrFwM69Q2/+HS7YEgvViTh3vSIhNXtLzF9YHtK5en9do1wF3fsWE31Q==
X-Received: by 2002:a17:902:b484:: with SMTP id y4mr21539701plr.21.1591033904237;
        Mon, 01 Jun 2020 10:51:44 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k12sm58219pfg.177.2020.06.01.10.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:51:43 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com
Subject: [PATCH v4 3/9] remoteproc: Introducing function rproc_attach()
Date:   Mon,  1 Jun 2020 11:51:33 -0600
Message-Id: <20200601175139.22097-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175139.22097-1-mathieu.poirier@linaro.org>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introducing function rproc_attach() to enact the same actions as
rproc_start(), but without the steps related to the handling of
a firmware image.  That way we can properly deal with scenarios
where the remoteproc core needs to attach with a remote processsor
that has been booted by another entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9f04c30c4aaf..0b323f6b554b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1370,6 +1370,48 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static int __maybe_unused rproc_attach(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	ret = rproc_prepare_subdevices(rproc);
+	if (ret) {
+		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
+			rproc->name, ret);
+		goto out;
+	}
+
+	/* Attach to the remote processor */
+	ret = rproc_attach_device(rproc);
+	if (ret) {
+		dev_err(dev, "can't attach to rproc %s: %d\n",
+			rproc->name, ret);
+		goto unprepare_subdevices;
+	}
+
+	/* Start any subdevices for the remote processor */
+	ret = rproc_start_subdevices(rproc);
+	if (ret) {
+		dev_err(dev, "failed to probe subdevices for %s: %d\n",
+			rproc->name, ret);
+		goto stop_rproc;
+	}
+
+	rproc->state = RPROC_RUNNING;
+
+	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
+
+	return 0;
+
+stop_rproc:
+	rproc->ops->stop(rproc);
+unprepare_subdevices:
+	rproc_unprepare_subdevices(rproc);
+out:
+	return ret;
+}
+
 /*
  * take a firmware and boot a remote processor with it.
  */
-- 
2.20.1

