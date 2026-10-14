Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36E4B403F
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978385; cv=none; b=GCr9fGvHwVeaYl2vgJklmIjlfCVxACyR89KJVhhzwZffnONwsd2Mh3HKk0mYoi+8wlu6P9VARmAbqhd2/SB8snK1fjFT5mvSJnKnZDf0yxV2mKcd+No9M69Q6PS0GMms8Tia7U6M2AxPncEtLmFAiiXyEDeRIxT8sD5MIiGQ30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978385; c=relaxed/simple;
	bh=xkX2bRguaaI9g7wCQtbojy2CZApNug7UL8kET8qabx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lMjEGzBIIgG/PcUHKiai1pConDqruHtD+aZZTPL2RufppqctdjF5GwFoXdy/O7aQ+WS9y5d0r6ZeYay6HBjuVm6x0NA3jQScdemic4qpoUBoq3yRdMULgt189Oe2r40DTb4h3a8PzzKo8QLu057Ib2o6U/Lu/mS3lNtId6CaTR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdVbOOjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLdKkA4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdVbOOjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLdKkA4+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBVQat2515931
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 11:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXU7AK+Su6WcJRAjU1QDSLPTn98jqh+NujTwosmUluw=; b=mdVbOOjFe6/mdkk4
	7/BYCspmistjQuawFq1h3xS/x03cEugCUH1A4qxmQWJ8QVQjcH4cb7gJQ+q0fkzZ
	4Tlqo9DzYe6DCpFAUvpAnJDJCTpbS79LrDbgtUZlJXv5bRge5/EgcjotDflXDgYZ
	CEgR5A+XvZnofMofcPW2eYAKmqMSCeLgGTnjuufka9PQVuiupZje+s6JKxLVpTyd
	Cm3PreiCGq+o3nmxViI7oyMWjBdaIFhQXpKne9kJ0CuFmk+Vnf5OTGH7u0ToNGwM
	Dn1gK00P0O3eeAyPcK4i5sUplh37cppF1VrAk0Np3eBGrHIfKaPGlXUCl0lc7MTO
	lEvqHg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709bw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 11:46:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so5266431a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 04:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791978381; x=1792583181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXU7AK+Su6WcJRAjU1QDSLPTn98jqh+NujTwosmUluw=;
        b=HLdKkA4+n7fbI5lkBBuUGDr7kbx1PgmGAwMkfBI1xotynzrrVvZ4eqge0eMQt6erBi
         +Hv8xN5JgPz0N1cuuJf3VK+2l4u6x/jD1VH0z6VO6G9fKAtMsnpPeUtp+pMMAIZSbXzb
         h6X5mb2Jz7knZ5KYpkbMqmPE0SxlVgoSEoVmn+OzEzd2JwJ0RsjTh+T4tMWOrdFDxGD9
         zfHwcyp6peBalnyDzSIHOYIfKtbfmDRMY66xXD5qqvRuO58nT06NIGugcRmFTV0QX1Rb
         XmRPqKqb9/rG/hXf/Ykcw5XJQ7o8PcL5FGQTDgWS7S3W7JMHWcTO+bxbeOlOKatBH9Vf
         uDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978381; x=1792583181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXU7AK+Su6WcJRAjU1QDSLPTn98jqh+NujTwosmUluw=;
        b=zaDAnyfNp7EvL3NEADA7l+XHoL7gRMt9PwSjeV0DLBNEhxUy+GwLrXjF/vGgg9QJUf
         AyUkCAeu/AUO2EgRmlR2awVnfyHIMIIHit7LOOyl2Git3+AEmsOunWV7jwrrNys+1htf
         974Ep39wcOJQmVVFH/mwiH8ewqLfo3we2tulMS6fOpGRqJw69ovZUcGd6k5LpfMfdUYo
         LK6BxcP8kCvOlHO/QKwtUkYI5vaTGzhlsv1D49x3MPOvxS0Ar92MMui7A0I72BfYhPjP
         pYwFrYbjn0pHzIsmvZUTuNUFcYo1yGEFSGB1/9tliDxHaSGjlbYMt9x0skwL+am9mvq7
         4Rng==
X-Forwarded-Encrypted: i=1; AKwUvBy8o3/Y2OSMw+XtkATv598xtoFJ4ogr7wBpp2dkVs28ySjhmvFaf/0ZMhwqsHdchgAoIYKiqdIa5iJcQOGO06NH@vger.kernel.org
X-Gm-Message-State: AFq9FYLD3nif7gwQVuc+0tAORrlK3k8h3V4N/X6O6AJUI1NDKat8ee5g
	hW55cTnCjQvLAYYakiscbrEiTzrG9jN/KAbpVyWYc5ALc9yFGkH+FWCECyRLa2wLtIXrwdHE98Z
	d0P3rHR0Y6R/UG3DxJCzvzzu1nltn+ZjFNdejBAC/8VjDtAEnujyW/uPOloZ0wdslRYhwD67x
X-Gm-Gg: AYBFou2Gl4SuVsdRnhiQ1AwVNmI1BOsEMUDe6wVqIocruDWCi/sBcoTHtQrUFPpQGWl
	JClpX9iXSK5vwpsZL1GeDUOaPrVj0OnKEb/usuGqL1bEWa9pPTeKfffYgHdwlwmn2mSBpylheLf
	ggzv4z8jNRKM2JFFlY4Sc2p/FWizKZpGDqrzbd5ibPFj/ja6Q+oCWhAc05103JcobXJKQxeDAtd
	X0NHrVKbtq3S9t7rua27F1b4rdCL4lGfYGfgj0H4Bg19OGWFMmJisVMQL20/HSVhwej2lnvNSf4
	y0ffIulNzvijR4HFSnxzYolaLUXKkcpZEPnDUmSP7mNbz4Lgkj6fpeNGRTdtuMYsz9MXRCjA+h2
	4t4BNmukkJkEnwPvjZlomJZl5ZahGBu2KDtAt
X-Received: by 2002:a17:90a:e70c:b0:3a8:21eb:2e1a with SMTP id 98e67ed59e1d1-3ab3ac675b8mr9059231a91.30.1791978381056;
        Wed, 14 Oct 2026 04:46:21 -0700 (PDT)
X-Received: by 2002:a17:90a:e70c:b0:3a8:21eb:2e1a with SMTP id 98e67ed59e1d1-3ab3ac675b8mr9059204a91.30.1791978380608;
        Wed, 14 Oct 2026 04:46:20 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6009d94esm4219151a91.8.2026.10.14.04.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:46:20 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:16:09 +0530
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas:
 Add Nord SoCCP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-soccp_driver_dtbinding-v2-1-09d9c1378e9e@oss.qualcomm.com>
References: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
In-Reply-To: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfX/5Ti1zXMYBR8
 Fo6qChPs06pKIm65S/L1f0b815k8wesBEnURcYasnNsC/i3a6fubzV/IW48BtahGUKrljDy8Sn5
 sCX5EkKvTXiFvl/zqb39Nzp4BRmC5bGZhpweQ7ZqRkJYAnn+63n3yKzBUeg3athhbrleyLLbXg0
 eN9/iQTBNB64jn4tnWffu/ovQ+cItwGp+g2M+jyW8yQBELXChQ90AXrFSY7PWJvj0lq5YRmKXg+
 lRUfZhdaXj+U6R9oWdDj8vlejG6zo8LaofkokXzd4ZE64HcJ+FBZEyJn0l06l+Tx9xrbXX3zriW
 uBr4onb8/NwCUhNQzw0KnVSLmu+wLO1H7hSxeGuqEsHBMjj8sQit7nkMbDG+L6mOMc0nOe2eS3Q
 ezECimB2tcQ7Lvuy88gN4IWOgUZLXOeM4SW3nb+0aodxHczQzIGyfmoOco7Khl3jXV7spshy2L7
 8WkmiwOC9320WRxP9Jw==
X-Proofpoint-GUID: 0ERuIb8P9js5SEamO0uXLMPgSMkh5dip
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf6b8e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CHE7YESx92GpoR9PaLAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 0ERuIb8P9js5SEamO0uXLMPgSMkh5dip
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfX8dG8IWzoQmgv
 qeOayXa15jREaXoOWoT/AIMIVvci+Rzd7GGyllrpcjIywO/t1MMk/yjIb2QcogGT4kQtxmrXzoC
 w8aMnM8VNUGZReH0DbDF5wWN7hQ38cM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140046

The SoCCP (SoC Control Processor) on Nord handles hardware fencing for
display and other use cases. It shares interrupts, SMP2P states, power
domains, and clock with Kaanapali SoCCP, except that it ships firmware
without a separate devicetree image, so it cannot use the Kaanapali
compatible as fallback.

Add qcom,nord-soccp-pas as a standalone compatible with a single
firmware-name/memory-region pair, while existing SoCs keep requiring two.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index e6c78d621d17..c1911124e073 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - qcom,glymur-soccp-pas
           - qcom,kaanapali-soccp-pas
+          - qcom,nord-soccp-pas
 
   reg:
     maxItems: 1
@@ -49,11 +50,13 @@ properties:
       - const: mx
 
   firmware-name:
+    minItems: 1
     items:
       - description: Firmware name of the SoC Control Processor
       - description: Firmware name of the SoCCP Devicetree
 
   memory-region:
+    minItems: 1
     items:
       - description: Memory region for main Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
@@ -93,6 +96,23 @@ required:
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-soccp-pas
+    then:
+      properties:
+        firmware-name:
+          maxItems: 1
+        memory-region:
+          maxItems: 1
+    else:
+      properties:
+        firmware-name:
+          minItems: 2
+        memory-region:
+          minItems: 2
 
 unevaluatedProperties: false
 

-- 
2.43.0

