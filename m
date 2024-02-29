Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7498D7C095
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 23:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709247638; cv=none; b=c6Aekl5RDXdNbYF+TCsmu1SbZPVS+I3hvqefKgVy5mtPL0CLfWaXN0UVpH7qv6RxIqVfOhO9SJefYRzMnqgmGHZHMYo53VEMRRPIhFdVBHkB7nS5k1/dopp2PhZZkWv7EvaGCrmlxXVIBTHoiuLxKHmSr6HKT7qQNZ93+9eROIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709247638; c=relaxed/simple;
	bh=VnOQriAw1Coa17S6UV6rmzyCaY+V1h+WcK+1P24ob6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4QZy0+Y/XxgSncge/tgf5xIdKiIUbMXSwZHg4Dr98ZvKL376lE3NoK8BmmaX3MNIf66K1qgG2yFWbeFuPgAudMZflb5PMPCzbxjcBJPc79HYXCzdoK0Vo9lwqQR6pgF2QAfw5wTGmIwW6p6is+UK4nL6Lj5HpKNCxMaj0OYKxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBg5RXHy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBg5RXHy"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5131f3fc695so1594237e87.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 15:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709247634; x=1709852434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPcglPDpZKXCiMnjfqODdkc+dlLyv+wBuIOF4S4IqvQ=;
        b=sBg5RXHy8tw6sIBxFy6Gx11gnvdRGhhW/UY9zp61RWchjLi5TM5zUxTAeC6BndfA6n
         gOSAh5M0sc0xAofPZBl5IAT9jK7fhVyDkwT+5jXD9QjvB4cBU+SZ0xGbfZgivontXw0S
         w9qRK/+bTpql4Pc9YBt5U2TQM2JEqPW2ibKGGXQatcgZNaYy4m8Tark+tb9WPFCAs/Or
         1hJc6TQ4JFj1gQcJsxWum+LZKuESLVjyUIt5RwQ6pzxomN5JW5a9jdNTOOFKgUdqd/Kt
         V+Z8vsgppgDBlKdBGCgT4Rj2rMv4O/gUKoxUSj/TWDbCvRRBViteJbDYGmkVnWN9otbW
         pyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709247634; x=1709852434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPcglPDpZKXCiMnjfqODdkc+dlLyv+wBuIOF4S4IqvQ=;
        b=XyU2J2wWKyaIsZyR4GCNSKhsSAzAFzuPW/D/P6U6PXKqpogLTdK4iem97lFgjboO6z
         U+lCZ3u0cUB4j6q7TjwVgaMkVRmIU/d3iQRzfe7E4RL6rd5ze+sjumqyDCybQfy4jlXB
         7474J0a9J8Mpl41y7mQoESCR4UzZjXTjeneoqdGQjaGEdCylomN/PXCrQIwjFc1cWnsS
         5U4HX2XIluYTafh2E56HHH1S9TESec5xzx0oHq8Gu3Z3kIsNgNiAWI0lVIzgySfokcWW
         WJ6i4Du5umRrhojPRhcd/1V0pJDbHMUahVN6HAlk3vGisQqGZJQWqCQ3o7xZ97PoyzVn
         g8Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXnQtl3HXl+vsby/kEtiqbDcURXyKaJ7MnbtSYavYzXTMF3Li3gdZUi9xJqjiRijjICxpOJL2sCneH7S5B1wd6A4mlBVpXCzXqn8bgHp8doHQ==
X-Gm-Message-State: AOJu0YzPR9oWNz5JCGn3QJBNhMV4DEf8MaCw7sbPiuJJuN62sq0ZN7Pa
	/Mygqg1IPvrdVKnczi+X8CdVJWYYvqvToIWNoa+CCPWDP5qE+pNc876gVZRnIC8=
X-Google-Smtp-Source: AGHT+IGfPE3/Fweuarn55mKHjbvWF3M8lWjKqoI2isLfB5oU4ZXd1f3xR4iuLvkijI2P4eQEqAF+xw==
X-Received: by 2002:a19:e016:0:b0:513:17ea:e490 with SMTP id x22-20020a19e016000000b0051317eae490mr2456450lfg.61.1709247634708;
        Thu, 29 Feb 2024 15:00:34 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id s26-20020a19771a000000b00512ed2cf297sm408455lfc.151.2024.02.29.15.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:00:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Mar 2024 01:00:29 +0200
Subject: [PATCH RFC v2 3/5] remoteproc: qcom: adsp: add configuration for
 in-kernel pdm
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240301-qcom-pd-mapper-v2-3-5d12a081d9d1@linaro.org>
References: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
In-Reply-To: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6236;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VnOQriAw1Coa17S6UV6rmzyCaY+V1h+WcK+1P24ob6M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl4QyOSMUnoXjUTlQdp7XK8lQoK7qX2APAGW7o+
 dW37Ra3W7iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeEMjgAKCRCLPIo+Aiko
 1YecCACwxfTwPg58SmDNo9AXjzhY7cv6NnspwkBhGKBLKCUepA8Qk1eeOcQECcTN20Arkq0UDYN
 PVUIvy/3U90Z5G8QX8UGwnBUVoV4I3I8t0TL26RFbBVPhmjBjaJ3U5fndcayD+wo/dMCNiuaFQW
 8T0VMx2XZ6ikEvBniyUobSH8rvX9ovxB75W4GoRwIqkvCU00hpeMU939dfRWd/E+DPx40EG9E+t
 wGe2ywYbhQNSiPsFSjqJR8t1dJiK0O4ZODT5N9NDuxTFNXPQBvrtbWm8SWdnHFnvTMmb3YjIeUP
 nMlutAbZlNBIcx4j+UxzkeiCS030lrEGVRxG7rFoKouPZMWY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add domain / service configuration for the in-kernel protection domain
mapper service.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig          |  1 +
 drivers/remoteproc/qcom_q6v5_adsp.c | 87 +++++++++++++++++++++++++++++++++++--
 2 files changed, 84 insertions(+), 4 deletions(-)

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
index 93f9a1537ec6..5751bcb0c285 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -23,6 +23,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -75,6 +76,9 @@ struct adsp_pil_data {
 	const char **pd_names;
 	unsigned int num_pds;
 	const char *load_state;
+
+	const struct qcom_pdm_domain_data * const *domains;
+	size_t num_domains;
 };
 
 struct qcom_adsp {
@@ -116,6 +120,9 @@ struct qcom_adsp {
 	struct qcom_sysmon *sysmon;
 
 	int (*shutdown)(struct qcom_adsp *adsp);
+
+	const struct qcom_pdm_domain_data * const *domains;
+	size_t num_domains;
 };
 
 static int qcom_rproc_pds_attach(struct qcom_adsp *adsp, const char **pd_names,
@@ -374,6 +381,7 @@ static int adsp_start(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
 	unsigned int val;
+	int i;
 
 	ret = qcom_q6v5_prepare(&adsp->q6v5);
 	if (ret)
@@ -434,8 +442,18 @@ static int adsp_start(struct rproc *rproc)
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
@@ -463,6 +481,10 @@ static int adsp_stop(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	int handover;
 	int ret;
+	int i;
+
+	for (i = 0; i < adsp->num_domains; i++)
+		qcom_pdm_del_domain(adsp->domains[i]);
 
 	ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
 	if (ret == -ETIMEDOUT)
@@ -690,6 +712,8 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->rproc = rproc;
 	adsp->info_name = desc->sysmon_name;
 	adsp->has_iommu = desc->has_iommu;
+	adsp->domains = desc->domains;
+	adsp->num_domains = desc->num_domains;
 
 	platform_set_drvdata(pdev, adsp);
 
@@ -764,7 +788,56 @@ static void adsp_remove(struct platform_device *pdev)
 	rproc_free(adsp->rproc);
 }
 
-static const struct adsp_pil_data adsp_resource_init = {
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
+static const struct qcom_pdm_domain_data cdsp_root_pd = {
+	.domain = "msm/cdsp/root_pd",
+	.instance_id = 76,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data *qcs404_cdsp_domains[] = {
+	&cdsp_root_pd,
+};
+
+static const struct qcom_pdm_domain_data *sdm845_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+};
+
+static const struct adsp_pil_data adsp_sdm845_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.ssr_name = "lpass",
@@ -779,6 +852,8 @@ static const struct adsp_pil_data adsp_resource_init = {
 	.num_clks = 7,
 	.pd_names = (const char*[]) { "cx" },
 	.num_pds = 1,
+	.domains = sdm845_adsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
 };
 
 static const struct adsp_pil_data adsp_sc7280_resource_init = {
@@ -794,9 +869,11 @@ static const struct adsp_pil_data adsp_sc7280_resource_init = {
 		"gcc_cfg_noc_lpass", NULL
 	},
 	.num_clks = 1,
+	.domains = sc7280_adsp_domains,
+	.num_domains = ARRAY_SIZE(sc7280_adsp_domains),
 };
 
-static const struct adsp_pil_data cdsp_resource_init = {
+static const struct adsp_pil_data cdsp_qcs404_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.ssr_name = "cdsp",
@@ -831,10 +908,10 @@ static const struct adsp_pil_data wpss_resource_init = {
 };
 
 static const struct of_device_id adsp_of_match[] = {
-	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_qcs404_resource_init },
 	{ .compatible = "qcom,sc7280-adsp-pil", .data = &adsp_sc7280_resource_init },
 	{ .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init },
-	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
+	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_sdm845_resource_init },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);
@@ -846,6 +923,8 @@ static struct platform_driver adsp_pil_driver = {
 		.name = "qcom_q6v5_adsp",
 		.of_match_table = adsp_of_match,
 	},
+	.domains = qcs404_cdsp_domains,
+	.num_domains = ARRAY_SIZE(qcs404_cdsp_domains),
 };
 
 module_platform_driver(adsp_pil_driver);

-- 
2.39.2

