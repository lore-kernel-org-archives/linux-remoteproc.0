Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EFD24C069
	for <linux-remoteproc@vger.kernel.org>; Thu,  3 Apr 2025 12:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681798; cv=none; b=WZFksAPfkLAvFP/OovetfBNfNsR4BOxphHTtFiUg7L9M5OgCw4zG9cgmLJWwgu67vyHcfinzAC+0d9by+pQTTD2yHXkWx0HuQSkUYgOJUIq+XygWZwJ9bfEJ9x7sjGE37l4/bYMfQjW6U/0ECR44/BiPXatrdt/kFcMfhaWNSJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681798; c=relaxed/simple;
	bh=5aSR/CkARF1THdVGvZaG6mXoEeoBr2YVhlX0SEWDiqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lNwwS8OtRi0fV+95tp8LZ1kcQXIsmItQ/aD2YbyPxu9AA6hqpS7g/latZxHK6ocJ2S37ZexKNEOpbwSIBOsWRrBbEt/tGT8SlLnO73/udpNv2RVx9IblUQv3KHRhRqZLLUALwM2JLUuQc3PJIJhOFvhQFhfh8zaXQRdUfUjGe9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpD+pbcR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpD+pbcR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339sE4o029964
	for <linux-remoteproc@vger.kernel.org>; Thu, 3 Apr 2025 12:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=U+WKP7GXR0a
	OUH6+HVcnhGI+Y7EGQYA2UqybjHwM+Ak=; b=BpD+pbcR89ogME92fnE2IKcrAfi
	4CSMO5jeEnT8hLnlPfVDwKeVTW3WArt7H3O1q0rQFVvbEpMIqp3P/B3jg823pB0M
	T0+NhKwyckFmKJLwNnz/ogose5NB56mOeMU72F2cHwJ3JGX4ba4TyqZp2/Pz83vI
	BByP+wNifMbZzS14oatxgqk/uWmcaQWg7Xzc1ip5iN12jdSx0+Cpc2f0RfLKV+RG
	aXCQWtREGBYInYqDuJqwUbc9D4gsCA/Psa872Hkbgp5Eeo+Lw/fKF+ztFl3+bVTn
	+v3owD83ElNfPjD/JZfJJ8t6HCFZ+UfBHzjBSRnowPx+NGQz8nuEIDUN1NA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyypc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 12:03:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff798e8c90so817846a91.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 03 Apr 2025 05:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743681795; x=1744286595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+WKP7GXR0aOUH6+HVcnhGI+Y7EGQYA2UqybjHwM+Ak=;
        b=i/DJh8KO6GOXcakHNJ5yGc5C6T93GnxxC20+MN2UigFNK9T3BE5dNbu3boPKZE2zRU
         Kv2Y9X05fxQytlTPzuof9oxBqnftEQH25+Vu0lG9zPnFQB+g2B2amBJSuBHUQIB3czJC
         nXozGRgfo38fdidVBTZaVQ3afJGsRMW4s4aFX1YqTIMzy3M+92y5LnTQKwe0qB2i1/9y
         6DLzQmVT+FpK2hywk8AkHmGU4f4yVWGFE8yyLwATa0tuuxwUtd71mogBT5BLWU4ikcxE
         8IGTxJHYaM/LHbzDsZBlpgUzTTFy+MduYwa6FSZihDVnl6xkH7w6fBZE5VfoRh8z2gul
         Ngsw==
X-Forwarded-Encrypted: i=1; AJvYcCWi+Qc4oO27VFLF/Aq+XAeVZbN7fuJhPzm2co4aKbPmlE04q4pj6LKQFuhEG4yWdWOr1USpgOynzgauZKlExnav@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnc7Q6kfaomqcU/hLRS9LS78iApaaponCp7T1KcH/gFoJ86ejk
	hYx4A6XSFFZwwGplSwZ5qJyEq0nQX0yGPfyhXv7xzONTqCLvQ4enttwUnHZD6a2h9AX+MUInE+T
	8Idfk0kZUK1yN2XpLfoGs0r4JjLHdBHFixGyD4X+ljJ48LxyDpyRlbvRAwsGl8CyD6mel
X-Gm-Gg: ASbGncsO8eG1e6o/4r/j7f/gvpxqoq9AUJxz2oBRbiyZC0O04abJq+KoH8JdbchaLoi
	J2DMPu5CsZ6yV9KqhcvGx4AWPfiGm1ak/g6UgXgoy+yFAtlb+SColfnkO7xFUYCCb4Pet5JFHU3
	UY5N0OX8c8SQkWfpw3OtVM0QelAMHNJJo0Izu5SD87VtYHAWlv/sEAMd2AGmwB5WNmEyzPPZnmU
	acs+lVnyDwaR25o1BoiZEPXy7WiSVnjbeDQokMrxC/o5yJWwZZDnfPKsc2nn5Qu49Hn3drvIwUc
	qRJ8LOehtuC1y/DwwlnB7e8bsZcyN+/7SMLKK2ZgHvOHZuDqNS+ut5jmIeNppqtYo7fKxhZx7Cr
	hQSHaj448m677+1AT0ZCE44y7eJZOYVvXWZa+3jU=
X-Received: by 2002:a17:90b:514b:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-3057cbcf175mr3235087a91.3.1743681795021;
        Thu, 03 Apr 2025 05:03:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdjpRIr24Az8IqwRnHaYfyOlaCRKC5oMnaVnty2pYG6QVQETBLwG6G0beE9NGRt9WSPJj7rA==
X-Received: by 2002:a17:90b:514b:b0:301:1bce:c26f with SMTP id 98e67ed59e1d1-3057cbcf175mr3235045a91.3.1743681794649;
        Thu, 03 Apr 2025 05:03:14 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d710csm1285799a91.10.2025.04.03.05.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:03:14 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V4 1/8] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Thu,  3 Apr 2025 17:32:57 +0530
Message-Id: <20250403120304.2345677-2-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250403120304.2345677-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3btduZBZl5_u3l8XHmI_bzzq1MQ9_sqc
X-Proofpoint-ORIG-GUID: 3btduZBZl5_u3l8XHmI_bzzq1MQ9_sqc
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ee7903 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uWiwPwd6ELW8fYEcJRYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030050

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..456e4de538b2 100644
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
index 097369d38b84..0f40e5828a67 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -96,6 +96,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 
 #define QCOM_SCM_SVC_PIL		0x02
 #define QCOM_SCM_PIL_PAS_INIT_IMAGE	0x01
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_MEM_SETUP	0x02
 #define QCOM_SCM_PIL_PAS_AUTH_AND_RESET	0x05
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
-- 
2.34.1

