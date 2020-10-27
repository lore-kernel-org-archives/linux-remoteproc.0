Return-Path: <SRS0=NYIK=EC=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEACCC55178
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:52:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8151D2076D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 17:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySnEVeU9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1822827AbgJ0Rwz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Oct 2020 13:52:55 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35017 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1822769AbgJ0Rw1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:52:27 -0400
Received: by mail-pf1-f194.google.com with SMTP id b3so1358732pfo.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2020 10:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dV45urz8CEkil+8k/x+LWNSg/bkz6TIq0p5IEVSCoA0=;
        b=ySnEVeU9jWeTb0qiecTxIE+ABKsLlD1d4Cemwq17LC264SVdVApeXPBoN/wKIBTrKK
         R8IcREor0bMosp53Ls1CGAlHZVQnJidYjycMx1wcUxOexQaKCpsMOy3PTMubpGxy+Kcr
         ClDA56SZs/W+In5LkLtQFr+1a2VHzsmij7jrA3BXeWFNV+bHzuWxFDdUpVmTK5vGhpHN
         qwJjkcsum7U2BAEaSwLztyx95QqMZ/HyXRv1BQSjGfZ6imvCF/0I/sv0SkBqD+POIFsO
         0WrU/O+j8U9Odzvg9ZvNtilBR1AWS0q9WJRjZd4NNuqrgr3vAUrleyhOA8GtSIpQHTGl
         ZCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dV45urz8CEkil+8k/x+LWNSg/bkz6TIq0p5IEVSCoA0=;
        b=V82u5h7S4z7rUjvuhz7EXkz51Q6dRNKjF7F9BOQDNroljF0Q3xSXKYUwdforllBz/E
         XWlCS6OTWaHTtVp/T1UfRqvBN+T6/uMrqVZ/0a9uMFKObG1dXjnez4pRkxEHfGNTU+eK
         KBDDEzadkGFF6yJbZxSFHSzJZPAf3D9IBAqJl9DNqcDmLyGzD8+N2ROMSMu1YHA2xLjc
         nfN/a/ZWRo9CWe61Y6LO5PwsS6ksprs30+Mg17wZvUf7ig2tIXIz7IwHq5lIOv3r17Xz
         X59oKMWJVF6HGosxiy6p2GN0k3KKGAByDaDIhp/J3xKZQfbondW7kQlqkY0lBgR6pEfR
         sfPQ==
X-Gm-Message-State: AOAM530+a5RPeuML00IdVAfWr0nxReFaYnookd+Ffj5VJo/X1XWiKLhT
        sNQgQU/+ScL7Pgj6CwFJvpo+Dg==
X-Google-Smtp-Source: ABdhPJxyXDNprNmTkanMO0scohW4O656dD1a2h0+KFfGY4U6rW1J7gTwUmogL8k5Sy9AUmzatN/00w==
X-Received: by 2002:a63:e642:: with SMTP id p2mr2882647pgj.79.1603821146803;
        Tue, 27 Oct 2020 10:52:26 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r8sm2761225pgl.57.2020.10.27.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 10:52:26 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/8] rpmsg: core: Add channel creation internal API
Date:   Tue, 27 Oct 2020 11:52:15 -0600
Message-Id: <20201027175218.1033609-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
References: <20201027175218.1033609-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Add the channel creation API as a first step to be able to define the
name service announcement as a rpmsg driver independent from the RPMsg
virtio bus.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/rpmsg_core.c     | 44 ++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h | 10 ++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 91de940896e3..6381c1e00741 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -20,6 +20,50 @@
 
 #include "rpmsg_internal.h"
 
+/**
+ * rpmsg_create_channel() - create a new rpmsg channel
+ * using its name and address info.
+ * @rpdev: rpmsg device
+ * @chinfo: channel_info to bind
+ *
+ * Returns a pointer to the new rpmsg device on success, or NULL on error.
+ */
+struct rpmsg_device * rpmsg_create_channel(struct rpmsg_device *rpdev,
+					   struct rpmsg_channel_info *chinfo)
+{
+	if (WARN_ON(!rpdev))
+		return NULL;
+	if (!rpdev->ops || !rpdev->ops->create_channel) {
+		dev_err(&rpdev->dev, "no create_channel ops found\n");
+		return NULL;
+	}
+
+	return rpdev->ops->create_channel(rpdev, chinfo);
+}
+EXPORT_SYMBOL(rpmsg_create_channel);
+
+/**
+ * rpmsg_release_channel() - release a rpmsg channel
+ * using its name and address info.
+ * @rpdev: rpmsg device
+ * @chinfo: channel_info to bind
+ *
+ * Returns 0 on success or an appropriate error value.
+ */
+int rpmsg_release_channel(struct rpmsg_device *rpdev,
+			  struct rpmsg_channel_info *chinfo)
+{
+	if (WARN_ON(!rpdev))
+		return -EINVAL;
+	if (!rpdev->ops || !rpdev->ops->release_channel) {
+		dev_err(&rpdev->dev, "no release_channel ops found\n");
+		return -ENXIO;
+	}
+
+	return rpdev->ops->release_channel(rpdev, chinfo);
+}
+EXPORT_SYMBOL(rpmsg_release_channel);
+
 /**
  * rpmsg_create_ept() - create a new rpmsg_endpoint
  * @rpdev: rpmsg channel device
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 3fc83cd50e98..810dd95cc9bd 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -20,6 +20,8 @@
 
 /**
  * struct rpmsg_device_ops - indirection table for the rpmsg_device operations
+ * @create_channel:	create backend-specific channel, optional
+ * @release_channel:	release backend-specific channel, optional
  * @create_ept:		create backend-specific endpoint, required
  * @announce_create:	announce presence of new channel, optional
  * @announce_destroy:	announce destruction of channel, optional
@@ -29,6 +31,10 @@
  * advertise new channels implicitly by creating the endpoints.
  */
 struct rpmsg_device_ops {
+	struct rpmsg_device *(*create_channel)(struct rpmsg_device *rpdev,
+					       struct rpmsg_channel_info *chinfo);
+	int (*release_channel)(struct rpmsg_device *rpdev,
+			       struct rpmsg_channel_info *chinfo);
 	struct rpmsg_endpoint *(*create_ept)(struct rpmsg_device *rpdev,
 					    rpmsg_rx_cb_t cb, void *priv,
 					    struct rpmsg_channel_info chinfo);
@@ -75,6 +81,10 @@ int rpmsg_unregister_device(struct device *parent,
 struct device *rpmsg_find_device(struct device *parent,
 				 struct rpmsg_channel_info *chinfo);
 
+struct rpmsg_device * rpmsg_create_channel(struct rpmsg_device *rpdev,
+					   struct rpmsg_channel_info *chinfo);
+int rpmsg_release_channel(struct rpmsg_device *rpdev,
+			  struct rpmsg_channel_info *chinfo);
 /**
  * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
  * @rpdev:	prepared rpdev to be used for creating endpoints
-- 
2.25.1

