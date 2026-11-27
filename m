Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769106;
	b=ycFxMwAMa7g7b0PM0pVPOnR3ZLWW0BGWG7LomEwOX+1Zqi/yLuWSPgPxgGlVQfwkK1kc
	 0guZphI5wFJ7/0c6dX4saaXgy1mbtA7GIGiSVNNPuKtLY+fI3u7OR5N5T6IvzExZ4AcjZ
	 c24rzjrbCSXufkbEJCsECVp/oZhf7y5BRIGW4muNbxqL4oVK2iCT9Wy6mWgpsW2Sl41l4
	 MnLlneq3MXiYQG+yVr5iTBx2Ys+tlHo96tbUyFdfyHz1S6j7Pq7qghE46FJigp4zznOb9
	 H1SytkmaXDYqgGkXVI5sE3ILagbLGiwQF+kD7Lbo/qbjR+vaYkElqqgIfkzWUeKf5ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=klExsNggnTq7Co752110n/Fy9zdaNvu8vGyvObetxTY=;
	b=qVijU4Nqln55ShHWc7GiDEMUft50LH73aPO3LRMf9OP83DzOzqru/LBO+NDi531BL7t0
	 pJo7Fi7rlMna5gXnrN/6mY9cZeeUe2OjMiLZeg6XMq7Um88Hy+fzbXZeBw2dK11bf+Hox
	 5gjiLZ8NNZloj1SyJoT1zZNtDs1sTf+MSim0/G8j34Y46rDctI649EkWbQcZc4wglrC10
	 zobyqkt3forznpWK1t9YTvp8zPT4BlgU4T3rhOuzVUGsoaCvbxD8MZYabBrUX8R9nuvL3
	 camEZWdDc5YjM//DLgm/hCRXL4A03dnz4wR4TMzQgeMU0Vv2EZn8MLV8+vsnUF2Ji2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1psPBNl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DBJ9hS9C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08399606A321
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 08:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08399606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1psPBNl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DBJ9hS9C
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GjwX2421555
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 08:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=klExsNggnTq7Co752110n/Fy9zdaNvu8vGy
	vObetxTY=; b=P1psPBNle7/D+Ji/MOwsEleepdJG5cR1THtHsXfi+8s/IOWQlBw
	BLUfaq4+yNURP51agqHX/C/5zSGaW1MeLPO59NUCyvmUH6i5QC9MgWunyegh9N5e
	ZEyvAIQdWtgKVNvVq56/Mg8u+66b6GjH7baCUSNxULOS2cClLqHKBK2ETD1cfrn7
	7GdLRhK7nt88w2w1g2VkbrO0Rd0SodsMB1sfp7lCim3MCFZKsGPKqnNe4DigbI5c
	IaQQ0n6vXJUV1xIybW01imyfuDI06oE45+i+FuNVfpuCZEq8aDGRy8KuZ3Q7HvYd
	jolAUtwTADq32TBeTf4TOxQJnB60sEqshSQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf92mpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 08:45:05 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8615bdcc5cfso6968633a34.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 00:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769104; x=1796373904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=klExsNggnTq7Co752110n/Fy9zdaNvu8vGyvObetxTY=;
        b=DBJ9hS9Cl8BpJcNQ5/SvcBzaCYEc+8SjU0jitn1dfEFpzFZpOFmWQrSjEZDPgBDXeU
         vY3o6qdRpG4O2Ei4EswkjDu56Qlsu6jj7kiynVfvOCKJayvF4dVijTpTBqEGbd4liu6f
         sK7k44i3gCCdAxhMpK+LMFdWWKgS5SOYE3rdyBwRLQ1JqP6ZFhohIE1UmQSFOuQL0fWL
         N5WPpvbHndWW58prxmKmuUbcVyXo9jHjmIG8B3YxRnPjbKeoSD2LXdcd6Pc//QxwU87Q
         rUoWYoZuCJNoE7MaTCVEshKsH5QK5GFzn8U7Rp+9zkoDJbIl6KBFxHIHrlTChLUTuGO7
         B+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769104; x=1796373904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klExsNggnTq7Co752110n/Fy9zdaNvu8vGyvObetxTY=;
        b=qu12D/9IKeOkFaTSMFSCTNW6EphSIO9SVCr67RTBUr+8QnLcf+l868sq5uRb08wyae
         OhZlA3o3t+Cd84hNTN3N0/+j3OFfvgNQS8AhJdsGcd9N8FapvmtjV3ld2eY4X1MXILNO
         or5wVye4dJpHe6SA/uVOOZZp2WkJeSfjf9gIRE2EJF1fiWXtDwhfjWh61G6EsmmFTbv2
         jzj+jPmVKtaYX06XZLa6SPBPOoaS8n290MU3d1HcqP0nqMAUm6s0xmmQqJpM7hHzfRyq
         e/s6R4GDWh7pqKD27na9Ca0e7GamBFaGEsoGita7Hc3FrsT06S29YKqP8Av2PO1W4hTJ
         KoUA==
X-Forwarded-Encrypted: i=1; AL+hErHZK7ANjJbPdS85NKT8CPdlLY1mq4E10IpoW2IacnOywSnHzl/jmNX0lhnBmqrVxpB9jKSBALT0J8SdrEJUUm0+@vger.kernel.org
X-Gm-Message-State: APuU4Z/aHubOTyfO1d5GB74SKohHuiB7zWrYnuWbhXgw6LRcb8ucbNr9
	fMe4DkqeCv6prUJernjKO6BVeH1zllcR2cr3bE2UXFfx2yL3kvbqUsnVGwklnKQR8IAxrY6c9hO
	Ip4I62mGQXss6axFs3q49YgRvttI7btL/4Ace9JlciI/R3jaPYgPRKlmNlwsFccYahzlJad/M
X-Gm-Gg: AZFdTZe8eRx3WAoFZ9z76tKrLvC1XIc0s+TvTRaisYmOqc8z7Ip4M1BorLciiXH0hWN
	wqE2/hkylenur6Qh2s+R/ZY9XC/+WaIMsOsbqnlFZrCo2S6UxPtpTazp8KKz7JOPiEuueKWFDxM
	fseGEkaw3wVKrYjnxXBwff0CRO95ZRa9GZFg6cVwNv3/CfrmP2/ZLidM6gs+ZzEIWm6F9QVMzuB
	5G6XEyi/X0w59Z2cntYp5tLrn51bhyUMjVkP4ZS5VyjFukejUJpZIhtMXu1PeU/LMw66QKuugID
	BifjfVyUGmasXpGAm8YIgwNi46HwDvTTX41i63+bqtn+qPTGqlJMlAIcBeInn4aCCo8peIUhL2B
	5LKr7aJPH/oIkFyg6UeHHSN5Hff4wnKPDaAyxYXCxZnS0sgG+7Mg69vjIMS+TTAdIrOaSJWrKXE
	xpK5If89RMUxsXU+0xAjGepK9dAg+ROTAtw8mV
X-Received: by 2002:a05:6830:4c18:b0:81f:22fd:6ed5 with SMTP id 46e09a7af769-863159b9da6mr27289254a34.21.1795769104226;
        Fri, 27 Nov 2026 00:45:04 -0800 (PST)
X-Received: by 2002:a05:6830:4c18:b0:81f:22fd:6ed5 with SMTP id 46e09a7af769-863159b9da6mr27289225a34.21.1795769103634;
        Fri, 27 Nov 2026 00:45:03 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6d8sm16468518a34.10.2026.11.27.00.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:45:03 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org
Cc: sibi.sankar@oss.qualcomm.com, konradybcio@kernel.org,
        rajendra.nayak@oss.qualcomm.com, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom_sysmon: Free shutdown-ack IRQ before freeing sysmon
Date: Fri, 27 Nov 2026 00:44:49 -0800
Message-Id: <20261127084449.2029868-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bMcYaJzQL9B-vV0ymyezK0yVEUTQbDQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX7//tynmgSGuU
 9HL9Fu2Eg/DEHxWLT7OJFYDLzU0Si/KEsyKFcSFl2T/volOvIWVsKoCIEwBDCaVKbMP9//4hMWs
 rnlclzm9Iw0JroeeFmW+nsWwIKcBuNF1BME7VzzBZmtCZmMsj7JpmIc5O9JaoNyywkDu2PvHp12
 h9jHH4gcRFCRPQeQ36bYI1jv68cr0oGTCvGCvWKKv0/91ERtijvwpyTkPEm/+9Mg2DoUWUl2K5t
 sxmUEPMzr+45IxqQ9jEdvxlrJ+jFMbiUO88Lj3yb67dk40aBQof1Z42/JFcOMgq2FuWCOu5NPFn
 fO9sNpdfVTFv240wZGIldWJayrTja5ETUZ9sbOqclo9PBlzKyWPvX3WnBMoIgDolpRo7d4MFf4n
 RN2iKPJVwfPIcfwLQIw5g4fANur4fr0KVIH4uAOvXdtjTm0GvGRYogWn/sywTuWJANQ37nakou/
 76bdNYJZlacI+qckWAw==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b094311 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mRnBLr89bJbyuihAmEYA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX5dRGxXv8ptiV
 7SgXX+q2tkGdTJMOsA61FfxYtukMCh6pT2VhHsSdFbLVUQs8ztqWEXtdoHWxA4iKzE9F2wCmBrx
 EOOLsPXSHWP0u3LPy3k4FR1Xs2uZ+xo=
X-Proofpoint-GUID: bMcYaJzQL9B-vV0ymyezK0yVEUTQbDQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

qcom_add_sysmon_subdev() requests the shutdown-ack interrupt with
devm_request_threaded_irq() and passes the sysmon context as the handler
data, but the context itself is released with a plain kfree() from
qcom_remove_sysmon_subdev() and from the qmi_handle_init() error path.

A devm managed interrupt stays requested until the driver core releases
the device resources, which happens after remove(). If the remote
processor raises the shutdown-ack interrupt in that window,
sysmon_shutdown_interrupt() runs on freed memory.

Free the interrupt explicitly before freeing the context in both places.

Fixes: 027045a6e2b7 ("remoteproc: qcom: Add shutdown-ack irq")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 61e1038328e8..0ffa6edaae9b 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -671,6 +671,8 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 			      qmi_indication_handler);
 	if (ret < 0) {
 		dev_err(sysmon->dev, "failed to initialize qmi handle\n");
+		if (sysmon->shutdown_irq > 0)
+			devm_free_irq(sysmon->dev, sysmon->shutdown_irq, sysmon);
 		kfree(sysmon);
 		return ERR_PTR(ret);
 	}
@@ -714,6 +716,9 @@ void qcom_remove_sysmon_subdev(struct qcom_sysmon *sysmon)
 
 	qmi_handle_release(&sysmon->qmi);
 
+	if (sysmon->shutdown_irq > 0)
+		devm_free_irq(sysmon->dev, sysmon->shutdown_irq, sysmon);
+
 	kfree(sysmon);
 }
 EXPORT_SYMBOL_GPL(qcom_remove_sysmon_subdev);
-- 
2.34.1

