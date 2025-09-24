Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA94231B832
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739096; cv=none; b=hr80AG+NJMO9ws4FIvCbaOzdee0DJx6LvHWRmdCUrQg1bwPlr7lmWfX03ScdWcotNQFbCJMcfeeNyiol3O4H7taBSwP+x+Auvr8WlmA4Gqz0RCzSk5GnrcNFZyJakqJ7B8ZbZOra6xk9QkLEY9SOgCFuBtpTHUW0HzGCRCwwrRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739096; c=relaxed/simple;
	bh=k9CkL2qkm+Gq+OsTV8Xqcli2o6B8i6gZkt12KJczsqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MJLO/sM36tJYLAsTPYW88vVrjYU9kfqYaWclfvVj+WI5bbIrKE9X4wlpeaz/CNOmYqir9i3XTHA/OFZRg11aV0CJA1wWYIhqd33hktvmWmmVufNJCAvUG/hcdAe+XQSELQNJ9qM5bYtAd5FqFlIc3FXTHePtErJNlzAmRKtY1HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OePsLT0r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OePsLT0r"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODdF16017430
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D/76oTdLGn3
	8H8eHzIbnSh0dnKY4nS7/Ubm15EkVBLs=; b=OePsLT0rP3C5KSJ48BTLLYYzDye
	YOsJgJSKMJ+dViCi5lNreoTP+N96DhyjMRRsB/JspqyNN8SbyVZD3LkLLez11wCM
	X4JYWtR2ThFJb2cOBJUwkJMEXX3WAAumrFT85wX8cUQWuONJBhHKkSZyzARK4JO3
	lPhS73x5vSHASWNllmI/fpICOQCCDW+LTVWZxQeZ/lVCOaMsolF9KY8LAvLw5qVd
	ubqNKabtAraU7CXLQecw4zdwhEbdNRWVI1UH5PfFJVQdqzWuRP80okibmoaia60q
	l5/zUZjXe2DBTcEgdoYT7qwEPhRtlvD/MUpwW7UXPhh2wMqXDn91Qc9rPOA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvjxrep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 18:38:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so109955b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 11:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739092; x=1759343892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/76oTdLGn38H8eHzIbnSh0dnKY4nS7/Ubm15EkVBLs=;
        b=aLWMznsV+CJ5GJjVDoeZuBFnCcMieNnEcTS/LlBH9EvW9/8MUtzzHUncklkydzsRNU
         9EaOIlJ8SMN4SskpKc528ERMsrQHzC7ZCGRCcQczU6Zgo20uZLS1xmipFKf7qxnR5iqJ
         Le4Xf3HiNOIvzWGefp34sIVUnSIMLBB9WHlLWJ40aLnZ0obbQCr4vgD9uq4onZu7d0VN
         +wG/DENI0ea8U3B13I11PwgFP6WxBylOuUmbfia1K02g1JWl/KCUxtT2V049NRYPGKb3
         RkiXd4zoAOkHJobCbP9IiGwdMdPI6EH6GYWmj4tuSjEhJynQle2ays4gYH6aeEA5q5EU
         tQDw==
X-Forwarded-Encrypted: i=1; AJvYcCUUxs6dIapMWeLdK+vzo9SRkVsqAoPCDpnsMcfFQJJhw5Qd4Opz8QWzY18/MzPepJA08fGD32B53Hg8VKWQ0o1a@vger.kernel.org
X-Gm-Message-State: AOJu0YwKVbIA9Vii05hZdbWaE7zeXCGObFYvjMUhu1ABu0Bng91kouHH
	xlCoe2JY/EHnTGHMVFHlGd4RdYt1TIePKepELOdGMizAlqix66ezLbsmCz41Q36t8IqQf8nLAK/
	n6GIrhXbN2Rv5hJNvmrlRTqbsvcocfBrY6IS9Y43QSu42PNGoRg13R+dfyLl+Wc9kVWd/d0Nn
X-Gm-Gg: ASbGncs2PbCAEFee7RmTQD11JQTUBrM1qvsO0hBYDnBgBFAGDzC8pRmtpVxXuaGpuM1
	ZqttRrKu71756wsxmVG9QCyq8f5qqxAI1XTenETNfEODmUpdEzoA0clq3ORcU0Dv3weoXEwM65y
	IN6CG9P/oYLQG6Eui2gUagcs3YY0FS8Jt0VXBSuTfgNUidniT5PyayXQekJrBv8TXw555Ll0Da2
	Jpxh+RdEroyKwk8ElfMFZ92Zsrqq6WD4+PWXcHCValyGhXo8EqXZomR+3V2+S6tCxGHkPV/lEkU
	40IEkOAn/EC8HFShSOsMP5yD4YCL0gvKaFRXMTeF4hmILg3lsV9+pasUvCVFedYCuyQusTa4yl/
	ZLziURPyBASq/iWEVDKmxDAWiQUUsnCVQi8TAsqOTOtnBrgz9FHJPrxg=
X-Received: by 2002:a05:6a20:2587:b0:2e5:c9ee:96ed with SMTP id adf61e73a8af0-2e7d0ad23efmr792538637.43.1758739092163;
        Wed, 24 Sep 2025 11:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWHNu98C5qMUkkEF8Wz0kUHwZ/TobJChUZfOqfDNQhuDyK9wb0zE0W+cDeaQIS/hn4PG2+wg==
X-Received: by 2002:a05:6a20:2587:b0:2e5:c9ee:96ed with SMTP id adf61e73a8af0-2e7d0ad23efmr792496637.43.1758739091597;
        Wed, 24 Sep 2025 11:38:11 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:38:11 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 5/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document Glymur CDSP
Date: Thu, 25 Sep 2025 00:07:26 +0530
Message-Id: <20250924183726.509202-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _CDrt3NZACrG39ZeBnHmylX3FMinXnIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXzppnl4yQM0w9
 ivuYTb+44HGHy5du1EyWN53wz5hfBdc3BozEjtEvHtEP+PX/ASrlRCAp6GQsKBSBz2ddTLRkMJw
 p3VwkvjY8K/LJd3kC1++7KHTQ5RO3wIIDE3wJJKffhlQlp5G+GAjtx2oaGMEjYJBdsvawLflGXc
 xeHzIh6abAVm14dY4XFly5uTq1vYtwKjRMqX7s66lCNbxpehDcMR8IU9J4usM3FpvXw+Igfymrd
 MEWhzfbGMYfOgTYnfrLuivlbO8qNVwn2+QBBFe5kvE8vzj2rPAwb4sdhhnIxrJVtAShgvjJYI+v
 tRfbifl6BFNRGlL5enKwMgDYeDlzZAjtubk7Q17o0g1Qh3hlGQvdSXPL2CBq7gT5NUsY00Dl0uB
 TKFDo1lG
X-Proofpoint-GUID: _CDrt3NZACrG39ZeBnHmylX3FMinXnIa
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d43a95 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_X9-DzOTpKYA3bgxq-AA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

Document compatible for Qualcomm Glymur SoC CDSP which is fully compatible
with SM8550 CDSP. Also with the Linux Host running on EL2, the remoteprocs
need to be hypervisor independent, the iommu property is mandatory to
ensure proper functionality.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

Dependencies:
Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2:
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
This patch has a dependency on the iommu binding added in ^^ series.

 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index cba45ce2865e..8a15e0c47a78 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,9 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - const: qcom,glymur-cdsp-pas
+          - const: qcom,sm8550-cdsp-pas
 
   reg:
     maxItems: 1
@@ -98,6 +101,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:
@@ -227,6 +231,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
@@ -247,6 +252,7 @@ allOf:
         compatible:
           enum:
             - qcom,glymur-adsp-pas
+            - qcom,glymur-cdsp-pas
     then:
       properties:
         iommus:
-- 
2.34.1

