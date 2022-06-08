Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBEBC43334
	for <linux-remoteproc@archiver.kernel.org>; Wed,  8 Jun 2022 17:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiFHRWz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 8 Jun 2022 13:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiFHRWe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 8 Jun 2022 13:22:34 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC8E24A682
        for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jun 2022 10:14:22 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id u18so18206693plb.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jun 2022 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=egiLLKGdpV2llxCKr0nnUtNRcHSTkDD/C9StjqhJwTA=;
        b=k1sfvISH2Sdwc1FIPhi3BB/QRohqYKpauU1UWP0WMUSa2pVAd2t/OWq8UizdfKJ1Gs
         0cEF2PM+PZEo4VgS7QP1/IfcIgk37/IS6d/g2aBxi6nz6zcDHOmE4AbzYBxv6TO7+6Gs
         dVdZDMAuSjNREJGGvzoIeG30ETbSwWUMdn/yr0lE88yCP7ur3M0Y1jO9eqA3rxjE8blQ
         wuX5g+Z0l3X+Ee3pkCLb1twGLH9iBL4LQSA2zQTimczmbnNVXNkjYorwyapf78W/3yUc
         72c154e3w8K1kNFavpAJlAVOw4EyDrma+OX0pYxYDpYhVqPsb/zTYi5BdfdRDHxSTb3N
         834A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=egiLLKGdpV2llxCKr0nnUtNRcHSTkDD/C9StjqhJwTA=;
        b=AHHOH07GUqUkR4R7D4oA2ayUc452r+DezyCKxbsLGWzXuraPza98weQ6GSaja+VrIp
         1fC6WMPxgCL5UPk1HkX20vIIFFq+Lp3kmAkapZRHP1bNIJVS7NypxVcSVUnzjNR/hpxz
         l8fTqX/yZrp9DVDYhSUzaFKx/MtOlo0WxRaLRBYYEZ9+owllgmk+MGMa/P8IthMYveXv
         oiHa79dEoLYr9TR/S34FWQ0i03kpWtpt7BTuiQlSZQ++bknsqDqDmWWR/ny8TMHGIGFe
         l7bV6IGSy/HXAVMOU/8UQvHlSr3BHIKAdTPCZk/+mQ6t+/+XtkVetVDrJcv/q6YX8sz3
         hxzg==
X-Gm-Message-State: AOAM531USHq9ZtqpzTRAnEVkOHHkK5NxoSIlhWOcU8E+PVK3KXgw0s9E
        S4cLXYdkU2AM5PtltEE+bZx0ng==
X-Google-Smtp-Source: ABdhPJwnSXhqanUExGjOjaslzLH28gNyihKxRKbOKvlSQ5G9Fh+O5F4WK51Ziid1m7cnlKuvugoFEQ==
X-Received: by 2002:a17:902:ec84:b0:167:6f74:ba76 with SMTP id x4-20020a170902ec8400b001676f74ba76mr20402231plg.17.1654708461912;
        Wed, 08 Jun 2022 10:14:21 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.162.103.97])
        by smtp.gmail.com with ESMTPSA id t7-20020a17090a4e4700b001df4b919937sm16803986pjl.16.2022.06.08.10.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 10:14:21 -0700 (PDT)
From:   Anup Patel <apatel@ventanamicro.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Atish Patra <atishp@atishpatra.org>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Anup Patel <anup@brainfault.org>,
        linux-remoteproc@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
Date:   Wed,  8 Jun 2022 22:43:34 +0530
Message-Id: <20220608171334.730739-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
fails due to both virtqueues (Rx and Tx) marked as broken by the
__vring_new_virtqueue() function. To solve this, virtio_device_ready()
(which unbreaks queues) should be called before virtqueue_add_inbuf().

Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 905ac7910c98..71a64d2c7644 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	/* and half is dedicated for TX */
 	vrp->sbufs = bufs_va + total_buf_space / 2;
 
+	/* From this point on, we can notify and get callbacks. */
+	virtio_device_ready(vdev);
+
 	/* set up the receive buffers */
 	for (i = 0; i < vrp->num_bufs / 2; i++) {
 		struct scatterlist sg;
@@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	 */
 	notify = virtqueue_kick_prepare(vrp->rvq);
 
-	/* From this point on, we can notify and get callbacks. */
-	virtio_device_ready(vdev);
-
 	/* tell the remote processor it can start sending messages */
 	/*
 	 * this might be concurrent with callbacks, but we are only
-- 
2.34.1

