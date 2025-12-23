Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB52E325716
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481268; cv=none; b=iD++P1yF2R6tBpLfQxsUsns9u1gwFVY8XX6zyEPsEzIboRH7LS6hmGZJIR8iZIJaU1PiR7zRJnB+ZMdTwSrQvFg0epEptoZdMkGWn4jidk3gWheR2kWIJsN7Lq3C8ZeM0TtOrK/RwMqv9NoJcKNFAcJLw2MK/YRJDZinMxaropM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481268; c=relaxed/simple;
	bh=Z9QJNhY+mYwzlzBieDqkxxHl6MsI+iCoGg5mCTi2KUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nyh1P1UvsYUxQMzjMzBsIQreWqO3XsBqQZezVn0bd6HP/gyJV0gXC8BsNEFuoL3VHiJxK6LtJiC9eouMNVEQl59Fk3GoTDqhoRadHz3I/ZjovITTrU3r8Eap7zZGV7D2DDMDEBEyVh5KlQ7xP7kh7u16iu0Wflw7V42OT20O0xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iD7XO4vK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxRuN9Vs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iD7XO4vK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxRuN9Vs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2r5Af2040955
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJcDNjDK63/A97p8z3UKsfq/z6EEgXQi+po2E47PTPU=; b=iD7XO4vKiHApJgKN
	VnRq7OCGCp7kqeI4iwE0FjnT7OtTOfRm0PszRZMHs0tcdjZtPW4Cbp/cdO9fd2Em
	Zj9pgHNBt7k7svvFQuXeG2UKAk9YbepI8mYNlZAVg/ApOWFFTRnGR3x8wIoA29oz
	JIxS+KnvQ2MDe1K+yUC5z3QOLmRPkfRk375fhNg+DC1Znq4UYlXXuz7x7in0xMAV
	ND3kJE6qVsG3+P9gM3mb7cPuFyxtE+xvDcFBB7rdze81xU4IFYwHKfC3W07JCgvD
	u1WXap5UxrUMUMg8wbIci/zEgcCnLIvxBcPPLfVtqg/Vn1JDdraPZjrn0huy4Cb4
	3HgQdw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pk4vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11ddcc9f85eso10522306c88.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 01:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481262; x=1767086062; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJcDNjDK63/A97p8z3UKsfq/z6EEgXQi+po2E47PTPU=;
        b=JxRuN9Vs/fzzpiBTw6FSKUHJ/M0xV8/aO9mqfkFLycWJdgHPiXN7Hp9NGuHt3iCivs
         oaWx1K8Ze595pBcWecNZE2kuVzD3JhDYBXids01WWRXRE1uSbw5QWbNOboj3L7eR9VO8
         R4xyTctmWZITnbXBpiciE3+CW+E4ukHAPpMfyJU8i3MtzV9+rIKD081HkxyJ/fvssuPS
         DuA3v9jSV5nwqHmKhHuxrvtrWDREXWTmWLGDTxmMjiqokWJT+8wsW41ye4b7lNUpQemu
         EJj8GpRCkWoe+K+Gt0+qod57zvtR7y0GWMGWoHQX0STt93wxjK2PFIOrmhp8hEXSu9Mo
         3CQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481262; x=1767086062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eJcDNjDK63/A97p8z3UKsfq/z6EEgXQi+po2E47PTPU=;
        b=laQy+3fGBWWqoNb9Li+6Q13GdE9Gf6giaqs7c+lJ/3XAkjzn1gK+Cg7exAAel9hlmb
         1HkX86niTDbrQdKKZ44ij6l72u7kk62MIWbQowb57eiFAa4J8b6FFPXdGUE0x7Bcx8ci
         bsny5uaZX25A5ApFV0mWuORv1/tA3VobP3oDwkBWaLl/rruGGb0OvDmfQ309PeJp9HN+
         2Th3aamyTOahLW2tzoj/Ocy7phdv3P+q6mHx07NXH2xg2249mTSvXga6AY5zZgwfeFOj
         xU7o1HJx5P8Z2t4uwGbzZ6JkTF7+PuMN7co4hK7eJN3lLlRZYJs05f6QRcZhgfO3VMcl
         6sWg==
X-Forwarded-Encrypted: i=1; AJvYcCVmUH9sOgD1opArWUKVXjTEe4GrDXcvQKmjvLs2DLR65+szDkqFTnIoADzv+oFooEMOeraL5SpKH0kOnzA+RtlV@vger.kernel.org
X-Gm-Message-State: AOJu0YxBhzHBK2LV64yjH4u74DcNJU+XJidhHyLeEhDdbw+oK4aXujEl
	dtzRECpwMsy2FKQQ9cE3RlvfiFeeDy0TWEdZDCQ//qE6ktCvEg3xmcuo2Z4uFcb4rv53o3d5WVv
	1cY1fMG/rfJI3+krgV/sDS8ew138CFh+gZOyPLvum7NeqsI27MXa3RIqIKj6OIjP2yDr3fkKA
X-Gm-Gg: AY/fxX7CY3URzwPaeDhHZ6/qV5ySxWfniNJuMj1SDJ5PdfKennF0CPaGj9Xf2+8DR0O
	Of/ImIqOVVcmScifDc/lAdHS2ikPq4gjIGp0UhyaJpTw9tq6lJdJ+t5JNBff7l8czm/kfrktN2T
	efCRTJpg9K5ufnYenAVGDXW7VSq8brdV7geirdUgKU5ufSe95zOvdcjwoFmB8BGdwBcZMxs9vc9
	48qYJVusp2DzetVZoYK/BaZ2thcs55vmwxIpKuwICGABwtCA5sqn5XPvHSwGfWHMvky/V+1KWYg
	rmUhMW5OfkbI7sb+Hjn+s27m6Gutk4sskq3gJ0HyPL4L0h0a+CEsEUvjkLlrVp37wbU+v2kQmC9
	ikkN/nFwP1uCbV5SWT1YVlQdedTeHfOkumRQOWjUchTR+UbWJiO/oVv8ADzvb
X-Received: by 2002:a05:7022:504:b0:119:e569:f873 with SMTP id a92af1059eb24-12171aca67dmr13556836c88.16.1766481261952;
        Tue, 23 Dec 2025 01:14:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTP0/AwBUYd6P7PP+1p6xTFQSi83JRp1lMYYpbdk+VVLXwcuth5TftVz9La6cVPPcIwSk5iQ==
X-Received: by 2002:a05:7022:504:b0:119:e569:f873 with SMTP id a92af1059eb24-12171aca67dmr13556807c88.16.1766481261290;
        Tue, 23 Dec 2025 01:14:21 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:20 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:13:50 -0800
Subject: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
In-Reply-To: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=13613;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ah4BRBCJ3psBdbQurF6akJP6Z/Tu+W9Jy9iuU9xu4NQ=;
 b=Vz3zYF76QnjqHTWD4igQMv2JhZFNCZ4kQmodYeOX3UNOJRTlOdNx7TKgkcU/OJzSmul8j1en1
 BP1grt856xaDfE+JW7CCVRWh2sxRnnlHGv0HQEiN7/lT0dp4enuuz1S
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX6dAYDxJ8HOve
 aW/3KyFBgRC4D14Kxn+HkfN6vJYD/I8zm7dAvlSerakqRy7te2PCPP0r8I/4/JIy2vpP255mvf6
 4NMXVxF+BNw6kPIf12B3v2b0sywlGXRbhScGH0Dn2PqlOFdqXjHne0nnXAJ0vgvV0tpcT4KDhGq
 rH8xhEJ5YjdaiqoQrdFkt2Io1RC7uVAPMI6H2RekWngmxq1ZuhB6GHSPoYu3EmDPd4OCAAZuWDs
 pYZGzc02K4sZAOxVbuO33Q5PsqMCR9LoINObBQDalarJ7DA4WxiadVuLj7xqBjFXVEhuHV1LKSy
 7ILt8sEDtj8avrs5z0IBItzC3KqB2KayH1ByT8jWpetQam/diyOYybxGwxdGfwU+seE3LjeNyGV
 B+Vi/OC3O908klgPbDWS5Tt4jwqy+WQx1SilxnbaXAahthPnK6e1vyON2qQXFsa8FJaRnOQ+G7v
 G+olQaggNLKxV9enuyw==
X-Proofpoint-ORIG-GUID: cltD_Jpw9yMozqlPQ1DlBqhJfSfOO2Ox
X-Proofpoint-GUID: cltD_Jpw9yMozqlPQ1DlBqhJfSfOO2Ox
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a5d70 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=x8meLMyhUKYFESlZP2wA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230074

From: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>

Subsystems can be brought out of reset by entities such as bootloaders.
As the irq enablement could be later than subsystem bring up, the state
of subsystem should be checked by reading SMP2P bits and performing ping
test.

A new qcom_pas_attach() function is introduced. if a crash state is
detected for the subsystem, rproc_report_crash() is called. If the
subsystem is ready either at the first check or within a 5-second timeout
and the ping is successful, it will be marked as "attached". The ready
state could be set by either ready interrupt or handover interrupt.

If "early_boot" is set by kernel but "subsys_booted" is not completed
within the timeout, It could be the early boot feature is not supported
by other entities. In this case, the state will be marked as RPROC_OFFLINE
so that the PAS driver can load the firmware and start the remoteproc. As
the running state is set once attach function is called, the watchdog or
fatal interrupt received can be handled correctly.

Signed-off-by: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c      | 87 ++++++++++++++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5.h      | 11 ++++-
 drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
 drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c  | 97 ++++++++++++++++++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5_wcss.c |  2 +-
 6 files changed, 195 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..3f451e5db381 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -20,6 +20,7 @@
 
 #define Q6V5_LOAD_STATE_MSG_LEN	64
 #define Q6V5_PANIC_DELAY_MS	200
+#define Q6V5_PING_TIMEOUT_MS	500
 
 static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
 {
@@ -94,6 +95,9 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 	size_t len;
 	char *msg;
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	/* Sometimes the stop triggers a watchdog rather than a stop-ack */
 	if (!q6v5->running) {
 		complete(&q6v5->stop_done);
@@ -118,6 +122,9 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
 	size_t len;
 	char *msg;
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	if (!q6v5->running)
 		return IRQ_HANDLED;
 
@@ -139,6 +146,9 @@ static irqreturn_t q6v5_ready_interrupt(int irq, void *data)
 
 	complete(&q6v5->start_done);
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	return IRQ_HANDLED;
 }
 
@@ -172,6 +182,9 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	icc_set_bw(q6v5->path, 0, 0);
 
 	q6v5->handover_issued = true;
@@ -234,6 +247,74 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
 
+static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
+{
+	struct qcom_q6v5 *q6v5 = data;
+
+	complete(&q6v5->ping_done);
+
+	return IRQ_HANDLED;
+}
+
+int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
+{
+	int ret;
+	int ping_failed = 0;
+
+	reinit_completion(&q6v5->ping_done);
+
+	/* Set master kernel Ping bit */
+	ret = qcom_smem_state_update_bits(q6v5->ping_state,
+					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
+	if (ret) {
+		dev_err(q6v5->dev, "Failed to update ping bits\n");
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(Q6V5_PING_TIMEOUT_MS));
+	if (!ret) {
+		ping_failed = -ETIMEDOUT;
+		dev_err(q6v5->dev, "Failed to get back pong\n");
+	}
+
+	/* Clear ping bit master kernel */
+	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
+	if (ret) {
+		dev_err(q6v5->dev, "Failed to clear master kernel bits\n");
+		return ret;
+	}
+
+	return ping_failed;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
+
+int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
+{
+	int ret = -ENODEV;
+
+	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
+	if (IS_ERR(q6v5->ping_state)) {
+		dev_err(&pdev->dev, "Failed to acquire smem state %ld\n",
+			PTR_ERR(q6v5->ping_state));
+		return PTR_ERR(q6v5->ping_state);
+	}
+
+	init_completion(&q6v5->ping_done);
+
+	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
+	if (q6v5->pong_irq < 0)
+		return q6v5->pong_irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
+					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"q6v5 pong", q6v5);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to acquire pong IRQ\n");
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
@@ -247,7 +328,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
  */
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 		   struct rproc *rproc, int crash_reason, const char *load_state,
-		   void (*handover)(struct qcom_q6v5 *q6v5))
+		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
 {
 	int ret;
 
@@ -255,10 +336,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	q6v5->dev = &pdev->dev;
 	q6v5->crash_reason = crash_reason;
 	q6v5->handover = handover;
+	q6v5->early_boot = early_boot;
 
 	init_completion(&q6v5->start_done);
 	init_completion(&q6v5->stop_done);
 
+	if (early_boot)
+		init_completion(&q6v5->subsys_booted);
+
 	q6v5->wdog_irq = platform_get_irq_byname(pdev, "wdog");
 	if (q6v5->wdog_irq < 0)
 		return q6v5->wdog_irq;
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 5a859c41896e..f500518136ae 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -17,22 +17,27 @@ struct qcom_q6v5 {
 	struct rproc *rproc;
 
 	struct qcom_smem_state *state;
+	struct qcom_smem_state *ping_state;
 	struct qmp *qmp;
 
 	struct icc_path *path;
 
 	unsigned stop_bit;
+	unsigned int ping_bit;
 
 	int wdog_irq;
 	int fatal_irq;
 	int ready_irq;
 	int handover_irq;
 	int stop_irq;
+	int pong_irq;
 
 	bool handover_issued;
 
 	struct completion start_done;
 	struct completion stop_done;
+	struct completion subsys_booted;
+	struct completion ping_done;
 
 	int crash_reason;
 
@@ -40,11 +45,13 @@ struct qcom_q6v5 {
 
 	const char *load_state;
 	void (*handover)(struct qcom_q6v5 *q6v5);
+
+	bool early_boot;
 };
 
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 		   struct rproc *rproc, int crash_reason, const char *load_state,
-		   void (*handover)(struct qcom_q6v5 *q6v5));
+		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5));
 void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
 
 int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
@@ -52,5 +59,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
 unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
 
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index b5c8d6d38c9c..15b3cdf8c157 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -712,7 +712,7 @@ static int adsp_probe(struct platform_device *pdev)
 		goto disable_pm;
 
 	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     desc->load_state, qcom_adsp_pil_handover);
+			     desc->load_state, false, qcom_adsp_pil_handover);
 	if (ret)
 		goto disable_pm;
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 91940977ca89..2129064147d6 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2143,7 +2143,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->has_mba_logs = desc->has_mba_logs;
 
 	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
-			     qcom_msa_handover);
+			     false, qcom_msa_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 52680ac99589..7e890e18dd82 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -35,6 +35,8 @@
 
 #define MAX_ASSIGN_COUNT 3
 
+#define EARLY_ATTACH_TIMEOUT_MS 5000
+
 struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -59,6 +61,7 @@ struct qcom_pas_data {
 	int region_assign_count;
 	bool region_assign_shared;
 	int region_assign_vmid;
+	bool early_boot;
 };
 
 struct qcom_pas {
@@ -326,6 +329,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
+
 	if (ret == -ETIMEDOUT) {
 		dev_err(pas->dev, "start timed out\n");
 		qcom_scm_pas_shutdown(pas->pas_id);
@@ -409,6 +413,8 @@ static int qcom_pas_stop(struct rproc *rproc)
 	if (pas->smem_host_id)
 		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
 
+	pas->q6v5.early_boot = false;
+
 	return ret;
 }
 
@@ -434,6 +440,85 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static int qcom_pas_attach(struct rproc *rproc)
+{
+	int ret;
+	struct qcom_pas *pas = rproc->priv;
+	bool ready_state;
+	bool crash_state;
+
+	pas->q6v5.running = true;
+	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
+
+	if (ret)
+		goto disable_running;
+
+	if (crash_state) {
+		dev_err(pas->dev, "Sub system has crashed before driver probe\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+
+	if (ret)
+		goto disable_running;
+
+	enable_irq(pas->q6v5.handover_irq);
+
+	if (unlikely(!ready_state)) {
+		/* Set a 5 seconds timeout in case the early boot is delayed */
+		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
+						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));
+
+		/*
+		 * The bootloader may not support early boot, mark the state as
+		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
+		 * start the remoteproc.
+		 */
+		if (!ret) {
+			dev_err(pas->dev, "Timeout on waiting for subsystem interrupt\n");
+			pas->rproc->state = RPROC_OFFLINE;
+			ret = -ETIMEDOUT;
+			goto disable_handover;
+		}
+
+		/* Only ping the subsystem if ready_state is set */
+		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+
+		if (ret)
+			goto disable_handover;
+
+		if (!ready_state) {
+			ret = -EINVAL;
+			goto disable_handover;
+		}
+	}
+
+	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
+
+	if (ret) {
+		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		goto disable_handover;
+	}
+
+	pas->q6v5.handover_issued = true;
+
+	return 0;
+
+disable_handover:
+	disable_irq(pas->q6v5.handover_irq);
+disable_running:
+	pas->q6v5.running = false;
+
+	return ret;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -442,6 +527,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_register_dump_segments,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.attach = qcom_pas_attach,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -746,7 +832,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->proxy_pd_count = ret;
 
 	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     desc->load_state, qcom_pas_handover);
+			     desc->load_state, desc->early_boot, qcom_pas_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
@@ -760,6 +846,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	}
 
 	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
+
+	if (pas->q6v5.early_boot) {
+		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
+		if (ret)
+			dev_warn(&pdev->dev, "Falling back to firmware load\n");
+		else
+			pas->rproc->state = RPROC_DETACHED;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index c27200159a88..859141589ed7 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1011,7 +1011,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
+	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, false, NULL);
 	if (ret)
 		return ret;
 

-- 
2.25.1

