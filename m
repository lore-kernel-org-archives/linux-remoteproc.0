Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877633E6DC5
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282330; cv=none; b=TYYRWXO2VOgoTczYXBjrN3UeijJeT5UIkwZNHL+bIjkzAfJPBmV3X6JseFel82BLz2Jd5YVVNmBY9DQbVSuu50Go3MPDWxIGJI2Trs+8DsN4a/osvGJAFHSNckpASDbKasOpc2N09S8GRjwwBzR8n2xOa4J4Ry4iyt+FqcdMgTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282330; c=relaxed/simple;
	bh=3+7H0KM7b3GCDElOGl9jlYjs8r5xlY0/JVR0gENvQG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SN5eZRPO9OiHW7a7AFTdldylaxTWu0xVB+RIdM8xNAdTG/WvY/rlc6hrc8IbpYJDBWILU6JfX4TjiPkI7WJZRKG+PDtFNC51ZYMWQ+cx7F23Ux2pBwtZm05nBd/tjdSsc3X0V2uESBQXPk8WjdJojRDICFYXIX2gmqXpkWa9vOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsrsmOJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SiR3NExi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsrsmOJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiR3NExi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRqG951361
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rHwgU4bJuDw
	LyN0I2lr2dORoG/+b5/ihZjySSIbII/U=; b=KsrsmOJXHJ+zWC4ycVLKgVReP+2
	dOflN4kwDkcZ/XSxcWvuWqfH+n1apdDVXrOeQKGiNVKFONa2l38dNuo5k/4HM/8A
	glOm0W5GX4fW4Leb1cHrkLaUwvtspaIGf2QaLnzvQU0YzI22En2jk5bQ+AOOMEHT
	wBVKw3f7cEVuB5XRDiVtE0+IugLi8K/72WH5Jt5ax1Qf6+SFFP5nx8drQWkjfeBH
	j0TcjSOmfEfVpPN8reG1iLqZZU2nVg3a3eLIFW9MoYpMRorm5S6fZ0KVAuKsHbU9
	GItawNkldJFuLG0C51AILopy9KQv+evfq9cRRl9+NpLUnKgjqJ4QgdKGb+Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2un4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 09:58:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so11312067a91.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Jul 2026 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282324; x=1784887124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHwgU4bJuDwLyN0I2lr2dORoG/+b5/ihZjySSIbII/U=;
        b=SiR3NExiawdlgzcqCKrjqnoANNVY8KMFcXCjDkM9Pr2TPmLRi4xyFSatzqL1tdwmZ0
         9lTXSJUE1YeoN5XlCwa6mfhneNkWacKkMea1JGzlogmm2IN7KR3mVewzOQXEKujLNJg2
         swQp6F/c2f1PujdLRs+nwDhtkSyguv0zVVJqhAHO1cZgOL620qaot5I39bMM0hp0hq39
         o/L4NeWM6CN/eqZRPB3QtC4oCx1cYBoX1L4GVgaF3bPWM9bZVkwPuzNTJR5IHH+J/atH
         iiz4y4tgpjYPeykhYN6/TWBRoLmSjyi9fmHMqCVCWkzZ0GHLDU1LyHYiWTpxwPQygvOi
         nvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282324; x=1784887124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHwgU4bJuDwLyN0I2lr2dORoG/+b5/ihZjySSIbII/U=;
        b=ZNVArNsQKu+TOH4KjS2TeIWlBj7JtOVVDdOQPWaXnOav/FM4lpYItZCHauADNbB4YO
         j45ceB8CUVWmj9Mn83LCtnYRno18Xd9FIYlQrKd3Qe0Ae3IcQF++F9SV4byHk7C0sT1+
         JQBAVOx/9VuoAFAUypynVd3BIV8qj4kJXvMhZiERE76CQcSwwClEsBCuUtO8aWjQdMI+
         c0Nspf1IFv0xJaiuWuLgl6mX0Nwviefm4+B7i3nI8UOQAiH4wQkWlYbfTo4HLTM30VYo
         0ouH7BQbqPWtQR32t3cBKu2vMOzjUXVqPLCGE7Edh0QDITpOHwQ24sFCclXJL/KUMK4Z
         8aVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXD5ddu8HgZ4Y99kdNho30Qhmc1iRzDpJlXjsbuLuln92NtqAkHYE6OycCWZqxMwN4eD0cdL6vuyCvxiAUrnuc@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJ5Tsg3q6ZOA3j3PwVihEWu0TOu73rEbfDJtTgme7bOxBZasC
	RmglpESh8MfB8awHFfL+S+15ijdOt4VBrnoG9c4qpBjEDXn4uuysXi3YZpqLsPYyJsSQLhS5dbS
	HiL/p7EWynKmwC0wF2tKhnqENIj2WpL190YyIgSgkXe7MAB4TrncutoSFD4SdM7o4R3oXsOCE
X-Gm-Gg: AfdE7cm8vYlNQO3qnkrlXvydO4CGiRe2wiFf+WtefTU2qCujxPqeU4tMCmrGNFVCOaU
	QpRRRk/fmtlnn4G/z359WEOf1FMRl7FXqB/GcqGFj/RmUTJYeUxp7aY1PTfmboXH/5MjncJKety
	yl/fBx5lRc7ph6nnqHcmGwBrvw7jTcq7blCw8onAy57XTStiNTDoi4uMjhU9qJXHWrSe53BMHhL
	JK5KBw03HDY2CDOynWy7jcGtL4o+wIKig6TFSCt2UGx8H5+N1WJVFGsg40G/Nebjy4/CEb3l5MD
	4IxggGfi77o0Fa1mXUngAq7l2rgA/FMURjyg0l4eKNaQiIkCI836qRqKzz6dQw8LPq35EuF2PFz
	RNUST/CGH1keGNShsVXBq6JpICQ0/M9SSUA20
X-Received: by 2002:a17:90b:3dc8:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38e4b3e1419mr1736758a91.6.1784282324578;
        Fri, 17 Jul 2026 02:58:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3dc8:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38e4b3e1419mr1736734a91.6.1784282324108;
        Fri, 17 Jul 2026 02:58:44 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm2661071a91.2.2026.07.17.02.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:43 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,pas-common: allow up to 3 iommus
Date: Fri, 17 Jul 2026 15:28:23 +0530
Message-Id: <20260717095825.3962666-2-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NIONFJUqvjiBKEvUDNBJPNWinp6886Nr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfXwsjrSIw/ucve
 gQEquIc/4pyuq6bECp2RD58S4wVBVTf4PKhstcydGq2Tce4I1YYgwvppUAXTLpcahcpI3kw3sXw
 gsLQL38NHXZrBUnU/S3sn5g2b+gX/pI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX77+NXkQx7/ML
 K/Ef8XUBrC2ABi5lxndC93fKGciGCeyGQf1RAH1I+fZEd2I4/J/0ciRgh0ClDc6nMcX+0T0+tWK
 lQHYr+FrpYitiwGasMRk3GtOn+SWNDIwBsQBNKDRRVj4DohUOG3I3D6TMHrzLXkrRdMSPNSFYu2
 J1DcCle/P1MkxMjh4z4FqnmtQ45rfpasEM4GU62bzC2YVbKAjYINEdjtIjPmU9dC+N9/Z+gzPBz
 iW7ZqToRlQMnVt/VPgaebxMa4ONIhSoFhxg3tOR2RRIoJC/eF0dVXLPSHUQkuX1nbqPn5tCQcc+
 uLNl7yUL4jyBfG/Vxvl2w7ZZFHBbCYXTicxsgNA3vxT2Pfk9I8TyA8ZGspQD4ZR0nD+xGSZS9Rh
 PTEiI4ic0oJB0twuqC9SAUEdmGPpC2Lx0IhA8hZ8kE8zPea7iAv8KT1MLR1G/vfm/JSbMoHZxqh
 Ge6WO/0MmkKIcOx98LA==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59fcd5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7cYE88sQBSXScjUnM7gA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: NIONFJUqvjiBKEvUDNBJPNWinp6886Nr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170099

The ADSP PAS on several Qualcomm SoCs (e.g. SA8775P/lemans, QCS8300,
Monaco) needs more than a single SMMU stream ID for the audio ML
(machine-learning) offload use case. In addition to the primary
ADSP stream ID, the DSP/SPF issues DMA transactions through extra
stream IDs that are not covered by the existing single-entry mapping.

Relax the iommus constraint to allow between 1 and 3 entries so the
additional ML offload stream IDs can be described, fixing dtb_check
schema violations on device trees that add them.

Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,pas-common.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 11faf655f530..fb656bda8527 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -33,7 +33,8 @@ properties:
     maxItems: 6
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   power-domains:
     minItems: 1
-- 
2.34.1

