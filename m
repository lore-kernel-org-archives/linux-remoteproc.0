Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD82064E8
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Oct 2024 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729862081; cv=none; b=j7U8Y7fznso2LFPSjlwKbWL3IPonVefj+K9gXsn8YGEXUm4DJ5JjIKgqpuMJX0PBwRTWPBPvh5Q+gAxT6qHRUAMac+3cRpxA5zXLG6Y7ve3Ip5GP9s3TBkEoNsiZOiO1RGJ1qmL23EAwC4lJL4ZLnd2FpOiicgTqLrq5thw7Ie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729862081; c=relaxed/simple;
	bh=aAuud3rm5cPWkUQUGwv7b95D6zwXwfB/xjhjZJWtfaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bpc/duBRw4esYa8ZcHTtb+QmvtzKAnarXb0G9ZpYsrziuunDUCgHoXKCxyhvqWKA7tNTss1HAGx+M6f8ppXiKZE+7cRo6pSBNx84owRw51LBHjx5idvyR0FPV/hE56uOxgCWS0Og4iPRwxyMwJ6uojzxLNmgU4xBX81NrUgxoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wsy8ztxb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wsy8ztxb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d808ae924so1422613f8f.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Oct 2024 06:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729862076; x=1730466876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++aEk6a+cUFK+JnaxlTBl5FPNZKeKXmhUzi+ROa4bp0=;
        b=wsy8ztxboxhrx/5gnJ3shRcbeUtOTSfOgAntKpU+qImI6bS11wBJQ23XGwV8G79C3F
         4RBOYtXgsA9zJRSye/M+a4X9mlXTTgrUtaaKVmsZEwkhqyf0JTDNdsUGYbZ8u2vDxWMf
         GKE0TiQ99QGS0HiSbMeHsI1xsM5MV73xmPxVD8raMyEtAKP0dcfMyLDUKUv4psnAbrU1
         qDo7JUBQaF4PYfYn9en0sCGcpu4ejIedkybNdNuYJUCzWH9mYm8yUO73zABHD3xIFjRK
         4l3Oxtst51GKpirm8Ei3K67o5VqkYhI1qkU/2GkCpBXmljTnZFpbY9MiQvxbJiDSnEMU
         kASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862076; x=1730466876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++aEk6a+cUFK+JnaxlTBl5FPNZKeKXmhUzi+ROa4bp0=;
        b=rZs6eIjyPQGI7fb8qlr8W/IxWBfURsbA9XCby6UT3b7mt495zYb4kzFXmmtEfiPas7
         npg+F8jb9Ca5ytyBB3DVp9bNpixCTAVWWPqDZs9v2l9oMQ5SfzNPcOkrVGbADjB1mrjq
         QyMPoa+3WTeacM8gbWIwxZ4pq0PpT3lEeFiTLFLGuxGGiaHIW1vzWmnyB0pEmGVozXYb
         S/XfO5T9GfZsWTTe/2W/pr09f8olkItorTVQykd3e8lsSftEoy1P3NVuN7UW0U7bCONT
         uG+06Az5KCa5dNdCjrdn31Sfd9b0Z1rnafC63ZCcP0933TuotH7RmP4HhG1pOH67ASiH
         +Dqg==
X-Gm-Message-State: AOJu0YzBxYN5zzvDfeQ5z6P4sMhV8nCU1RPbL/+c7geETgNW7i3Zsnk5
	WC86wARjnm8jeAmRXXuRob3F7eQXetcMDPQ2duThujvfPwDJcTj0eu2fumk8BLo=
X-Google-Smtp-Source: AGHT+IHvRvMLLZZ2WbmWtACDwlvRZrSstsnnSC5Ts5r50eeUAcLVMWfeHQS82EPWHi6Q7cbj3W6STw==
X-Received: by 2002:a05:6000:e48:b0:37d:4cf9:e085 with SMTP id ffacd0b85a97d-380458586c5mr4051987f8f.25.1729862075721;
        Fri, 25 Oct 2024 06:14:35 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:d7d6:ae91:e8c2:f1d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b4000dsm1504174f8f.45.2024.10.25.06.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
Subject: [PATCH] remoteproc: Switch back to struct platform_driver::remove()
Date: Fri, 25 Oct 2024 15:13:41 +0200
Message-ID: <20241025131340.258233-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11595; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=aAuud3rm5cPWkUQUGwv7b95D6zwXwfB/xjhjZJWtfaY=; b=owGbwMvMwMXY3/A7olbonx/jabUkhnTpmS36YoWq1erhyx9zt3/o3uvpvy3J7+L7iONBN14oH RAvuNzfyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsCN3sH+v2TOlYR0m0UX+hbU TOl5r/FSWSd6+if3Fq3afoPEaXVqTMcC4zPtk3MWNpom+3mtvlVh8ZG3Ov6mNkvaq6jcb4WOi34 ulb07ZeZeFTauSGZ+hvLe63ditcTCg0/3Bzz0t2y7ZBlWxc/IyH4kWSRm1VHWvn+L+jp3ixyd9U 1g4eLXvtUcuy6kOSXP1Fl9ZNqOjR15zQ/SD7+c/vv93/Sb938e21oeXKbSsrTw7fYzB264LuFp6 t0+4/6L28bMpQYLTgnNPhv+1btOZYGO1o/sr/0hGy2vrXW5HFedUi3oWj7HQG6WgIbdh4c/mrrm bfa6xiDz1eHgixvlHA/2cKXpaMYZRV6/pPlohYQjy/8SAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/remoteproc to use .remove(),
with the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/remoteproc. While I usually
prefer to do one logical change per patch, this seems to be
overengineering here as the individual changes are really trivial and
shouldn't be much in the way for stable backports. But I'll happily
split the patch if you prefer it split.

Note I didn't Cc: the maintainers of each driver as this would hit
sending limits.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend.

Best regards
Uwe

 drivers/remoteproc/da8xx_remoteproc.c     | 2 +-
 drivers/remoteproc/imx_dsp_rproc.c        | 2 +-
 drivers/remoteproc/imx_rproc.c            | 2 +-
 drivers/remoteproc/keystone_remoteproc.c  | 2 +-
 drivers/remoteproc/meson_mx_ao_arc.c      | 2 +-
 drivers/remoteproc/mtk_scp.c              | 2 +-
 drivers/remoteproc/pru_rproc.c            | 2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c       | 2 +-
 drivers/remoteproc/qcom_q6v5_mss.c        | 2 +-
 drivers/remoteproc/qcom_q6v5_pas.c        | 2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c       | 2 +-
 drivers/remoteproc/qcom_wcnss.c           | 2 +-
 drivers/remoteproc/rcar_rproc.c           | 2 +-
 drivers/remoteproc/remoteproc_virtio.c    | 2 +-
 drivers/remoteproc/st_remoteproc.c        | 2 +-
 drivers/remoteproc/stm32_rproc.c          | 2 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 2 +-
 drivers/remoteproc/wkup_m3_rproc.c        | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 7daaab8124e8..93031f0867d1 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -365,7 +365,7 @@ MODULE_DEVICE_TABLE(of, davinci_rproc_of_match);
 
 static struct platform_driver da8xx_rproc_driver = {
 	.probe = da8xx_rproc_probe,
-	.remove_new = da8xx_rproc_remove,
+	.remove = da8xx_rproc_remove,
 	.driver = {
 		.name = "davinci-rproc",
 		.of_match_table = of_match_ptr(davinci_rproc_of_match),
diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 376187ad5754..ea5024919c2f 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1258,7 +1258,7 @@ MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
 
 static struct platform_driver imx_dsp_rproc_driver = {
 	.probe = imx_dsp_rproc_probe,
-	.remove_new = imx_dsp_rproc_remove,
+	.remove = imx_dsp_rproc_remove,
 	.driver = {
 		.name = "imx-dsp-rproc",
 		.of_match_table = imx_dsp_rproc_of_match,
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 800015ff7ff9..74299af1d7f1 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1198,7 +1198,7 @@ MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
 
 static struct platform_driver imx_rproc_driver = {
 	.probe = imx_rproc_probe,
-	.remove_new = imx_rproc_remove,
+	.remove = imx_rproc_remove,
 	.driver = {
 		.name = "imx-rproc",
 		.of_match_table = imx_rproc_of_match,
diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 8f0f7a4cfef2..6e54093d1732 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -490,7 +490,7 @@ MODULE_DEVICE_TABLE(of, keystone_rproc_of_match);
 
 static struct platform_driver keystone_rproc_driver = {
 	.probe	= keystone_rproc_probe,
-	.remove_new = keystone_rproc_remove,
+	.remove = keystone_rproc_remove,
 	.driver	= {
 		.name = "keystone-rproc",
 		.of_match_table = keystone_rproc_of_match,
diff --git a/drivers/remoteproc/meson_mx_ao_arc.c b/drivers/remoteproc/meson_mx_ao_arc.c
index f6744b538323..7dfdf11b0036 100644
--- a/drivers/remoteproc/meson_mx_ao_arc.c
+++ b/drivers/remoteproc/meson_mx_ao_arc.c
@@ -246,7 +246,7 @@ MODULE_DEVICE_TABLE(of, meson_mx_ao_arc_rproc_match);
 
 static struct platform_driver meson_mx_ao_arc_rproc_driver = {
 	.probe = meson_mx_ao_arc_rproc_probe,
-	.remove_new = meson_mx_ao_arc_rproc_remove,
+	.remove = meson_mx_ao_arc_rproc_remove,
 	.driver = {
 		.name = "meson-mx-ao-arc-rproc",
 		.of_match_table = meson_mx_ao_arc_rproc_match,
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e744c07507ee..0f4a7065d0bd 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1521,7 +1521,7 @@ MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
 
 static struct platform_driver mtk_scp_driver = {
 	.probe = scp_probe,
-	.remove_new = scp_remove,
+	.remove = scp_remove,
 	.driver = {
 		.name = "mtk-scp",
 		.of_match_table = mtk_scp_of_match,
diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 327f0c7ee3d6..1656574b7317 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -1132,7 +1132,7 @@ static struct platform_driver pru_rproc_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe  = pru_rproc_probe,
-	.remove_new = pru_rproc_remove,
+	.remove = pru_rproc_remove,
 };
 module_platform_driver(pru_rproc_driver);
 
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 572dcb0f055b..cbd9a914880b 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -840,7 +840,7 @@ MODULE_DEVICE_TABLE(of, adsp_of_match);
 
 static struct platform_driver adsp_pil_driver = {
 	.probe = adsp_probe,
-	.remove_new = adsp_remove,
+	.remove = adsp_remove,
 	.driver = {
 		.name = "qcom_q6v5_adsp",
 		.of_match_table = adsp_of_match,
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2a42215ce8e0..103368d11a96 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2533,7 +2533,7 @@ MODULE_DEVICE_TABLE(of, q6v5_of_match);
 
 static struct platform_driver q6v5_driver = {
 	.probe = q6v5_probe,
-	.remove_new = q6v5_remove,
+	.remove = q6v5_remove,
 	.driver = {
 		.name = "qcom-q6v5-mss",
 		.of_match_table = q6v5_of_match,
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4..297ef0c69054 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1477,7 +1477,7 @@ MODULE_DEVICE_TABLE(of, adsp_of_match);
 
 static struct platform_driver adsp_driver = {
 	.probe = adsp_probe,
-	.remove_new = adsp_remove,
+	.remove = adsp_remove,
 	.driver = {
 		.name = "qcom_q6v5_pas",
 		.of_match_table = adsp_of_match,
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index e913dabae992..810441f43396 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1111,7 +1111,7 @@ MODULE_DEVICE_TABLE(of, q6v5_wcss_of_match);
 
 static struct platform_driver q6v5_wcss_driver = {
 	.probe = q6v5_wcss_probe,
-	.remove_new = q6v5_wcss_remove,
+	.remove = q6v5_wcss_remove,
 	.driver = {
 		.name = "qcom-q6v5-wcss-pil",
 		.of_match_table = q6v5_wcss_of_match,
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index a7bb9da27029..5b5664603eed 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -682,7 +682,7 @@ MODULE_DEVICE_TABLE(of, wcnss_of_match);
 
 static struct platform_driver wcnss_driver = {
 	.probe = wcnss_probe,
-	.remove_new = wcnss_remove,
+	.remove = wcnss_remove,
 	.driver = {
 		.name = "qcom-wcnss-pil",
 		.of_match_table = wcnss_of_match,
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index cc17e8421f65..921d853594f4 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -214,7 +214,7 @@ MODULE_DEVICE_TABLE(of, rcar_rproc_of_match);
 
 static struct platform_driver rcar_rproc_driver = {
 	.probe = rcar_rproc_probe,
-	.remove_new = rcar_rproc_remove,
+	.remove = rcar_rproc_remove,
 	.driver = {
 		.name = "rcar-rproc",
 		.of_match_table = rcar_rproc_of_match,
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d3f39009b28e..25a655f33ec0 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -593,7 +593,7 @@ static void rproc_virtio_remove(struct platform_device *pdev)
 /* Platform driver */
 static struct platform_driver rproc_virtio_driver = {
 	.probe		= rproc_virtio_probe,
-	.remove_new	= rproc_virtio_remove,
+	.remove		= rproc_virtio_remove,
 	.driver		= {
 		.name	= "rproc-virtio",
 	},
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index 1340be9d0110..5df99bae7131 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -457,7 +457,7 @@ static void st_rproc_remove(struct platform_device *pdev)
 
 static struct platform_driver st_rproc_driver = {
 	.probe = st_rproc_probe,
-	.remove_new = st_rproc_remove,
+	.remove = st_rproc_remove,
 	.driver = {
 		.name = "st-rproc",
 		.of_match_table = of_match_ptr(st_rproc_match),
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8c7f7950b80e..b02b36a3f515 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -946,7 +946,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(stm32_rproc_pm_ops,
 
 static struct platform_driver stm32_rproc_driver = {
 	.probe = stm32_rproc_probe,
-	.remove_new = stm32_rproc_remove,
+	.remove = stm32_rproc_remove,
 	.driver = {
 		.name = "stm32-rproc",
 		.pm = pm_ptr(&stm32_rproc_pm_ops),
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index d08a3a98ada1..aed88a5061cc 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -791,7 +791,7 @@ MODULE_DEVICE_TABLE(of, k3_dsp_of_match);
 
 static struct platform_driver k3_dsp_rproc_driver = {
 	.probe	= k3_dsp_rproc_probe,
-	.remove_new = k3_dsp_rproc_remove,
+	.remove = k3_dsp_rproc_remove,
 	.driver	= {
 		.name = "k3-dsp-rproc",
 		.of_match_table = k3_dsp_of_match,
diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 36a55f7ffa64..d8be21e71721 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -251,7 +251,7 @@ static const struct dev_pm_ops wkup_m3_rproc_pm_ops = {
 
 static struct platform_driver wkup_m3_rproc_driver = {
 	.probe = wkup_m3_rproc_probe,
-	.remove_new = wkup_m3_rproc_remove,
+	.remove = wkup_m3_rproc_remove,
 	.driver = {
 		.name = "wkup_m3_rproc",
 		.of_match_table = wkup_m3_rproc_of_match,

base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
-- 
2.45.2

