Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3CF23E356
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397323; cv=none; b=d5Yc9Q5Z19UpXqL92y87easvSW9IqyMM3pDebryylbtF0nlCL+6PPNbNHyHcC5CvbRJBGtzp1u1+N72+8kMlKmZapepNu5mahNxTow7DLw9YRLk77IA/+xc47KF9qorALAlytpU9R2HReBxVKa3EMw7ZFEi6ZkN797prGK7LnIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397323; c=relaxed/simple;
	bh=QqnYvsTf451Epz3/SeiQsoiXxXkbgbS3wzLonj96r0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CONcpM8w2eL9sVMEudgbe4uGxnjreHqNI+GT9Aq/dlZUNVuIbH+bGcTSsu03Nwmzdw2JkVDaYXkETuvhp7vAGoJ/U9zPYNNoXQu4CSH0t3BqkRrQuJxPw9KMLBduuN3VepnVhKkh729VKqgjjCvsg1d5l4lae0Aaj1dzUBb8UWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgUkMyvH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgUkMyvH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KJcme0032463
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15ThtRBkGa3IKqgU1GywTVR6/ueRJluHcfP/0b/5jTY=; b=LgUkMyvHPj/6OHdP
	Om4K99j/YtTAUxUD/KBPufOKS+S6F64I1Dh4BSW6AwDfQOyflmVuLFK6i+HEi/H4
	VgGhHVhUs5cZ9hvm9DuBpOUQ0UrlHArdduMzSnEkQVhsd0a8lig6BCpctQNTSIwN
	TY/HtK+nYztdpQTr+S3AJORyLWRDsc1UlZUdHwMOpaf2BqdfVaafRVrGfSjF/qUk
	YjPHkXxZNX5kRoDTpRUlzOouAA8OQMgcm4oZXmvixtUk1pt3M/bhKvQH06FYiJ+4
	3t4HHXMWxMwC1npZ2H+IiAv2Xs5EmpIcQR6SSeFbSJwRYsFfVsFfxgjkF1xVtShI
	kOfWEQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mbv171w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77e76a04e42so1504140b3a.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 12:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397320; x=1759002120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15ThtRBkGa3IKqgU1GywTVR6/ueRJluHcfP/0b/5jTY=;
        b=RPD323/Di2mHWMwkXIDeQvxO4ZdWfdy3CLIxmVYv+fTkxWa5U3M+8c1HavBlD7Ie9u
         /rtHlpuT3QnXsc5FAQKob223+bm8vDfoiWJ76X/F1J/GZXUeydJtZfzWJRfP18rlIgXl
         vCU34WBnMsV+UT6CEwt9wACLTCx8uk9vHDVOFZ/blBNjcowIN/FPETh6VgGuvv/5k6Jg
         rqHotQ/ETzaxDgwnVObsdN9Lp+682D7cdsmirh5UFBtZUbHJ+UwRtEDAzFMtfBbzIS8v
         X8YL4cKBsjVBMHDoj2VEcdikTwkoukOd6AbtgQIN0NgAZGP0su1qz8XhEyq5IFp0GCM1
         uA2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxtP1Ogpm3d+bzIDOYQzPOW69oUbEyvgAuGjs54w/JeZEe9rf3RDlqAOvWZUx8xRkLlUmPzkjAt1gSvQcly0p0@vger.kernel.org
X-Gm-Message-State: AOJu0YyF7tco1pTEUpPH9roAzIplrS5lfTStMEiabf+IQPZU2uoDwZ77
	bgc9QUVAhsbVgfe88x3oWk4hWZwm8tGHOpWszxCbHy/R+UuGfh7lxv9Xv3BrrjpBISAndo+eUQf
	2CADT1eCQCPdiJ9PLCQsgol4OziuPSGwAQ/KajI0bz7jm79zntvOS8pWVtJKqyAqhrqSBWaKX
X-Gm-Gg: ASbGnctEuIT/qb0whHBaXtFvPb5fcUY4R5Ae9L3zNPRo4yKQI9B6tyTcrvwXBqxWbPc
	VHvY0gwr8Ul6PBuxCMW+bmw6QaVMWSP9GhmVe5f8OENI1nA2NY4kEpCFmQXZpTfOGYiOPpXPP+v
	l84VIrHz/BwdXT0CskFLpbcXLoJjgHhFkZ+wC93/sCxzIKBkYCv2VWfGCM518ed8CpW4Z+QVVr5
	4IXIxHkMsHBbS/FZc+NUz+yGFJS23xVbr2j7gZZtYWcBHM7jduBDYPsvEk/6EzCAhao1L6vBWxu
	YQ+mZ2RhykFWMsS5yn+ELcsra+R3/8FF64yQA8NkcIWP2BcDyRh5Gw2E9Uxoug/Wwr0=
X-Received: by 2002:a05:6a00:3316:b0:77e:76df:2705 with SMTP id d2e1a72fcca58-77e76df2c12mr7595513b3a.7.1758397319655;
        Sat, 20 Sep 2025 12:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0JQHuaDi9Ef5aOW8MRCpB2LQ2vRYoPxNqWxI7WaRZYz49g8ehUTKvXnJ4gJllUwznq3gXaA==
X-Received: by 2002:a05:6a00:3316:b0:77e:76df:2705 with SMTP id d2e1a72fcca58-77e76df2c12mr7595483b3a.7.1758397319086;
        Sat, 20 Sep 2025 12:41:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:41:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:02 +0530
Subject: [PATCH v3 04/12] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-4-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=3290;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=QqnYvsTf451Epz3/SeiQsoiXxXkbgbS3wzLonj96r0k=;
 b=FZcDIqJloGX0bBX3EBcKnYi8sbf5hJjPi9w7Q+LPayOsf2QxIubm5Bw6WZ4C5XIvyTog/gDD1
 Iy44v8dajefBigzT+eV0HYtc7u/YpLTj7zMMA3mLGqwqJdyzbDpuNxD
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=ZcAdNtVA c=1 sm=1 tr=0 ts=68cf0389 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=clVQRPZNi0AJlk-1oEYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: u184Ff4AxCKgTJrQ2-xvC_cCpgaGrhHi
X-Proofpoint-GUID: u184Ff4AxCKgTJrQ2-xvC_cCpgaGrhHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMSBTYWx0ZWRfXwYxWtRTUI+BE
 PBC9ErOyIfMiBLzlaUhyaPoYJTWuZQir2RnE4YrNbDJlO8V7aCD3Xe2LxrHxuTjlVpcXfI8nAAK
 Dc3AHaPT9xPnihF8pJHM3NViA+BBxzo0F2lX/qigMfQFHuf8EcyJxd8HcH9f1SdvcIOI/3/t0OV
 wH7uDvvvJSKR7A3zE80C1S5NFGSC/dH/gLCvNBkVEuTY33LE8/hV4xR7P3bmboPqQoxZxx//Mfq
 5e595+yO72aQFu/gYl0zwJIp+BxfSHKHWoemgtWhEEN370C3X8Ajuow93lXYOrfVG8P4xoP6Hoo
 /vZ+aSLauCL0sU7YRBhaGXuworaa10bCQSBl3Cya5e9nvRY+X+ZiQtDc6Sz+E9N++ivXh56xZzZ
 klTG9ht4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200031

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to the handling of
the metadata context. Remoteproc subsystems retain this context until
authentication and reset, while non-remoteproc subsystems (e.g., video,
graphics) do not need to retain it and it is freed inside
qcom_scm_pas_init() based on metadata context parameter being NULL.

Add context aware qcom_mdt_pas_load() function which uses context
returned from qcom_scm_pas_ctx_init() and use it till subsystems
is out of set. This will also help in unifying the API used by
remoteproc and non-remoteproc subsystems drivers in future and
will also help in early setting context to all the PAS SMC function
to do appropriate things when SoC is running with gunyah hypervisor
or in absence of it.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 15 +++++++++++++++
 include/linux/soc/qcom/mdt_loader.h | 10 ++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index a5c80d4fcc36..2ef079797f05 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -486,5 +486,20 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+{
+	int ret;
+
+	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id,
+				  ctx->mem_phys, ctx->metadata);
+	if (ret)
+		return ret;
+
+	return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
+			       ctx->mem_size, reloc_base);
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
+
 MODULE_DESCRIPTION("Firmware parser for Qualcomm MDT format");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 8ea8230579a2..36b8b331ce5f 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -11,6 +11,7 @@
 struct device;
 struct firmware;
 struct qcom_scm_pas_metadata;
+struct qcom_scm_pas_ctx;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
@@ -23,6 +24,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t mem_phys, size_t mem_size,
 		  phys_addr_t *reloc_base);
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
+
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
@@ -52,6 +56,12 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	return -ENODEV;
 }
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+{
+	return -ENODEV;
+}
+
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
 					const char *fw_name, void *mem_region,

-- 
2.50.1

