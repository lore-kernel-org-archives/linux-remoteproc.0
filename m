Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B24313E34
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000591; cv=none; b=bEd9XEGHq8+TA6FQ5eWnc3vM467VS8ir/+5x4xD0ZdNO8zGkSoAHxxuIZ31RMEmuKCC6g1z91MuPUMr7lwMOAWocmjtUzC/smZNtQjvIXbYyRSgK5bN5C1ZCPzCafq0//sSqe6u85IrTXtIaV+D+OTbhzzdKyDNokoouBJFnHl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000591; c=relaxed/simple;
	bh=uXwyXvuaQR7b3/fi7jqzH0GQBWBRgTTMqz4fddg0ZkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7FViZdx6dsc2LVKL5EcSZhYNxQY0lFX1au5lhVf91CngyX8bJ1+Qiont4ZbuyI65OCcRxe0oB3blIYM1yUcFr92iCwN80Mwet4VRZMB8J7SPVh3PjOG/N6UHbKixzFsi1ZNj+0NBOEqr+It8h3P8UAV9tu5Z7wYdjM7/fUh6X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFT8E2cO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBmY3UFw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFT8E2cO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBmY3UFw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599wsdm2311513
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 10:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h55UH12lvi5
	qvyEigfzQK2YfBNXbPcu1QXY1N2+KKxs=; b=jFT8E2cO0n5l+K+kyNE9tMAtkO+
	VJGvA9nZnxZoyZfOdJGFtLAfBqiYwmhAHrtJNfXOiCl3hHbg/zO5B2xt5MJFuGtG
	tAmp8W5ojoszhWGOcBIqDmh1U5SgK1rbEdFddP3NkxsbGv6TbtpuMgFH6fZdbax3
	sKF12ckZ9P2OKXr5VLGvtkP8Xqkozy2BAV1tFcZlJlN3FN2eoymskJxnwSCXgLEu
	sRuo7BdrOEXFTGdxlzQq9z435xh8TU1YbFviag5kf9CBkWLmRiW06058Blj/RbqY
	CftS5gyqFsm8vdtZX7H5kxZlT6Ilwp7xEoDJC39eyv6xkPdAPH/Ub2KfXVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v07pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 10:23:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf335549b8so82745185ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 03:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000587; x=1781605387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h55UH12lvi5qvyEigfzQK2YfBNXbPcu1QXY1N2+KKxs=;
        b=VBmY3UFwDp+BA+v0GkTZyTY1gvA/BPSn+q67frtduTDSMc295HsZIHXF1C20bMJ0s5
         z7xuD/JJpkWYFCDVXj74RY8yesR3Rea+6diXr3WN3UauCPXv8lWkl5uQc7sqsOTZU8xU
         WPgOZ3tdf1dlI6C8M8JZBxtWt+wRTSycUDz8OpAHv3PphYPrgbx+IPXYaViVvCHbXEts
         /JpdmEfGNrvXAt31qp0DUrPfoNsgRpXWufKKckCGhFO80QZEj2yml2eUPwaR7hVtFQmM
         GuXLZFah+xsDJfP+/DgG7KHh1dOrERZjNhYwr8bqGeC/ZrVEtGibR/EKRx623NXw8YaA
         fzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000587; x=1781605387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h55UH12lvi5qvyEigfzQK2YfBNXbPcu1QXY1N2+KKxs=;
        b=bSxe53LmzAYf1iu5foClMpjUU0OIXr7WHXPmGqrlWcx9UiqTKsIOS6J07++ZwD0ANq
         6MvbM0z6tWzoDQETVmNX/5VYL8YJkCg9NNQYgH5V2ZwGA0g3dhjp51aWXkfKaSxhFTp5
         1mXuozXhR4LBzi9ZtarCF1UOa85511T6G+2qazTo1zkG26GI0adhrevJSyl+trKxO2Eg
         vhpdMk+8jciyZD0cyPgRNdEOas6gRNPeHw8ude69EPLTLJ44vxNX41KF84FPSRbZ7t+K
         ZZ4bW/f7n0zUzrAuRtJszWNrS1yPtB/8BRSnEUTGyU4WeO+nEcHiW8AYC5ahiHq5na3z
         jlxA==
X-Forwarded-Encrypted: i=1; AFNElJ8pArQ9eUhgDmyxWvi60Zh2LsPAV43YKb+KUjptf4dXL9HbmRLei/tyeibmjrFWvp8c5xo98B4LEl5IttxQRz2Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5PuXyYoVqhcyCTELqwXpiq2GPmguUQvnasQG9Tk+QEVyMwPzo
	RSbUzBqyBf6O+mX42QEUaHUsjQu6snJ2Qo7CPhBn+gpBdE6rR1h4ko0/ZMDx9bs4RYHp4XZVItF
	CD9SIvVAyTd5EJ+idpv3Nf19/8mEhDsoEgvVN783NHgtQilBOEylZCiZOG7RL4RQO7feB+W5I
X-Gm-Gg: Acq92OF6NcurApvyvETUS3dPMtumP7gbcLM5y0p8LkUL+eRR8P8nFNCxUJX3xos2u9o
	1WtMGz9L2mCkcqce3DHQdb/29ULcttGvTuot2ueIeaPQG1DEKH/UyqsCQWvlBYcTKrND81yAjRP
	NNz4R20N41kU7sxhH3ZkXZjUjGKvnW0TngsajW06MreC3lytC2hBi3N5qz3IJWQ9hjDjBLf6/Hs
	5fmfij4ujrm2NK0R1e8Yf2mvFvvHkKCcQVZ3605rO03jWarHRTEujI+E3CV51TkBEvsBHHA/Ab3
	2nlg2lliQRPuI1Wok4ns+PThmG0EYzKCM8qpdbV5n5bBVcO0lJKet8xdYF2DfBwR0TPpLLChVa5
	4DzJCOIcs84hed9wZbb/E/MDDnfAijNEVQBbTYdNK3RwjtIo+XWS2npTz9k4=
X-Received: by 2002:a17:903:8ce:b0:2c0:b4f5:41ea with SMTP id d9443c01a7336-2c1e7e93bf0mr204077465ad.17.1781000587138;
        Tue, 09 Jun 2026 03:23:07 -0700 (PDT)
X-Received: by 2002:a17:903:8ce:b0:2c0:b4f5:41ea with SMTP id d9443c01a7336-2c1e7e93bf0mr204077095ad.17.1781000586575;
        Tue, 09 Jun 2026 03:23:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e86dsm213121685ad.8.2026.06.09.03.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/3] remoteproc: check return value of subdev stop and unprepare callbacks
Date: Tue,  9 Jun 2026 15:52:51 +0530
Message-ID: <20260609102254.2671238-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
References: <20260609102254.2671238-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a27e98c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KgjLDdhTq4KzWEx1KCkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: szs4ZRAd7pPn8jQ4w7xs2lxCiDAW_TA5
X-Proofpoint-GUID: szs4ZRAd7pPn8jQ4w7xs2lxCiDAW_TA5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX6oqVvV12v7cG
 Ka4AAXoLXy5Q7BXCtyd04vYuaj87EMsUpASKSfgNkch4pMjuoVpkNaTQx0r/Wahpja98fIe1V4B
 QcI1sR22Le2izuqyZ/Y18PvXyTTMK/UdvNmejfWgWYtp0PTPPOHKER2+CXg5a6mT5uxEzOR7r0S
 jFLiFP7+rS0ZwHuXRK5Y0NmX77GwLO8hCmszafQlKw8tIXOGiuyC2lEc3tfWJf7aipW2deodar8
 SaEHtnoHs+8y5x+PKCegFGJPSXnU7dLESaNh36SEHWeEn7SvhBr67kEH+Ote1Fc7C6+opXodGEy
 OeLOfBNJaQFMzaD+SOZdOFol+Z1K4EaIWPIiu41RVFnJ9aAGvDvTcTZPHDnhn9TVKNVgx/TzKhk
 PuUnmvPm/a8So7Byu00PguUGeUlp2Q66Wy1UClecssMVDgCvWLj59bhYP2LBuqGUdriVQOCrX63
 gm5tiyx8PdzbzoUg0ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097

The stop() and unprepare() callbacks in struct rproc_subdev were void,
making it impossible for implementations to report failures.  Unlike
prepare() and start() which already return int and have their errors
checked, errors during teardown were silently discarded.

Change the callback signatures to return int.  Update
rproc_stop_subdevices() and rproc_unprepare_subdevices() to check each
return value and emit a warning on failure while continuing to visit all
remaining subdevices (best-effort teardown).

rproc_vdev_do_stop() propagates the error from device_for_each_child()
which it was already computing but had no way to surface. All other
implementations (glink, smd, ssr, pdm, sysmon) gain a return 0 as they
have no failure paths.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c       | 26 +++++++++++++++++++-------
 drivers/remoteproc/qcom_sysmon.c       | 10 +++++++---
 drivers/remoteproc/remoteproc_core.c   | 16 ++++++++++++----
 drivers/remoteproc/remoteproc_virtio.c |  4 +++-
 drivers/rpmsg/mtk_rpmsg.c              |  8 ++++++--
 include/linux/remoteproc.h             |  4 ++--
 6 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index fd2b6824ad26..05a599318763 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -216,19 +216,23 @@ static int glink_subdev_start(struct rproc_subdev *subdev)
 	return PTR_ERR_OR_ZERO(glink->edge);
 }
 
-static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
+static int glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
 	qcom_glink_smem_unregister(glink->edge);
 	glink->edge = NULL;
+
+	return 0;
 }
 
-static void glink_subdev_unprepare(struct rproc_subdev *subdev)
+static int glink_subdev_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
 	qcom_glink_ssr_notify(glink->ssr_name);
+
+	return 0;
 }
 
 /**
@@ -327,12 +331,14 @@ static int smd_subdev_start(struct rproc_subdev *subdev)
 	return PTR_ERR_OR_ZERO(smd->edge);
 }
 
-static void smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
+static int smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
 
 	qcom_smd_unregister_edge(smd->edge);
 	smd->edge = NULL;
+
+	return 0;
 }
 
 /**
@@ -465,7 +471,7 @@ static int ssr_notify_start(struct rproc_subdev *subdev)
 	return 0;
 }
 
-static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
+static int ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 	struct qcom_ssr_notify_data data = {
@@ -475,9 +481,11 @@ static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
 
 	srcu_notifier_call_chain(&ssr->info->notifier_list,
 				 QCOM_SSR_BEFORE_SHUTDOWN, &data);
+
+	return 0;
 }
 
-static void ssr_notify_unprepare(struct rproc_subdev *subdev)
+static int ssr_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
 	struct qcom_ssr_notify_data data = {
@@ -487,6 +495,8 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
 
 	srcu_notifier_call_chain(&ssr->info->notifier_list,
 				 QCOM_SSR_AFTER_SHUTDOWN, &data);
+
+	return 0;
 }
 
 /**
@@ -572,16 +582,18 @@ static int pdm_notify_prepare(struct rproc_subdev *subdev)
 }
 
 
-static void pdm_notify_unprepare(struct rproc_subdev *subdev)
+static int pdm_notify_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_pdm *pdm = to_pdm_subdev(subdev);
 
 	if (!pdm->adev)
-		return;
+		return 0;
 
 	auxiliary_device_delete(pdm->adev);
 	auxiliary_device_uninit(pdm->adev);
 	pdm->adev = NULL;
+
+	return 0;
 }
 
 /**
diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 913e3b750a86..44b905a7e129 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -531,7 +531,7 @@ static int sysmon_start(struct rproc_subdev *subdev)
 	return 0;
 }
 
-static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
+static int sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon, subdev);
 	struct sysmon_event event = {
@@ -548,7 +548,7 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 
 	/* Don't request graceful shutdown if we've crashed */
 	if (crashed)
-		return;
+		return 0;
 
 	if (sysmon->ssctl_instance) {
 		if (!wait_for_completion_timeout(&sysmon->ssctl_comp, HZ / 2))
@@ -559,9 +559,11 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 		sysmon->shutdown_acked = ssctl_request_shutdown(sysmon);
 	else if (sysmon->ept)
 		sysmon->shutdown_acked = sysmon_request_shutdown(sysmon);
+
+	return 0;
 }
 
-static void sysmon_unprepare(struct rproc_subdev *subdev)
+static int sysmon_unprepare(struct rproc_subdev *subdev)
 {
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
 						  subdev);
@@ -574,6 +576,8 @@ static void sysmon_unprepare(struct rproc_subdev *subdev)
 	sysmon->state = SSCTL_SSR_EVENT_AFTER_SHUTDOWN;
 	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
 	mutex_unlock(&sysmon->state_lock);
+
+	return 0;
 }
 
 /**
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f003be006b1b..21127d972bff 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1113,20 +1113,28 @@ static int rproc_start_subdevices(struct rproc *rproc)
 static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 {
 	struct rproc_subdev *subdev;
+	int ret;
 
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
-		if (subdev->stop)
-			subdev->stop(subdev, crashed);
+		if (subdev->stop) {
+			ret = subdev->stop(subdev, crashed);
+			if (ret)
+				dev_warn(&rproc->dev, "subdev stop failed: %d\n", ret);
+		}
 	}
 }
 
 static void rproc_unprepare_subdevices(struct rproc *rproc)
 {
 	struct rproc_subdev *subdev;
+	int ret;
 
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
-		if (subdev->unprepare)
-			subdev->unprepare(subdev);
+		if (subdev->unprepare) {
+			ret = subdev->unprepare(subdev);
+			if (ret)
+				dev_warn(&rproc->dev, "subdev unprepare failed: %d\n", ret);
+		}
 	}
 }
 
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28..128d3088a959 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -480,7 +480,7 @@ static int rproc_vdev_do_start(struct rproc_subdev *subdev)
 	return rproc_add_virtio_dev(rvdev, rvdev->id);
 }
 
-static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
+static int rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
 	struct device *dev = &rvdev->pdev->dev;
@@ -489,6 +489,8 @@ static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
 	ret = device_for_each_child(dev, NULL, rproc_remove_virtio_dev);
 	if (ret)
 		dev_warn(dev, "can't remove vdev child device: %d\n", ret);
+
+	return ret;
 }
 
 static int rproc_virtio_probe(struct platform_device *pdev)
diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 1b670ed54cfa..d8ea77055f31 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -326,7 +326,7 @@ static int mtk_rpmsg_prepare(struct rproc_subdev *subdev)
 	return 0;
 }
 
-static void mtk_rpmsg_unprepare(struct rproc_subdev *subdev)
+static int mtk_rpmsg_unprepare(struct rproc_subdev *subdev)
 {
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev = to_mtk_subdev(subdev);
 
@@ -334,9 +334,11 @@ static void mtk_rpmsg_unprepare(struct rproc_subdev *subdev)
 		mtk_rpmsg_destroy_ept(mtk_subdev->ns_ept);
 		mtk_subdev->ns_ept = NULL;
 	}
+
+	return 0;
 }
 
-static void mtk_rpmsg_stop(struct rproc_subdev *subdev, bool crashed)
+static int mtk_rpmsg_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct mtk_rpmsg_channel_info *info, *next;
 	struct mtk_rpmsg_rproc_subdev *mtk_subdev = to_mtk_subdev(subdev);
@@ -372,6 +374,8 @@ static void mtk_rpmsg_stop(struct rproc_subdev *subdev, bool crashed)
 		kfree(info);
 	}
 	mutex_unlock(&mtk_subdev->channels_lock);
+
+	return 0;
 }
 
 struct rproc_subdev *
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 7c1546d48008..315c479d163a 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -335,8 +335,8 @@ struct rproc_subdev {
 
 	int (*prepare)(struct rproc_subdev *subdev);
 	int (*start)(struct rproc_subdev *subdev);
-	void (*stop)(struct rproc_subdev *subdev, bool crashed);
-	void (*unprepare)(struct rproc_subdev *subdev);
+	int (*stop)(struct rproc_subdev *subdev, bool crashed);
+	int (*unprepare)(struct rproc_subdev *subdev);
 };
 
 /* we currently support only two vrings per rvdev */
-- 
2.53.0

