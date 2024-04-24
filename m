Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FBB1591EA
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 09:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713950887; cv=none; b=aGM0u1fSrHATiLkkjA+SaO0jkUMtH9FCrqvWkblaEySgL9ZVpKDq+iuzuh5U34hFF5T6t9ig0ifK9sDMkz8mx1iJBu6JvXRye0DnQ5bLr1l7ObOMWJnnYXWeg3pGWV/zJenZ/Cbl14Tqqoed5ueYbBcn0FqY5So867Jt0SK+8dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713950887; c=relaxed/simple;
	bh=fRpe4tZif781lZ12DHSpdu5zykO3631nXc2R0m1h4Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BrDTfPD530Ik1suUSIGtGERs1eSdO0XlFODx13OFven0jf14njZML9ZxrtICDdeHMkn+0ymeQVTN2eI8DfKvNCeDop0Z2O6pkaXLoJGrTFTmTMd6Wt6+essljakiCFalFwDsPI40BzkFAnf3pUwd2dZHNsC/iGZXpe8lZiTpAjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EDARoSsl; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EDARoSsl"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2de232989aaso18244701fa.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713950884; x=1714555684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XqnvD15NkzmaJMEzgWAv80CASkF9y6TdmD/lauJI7g=;
        b=EDARoSslWh7Ym3+J9pihQkoxLnk6LEcN0ivKHg6uGmlfVT6c4TPKyCcRn2wooCYhtU
         REhJ86HhRnh0CBowNiJRdkZSZLr7Pevuf4Z2USon63zBCCY8q1dSF2qCoUZmyLto5juy
         NGSF9LnMlmN6+NqrLRzCo9t+chfdflY5ay/0+g7TmRlhMmY6rSrxUpxUhSTV4jH+5lH4
         XFAA8/b89Ci19Vi7J7qFIgtmvnrcBAljGSKauRcKbEcl5AagusMd/sCnpq3+PctKs/Qj
         llCGKXliOCBZu4GBeu13shPAyNNJU8kJ7AbCfyfeUQHzXh7rxr8eHMKXlH0+v3FCiQaX
         0Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713950884; x=1714555684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XqnvD15NkzmaJMEzgWAv80CASkF9y6TdmD/lauJI7g=;
        b=plUJU0Fp+8TTH0Hoz1/V2vY+Y7Fd3VCgfSP8Jvrw4OQO04NsyQpp8wNJ5LbzG9Q17I
         r4gbmAaDpwebE/UQhrlA05BT7Dm1hwaxFYYmmS5HS/ha4AMW6qhJS4um9HN++reHNl4P
         9zTKZZ94LQLDA3lz+bnbATLiKgxaja+L+74Kg331osMbJ880lH5L+9q5yk0+LtQJELIF
         4qbJ9Ox8p8IezAAXclLcoSCHW7+p4AYcgnRtJvx4D575K0bBRnVdJ3od43JbRECQJQOD
         lGlz2QCISHnD5695rghRXH0fTMd32I3h1io7z/1S7WgUG76Q6NVfnLQAlYqFHSD5B92U
         O3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVFU1PyAiqDmdZi5gWAyAzJKiyjDY4LFuaVjfCD7yBPSi0y10GpupjGOJEPusF7oPg8V2VpPgKlfKuqVQHpK9FUUsmquNv8jjp/VH+FgxJ2iQ==
X-Gm-Message-State: AOJu0YytI9ZS0rSdLFoEvgurdA+/A/M1/eI53iBng5/igLSdcSh5jfnR
	xeTWt3e1/WKa0uesv3osXdI2c76OaRr2IL1otIUGRglyjLoGcq3o0Q8S4XjDPDw=
X-Google-Smtp-Source: AGHT+IHvO2oi/VktVWA8LCiBkkfJy9IjL5OZLxNNUom42pclP2vD2CwEvmUDzgFeX6OIyWoKPZiIzQ==
X-Received: by 2002:a2e:a710:0:b0:2d6:c29c:a4e9 with SMTP id s16-20020a2ea710000000b002d6c29ca4e9mr935422lje.22.1713950883834;
        Wed, 24 Apr 2024 02:28:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a2e8442000000b002d8744903ebsm1916849ljh.68.2024.04.24.02.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:28:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 12:28:02 +0300
Subject: [PATCH v7 6/6] remoteproc: qcom: enable in-kernel PD mapper
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-qcom-pd-mapper-v7-6-05f7fc646e0f@linaro.org>
References: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
In-Reply-To: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6924;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fRpe4tZif781lZ12DHSpdu5zykO3631nXc2R0m1h4Bo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKNCe9qNz3JAWsWAbg3RcW5Ue7H40CniSi6hYQ
 6OspBeES+qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZijQngAKCRCLPIo+Aiko
 1cxeCACptgP2ZLM38Mk8RWur2+UjHJrAQdL+lGrGWJqRxmOtyu9IM3pJ4z4P3J1oqIWfkAUj0Ad
 3znlgS48XMDp47zwhjVs6fg0K5rRSBsy2ho0+bD52Dip+OiXHYJWd4G3Ex6zJYNt33RR4h8TMG6
 clwiUgXYzUpfIqaQ3Hr8ubUbzbgJQgydbrY+YPURJ0nCqG8kGnlqbqZcx5kM5NVKJuL0tPR7wmo
 VpYvGgFcj5jgURk6Bmw96PkN9SUbXK1H748ANIGh5QNnYDkBS3iJQxy62qeLqo6EEFbCE/OhoNa
 c2ARDL6LD3P7bXOdsQPLRz128K368t3xTL1uRSSlwoNkfXrY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Request in-kernel protection domain mapper to be started before starting
Qualcomm DSP and release it once DSP is stopped. Once all DSPs are
stopped, the PD mapper will be stopped too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig          |  4 ++++
 drivers/remoteproc/qcom_q6v5_adsp.c | 11 ++++++++++-
 drivers/remoteproc/qcom_q6v5_mss.c  | 10 +++++++++-
 drivers/remoteproc/qcom_q6v5_pas.c  | 12 +++++++++++-
 drivers/remoteproc/qcom_q6v5_wcss.c | 12 +++++++++++-
 5 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48845dc8fa85..a0ce552f89a1 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -181,6 +181,7 @@ config QCOM_Q6V5_ADSP
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
@@ -201,6 +202,7 @@ config QCOM_Q6V5_MSS
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_PIL_INFO
@@ -221,6 +223,7 @@ config QCOM_Q6V5_PAS
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
@@ -243,6 +246,7 @@ config QCOM_Q6V5_WCSS
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_PIL_INFO
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 1d24c9b656a8..02d0c626b03b 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -23,6 +23,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -375,10 +376,14 @@ static int adsp_start(struct rproc *rproc)
 	int ret;
 	unsigned int val;
 
-	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	ret = qcom_pdm_get();
 	if (ret)
 		return ret;
 
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		goto put_pdm;
+
 	ret = adsp_map_carveout(rproc);
 	if (ret) {
 		dev_err(adsp->dev, "ADSP smmu mapping failed\n");
@@ -446,6 +451,8 @@ static int adsp_start(struct rproc *rproc)
 	adsp_unmap_carveout(rproc);
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
+put_pdm:
+	qcom_pdm_release();
 
 	return ret;
 }
@@ -478,6 +485,8 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_adsp_pil_handover(&adsp->q6v5);
 
+	qcom_pdm_release();
+
 	return ret;
 }
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 1779fc890e10..791f11e7adbf 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -26,6 +26,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
 
@@ -1581,10 +1582,14 @@ static int q6v5_start(struct rproc *rproc)
 	int xfermemop_ret;
 	int ret;
 
-	ret = q6v5_mba_load(qproc);
+	ret = qcom_pdm_get();
 	if (ret)
 		return ret;
 
+	ret = q6v5_mba_load(qproc);
+	if (ret)
+		goto put_pdm;
+
 	dev_info(qproc->dev, "MBA booted with%s debug policy, loading mpss\n",
 		 qproc->dp_size ? "" : "out");
 
@@ -1613,6 +1618,8 @@ static int q6v5_start(struct rproc *rproc)
 reclaim_mpss:
 	q6v5_mba_reclaim(qproc);
 	q6v5_dump_mba_logs(qproc);
+put_pdm:
+	qcom_pdm_release();
 
 	return ret;
 }
@@ -1627,6 +1634,7 @@ static int q6v5_stop(struct rproc *rproc)
 		dev_err(qproc->dev, "timed out on wait\n");
 
 	q6v5_mba_reclaim(qproc);
+	qcom_pdm_release();
 
 	return 0;
 }
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 54d8005d40a3..653e54f975fc 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -23,6 +23,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -261,10 +262,14 @@ static int adsp_start(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
 
-	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	ret = qcom_pdm_get();
 	if (ret)
 		return ret;
 
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		goto put_pdm;
+
 	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	if (ret < 0)
 		goto disable_irqs;
@@ -356,6 +361,9 @@ static int adsp_start(struct rproc *rproc)
 	/* Remove pointer to the loaded firmware, only valid in adsp_load() & adsp_start() */
 	adsp->firmware = NULL;
 
+put_pdm:
+	qcom_pdm_release();
+
 	return ret;
 }
 
@@ -399,6 +407,8 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
 
+	qcom_pdm_release();
+
 	return ret;
 }
 
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 94f68c919ee6..6ed60f3f3eee 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
@@ -240,13 +241,17 @@ static int q6v5_wcss_start(struct rproc *rproc)
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	ret = qcom_pdm_get();
+	if (ret)
+		return ret;
+
 	qcom_q6v5_prepare(&wcss->q6v5);
 
 	/* Release Q6 and WCSS reset */
 	ret = reset_control_deassert(wcss->wcss_reset);
 	if (ret) {
 		dev_err(wcss->dev, "wcss_reset failed\n");
-		return ret;
+		goto put_pdm;
 	}
 
 	ret = reset_control_deassert(wcss->wcss_q6_reset);
@@ -288,6 +293,9 @@ static int q6v5_wcss_start(struct rproc *rproc)
 wcss_reset:
 	reset_control_assert(wcss->wcss_reset);
 
+put_pdm:
+	qcom_pdm_release();
+
 	return ret;
 }
 
@@ -735,6 +743,8 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 
 	qcom_q6v5_unprepare(&wcss->q6v5);
 
+	qcom_pdm_release();
+
 	return 0;
 }
 

-- 
2.39.2

