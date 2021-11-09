Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BEEC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Nov 2021 08:31:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B2F3611C1
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Nov 2021 08:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244079AbhKIIdw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244073AbhKIIdv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Nov 2021 03:33:51 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B87C061766;
        Tue,  9 Nov 2021 00:31:05 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id d24so31574470wra.0;
        Tue, 09 Nov 2021 00:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s0IKHA14fyfH6614d1MLit1k252lJikwUDfjSyF9sD4=;
        b=E6Hj8nsb6ona45YrTSPoMfGXmM9mqwDdNgWFKLMbkZ9FLzu3CrXtZKeg73X1xSsBu+
         dVpyJV/bgsS1YapHj/gCRJAhL7tT2veJRCPl79gUVFnRF+PLEvVjxRa7dlyRWFu+AQrL
         YJrQufW36LbeQ+USDh+QGGszGFZ2idKF1JNMPvIgLViyG8CHy4sSG2f3fuxwHqdZGKXB
         kl9T1Vt8OgIVPPYWiWzI52hReinv0S1lhH/A9j9EWj4bvikdYFySfjcPYEPJc7Z9Lutq
         BHnjlvWixRbbnl9RnqQeAPeKDyyRMbaFkBWqnZ2J7XR/w22+A7suuoxGVm2CEpZjCv2a
         yVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s0IKHA14fyfH6614d1MLit1k252lJikwUDfjSyF9sD4=;
        b=MBf+S+3LGReorGRYWtc5zK1wu7LGeCqIIUwgAg1eMo+lvHNEtqfurd1Kcz/lmaO03M
         8YPdfGOI8hqamE4m5K2rply3JoVt4Ew3sphS7ApzdL+LvvwrT0OF8kDmmP0ge2fF2uWz
         BvY+0secwoKJ371OEoJngR8tAG1OXdvXmBdhfQdSavhzk32sjUzgQwlEXJEfu9dpFmVk
         E6C2crixZDDxkx9qBI+ULcedufy95SER4LQWPwSxGPd++Q0JOrNuNAFM63IxJEv+70G8
         2CtJqBczJubJuH2QomS8Mnw1YRlHLsyldZgxXcZON2fMNAYO7OIlZrPgQFF/tzfNJ84X
         xwrw==
X-Gm-Message-State: AOAM532OklFSXfmJ5yqy73QMOfxuI36s4mv5KNc4j0wlJHGRRHyNe2Vj
        WaQQQB5tPjDtDNGNeD49pBOgkBOMgoQ=
X-Google-Smtp-Source: ABdhPJz9ZwtCQbgEDklrL6PF0o4INiZ9dJFQn38KrbMCIQeH6jtTxgNqRJ7ktnJkzD89gwSJv2wMlQ==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr6941656wro.169.1636446664027;
        Tue, 09 Nov 2021 00:31:04 -0800 (PST)
Received: from localhost.localdomain.at (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
        by smtp.gmail.com with ESMTPSA id v185sm1821600wme.35.2021.11.09.00.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 00:31:03 -0800 (PST)
From:   Christian Gmeiner <christian.gmeiner@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Christian Gmeiner <christian.gmeiner@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 1/1] rpmsg: add syslog driver
Date:   Tue,  9 Nov 2021 09:30:44 +0100
Message-Id: <20211109083051.17831-2-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109083051.17831-1-christian.gmeiner@gmail.com>
References: <20211109083051.17831-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Allows the remote firmware to log into syslog.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/rpmsg/Kconfig  | 8 ++++++++
 drivers/rpmsg/Makefile | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 0b4407abdf13..801f9956ec21 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -73,4 +73,12 @@ config RPMSG_VIRTIO
 	select RPMSG_NS
 	select VIRTIO
 
+config RPMSG_SYSLOG
+	tristate "SYSLOG device interface"
+	depends on RPMSG
+	help
+	  Say Y here to export rpmsg endpoints as device files, usually found
+	  in /dev. They make it possible for user-space programs to send and
+	  receive rpmsg packets.
+
 endmenu
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 8d452656f0ee..75b2ec7133a5 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
 obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
 obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
+obj-$(CONFIG_RPMSG_SYSLOG)	+= rpmsg_syslog.o
-- 
2.33.1

