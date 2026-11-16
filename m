Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794844258;
	b=mrrRaK/oRfaXTMWC5aPikxWTP38gyOEeDto6JW+WQLPQALdZnnBCBddnjKgNLcb4yIcz
	 ILMIlOyiV0zqSAVYAqSfHIz5cqNqz3aLFrhuyy3GERNmelt3eHXUojJI56JlQrmBKVe/Q
	 lqjC1PuH9Ry2/Xk4NGaJA7DBAlGojUG9nAsQ6jhsRzDP/IA1xWaJ5sCQtz2EMXulkBBjW
	 9qN/UvGEv+cHY1t5jgqLAJm7NoQyrDpeM/mO4C9uGPlkn4qy1mfStu9i58eVq1zDmhiOl
	 oPwj53XVwU+xD0hCJ8j8J0JaCn8LL0K+TNL7FKbdDBk6X8Pt2y8Vxjg4hp2mNymjxrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844258;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NFYTEVwUBh6mmSdP2BVJJwhHCUzO3ElTCEe1TC7PL/Y=;
	b=Q9fwMXmPmqDwgeUoZ4spvSGwzq6dzK0cAGQBGXCmdVzmKXtalP0En44kdEq7cfbTDTa8
	 70OLRrrX1/bDvnaVTjX5j3wSTUxUkU/FSaay4uLXZoiui3g3+mSGnOCOdZmYg0xI+54FN
	 9uwsIJx4hVidMwhioAmQ/vdQJsqw1MA6fsA17I9BUEiJOh/uUnFz3S6ybz8IaenTgDgw2
	 4P/mSi1sZddCnCujUrxmxBz7rA6hv/BEFacbT+DOJXXI3KYRZeZKyQ5vqqAn0LxsvryCP
	 sHQmZ5Wf1l2m7ys/4sOFOd2hri9s82lVdVKBDC/HKBKjXaG8ZM7LhH1XsPeDatIvw3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkZoGBUL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730D7606A882;
	Mon, 16 Nov 2026 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FkZoGBUL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794844258;
	b=m3R3csgAE1GTNx/+YzJlRgHMOCKRZrg9lxzeY9QOM+PzeCMk2HnJe39c8Qwy/kt4Vd5s
	 lGX/D2UqM6nvAvATCm/hKoeeqAZxoZWqsK3PS7EtJ+Jb2XCC+b8mV3vm3hTa0xkeJWKsQ
	 1o+B8Y14RJv6SNwi1oZXyvQeO+GlfBKJlf2GeP2AIsogHsC42HM2TSTOjX03kRzldm0j7
	 ZDQdWxeOoBK7ACLyvtnE26V5Hv8SNhm0zk97WCH7kRSNNKa/MSXQBZ7FojmnyJ4sirYLO
	 MwgPWJSbss+B9BZFGcyEK3PvqUS6Ir8ykG+W8JYaNaWEcRsPqoOHzQIASuW2wdaSN2Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794844258;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NFYTEVwUBh6mmSdP2BVJJwhHCUzO3ElTCEe1TC7PL/Y=;
	b=bF55xMcdGkolqN4M0Mf+IwH27s2KquNkipuS7Ep8xPGL6rZz6p7ITbXSCa3wFI89TyXF
	 ChkRImimvDc4FLMlO236wPDkl1hUELeSnbQjLPybNAFBkg0UWbtM4jTY9Tb1UbKa/AISH
	 5PKPb9P/8hFi1TKBkSQZBOMqoY8Uz/0E6L1Fy8sVLuSjE7Y/dvO0Nk68kkvPDMaTUNelF
	 Z2y3tn7zymyPUtlq+HCesdAQMwr2T+KnZo1j5pDVt5grHfPq44eHhXS8XcbnhuXwkapmR
	 AgMezO1NlNJF9/rwnfHbsU9Pso865f+qKJV+1DrUsCiIyf+oCkGMMgsMDqyXm2a9mKw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F1571F000CA;
	Mon, 16 Nov 2026 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844258;
	bh=NFYTEVwUBh6mmSdP2BVJJwhHCUzO3ElTCEe1TC7PL/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FkZoGBULSgvSL5sKZQ/NQhuZA1WDSM69vQfSLAo7PArbb15iiIi8TSu8b5onet+10
	 RhRa5wBrb6YoWEhz+5gcyVLmi18SaBqpxCH/m+VIHcP0Yq06DgO2zK8QvEW7b1ozcH
	 eZNKf805a79u+PQ4UxMEgPYK4d0mQ222Jak6KILSITR4T0FTwSrxJcVZkfREEObMbt
	 AQGsDYw0pvLwBGJ0xEvbGyWIOp4/HrjNLnRYDbnprwaCFqjavm9bwCSj8L9i7Ks/lt
	 cvwCQWlEphIPt64xneZlZUTLPzXCc1FpNntLxqROnbfwfwSNe/SBAjkPk+piUtAEZT
	 CEPUYZVu7f2ZQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A347C4A4F8;
	Mon, 16 Nov 2026 15:50:56 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 16 Nov 2026 16:50:44 +0100
Subject: [PATCH v3 2/3] remoteproc: qcom_q6v5_mss: Publish socinfo for
 Pixel modems
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-modemsmem-v3-2-24ebc7ed6eb9@ixit.cz>
References: <20261116-modemsmem-v3-0-24ebc7ed6eb9@ixit.cz>
In-Reply-To: <20261116-modemsmem-v3-0-24ebc7ed6eb9@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Miro Mraz <mraz.miro@seznam.cz>
Cc: Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5814; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=RwIpafmzT0uNWBF3Nvx6g7u04fLCPqObCGKjspl4C0I=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq+yZfxGoYmj7ZU7NGjvRKdLI7GxJj4I2EElBW/
 mKkcpn398KJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavsmXwAKCRBgAj/E00kg
 cgsWD/40nzeSboMn70E0bkKamrMeAAnRJFC/Jn1K+JN9+9hNpjlhBHq626/rK2gqJP4QRZZVLzZ
 Ai6YVcoMO7fg98MoT90Hlv4FJoFd30nSLJvaLvilFXeAMcZjc03TFYshI9HsuDqU1bhMV0Z+PS+
 r0OXWnklfz8NwDiIFwLWBbKO7Do5voQaQyL4DB4/a4UMzGFBD++AupsoLqbDdA6sp6Ndl7hklUz
 JM/KHYyVY5RTEFOmA+X8P/CDCMFWHwn8lJklh7R5OBokozwkD2u67j1cXC2RILWzTIngvfVqCAr
 GyhXaJZZZonwOJItg8fI65n7xI5lH2ZI9fGun+z4e7H3E/3Tx4dqRReY1klkTqtv2vjX731JyZ1
 G3ZUsYChV5bafBmWWJ9PT1Ds8tfgQ7bs8xBatJ3He9rqixuXgnOMKqHjDHhtx9jUqEG7Qui2TbH
 l7fvI54NZJYyXzapDOvdZld7wXrEwskYKknTydZKnW+3zFtgks2wyQNWZ8zqOHuXNzqifuwAgth
 S8NwyXJbY07WuCjca+RXhrw7QdtH8hql2gP4uyUvJ2zHdogiqFkUoCdv2hIY/1IFCukNUwBkt8l
 YuDiLM2ALOF4YBavpiVzQDC16jedyQCpw2GvDfoe9OT6C7Z/qY1WKZSSBF78n6jaOl1jvdPsiTa
 U7uoy0MLgnE1XHQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

The modem firmware on Google Pixel boards (Pixel 3 through Pixel 5a)
reads the SoC platform type, subtype and revision from the first
vendor-reserved SMEM item (item 134) when it boots, and refuses to
come up unless the application processor has filled it in.

When the "google,require-socinfo" property is present on the MSS
remoteproc node, copy the relevant socinfo fields into that item from
the socinfo SMEM data before starting the modem. The SMEM item id and
layout are a contract between Google's downstream kernel and the modem
firmware rather than hardware, so they are hard-coded in the driver.

The item is written in full: modem_flag, efs_magic and ftm_magic are
left zero. Downstream fills modem_flag from a bootloader-provided
/chosen/cdt/cdb2 property that is not always present, and the two magic
values only matter for factory test mode.

Based on work of: Richard Acayan.
Adapted from the original form using both human & LLM work.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 75 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index dd052a62b8583..53deabea62259 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -23,27 +23,35 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
 #include "qcom_pil_info.h"
 #include "qcom_q6v5.h"
 
 #include <linux/firmware/qcom/qcom_pas.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 
 #define MPSS_CRASH_REASON_SMEM		421
 
+/*
+ * First vendor-reserved SMEM item; Google's modem firmware reads the SoC
+ * platform information from it when the modem boots.
+ */
+#define SMEM_ID_VENDOR0			134
+
 #define MBA_LOG_SIZE			SZ_4K
 
 #define MPSS_PAS_ID			5
 
 /* RMB Status Register Values */
 #define RMB_PBL_SUCCESS			0x1
 
 #define RMB_MBA_XPU_UNLOCKED		0x1
@@ -247,16 +255,17 @@ struct q6v5 {
 	bool need_pas_mem_setup;
 	bool has_alt_reset;
 	bool has_mba_logs;
 	bool has_spare_reg;
 	bool has_qaccept_regs;
 	bool has_ext_bhs_reg;
 	bool has_ext_cntl_regs;
 	bool has_vq6;
+	bool need_socinfo;
 	u64 mpss_perm;
 	u64 mba_perm;
 	const char *hexagon_mdt_image;
 	int version;
 };
 
 enum {
 	MSS_MDM9607,
@@ -1668,22 +1677,86 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 						false, true,
 						qproc->mpss_phys,
 						qproc->mpss_size);
 			q6v5_mba_reclaim(qproc);
 		}
 	}
 }
 
+/* Layout of the vendor-defined SMEM item read by the Pixel modem firmware */
+struct modem_smem_info {
+	__le32 version;
+	__le32 modem_flag;
+	__le32 major_id;
+	__le32 minor_id;
+	__le32 subtype;
+	__le32 platform;
+	__le32 efs_magic;
+	__le32 ftm_magic;
+};
+
+#define MODEM_SMEM_VERSION	0
+#define PLAT_VER_TO_MAJOR_ID(v)	(((v) >> 16) & 0xff)
+#define PLAT_VER_TO_MINOR_ID(v)	((v) & 0xff)
+
+static int q6v5_socinfo_publish(struct q6v5 *qproc)
+{
+	struct modem_smem_info *info;
+	struct socinfo *socinfo;
+	u32 plat_ver;
+	int ret;
+
+	socinfo = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
+	if (IS_ERR(socinfo))
+		return dev_err_probe(qproc->dev, PTR_ERR(socinfo),
+				     "could not get socinfo\n");
+
+	/* hw_plat_subtype was added in socinfo format 0.6 */
+	if (le32_to_cpu(socinfo->fmt) < SOCINFO_VERSION(0, 6))
+		return dev_err_probe(qproc->dev, -EOPNOTSUPP,
+				     "socinfo format too old\n");
+
+	/* -EEXIST: the item survived an earlier boot */
+	ret = qcom_smem_alloc(QCOM_SMEM_HOST_ANY, SMEM_ID_VENDOR0, sizeof(*info));
+	if (ret && ret != -EEXIST)
+		return dev_err_probe(qproc->dev, ret,
+				     "could not allocate modem smem\n");
+
+	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_ID_VENDOR0, NULL);
+	if (IS_ERR(info))
+		return dev_err_probe(qproc->dev, PTR_ERR(info),
+				     "could not get modem smem\n");
+
+	plat_ver = le32_to_cpu(socinfo->plat_ver);
+
+	/* modem_flag, efs_magic and ftm_magic are left zero */
+	*info = (struct modem_smem_info) {
+		.version   = cpu_to_le32(MODEM_SMEM_VERSION),
+		.major_id  = cpu_to_le32(PLAT_VER_TO_MAJOR_ID(plat_ver)),
+		.minor_id  = cpu_to_le32(PLAT_VER_TO_MINOR_ID(plat_ver)),
+		.subtype   = socinfo->hw_plat_subtype,
+		.platform  = socinfo->hw_plat,
+	};
+
+	return 0;
+}
+
 static int q6v5_start(struct rproc *rproc)
 {
 	struct q6v5 *qproc = rproc->priv;
 	int xfermemop_ret;
 	int ret;
 
+	if (qproc->need_socinfo) {
+		ret = q6v5_socinfo_publish(qproc);
+		if (ret)
+			return ret;
+	}
+
 	ret = q6v5_mba_load(qproc);
 	if (ret)
 		return ret;
 
 	dev_info(qproc->dev, "MBA booted with%s debug policy, loading mpss\n",
 		 qproc->dp_size ? "" : "out");
 
 	ret = q6v5_mpss_load(qproc);
@@ -2127,16 +2200,18 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qproc);
 
 	qproc->has_qaccept_regs = desc->has_qaccept_regs;
 	qproc->has_ext_bhs_reg = desc->has_ext_bhs_reg;
 	qproc->has_ext_cntl_regs = desc->has_ext_cntl_regs;
 	qproc->has_vq6 = desc->has_vq6;
 	qproc->has_spare_reg = desc->has_spare_reg;
+	qproc->need_socinfo =
+		of_property_read_bool(pdev->dev.of_node, "google,require-socinfo");
 	ret = q6v5_init_mem(qproc, pdev);
 	if (ret)
 		return ret;
 
 	ret = q6v5_alloc_memory_region(qproc);
 	if (ret)
 		return ret;
 

-- 
2.55.0


