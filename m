Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BBA233933
	for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jul 2026 04:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783742686; cv=none; b=BRhvi+P3iU5MWX+xv2qOIPWKXP66bkS2LL2TT2ZoHOg293LB/IhJ7JgD0HBNDebzzBzTBHcy+IL+foRYGzc2V97db1K+72ClgD31x6203Dv9xKBKZMsLSiN6gaNu9n1TCP0yi/JuWGxc9mAlmUr2xVlKa/7AbKp/RWc85lGsxYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783742686; c=relaxed/simple;
	bh=HpWBYzWHYiYkBzSWN/4r+9mOgVQY27kP6NIPJIN3Va0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l5DdiXdFrAB8B7p4ip18o9qJoC3YZj+VJb++tRMvdBD48a9XeG6tqUz1Hzwp3bg0eheMlLiRx+PpYhEqMypq43hS+dYZcaz5ks7RAaVLVWhoAvKtAe38cJCR+6x65Jq4zS5ScP/qKzLZqNqVeLXIltwAOyPz75fyDyXkS33HDiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrSeZKIS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+U/RqSU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrSeZKIS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+U/RqSU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B40qPd2648685
	for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jul 2026 04:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cy8uSUWvI/4++ENUPHrBjw
	xaVkdkSIrZafK16KXXntw=; b=ZrSeZKIShCtcmpT4mN79aoGKR8f7XUePGW6M6Z
	xFmZXJn+DMPDQRyiecc3hhZNoqO/+qpDuTXWaxEgVwBKAo9V0JOyRT+/IRiluVQb
	aZWXKfKwowCDAA9NRGsv5zXyS0xu4LpJW4VC2FnIX8FZtFWtMJc2KsyFqApGw6Ra
	QmnqT8F87tc9GIhuTacKl2teZ2lrbLCSGSe4J+z5KK+DDq5QEeOsX8x9LY1uMcdk
	SdA+rZ77CS1RtXODxprX5u+gzehz0EnwRwlmQ6j9Ov/2yCLgOuHjHMRqSShWDtJh
	pnK+nrM0LgG+6N24gImxWTyCHu8UUhwvojJuZnwm0QnqPHJA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9g095-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 11 Jul 2026 04:04:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484739a9cbso2539579b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 10 Jul 2026 21:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783742683; x=1784347483; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cy8uSUWvI/4++ENUPHrBjwxaVkdkSIrZafK16KXXntw=;
        b=b+U/RqSUKn1RaMXu+wgRZidUGAgfcL/bL4QHovp3htTzMme0RsVpV2RZAfIeCTSRg4
         ytZLVE01EbCYY1kjSUqPpmb9LbpIGgZ20k61laotY1O6Ju3rseSscP9L4qj33xBDhtrA
         roWPuMu4nZR7P+lN5e4oVTjDz9bfKKuoAY/Lf7K6X/aGCRAlFKJM5DGUITvja+Fb5WJ/
         g+G0X9J49NVxx+djXBpzHktd+C6ZIthbVhcYoVRdNqzUItDF4S7yUOJIsEks/jSUO/oF
         WbN4rtTgrqLJXmO7UaA9AbZbSqh+wI7OgZnehais09T4xa3KGM64WTLnjdKQu7jD/z0q
         DFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783742683; x=1784347483;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cy8uSUWvI/4++ENUPHrBjwxaVkdkSIrZafK16KXXntw=;
        b=cxZ2aVcyncCxVzz+kwjMBnJtg7MvuI4QkjMWHBlKwbK5U4jWh3MyM9d35QhSoLqZeO
         4qoLbnfoT6DYxxOWDVt23Xuij/UHX5zRmBMATQuLjtvYmcVE/w826VN8vP/2+/QfkgKh
         04AAkk8L6B3YQjrj7gSH8O/4Hqtn+xNZ/ngp5KbmO2ImDgSCbLIxgeqILk6+D2wlNoeG
         9gFW9TvTUGBoqj8ctu3GrHLsvZN1QQskyZWWHX0FQ9u/7TxenEeEePt9ttDdpi8Mmo2w
         itYFx/X5fhTA/64kbjCTd7R3kisVUZcsHzEkM9/8yK5GvPJXypRX5Fi36mLWKCA6zB2w
         FvDw==
X-Forwarded-Encrypted: i=1; AHgh+RpFY99UyTZOfU4z7rASP8NHCN5jQvN3LkRwVYxO4kgLbxkTegiXoNqCyG7EeJ1deMfZ2SdjkqjXTjJO3GcJXpMC@vger.kernel.org
X-Gm-Message-State: AOJu0YzvEcHrH/ORwv+tQhrVdsZH4KWRHVWL0G3xPv2XE9EkzfWlCE/t
	qAk0O+wMjc9B/Oq/7GLCsxT0g7LRX5ucoLG3GduOba3Hsz00i0swEW+VDYZpAtdUxxw7oz+HPqC
	keplYxyDLYVy5kjuW0f1u5QrRTI5zLEx8XWfRbYiNyX21YyS9+din9F4PBRlPrAzQJER+3uxm
X-Gm-Gg: AfdE7ck+dfP8TCvF4zvW/0ZT3Zr8EiH/S8YTJMXJ1Bc3tFaIAxPCUBDtX9WOTE0K+WL
	rw1TEiYZgK1KotPbQBgc0gqhDebHhnxCvdVsqot2f4fCw4LTPD866C1QZWkVp/ThZaiNX7cLKkV
	1FrSoWPZAQmoNZpmN29EnyUq34ofGpF2K/ZrjZbxW+9thkW/9gUaJ6+gBNAtgzgN0ZrSiNK/CAX
	EYKP1IbCWEZC6uNOo7ftRknT/s0PzVk6eTrLpr6TaECkpNCwlzxqcOgmAhgoYmFSU3FmieL4U1C
	vRcmZKjMp94q2n+/VxPM5KOaUguuFfibomJwhKE1zYjLaXl7LDONNn+dJuPbGcEXj1KI1+cOFI7
	HPD5hoJaiV2n981jZFXmZZeebMDCkDNqu7KUAeU40Bo0n5Og=
X-Received: by 2002:a05:6a20:12d1:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3c0f093fb96mr7270314637.14.1783742683054;
        Fri, 10 Jul 2026 21:04:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d1:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3c0f093fb96mr7270294637.14.1783742682612;
        Fri, 10 Jul 2026 21:04:42 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm43386913c88.15.2026.07.10.21.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 21:04:42 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:34:18 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Create platform device for
 BAM-DMUX
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-q6v5-pas-bam-dmux-v1-1-1e9231143b79@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMHAUWoC/x3MPQqAMAxA4atIZgO1YKteRRyijZqh/rQogvTuF
 sdveO+FyEE4Qle8EPiWKPuWUZUFTCttC6O4bNBKG2WVxXPaPZ7mrvGgiCN5dP56kKpGu9bUpDR
 Bjo/Aszz/uB9S+gBf6MDWaAAAAA==
X-Change-ID: 20260707-qcom-q6v5-pas-bam-dmux-a182d965a02a
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783742679; l=3008;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=HpWBYzWHYiYkBzSWN/4r+9mOgVQY27kP6NIPJIN3Va0=;
 b=6N8oRQRiYif0XgZ6p8CYRebveeG3YiPeAUfm8/EZ1dUKnphWtiIyzFDv8eZKz6rVD8Y6SyOYJ
 tlKfUwFZVtcAV0zDNk26sC3vqV3eE4mbMwA4EjgH++gVdmyR0w1WxS4
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAzNCBTYWx0ZWRfXznLEgCwk2eDK
 uHsfnPquI/H3c6DJPXOyFCDKUdNJIaMCZFSjwsbZy5/JVjfsYhnb6YCamZwApah2G5sUXP+1Gxu
 2HIjRh4Gbc0Bm5pT4Sy87+dhU8IcN6E=
X-Proofpoint-GUID: XVuVo2cpQgj3m0CvXInlLn8rg-gMAQUO
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a51c0dc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nxsA-RlP2EFdYciYeb8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAzNCBTYWx0ZWRfX61C21053dv0p
 GFr4rZjdv8GpBj5lWx4C6ECSbbj4P4C7kbQAmgKR9XxVqyM7oARSL3j976Xv7hWb5tBeyNwHx8W
 3iBAXGeAEOVbxnIRzaOtDBtjXfmtJn4ovQ70QW3ypElSpsngOfkak1VZfuEAEYWFpGqxJPUoRQr
 kf+cKV9CVXK+v8M6AJbrKXoFM0I8G4u7midEC3/HFpiUNAz4FIDuAIpnTT/LDCI/YCHLaWra4gT
 hdVGxYANOnRolq2f6sz6vAV5WVAbcOYXxCyyQADAc4O74GROy34CoeyyCTSUgAG4ufZkkuJJSJg
 H4UGFZRKkqW5yDpI5Rt5FVynhFtS/yGluxZa6RMuLxEJK8zRBvoHzTpTO3yjBQbQB2Jc+h4Cd95
 w3x0HSSAruDmKFGR5LXEI7Lj8jCEgKySuyllZcgyBYPx/91rbMcvGGasgpWlQ+SPMl/o31/Azo6
 waBmABqAoh8JGPgtLzg==
X-Proofpoint-ORIG-GUID: XVuVo2cpQgj3m0CvXInlLn8rg-gMAQUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110034

Some Qualcomm SoCs using the generic PAS remoteproc driver (e.g.
Shikra) implement the BAM-DMUX protocol on the modem remoteproc to
expose network data channels. The hardware/firmware resources
required by the BAM-DMUX driver are described in an extra device
tree node below the modem remoteproc, with the compatible
"qcom,bam-dmux".

qcom_q6v5_mss.c already creates a platform device for this node
(commit 59983c74fc42 ("remoteproc: qcom_q6v5_mss: Create platform
device for BAM-DMUX")), but qcom_q6v5_pas.c has no equivalent logic,
so the bam-dmux node never probes on SoCs handled by this driver.

Mirror the qcom_q6v5_mss.c approach: create a platform device
specifically for the "qcom,bam-dmux" child node on probe, and
destroy it on remove. of_get_compatible_child() returns NULL when
the node is absent, and of_platform_device_create()/of_node_put()
are NULL-safe, so this is a no-op for the many PAS-based SoCs that
have no bam-dmux child.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 808e9609988d31ff9d18b441914f761192909904..53c839ecc417eba2c53566011f174f3bf811c443 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -114,6 +115,7 @@ struct qcom_pas {
 	struct qcom_rproc_pdm pdm_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
+	struct platform_device *bam_dmux;
 
 	struct qcom_scm_pas_context *pas_ctx;
 	struct qcom_scm_pas_context *dtb_pas_ctx;
@@ -735,6 +737,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	const struct qcom_pas_data *desc;
 	struct qcom_pas *pas;
 	struct rproc *rproc;
+	struct device_node *node;
 	const char *fw_name, *dtb_fw_name = NULL;
 	const struct rproc_ops *ops = &qcom_pas_ops;
 	int ret;
@@ -856,6 +859,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_ssr_sysmon;
 
+	node = of_get_compatible_child(pdev->dev.of_node, "qcom,bam-dmux");
+	pas->bam_dmux = of_platform_device_create(node, NULL, &pdev->dev);
+	of_node_put(node);
+
 	return 0;
 
 remove_ssr_sysmon:
@@ -880,6 +887,9 @@ static void qcom_pas_remove(struct platform_device *pdev)
 {
 	struct qcom_pas *pas = platform_get_drvdata(pdev);
 
+	if (pas->bam_dmux)
+		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
+
 	rproc_del(pas->rproc);
 
 	qcom_q6v5_deinit(&pas->q6v5);

---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260707-qcom-q6v5-pas-bam-dmux-a182d965a02a

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

