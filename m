Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835CEC6FD1C
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Mar 2023 22:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjCTWUv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Mar 2023 18:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbjCTWUY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Mar 2023 18:20:24 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D2A18B01
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Mar 2023 15:18:43 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id y35so6359673pgl.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Mar 2023 15:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679350716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trrnan71ZHM7JKq0ql81PKKI2hb7rlyx27+ksKXBUrc=;
        b=f8qUTKDDglZJsgtv/KBhPEPSfsS/rDPVt7Q0ZvXfNE706If1SqJBI8NpCJq27Qo5gT
         DBGx99X/V+1V/tiTX54m6jRBxlszJZzogDlJCJTGTGIyxt6vbGwLhOM5KJqI9t04HNkL
         UQiy8VgJ1YxaLJ3QEbxjNGfDTUEzgR0koUy8jLa9VneY6PVluLfJvDPrLj+7E6CzK8OX
         MpFui5oS0O1cN+E/S3R2STlDyC4eSSr8INCk6CUcgeEVacgLh7uNNFy5QH/uMOp4VMzI
         m7UzrJVNthCu6l1D+R4JkUqPMcVo8xeHkhGJsyPEFhnBp5JUuQoLnCg4BemhWRypa75W
         GIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679350716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trrnan71ZHM7JKq0ql81PKKI2hb7rlyx27+ksKXBUrc=;
        b=s7nEm5m8gt72FTqkVFArtj3uC7GKlSLM3Uxg0Zj+aOpf21bTrtj4GDgRGICdt5Tu8k
         Xg+7QTszjKw+oW5xAmHrMxc/n6ZYDswG/SzBbB4ZmGM0xhWkknxeICzdDW0A4WTJyTV6
         bttLaVUkLPyPhRJJXpEx9cMCfVH0rhUipIEMVGH3F0mIe5hmD1Fiva74TR2j3tRfPiuU
         FPF2VE2KiEOje/Ri38UfiUqCc1VslIQSxAYKdkRDl2YO9uvwh7d73MEFP9++LVb/HMYC
         5dGHehhTNQLflnXIWfVDUKWt+350oJ26caMuOgD9v3iuclBVT2KGEjsSs34heG+CSaz3
         w68Q==
X-Gm-Message-State: AO0yUKWCH1G6PgsuJJVONhq72rMTUBcKIy6qJC4YFxpRchNnZacCpVXu
        It+WUWHkbS055ilRd0udBaQBgg==
X-Google-Smtp-Source: AK7set9+CAhMtLEgvAgzUcAfqrgmuEL7isu84NLQBw1S2LtfyWANSAlBjT/xveWdfYFLX4MYX/jmRQ==
X-Received: by 2002:aa7:9ae5:0:b0:627:fb1c:3af4 with SMTP id y5-20020aa79ae5000000b00627fb1c3af4mr342235pfp.21.1679350715864;
        Mon, 20 Mar 2023 15:18:35 -0700 (PDT)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:4ab5:5131:bafc:4428])
        by smtp.gmail.com with ESMTPSA id e15-20020a62aa0f000000b006259e883ee9sm4459196pff.189.2023.03.20.15.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 15:18:35 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     andersson@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, patrice.chotard@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        arnaud.pouliquen@st.com, hongxing.zhu@nxp.com, peng.fan@nxp.com,
        shengjiu.wang@nxp.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] remoteproc: imx_rproc: Call of_node_put() on iteration error
Date:   Mon, 20 Mar 2023 16:18:25 -0600
Message-Id: <20230320221826.2728078-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320221826.2728078-1-mathieu.poirier@linaro.org>
References: <20230320221826.2728078-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Function of_phandle_iterator_next() calls of_node_put() on the last
device_node it iterated over, but when the loop exits prematurely it has
to be called explicitly.

Fixes: b29b4249f8f0 ("remoteproc: imx_rproc: add i.MX specific parse fw hook")
Cc: stable@vger.kernel.org
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 9fc978e0393c..0ab840dc7e97 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -541,6 +541,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 
 		rmem = of_reserved_mem_lookup(it.node);
 		if (!rmem) {
+			of_node_put(it.node);
 			dev_err(priv->dev, "unable to acquire memory-region\n");
 			return -EINVAL;
 		}
@@ -553,10 +554,12 @@ static int imx_rproc_prepare(struct rproc *rproc)
 					   imx_rproc_mem_alloc, imx_rproc_mem_release,
 					   it.node->name);
 
-		if (mem)
+		if (mem) {
 			rproc_coredump_add_segment(rproc, da, rmem->size);
-		else
+		} else {
+			of_node_put(it.node);
 			return -ENOMEM;
+		}
 
 		rproc_add_carveout(rproc, mem);
 	}
-- 
2.25.1

