Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F242D3A72;
	Thu,  3 Jul 2025 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751548138; cv=none; b=gpCqJ3TuckDxbkSmq2NJT0prOTNGfY8bTv+m/CaJxR0SzP6593rUeAFRSmI0lTMkLI0jcobLCTxwWjyZj+cFbl2+w3dj0RYAUUwpnd3oghwn2wHzjCGbwxRVDYgi19ieUwrEYq4d9jZbK+YyCA/t9E+L9AMLHQA85h9Ni3gDG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751548138; c=relaxed/simple;
	bh=pZbI5ym7TtzcRfecHeI0uDxdfaVbnqScARauxiC1Sd0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=imOwKLFqt7k2JYiZhIMsSQkActsyPjf9BUJ1Bch5mCHBxLe2MJk1VLPghejL+OX2gBrnUBUh6E+h8R+ad6prihYRMtvFkf9UF8bnABwWK28tVyzyaLC2ZVc05HQh3syGP/+nuk3AvH9xNN3mtmwTkPdHd9mbBoENxLWAo/JrjhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp62OkkM; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp62OkkM"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a823b532a4so39460601cf.2;
        Thu, 03 Jul 2025 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751548135; x=1752152935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSWkEMF2WVElgQiqk1mWdTcpv8AKmbdHRCi0k3irPWQ=;
        b=Zp62OkkMSnOm7TpGUhYVWrcHnPURZFDCedQKpGOCJkYZNSkgBfoXCmKWr+MHUwGZFW
         EjlqlSpjWyydIN5yjaLMHwB/55A8+uK7YD083A3LSh8gHyDj9zYxh5HAl6OF8gwYaE0w
         fQnt/u3YbVeA3+eyc1kfzX+cgSTbP5/j4nXGsYUwWrod3MBAaVcQg2xal9RkxW0obkrF
         Eiv1PTwXIP8Ys71Fj8psHHSwwcs7y8xDo9hjIie1aCMNH0zh1+ul5krQ7TgiYlud1A7O
         yt5eflfZlrQkhEtB9lDKa4bedcMsVpLo1ng33BobD6wYpD1liqy96Sb42IzgMW79Ffqt
         E2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751548135; x=1752152935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSWkEMF2WVElgQiqk1mWdTcpv8AKmbdHRCi0k3irPWQ=;
        b=bY9dfdDeSre2mu79gsvbgZjVGLWU1HLkQwNe/MmKyfH8IxWsjGBexqjd6jgEhtpg7a
         TXOn1/o+bOOcIJiuOOsTZOfOBovqted3tUQ8K8ODmY0zQO2WUAXfq2nNH5JMQgmKGC5D
         e0m6PGpyI3Ol/jL03pwWT9ewJxcnT2z5gmFaBc+H1CU/OO3EchJXm8Pm7LAJ9MmpRkd7
         xpRZQ213MJvcjk9UD1rRAwiFcpztneDbon36cKqYB6OiC4mat8l0sxOW6MvpTcmjRP4I
         H+S5bibevVccW34r9sYHuQKIlDIKYHGGBofoJpjkKzx3BDhMOXZpgondUGNlbQD4WG3N
         MCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8D26/GYjl+XSPCpawWhzIJyu1o1j4YG4fzgbPU1bFqVuHYVGLtVzXhd8zZaMYHzJhBBmx1eR2/zh6xHa2d7IHg==@vger.kernel.org, AJvYcCXpdTw3m6/gRIGCUtn0+ZWgYYbsbwC2wasNPWAvDMK2hM5MgxTwd/s1oRKKvCb9sSuyWFjLK8MkvsYBtFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPb/rsYrsmcE3FNor2ujDsCCvFXSoKPs/8P1MvVl4DcEPttjQm
	vjEwEqv6mDm+jIleXK5pJHW+l8nykn1q96/xMjQ4apTl+ZcIWyihf02+
X-Gm-Gg: ASbGncvTOMonCJRKFlGJEylorGzBinXlQvfW72EHNdwUw4GdSTCNOXleTQMmHTbIy/q
	1kPFyftYXyZbm9Szqv0jWAI5f/6G+oZxxiT0pjcmupPD/71kH/ygg6YvIumM9M5TjnG1YE52iEI
	50j0DadeQrNLl170nn5bSzWIiom9DaGZxQBUcIPJX7LVsEZdUhXmqmlVINKm1dx9mV8Zvg6hHQc
	P8+gGMoPO1SoYn0yVdJJr2y0Y88FDa3zwlq1yfPqsHkKUsCC8jfvCNwqJNHtVo8tY+XuQGKhrqb
	j2xz1pUw1LZ+f2RSUjN551m5XWGg8ay5RoZ8UFPE+yHVqZagNzjEnderj50VGUyltyDP1zDtXtz
	PeHk=
X-Google-Smtp-Source: AGHT+IGroe8sSDGARASmREqDinTKJNPHDZfD5QFZoPsxPWLxadIu9TXjl+Rxu7ZcO3g4suDjXSuCiA==
X-Received: by 2002:a05:622a:153:b0:4a7:ff6d:e94c with SMTP id d75a77b69052e-4a9879c6e11mr49451301cf.22.1751548135066;
        Thu, 03 Jul 2025 06:08:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c0:b293:bc62:f957:108d:1060])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm107314561cf.60.2025.07.03.06.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:08:54 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Date: Thu,  3 Jul 2025 10:08:31 -0300
Message-Id: <20250703130831.18830-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Merge the contiguous ITCM and DTCM regions into a single region to
prevent failures when loading ELF files with large sections:

remoteproc remoteproc0: powering up imx-rproc
remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
remoteproc remoteproc0: Failed to load program segments: -22
remoteproc remoteproc0: Boot failed: -22

This approach is the same as commit 8749919defb8 ("remoteproc:
imx_rproc: Merge TCML/U").

Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
Hi,

The ELF I tested had the following data section:

Memory region         Used Size  Region Size  %age Used
    m_interrupts:         680 B         1 KB     66.41%
          m_text:        6984 B       127 KB      5.37%
          m_data:      130224 B       128 KB     99.35%
         m_data2:          0 GB        16 MB      0.00%
[100%] Built target hello_world_cm7.elf

Which triggered the error. After this patch, remoteproc was able to boot
and work fine. Thanks!
---
 drivers/remoteproc/imx_rproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..bbf089ef48ee 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
 
 static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 	/* dev addr , sys addr  , size	    , flags */
-	/* ITCM   */
-	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* D/ITCM */
+	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S */
 	{ 0x00180000, 0x00180000, 0x00009000, 0 },
 	/* OCRAM */
@@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 	{ 0x08000000, 0x08000000, 0x08000000, 0 },
 	/* DDR (Code) - alias */
 	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
-	/* DTCM */
-	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S - alias */
 	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
 	/* OCRAM */
-- 
2.39.5

