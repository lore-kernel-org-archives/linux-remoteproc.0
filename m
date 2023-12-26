Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F6ED8
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 Dec 2023 00:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZfA9hGMA"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ccc80791e1so7098021fa.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Dec 2023 16:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703550891; x=1704155691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk7JCm6FVAskN3xKnyN6uBzsSfBNTuACoWqqIWubEIg=;
        b=ZfA9hGMAP4a7nqqIi6ExRR5kaMrCxwgX8Z0OBIwVNYKYywxnGUrR1IRKeJZjxRPIgj
         nkqWV6JYG5Git+FsX+GWVpVmDwtpWsKoSGcHhMSRE98+N8EenHU9s7YrElapHVLScCGM
         vBI+ZazbLpVRTJRnU+cJur3ey8VV/CGncRPstFVtywmRSF7037L7cfYbUgZxNEfRW+TL
         8ZEgaGdIze0Kt4kpXI4Ecy2Uz2mUrnocQj2I++a/PqE9IKJ/3aVTnE2f8kgX2jShNve/
         JaKrlh+Wxj3oONXf9LWCI9b8W7N0V30RHWtKaTlHHdwK6Y84Gu3jpX/ysQFVA9P1lIbq
         NPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703550891; x=1704155691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mk7JCm6FVAskN3xKnyN6uBzsSfBNTuACoWqqIWubEIg=;
        b=VqXwfQ3gMzxltQdbMv4hHFBodKl6xPpi4yy413oDNfOvOKcWFMkSbKR1C9TOt/aG99
         YnaQ7HPp/ZVydLHH17Zztbaj2PKEMMhQby5XFndm/d+Yl1P90AcfciF2jirR6KfkicpO
         3ngb5M1492/DniofrX2ogwW9VYsaOBcfT/1li1LWwke8qIlc17irv6TRVrhOMAS5kD6o
         pYMW0xqNp94eXnREorj8FnP3E63sE/ssy5VOPb2AlkMByP7gpV5B6Z9XcT5RsnQXttCn
         5EnIjZq6gUoPV7YarYe9KrChJrFvyIU1vBEgzRH9ScH1zWOBcjiyIQH69MZiNPW986vO
         CGIA==
X-Gm-Message-State: AOJu0YxgBjQGLWeT2z+z7GCVrQ1eGwoDrb9TGJ3QymHViatSG8wud5gY
	Y0V6CTOalChPxax1xikADbEEcgTZ4t5FbQ==
X-Google-Smtp-Source: AGHT+IGHVeh4SgVzGyS0ZHJrO8LTdPx7kjHJxyEK76C8mFD3RD40zwemuw9kaSFdKQ9no8xSneKRrw==
X-Received: by 2002:a2e:a499:0:b0:2cc:9320:bccb with SMTP id h25-20020a2ea499000000b002cc9320bccbmr3184266lji.2.1703550890742;
        Mon, 25 Dec 2023 16:34:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a05651c088100b002ccb1301d53sm1368810ljq.48.2023.12.25.16.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 16:34:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 3/5] remoteproc: qcom: adsp: add configuration for in-kernel pdm
Date: Tue, 26 Dec 2023 02:34:45 +0200
Message-Id: <20231226003447.3044365-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
References: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add domain / service configuration for the in-kernel protection domain
mapper service.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig          |  1 +
 drivers/remoteproc/qcom_q6v5_adsp.c | 67 +++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48845dc8fa85..f1698d4c302e 100644
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
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 6c67514cc493..71106ec94840 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -23,6 +23,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -76,6 +77,9 @@ struct adsp_pil_data {
 	int num_clks;
 	const char **proxy_pd_names;
 	const char *load_state;
+
+	size_t num_domains;
+	const struct qcom_pdm_domain_data * const *domains;
 };
 
 struct qcom_adsp {
@@ -118,6 +122,9 @@ struct qcom_adsp {
 	struct qcom_sysmon *sysmon;
 
 	int (*shutdown)(struct qcom_adsp *adsp);
+
+	size_t num_domains;
+	const struct qcom_pdm_domain_data * const *domains;
 };
 
 static int qcom_rproc_pds_attach(struct device *dev, struct qcom_adsp *adsp,
@@ -382,6 +389,7 @@ static int adsp_start(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
 	unsigned int val;
+	int i;
 
 	ret = qcom_q6v5_prepare(&adsp->q6v5);
 	if (ret)
@@ -443,8 +451,18 @@ static int adsp_start(struct rproc *rproc)
 		goto disable_adsp_clks;
 	}
 
+	for (i = 0; i < adsp->num_domains; i++) {
+		ret = qcom_pdm_add_domain(adsp->domains[i]);
+		if (ret)
+			goto err_domains;
+	}
+
 	return 0;
 
+err_domains:
+	while (--i >= 0)
+		qcom_pdm_del_domain(adsp->domains[i]);
+
 disable_adsp_clks:
 	clk_bulk_disable_unprepare(adsp->num_clks, adsp->clks);
 disable_power_domain:
@@ -472,6 +490,10 @@ static int adsp_stop(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	int handover;
 	int ret;
+	int i;
+
+	for (i = 0; i < adsp->num_domains; i++)
+		qcom_pdm_del_domain(adsp->domains[i]);
 
 	ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
 	if (ret == -ETIMEDOUT)
@@ -699,6 +721,8 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->rproc = rproc;
 	adsp->info_name = desc->sysmon_name;
 	adsp->has_iommu = desc->has_iommu;
+	adsp->num_domains = desc->num_domains;
+	adsp->domains = desc->domains;
 
 	platform_set_drvdata(pdev, adsp);
 
@@ -775,6 +799,45 @@ static void adsp_remove(struct platform_device *pdev)
 	rproc_free(adsp->rproc);
 }
 
+static const struct qcom_pdm_domain_data adsp_audio_pd = {
+	.domain = "msm/adsp/audio_pd",
+	.instance_id = 74,
+	.services = {
+		"avs/audio",
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data adsp_charger_pd = {
+	.domain = "msm/adsp/charger_pd",
+	.instance_id = 74,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data adsp_root_pd = {
+	.domain = "msm/adsp/root_pd",
+	.instance_id = 74,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data adsp_sensor_pd = {
+	.domain = "msm/adsp/sensor_pd",
+	.instance_id = 74,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data *sc7280_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_charger_pd,
+	&adsp_sensor_pd
+};
+
+static const struct qcom_pdm_domain_data *sdm845_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+};
+
 static const struct adsp_pil_data adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -791,6 +854,8 @@ static const struct adsp_pil_data adsp_resource_init = {
 	.proxy_pd_names = (const char*[]) {
 		"cx", NULL
 	},
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
+	.domains = sdm845_adsp_domains,
 };
 
 static const struct adsp_pil_data adsp_sc7280_resource_init = {
@@ -806,6 +871,8 @@ static const struct adsp_pil_data adsp_sc7280_resource_init = {
 		"gcc_cfg_noc_lpass", NULL
 	},
 	.num_clks = 1,
+	.num_domains = ARRAY_SIZE(sc7280_adsp_domains),
+	.domains = sc7280_adsp_domains,
 };
 
 static const struct adsp_pil_data cdsp_resource_init = {
-- 
2.39.2

