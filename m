Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A583C64E7C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3D3020715
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 21:37:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="icUFKKqd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgKRVhW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 16:37:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727196AbgKRVhJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 16:37:09 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19A8C061A51
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:08 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t21so2206163pgl.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2020 13:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zy3k3QU006yaoOz1NXa213YD9ZVtkyTeVCamwFEkkEQ=;
        b=icUFKKqdT3O3MfaZT1wGzWn5QA732yvQHomUfU0K7xdkzUdogA+4S5L9cfQ07uzZhZ
         AZp2HNmeoiburbu5jDmc2c/PuxYRvv6sotaKfm79q6Enp6JzlfICvlqbMFg3PGYRHhfy
         T4/bBSvpPrAOnS5tmioFZdtqW1Di85b5TU9NXVfYN6opIgyCIy7GzmZXyjXAarYOBTAR
         TqIILJHxA+ck+RwZ5ikeMJwX20mym39vRwedgoOLCC/KVxBFK+1DojWmo0dFoS3k4ocb
         dZ7M+1Bfl3Y4yr/YBRf61uxymYjuxew+M70kBhBo1DaR4/ts0UChdg//zfhcYFCZgv63
         alCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zy3k3QU006yaoOz1NXa213YD9ZVtkyTeVCamwFEkkEQ=;
        b=gUicgWVjG5gu+54G6pDC3jMxa+LvUz5JjnqGbfgSOanJxFFxkuZQWA+PcBrjX/HFdK
         mmdMof/emuoANPrzB2zuqmi/sRDrkBcEFbtqG6aFpW6CGX0Xkp4VFEzrywKg8jKsUinU
         JpBaJrrPqNvrBu7WJ5Yh4v8jgAF/b81gbqjZ8g0nealqPKoslWci3ORyiAM6flIIMAth
         uqwCjFC3awenGxAuYRg41JYHjJn13RwxUih/NRNJKCQzfxPTw7+pf5GiDZA2tlFFc4q8
         ZTCn/KFvjl1t1T+BTDFWaeX3iNjUaTNCYrAbjGZVUjtfiuzf9uQO/a3cWD/3tUCQcAqc
         Gpjw==
X-Gm-Message-State: AOAM530VNG8EcWhLK/7X+EcHPZYM2FbjC198ba13FeY0VaVunPu34ZnO
        mk6G9OotfBis6lzISU2P0DWWZg==
X-Google-Smtp-Source: ABdhPJxRW8Jrq4birgvuXpqlj5KN69JKSfYJk+5WtworHWJCvIaFslvj2wHgFA+NHNM7N8f+Lm7eEQ==
X-Received: by 2002:a65:688b:: with SMTP id e11mr9768874pgt.175.1605735428544;
        Wed, 18 Nov 2020 13:37:08 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e6sm26575694pfn.190.2020.11.18.13.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 13:37:08 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     guennadi.liakhovetski@linux.intel.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/8] rpmsg: virtio: Add rpmsg channel device ops
Date:   Wed, 18 Nov 2020 14:36:58 -0700
Message-Id: <20201118213700.74106-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118213700.74106-1-mathieu.poirier@linaro.org>
References: <20201118213700.74106-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Implement the create and release of the RPMsg channel
for the RPMsg virtio bus.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 2253936593c5..6ec299f7f790 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -151,6 +151,8 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
 				  int len, u32 dst);
 static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
 					   u32 dst, void *data, int len);
+static struct rpmsg_device *__rpmsg_create_channel(struct virtproc_info *vrp,
+						   struct rpmsg_channel_info *chinfo);
 
 static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
 	.destroy_ept = virtio_rpmsg_destroy_ept,
@@ -255,6 +257,24 @@ static struct rpmsg_endpoint *__rpmsg_create_ept(struct virtproc_info *vrp,
 	return NULL;
 }
 
+static struct rpmsg_device *virtio_rpmsg_create_channel(struct rpmsg_device *rpdev,
+							struct rpmsg_channel_info *chinfo)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return __rpmsg_create_channel(vrp, chinfo);
+}
+
+static int virtio_rpmsg_release_channel(struct rpmsg_device *rpdev,
+					struct rpmsg_channel_info *chinfo)
+{
+	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
+	struct virtproc_info *vrp = vch->vrp;
+
+	return rpmsg_unregister_device(&vrp->vdev->dev, chinfo);
+}
+
 static struct rpmsg_endpoint *virtio_rpmsg_create_ept(struct rpmsg_device *rpdev,
 						      rpmsg_rx_cb_t cb,
 						      void *priv,
@@ -347,6 +367,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 }
 
 static const struct rpmsg_device_ops virtio_rpmsg_ops = {
+	.create_channel = virtio_rpmsg_create_channel,
+	.release_channel = virtio_rpmsg_release_channel,
 	.create_ept = virtio_rpmsg_create_ept,
 	.announce_create = virtio_rpmsg_announce_create,
 	.announce_destroy = virtio_rpmsg_announce_destroy,
-- 
2.25.1

