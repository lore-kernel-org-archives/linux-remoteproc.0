Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716DBC77B61
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Apr 2023 16:14:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbjDGQOe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 Apr 2023 12:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjDGQOd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Apr 2023 12:14:33 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B7B10C1
        for <linux-remoteproc@vger.kernel.org>; Fri,  7 Apr 2023 09:14:32 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so43722460pjb.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Apr 2023 09:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680884071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=va/SV6E2+ud/jti2qYlNsmAiizf5dXOpYvfXoBKZhWU=;
        b=tmQXIDq93SdrLxctIy/NUHVgpSL3ppxF6Ir29BQVL+Y/2ykQd1PhMENFj/gK1ITS4G
         GQf6+EbQmFyPoESHGoEv5rNkjE6yMGY3Ymaa5FUAlEsGsiulTy8Wlxv1Sc+/6KIiSJoc
         6J36gjmUQyqjS/GRf66ztU9QQ57ZHnf32oMyFfA84vVNVKdY/ciU5Lt/zhn2bIDJpiBM
         /qKZlWuFtx4Ku61jRrS/Aiq4+dSiy10bbzgA6ZfbBNLITeuXw6S+R1VOrW7x2E/dYcSw
         unVoyGLyRhfd5sK2XJdz5nILht8f3XT93DGk+ibup971sApa9/WEpJ8nsyMKo6iRZVg3
         s+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680884071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=va/SV6E2+ud/jti2qYlNsmAiizf5dXOpYvfXoBKZhWU=;
        b=LhXIIhjRWy/ai1z/xd8AA27e7Oqx3okhTZ5o+WUx5NLOKi1BRjIjvGI6Xrs34jIDLr
         dXV6wTbqbGhdy/ylDpE62BP3dzeI4i+khVa+PbZNJ9+2/ueUShtz5ODVgmXb5EQIJiez
         8IG9BQcaf+tP7LLGHqlQ4Xl6E0G9PDjXg/nze4x0xy5oCLTfSjF/siwFTKfZz+zMgGCA
         vilJuTkPmyzCQ93AR7XojYu0Yrx26OM3xW0ngaW+zAOWV9v1EZumYIKx4UUQbQ35BFAO
         f6leoeTPT/5K1SX4dBmFS7i4YOyf1LlcBEK2p35HT9JnUWvHDl2rrGrAm8fA/GPaS/7b
         KYvQ==
X-Gm-Message-State: AAQBX9fewY4yxeZzvFO0YGP0V+Fnntm0aAUaejVbOMHAqmu5MwJuiy+w
        GkAxxT1+5HrzJGl8Y/1L8zLcmw==
X-Google-Smtp-Source: AKy350atjMY/kis0Ii/ZkRXNjB42cq9O4CbNOs67ggofFXNiFSoQApkLnrEZ46mrdLQ/A52BxMeDrw==
X-Received: by 2002:a17:902:ec8b:b0:1a2:940c:e452 with SMTP id x11-20020a170902ec8b00b001a2940ce452mr2779756plg.9.1680884071643;
        Fri, 07 Apr 2023 09:14:31 -0700 (PDT)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:f97d:e249:15ae:2498])
        by smtp.gmail.com with ESMTPSA id e11-20020a170902ed8b00b001a1ea1d6d65sm3112165plj.272.2023.04.07.09.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 09:14:31 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     iuliana.prodan@nxp.com, andersson@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: imx_dsp_rproc: Fix kernel test robot sparse warning
Date:   Fri,  7 Apr 2023 10:14:29 -0600
Message-Id: <20230407161429.3973177-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch fixes the kernel test robot warning reported here:

https://lore.kernel.org/bpf/642f916b.pPIKZ%2Fl%2F%2Fbw8tvIH%25lkp@intel.com/T/

Fixes: 408ec1ff0caa ("remoteproc: imx_dsp_rproc: Add custom memory copy implementation for i.MX DSP Cores")
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---

Iuliana - please thest this on your side

---
 drivers/remoteproc/imx_dsp_rproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 21759d9e5b7b..c805cb83cacc 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -750,12 +750,12 @@ static void imx_dsp_rproc_kick(struct rproc *rproc, int vqid)
  * The IRAM is part of the HiFi DSP.
  * According to hw specs only 32-bits writes are allowed.
  */
-static int imx_dsp_rproc_memcpy(void *dest, const void *src, size_t size)
+static int imx_dsp_rproc_memcpy(void *dst, const void *src, size_t size)
 {
+	void __iomem *dest = (void __iomem *)dst;
 	const u8 *src_byte = src;
 	const u32 *source = src;
 	u32 affected_mask;
-	u32 *dst = dest;
 	int i, q, r;
 	u32 tmp;
 
@@ -768,7 +768,7 @@ static int imx_dsp_rproc_memcpy(void *dest, const void *src, size_t size)
 
 	/* copy data in units of 32 bits at a time */
 	for (i = 0; i < q; i++)
-		writel(source[i], &dst[i]);
+		writel(source[i], dest + i * 4);
 
 	if (r) {
 		affected_mask = GENMASK(8 * r, 0);
@@ -799,8 +799,8 @@ static int imx_dsp_rproc_memcpy(void *dest, const void *src, size_t size)
  */
 static int imx_dsp_rproc_memset(void *addr, u8 value, size_t size)
 {
+	void __iomem *tmp_dst = (void __iomem *)addr;
 	u32 tmp_val = value;
-	u32 *tmp_dst = addr;
 	u32 affected_mask;
 	int q, r;
 	u32 tmp;
-- 
2.25.1

