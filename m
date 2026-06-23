Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD237104A
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209155; cv=none; b=qa7s/Jq+Bwux89pN+vNfn0ZpW8oRXVhVUqgVDtPlbHVBdZ3+edrXo6ARi5qugXOpTU1uH5JJ9i15SuSem2vf+v9U+zRXNZP4k3Ry/COMb29hWlun2bVXX+8WJSgrVK2Q+Cj8HeBj3RjO+zZg2j45lrkDjeew5s8rWbF1MYtsDh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209155; c=relaxed/simple;
	bh=7KFr550cWvHxKyQ9CcCG6oCAK+uV1dQAvp3/3+OTIRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTJ7EmYpk2l/hJbQaESqSpJq6KSq/iL/p0ykWA58G9CLXZ3FBJWUsQoxmWMIW5h/JypVy2cOFkAhyr/k4FNmubA0lQhvi2H+H6cg4Jfo801o3Kz4WVcFmRjknscfPnKfF3spMy60ri38uI8TSolrFuBouHYS222xcSjnFaupdqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRK4/Mlq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eETBDknB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRK4/Mlq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eETBDknB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA4wiW4126370
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/N/vYY+Gi7+uGnuQk94OBv/y9moy0GB3wWdee/AsGE=; b=WRK4/MlqxndV6Vgn
	tBRNMAPZycj5cS5pQfSEN8Sr4r30jyqqSyYVoyQgvr/7bnLhGP5aGSyFPHQ5ZuqJ
	gJYYoNNproZrYvTpwfoXJFnPcSrbEq1sD0VlJmY6cbkTOaLwf6VJ50vTQ/I/TOVm
	E48y0oF5lMU0Lc6CvgsGLkkEYlQBWKo9kp8/jXNfGbAqsfGw/CIgQ+xZH3tpZY9j
	AGCepZxDhzXj1BP4FoYRop7FdmSXRLGqSMdB6yPIf9aR5xAj9JiOC3PIIdvSGkxm
	ZdgWQW20hTqZRaAjSPMQ7ththa+rXejdOnjf4vz4w1CqzjgalVEUiTUsQWqf8Hmi
	u9I9WA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr32006u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 10:05:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b74d67e0so8660290c88.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209142; x=1782813942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/N/vYY+Gi7+uGnuQk94OBv/y9moy0GB3wWdee/AsGE=;
        b=eETBDknBnNMD9IqIeHU7jvFEJlIUI4S+sIJ76i4Fwz84wn1E4dQuFk4QVr3RuoiPsP
         CMSjz2DD7GjiyzPHhMs8y8/CzqvS41tsX5Pwwaqufj/5dp7RPvxpSxq28Yj9Cb5aJq8Y
         gXuJ3CMa1CiyN69ayi7s81u1C/GNu/7bT5vydcBFs1uIyfv+5iHuQwwb3f+AEGsWMN30
         BWSs0fq9hglB8393OgOZyH4/qDkKfvtmjsGy1k5KUqSl5F1U5/VW/jLt+i0QdjVKVxoO
         y9ECF7I9A4oKfJKFoE/4txgOoAv6us6XqPXqTaYJcyNBrwzzVy/fijMgFgHqwiPyUvuZ
         5V5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209142; x=1782813942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/N/vYY+Gi7+uGnuQk94OBv/y9moy0GB3wWdee/AsGE=;
        b=jfdxnG/Gt6jUOaMspu7MDReNc6v67uOgX8SP4pedxetmiVqbwcAi37IDzMj/DrcenW
         fJ+CcnB2Sy4zjpZi6Pcfs6eVrcZ0b8MOrPmiDXYau6fD86ixGbTfMVZBcLgF4fMOjG4O
         94rbeBIihyPu23n1W+DEJOLGHrUAkRc9PPQHDYFMKkxdwl8mqDqohRAPKv+jhcSvjySI
         eUOox46FrubEag40v+p51dJf0MOXLmb6jTRYiCmJG/VIvLpXoTMkCpVB2mZS2lKauxvm
         ovp6Lc1AHeUp4PRyXQ/AQMjXGtH7vVYCzEWSUMrNyRd/p8OC6BiAt+oDm47RtWMCZZZx
         pGRw==
X-Forwarded-Encrypted: i=1; AFNElJ++qK1pv3lj0OXn99roaXkOAy2y93QKeG17kAtp1pSapW4atdPjYVhVUDwcFGWWD4E6HACVohrVQA6J1ZrtXcOb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2m/OCKwXOsks0raH0oJFT9g84si1FzUuIriikye80uhkA0yjl
	XgVlQlVUwfmfYXuHIsPKuJJPgH/JckvnOb73od8DVP27MtqR8PoHGSkqNBuqGCee5m1qTdUK/Db
	HAzWy4DRZVotcQulVjPKPZZcecb8q5kIsZvmVXJBqXi9MAP8SlaeYIlLDDAM1JT+S2IHvIhMz
X-Gm-Gg: AfdE7ckKQcDrPAE0XjZ47J8woDT6bc1DBz4CdtSzBFQj7ffLLI5fjirgU7x4z6FkiEL
	/O5gb75rppnotkw78lcLI8wmSabuEi00E3kvVFqhhEhW0sSNPphgdMeYGVOm3XRLJ9nPFhDEse3
	8LC6l8SAhi/FoQ5VtC9iQyGiZHbYbEgm/3pll2V5n8bDihwij3gRZgSKrr0NBMyI1xdxdeAJx6q
	muBKmX8KV0209mwvlZB+3UUEnI8P4IDSZWiifPfOZ2xuW3V7N/I18SkCgR5IbBdA9eYpfJHb+40
	7xRmVJQYJFHyWk5Y6aVUzUwyrT913HN65+5TBEVuwXTCWfEnbBG8Hb+He99S9ur/6apXnIqxKVf
	9RfBBWAGNP+m/BeHZa71c4PtefaOovt8hfRo7WIWPgykKgs+wBUdQhcJeCo/g9g==
X-Received: by 2002:a05:7022:3d83:b0:128:d4be:7438 with SMTP id a92af1059eb24-139ad71294emr11455113c88.30.1782209141827;
        Tue, 23 Jun 2026 03:05:41 -0700 (PDT)
X-Received: by 2002:a05:7022:3d83:b0:128:d4be:7438 with SMTP id a92af1059eb24-139ad71294emr11455072c88.30.1782209141317;
        Tue, 23 Jun 2026 03:05:41 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:40 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:21 -0700
Subject: [PATCH v7 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-5-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=6724;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=7KFr550cWvHxKyQ9CcCG6oCAK+uV1dQAvp3/3+OTIRU=;
 b=rrZTqCfrp8XYG0OoeNmZgHiyJKHYsFvB+11avWSy8lfhAKFi2Khc7PP94S6Q2XySykpdKbDIY
 Rpbp4olJ/F7Aoj+ItNQXo6PnySbpEDLGUCocbaB9D+8Suu5zo6bdkm8
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a5a76 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KEoK7t2FL3BCqjfwJwAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX7ZQ8lC9OYVK9
 7gXauOkpck2961V8y211TF5f4RZiTPm2KbjUH/lIs4T5wSh2aZOBo/djVQk23OwEq61te7XGadM
 Mnp7cr/l1X0VX/9VfALaUOIxzxdqe+T8Tf4iL4O83fLZ4/Q3uLZ5ZF5GQMGwWUZYiHpRZPhEhmi
 3N37+jrwOozD0/BH3JPvBY3s9Md1jw9TOZN/HH8I3DeS2/0xyykkW53L41mWXIHRYNIqUv4YQYt
 T03oWLSKaLibHjt6h0RlyLfYisfbdAu9hoMnwDfSOsgo4pmh31opouDlI5l7cmXiuWB68nY4tH8
 RXlMF0DbYHCJFj8tgVOkfyX7Mqi4P+WDyMKLxsYsDUD6FYmdFXoSlnBeZTFy2Q9qsl8toqbZjug
 dixY7t+htwIS96Vb43oIVV/pVKXYbA==
X-Proofpoint-GUID: zS5dqI7s6WcpNPfi20jZMUDekt7RsdHN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfXzNaxFVOH5G2l
 nEjXsuV6PA3OEYmjt7C9YlCkfN/sjYqEy/hyfslM4UthscoJtfN44VhFibS7IWjd0htipV7enJ+
 7i2L2Jh3be78Hr1Pwaqiml2/762ZdBA=
X-Proofpoint-ORIG-GUID: zS5dqI7s6WcpNPfi20jZMUDekt7RsdHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230081

Subsystems can be brought out of reset by entities such as bootloaders.
As the irq enablement could be later than subsystem bring up, the state
of subsystem should be checked by reading SMP2P bits.

A new qcom_pas_attach() function is introduced. if crash state is detected
for the subsystem, rproc_report_crash() is called. If the ready state is
detected meanwhile stop state is not detected, it will be marked as
"attached", otherwise it could be the early boot feature is not supported
by other entities or it has already been stopped. In above cases, the
state will be marked as RPROC_OFFLINE so that the PAS driver can load the
firmware and start the remoteproc.

Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.h   |  6 ++++
 drivers/remoteproc/qcom_q6v5.c     |  3 +-
 drivers/remoteproc/qcom_q6v5_pas.c | 68 ++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_sysmon.c   | 19 +++++++++++
 4 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index b07fbaa091a0..b0e7e336d363 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -68,6 +68,7 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 					   int ssctl_instance);
 void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon);
 bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon);
+bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon);
 #else
 static inline struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 							 const char *name,
@@ -84,6 +85,11 @@ static inline bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
 {
 	return false;
 }
+
+static inline bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
+{
+	return false;
+}
 #endif
 
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..a11d8ace554b 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -202,7 +202,8 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon)
 	q6v5->running = false;
 
 	/* Don't perform SMP2P dance if remote isn't running */
-	if (q6v5->rproc->state != RPROC_RUNNING || qcom_sysmon_shutdown_acked(sysmon))
+	if ((q6v5->rproc->state != RPROC_RUNNING && q6v5->rproc->state != RPROC_ATTACHED) ||
+	    qcom_sysmon_shutdown_acked(sysmon))
 		return 0;
 
 	qcom_smem_state_update_bits(q6v5->state,
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 808e9609988d..8a0bb4b2e71c 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -60,6 +60,7 @@ struct qcom_pas_data {
 	int region_assign_count;
 	bool region_assign_shared;
 	int region_assign_vmid;
+	bool early_boot;
 };
 
 struct qcom_pas {
@@ -507,6 +508,67 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static int qcom_pas_attach(struct rproc *rproc)
+{
+	struct qcom_pas *pas = rproc->priv;
+	bool ready_state;
+	bool crash_state;
+	bool stop_state;
+	int ret;
+
+	pas->q6v5.handover_issued = true;
+	enable_irq(pas->q6v5.handover_irq);
+
+	pas->q6v5.running = true;
+	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
+	if (ret)
+		goto disable_running;
+
+	if (crash_state) {
+		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.stop_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &stop_state);
+	if (ret)
+		goto disable_running;
+
+	if (stop_state || qcom_sysmon_shutdown_irq_state(pas->sysmon)) {
+		dev_info(pas->dev, "Subsystem found stop state set. Falling back to start.\n");
+		goto unroll_attach;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+	if (ret)
+		goto disable_running;
+
+	if (unlikely(!ready_state)) {
+		/*
+		 * The bootloader may not support early boot, mark the state as
+		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
+		 * start the remoteproc.
+		 */
+		dev_err(pas->dev, "Failed to get subsystem ready interrupt\n");
+		goto unroll_attach;
+	}
+
+	return 0;
+
+unroll_attach:
+	pas->rproc->state = RPROC_OFFLINE;
+	ret = -EINVAL;
+disable_running:
+	disable_irq(pas->q6v5.handover_irq);
+	pas->q6v5.running = false;
+
+	return ret;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -515,6 +577,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.attach = qcom_pas_attach,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -526,6 +589,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 	.coredump = qcom_pas_minidump,
+	.attach = qcom_pas_attach,
 };
 
 static int qcom_pas_init_clock(struct qcom_pas *pas)
@@ -852,6 +916,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+
+	if (desc->early_boot)
+		pas->rproc->state = RPROC_DETACHED;
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 913e3b750a86..a0830a48b1f4 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -736,6 +736,25 @@ bool qcom_sysmon_shutdown_acked(struct qcom_sysmon *sysmon)
 }
 EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_acked);
 
+bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
+{
+	bool shutdown_state;
+	int ret;
+
+	if (!sysmon)
+		return false;
+
+	ret = irq_get_irqchip_state(sysmon->shutdown_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &shutdown_state);
+	if (ret) {
+		dev_warn(sysmon->dev, "failed to get shutdown_state: %d\n", ret);
+		return false;
+	}
+
+	return shutdown_state;
+}
+EXPORT_SYMBOL_GPL(qcom_sysmon_shutdown_irq_state);
+
 /**
  * sysmon_probe() - probe sys_mon channel
  * @rpdev:	rpmsg device handle

-- 
2.34.1

