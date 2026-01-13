Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22838A713
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296048; cv=none; b=rSoR3qbLyHc9vAVGEEEhQdinjWrLYju6bKS9e3TgcKNRKBgRIalcHPyfNV0CZ0X4W1E9A4v/4hPvO4lHFFEFE3BbGbZT+FvmylkUh0GQqnhxYNpJMG1ucZJmo5tsfWCo3Jb5menYU22vS9kJK2F54WCPqclBDyHDoj/QAJ4snz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296048; c=relaxed/simple;
	bh=cN7BDHfjPmZXLVddZ+TKRBf+/XOJmbxfkY4V1X7n8bw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JqMkCoqpma9m72mUEzRC5CSG+A7bVDeE6v56AoK2b3+lepwJC6q7GrWwwTGPo9eKzYmCp738bpAOCfETmvR7Gj+L4KA5G77DaVEeoQ0BWz5Vac85Gs2P3jcGBdzb6vPBjNLVPoqlzikUUzgB3p6HY9Qw+0T6oUlx1Kb2l1fm2LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNPd4v69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyLSD3tM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNPd4v69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyLSD3tM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D1than2752095
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ql+pl8KOPe7
	yPuMFFW/Jv1V/1/No2AKB0sEtQ8Virkk=; b=RNPd4v69VFvo9x9olYpXXvcRHjB
	POI6HpO9d0HgHblmpZzjQsfW7gmR+7fw6X7Tq9tXiX0gcNQPyYq9SW6ujhFXVdJ/
	QC7Q3AbI4+JkDt3y2tpDSh29F7RFFV+rzRqHGgMfPGLxe/OhPaBvcaMqAWJwlE0T
	qIZUUb50eCGnhqc24TXjzI6vzhWKGKKHuGIa0KGE7ou7WUUBXOmBTqcr9WDz8XDG
	ZpwVr9GX0TP21oWg5KpDZ97K8mH/ysIl9y1awTNulsmFJli4SfadNtkmSg+xQJwP
	e6NPTXPRNsUUlSxr+cCE20zrh2x8YxnzJukYI6IHOdAGYIvmPq5nSi6F9WQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnctjs5vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 09:20:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso30478415ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 13 Jan 2026 01:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768296032; x=1768900832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ql+pl8KOPe7yPuMFFW/Jv1V/1/No2AKB0sEtQ8Virkk=;
        b=PyLSD3tM2+slhWOfvh/sou1cvu8KTbVZllFCZt1uzjxnu1uMDB6ZlcG3Hhxun7GCCA
         N4Vn+EUFUAhSkO0p9+j8Hk36IiNf0dphv7OcbURrQQtN0mbhMHiHWY7tl6Z7kK4y14Dj
         7WrIVy91LEMJYUuauIV42iHD6SpemhujU4N/KA/oyrrSkB7RMcpZtNKCMWqXrF5K9QvQ
         dR7IndP43cCXkjH/997mZrmkeAyRVHqDnoFjEmY/t5QC1WEcWGtn9ZqMVwHL2FvNwZcj
         vHl6QGa/GbNvMGtGA2+Xj5s9DdxRy3OBepZpyYBC37RyFOCcoI6WXXN9JwVpYhfGwD4L
         TRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768296032; x=1768900832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ql+pl8KOPe7yPuMFFW/Jv1V/1/No2AKB0sEtQ8Virkk=;
        b=FxjQVYf+gZTODRGnwLulWwrIjsP9MhXVvQE2m2nYmcM0o9tdpw5Yb58qAcU+jjps/f
         qJrKPe4D9pTBgalpSxVFWV9P1Z4AiH9mR0Dd9d/I3Okrpjq/bWG1OR4zDPBX86hJbd3t
         tSC2SJQCnFMPfa8xy/JMmc5J5hvErSi6XhlX6xpx68QjXf70O7CPUg70DOJ07OzazRpA
         +tfcz2JNDzLxGmuz1BtjJFTr3VdGaRgt/ZD7IT/OOvb5fMqjhdpKKKjZ2i0tn0wSHXGT
         1Urlz6mIoghZa6I3f3fNIxrAUjtlSH45UoYD2Pikf3QmWspQk92pwM3onlF7vIQCvagd
         Wr+g==
X-Forwarded-Encrypted: i=1; AJvYcCVvJhNM58kgY30a3PPSCJih9Zx/QLGAwon6hsO5NpszRolCPA1LsnbLzd1lXZQpjjo0qnsgEufizAG8KYqzPs4J@vger.kernel.org
X-Gm-Message-State: AOJu0YxCoF2XUvL77LcZYV5RHfYj1ShcSRdbLOquyYCUQgtdsIM/fjFi
	Mi1b5WN+UexOjXDEOumwAc29CQaOk61nP+ysXX43Z1cCRzlyJN2LIa3hISmqy7daCJRtR9Dqt64
	l+MuFC2+iyBXdAYGKzcMtXGnlbHjVqbSjTZST8eQpgjQMRo7a1CHO1djr362Euaj5zBAgH9AM
X-Gm-Gg: AY/fxX453M2QR9fOmZxSveihlBRqSuRCj/CElKtcq3NcTAwp1wnzZjo7HIxU1yLBieI
	NmYm4Ci0NbxEgCYU+LTtnaLCUuu7AMfjnmNOy8eMLrK3C+iJ3TBgF8V380cbncY268eHKxIocnh
	0xfVVQ/ySQnqO6rGMrzA3rEZ8QgSqG9WVU7eK5jahaILc1xnSSTZ6ao6Q5O2dunTz1sl74P2AJF
	BNquEwG0yU2OcqG49mAmkqG/Djqsq2i8GH8x+t+7C8zdb3Uq7bqWfG7XUg64lDa6ymSNEjCRSbw
	G/FPifVLQw94vIu8tuHMp8rTI5m12vbi0RR2CUaFOfxnnF7R2lg27RPvr3TJ2m8oVAXtsj/SkG0
	a5jC4nbJNd/s5Nxu6DglERfe1gj+fkVX7wW3P0Whbv5TIFhfXvcwPU3NcIrXN0HfzAiy9TZC7m/
	qBt3ShYdd4KpXOvThj//3WUuLfwhFLsjmULAIvhJA=
X-Received: by 2002:a17:903:1b43:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a3ee49c701mr226369875ad.44.1768296032297;
        Tue, 13 Jan 2026 01:20:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDcc+uF1WMgTDehKIFxDTK4sH15EoiABMl0DNiGHXTm/Ary3ynF0++tW19QbaX4WtGuYiiPQ==
X-Received: by 2002:a17:903:1b43:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a3ee49c701mr226369625ad.44.1768296031846;
        Tue, 13 Jan 2026 01:20:31 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc794asm196314945ad.70.2026.01.13.01.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:20:31 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v10 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Tue, 13 Jan 2026 14:50:16 +0530
Message-Id: <20260113092021.1887980-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260113092021.1887980-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3OCBTYWx0ZWRfX9TnNUD6hHRm5
 kUR6ddaeym7TSRWyVelJ+PHPyr3Tg7G/2GEupMOAiZpQTMtmKGnclMI2xXtUKlKKUXJ+uGn167m
 Bqo31ZYpb6RWikbPW0OaVT+vskHDqvTTMUsZ2oFaO46L3VSBivXVkx7KJQRJIxgEw5iEulCUOev
 8psBU2R9kp4WwWCbETXhQeqiRXSN2vZUF89ttKN9f0o9OwBi98i9r7CTDTmyopVkf4QVItBCQKN
 0oEC0BsFrynj79fBX4HzKaLqqQJW0/xEOpmBBRpvRYg2+sy/HWQioylrVug2MSaoL+2YNP6unI/
 2yzsM75UL4y01bca6YCwV470hIo1v0TijukbJVP/ayFAFUtDEDQyf0KNSWFFfIXCn1pTzN3BdWQ
 anVugE2crF6PUT96HnBUlDnkQ8qErTWFy0ABIxOCHB+pFbo90/8gWbiFfcS5OHp89HIHa1wGLa0
 ShQbLL1bsEZdPdpWDpQ==
X-Authority-Analysis: v=2.4 cv=Ls2fC3dc c=1 sm=1 tr=0 ts=69660e61 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uWiwPwd6ELW8fYEcJRYA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LfQ4CWfWMHAoal0vbckQradgmxeFFdoq
X-Proofpoint-GUID: LfQ4CWfWMHAoal0vbckQradgmxeFFdoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130078

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v10: Added r-b Dmitry tag
v9: Added signed-off-by tag
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

