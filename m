Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4CB4A07
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766113828; cv=none; b=Ck04W+BoZ3ksseXEXd1ye77IuolKzcppmlSqZ3BmD1rdXoGHo7I0CWGp9ieLgPRpPY7bhRL2b7kw96xBC2R09L7ohPcGj1q+c5xmQj0MOOm1d+yT5EcfqdZ+rbAFOhPUF+tsoeSD4QoKUloh7pYVdXSREFT2fyCRv+2O7cebXaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766113828; c=relaxed/simple;
	bh=1KgQnlB41KBaC2DG4Yj9ulDgjSoB7PMArv6hECtKgus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OB9G6vHhm5IytsN+oV+nvCA0xAviszEy/+NRx8yx5S7U4E2WHdzKurs29jpcmlhPgdPv8t+L0FrRzWKixT6TTEGZN34CETUAFqgumb5ppPTKtPp9f89UfR/b3AoFAxSdUIoQB+Z21VVY/BySEhWIPHMZsNNKbJw2vqkQUs/gIhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPvR9dQR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx2l6ic3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPvR9dQR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx2l6ic3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ2OKLV3813946
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imtAR/C7wDh
	u9pVrr0JhhByoc7Qoc/nTvrS7itb8mJQ=; b=LPvR9dQRKcszDMBfrL8l0Vrxo/Q
	q4UyTUIdMm1kTqRorp6kMCCpuDfYxMR+lKJcmZzTRJNfSM6nID/J2BpxRDr79axT
	MeYUf3uNpTP+OlqyUo1X8YuOWKj+p/MV2JyCXcARr0NAZTcOPREpAkGnHhtSjtdl
	NDxtc8cRJCM4O3d9Fpqw0Ll5ZAqP+SK/46IM8ZbdzCXu9CYxqA0nzRIUFtsMogA5
	aG28zsiC8rZl+MxtVA+d9DIw6isJRJLM+ZzU3sRffPW/MLYJzJe6k/f91EgFgpAk
	FR2PP5o9c3WtI8bUMWTNDHHXldKZYmdv61ekO3GiAVY4K1I0BQZHFrTrqew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c10mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 03:10:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c38781efcso2396549a91.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 19:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766113825; x=1766718625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imtAR/C7wDhu9pVrr0JhhByoc7Qoc/nTvrS7itb8mJQ=;
        b=Gx2l6ic3JzF6hLotN/i4bArWRshDrq/Q6a9vwIA+on5hcX8K9pbPCEunHWHvlCf4+H
         xGj4D88fvMnSbIJ2S2fxpWNhILWQJ0HbpO+GZ4P2YmGzHiEyeEeQTjgMQHv04nhAMqHv
         AKZ6hgsp6KJDM3TaS1jU3W7Bou9pGAeTajRCUaI7h5o2M/eXmkfVfzgp35gO56ZuoQWI
         q08LHXgZgIrAiwshDXR3XSKGytN4DnFSc/CHvgnpRPV1j3hRqprdCEpZ2zJIC7eP26wt
         y4j6lXBUpjl+nLD74RZSbonZnUMUWHaFRkgmx4FsoO/pos6bGucHWU5prc7nn1O+gUS/
         cz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766113825; x=1766718625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imtAR/C7wDhu9pVrr0JhhByoc7Qoc/nTvrS7itb8mJQ=;
        b=ih4MLB7wdg6AL1CSX1qTIK9SURZaLaVmT8CawfVTV0oYbNuWnEmem3sZl5fjyoU8TN
         FhfjNDo8w/yKtaBIl1WH6cu2tFErK0oav6jTD+R66y15id7nVxH8Eo3voC0V/F8nQWty
         fcxpbBtQ1WdGoDjUQTr4KlWmCprtOdbH0fh9sz4gABaIUyA1NHVxCO6EeMJ8N3UhWKoZ
         UBJ++Zxq5IUSoVZyXIiHLpgF4N5sYKGiM3J+WeBgd8dzSFEl+UwQ8nWMvZ4r08IhYToR
         o6nO/kOE20RJoBYBKG/IlKC4kCCig8RlUzh7v+jiTuQzdrgfPutdrsjF3st5CAxvKl4e
         35Uw==
X-Forwarded-Encrypted: i=1; AJvYcCX+Gpb85lqo1/wuTWBmlsX1M7X0TewoDirnuvq/3L3bYjFE4H4mB5uYYeNr+Y4KAlFssx22v6EY20t3zB1htAjm@vger.kernel.org
X-Gm-Message-State: AOJu0YypazJ0c/qwC2z9sicQHNZZWHOL5lCNlXGT1GBSsE1DM2KcPcwV
	27f85AOFp7CzOdCb7SruEhoHmmBrrtr9eX9H5M0cDd0cm0D4QKZd3uZvT9k2Rxh21Un/WLvHV7p
	LEcVWqU9MeDj84oqQjmrwVw9swyixFlpSbGTxVGlzoBCdc4s7RnvrZC+RC6gYjL4GobU9sWha
X-Gm-Gg: AY/fxX7LEbYjpihE6HID6JvjK41/KX7xyS8McwG16Q4teCVBzLe1AEQW9QXpNhxiBY3
	x3b4HtKdvtTZT5IpegipnPzyhymjB3ZxQYutB8mfSF85vPvl6MB5wWXNtTJsDshVcINYkA9M0xU
	mjQD1RfZPK7PsbPmYbmslyJI5Rk+Azfw6rKcDNo8A9h2+sU/kESPeqy3/L513ivHNE3k3V1B9RI
	1sHfR1ht1vgSIJlh49/omAxNGhiCANgSvpfwIhqI5smYrhwkBolu4vR7pEFG8d+2Rs+OwSlZB3t
	sM2GQ3IL0AaXc1BVfuh16sdix7bnux1NOGkevoY5vklrDU3O8lemp73cRdzPaDFixZ3ob4JsHk/
	S2CCeEe0GnseKOhRvRSG2tlB8um9jIA35j3J8px2c8+WswcIA9hI09KsGYhx8GwZ7KW0fudckMI
	MNzsX+cqcrylVH5wOxm2/GjuQaklLITlhbK0+whG8=
X-Received: by 2002:a17:90b:2e0c:b0:34a:4a8d:2e2e with SMTP id 98e67ed59e1d1-34e921b7ca2mr1336469a91.17.1766113825104;
        Thu, 18 Dec 2025 19:10:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb9ZWK+oeRMMRCYJozlfCcOYjkREpySRVF4gwmiYA/MXbS22ApJNllDyU7QX8ZeVUVfFhBCQ==
X-Received: by 2002:a17:90b:2e0c:b0:34a:4a8d:2e2e with SMTP id 98e67ed59e1d1-34e921b7ca2mr1336433a91.17.1766113824629;
        Thu, 18 Dec 2025 19:10:24 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d656casm3737867a91.7.2025.12.18.19.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:10:24 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Subject: [PATCH v8 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Fri, 19 Dec 2025 08:40:05 +0530
Message-Id: <20251219031010.2919875-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20251219031010.2919875-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAyNCBTYWx0ZWRfXzLL8B8kYsNlk
 W6IO1HpX93Z5DgXPRESIHs082CvylyfLB28s5GzsfM6MkE5ByvaBJeDj86og7TFCjU9aLgNHZWd
 cgzHOaegyVuwFn/Zp6j3TfeP+TNKWNOZUfB1P8q3Vk69Qau8MLv5zUYD3SgRa69rW3AdKGNBZuX
 5zIO6Ry1GRTS4SK6K5+ZX+QREZHF7XGQtk9MxBvVv//mC1fQkhIRDfZ3kiC7k/5K3ECmc7aF7lx
 4b52BGBT+d8fL2iwYbxO3+mhOuQ48ESuoKNAWtQQ6vRTh4+yhlpKKgnGAAv4rATFP9RhWAScFyN
 LrkajLu9f9ZhhiSRgA7/0kWncOLGMMNixti7osPU0Sm8lWycT9brs7YqQFu8Sf0r2wvzaLMqd+c
 JM2ICiGT+zsxPmFdCO1ZEt4byPgb4Q4tZuTlFsBGdbG/5G68Xgg1PD03fH3ut5t0oXKWZOB3JAm
 ZCZwBYn8hAcr71erfNA==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=6944c221 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uWiwPwd6ELW8fYEcJRYA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xz1qKWid9nopuZbDMi5EqSMnS4gBfQqI
X-Proofpoint-GUID: xz1qKWid9nopuZbDMi5EqSMnS4gBfQqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190024

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e463e0..c970157f75b5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -583,9 +583,6 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -617,7 +614,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	if (ret)
 		goto disable_clk;
 
-	desc.args[1] = mdata_phys;
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+		desc.args[2] = size;
+	} else {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE;
+		desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+	}
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	qcom_scm_bw_disable();
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c..57d63e932f62 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 
 #define QCOM_SCM_SVC_IO			0x05
 #define QCOM_SCM_IO_READ		0x01
-- 
2.34.1

