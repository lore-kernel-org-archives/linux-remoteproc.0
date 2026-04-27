Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973E3EF0C9
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 19:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316791; cv=none; b=UOeEdoEiyCsLv0ed/1QeauvIave+ELOG3jzoeycVs/cqv/zsYMUoqzPt3mtwH0d3EKYIn3gpX0+UU101/rsjKvXG3Te5AaEdn1VzmpWaX4zwrBSdZY+E1o8yiao3v7/y8Dp00VlaDJrhvyg/fKI2Zly7pHcFon/NzfRhI8UV0oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316791; c=relaxed/simple;
	bh=5aNRN84OKFOh5IPvThdbtzj9Bgy0czm9fuZD8TrdrbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4UW4+nfYF1RXH87JsMXtHnY5RthXBQdbB1IE3tJOa3eob25Oq8PITQj5iFeEzrs9CJe+EZQ4x4QRnWwKuhhi6BJ/BGy+jdt25bz1UGoTi01d+/0VCQoDPlPfY1HKeP9SG++FMPVTqPz12aHuxlMZb6P4Yz0cPT6BQO8RQJYJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUpRdZxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4boBoLm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUpRdZxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4boBoLm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RHO5t1663416
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 19:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mt2hqVDHRpK
	IqINyb4FsXTJqc6aqWI5lx9jihlodcdk=; b=hUpRdZxbxMrirtnBLZe+srErpO8
	3ipw31vmkt8SLIsz18pmMFszlRZkOUCgG79iMw4cFkdI2v1bDB4n2GPH87pT1E+D
	mtiDGA0bDpyNJCbStTE7RhgbxrRwcgZKR8NW9wPex+jLAASl4M/UrKWup0Ab0jqL
	BwQDMxqPYc7rLdr2nQcHN4E2Rrv3RA/WMlur0/RIaw1slSNLAi59k54xoTRfcFT3
	9oP5N6GUaKB1/zWMw2YO1xUyocJ4uqV8khZfQCLaenF+XqGOr3jCBFnZ5gqRNsD+
	G/0iyrS7qN96o0JFOV529ZF/uUTmVJdC+UDvwEzcgQMVQcUwag6HfTyVyhA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n0cw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 19:06:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d99c2908cso10216837a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777316788; x=1777921588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt2hqVDHRpKIqINyb4FsXTJqc6aqWI5lx9jihlodcdk=;
        b=A4boBoLmhrzdrGfx5AijcWXnM7nZxbscXbMGSnV/GC6G/y5BYvcgruY0FJZaYHwtTd
         9/eVJzTg05p1HqY/7JXwPbNyFm39UjmKRldvsieNZ5RWu6V9Ww9CfHu5tvyRswaXvA/D
         Gn17nTGRsuEJ0yBzaIdypXVQvQlYWx+h9nXGPIS/J4vktoN1QISXjHUtMWHSlMjHwgng
         65nKU/GdNCvdboJGP28Z1cwswt2ab+ZfcIrG7Wi1CrHklIOe+JngIfaKBOAwJA6VkC9h
         AdPwZn9t/d81TyN7CwgL4WuX8Su2JaUJfdRnpLC9Svak3hmAcizcFbNuFlFnvsVU5XlG
         qftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316788; x=1777921588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mt2hqVDHRpKIqINyb4FsXTJqc6aqWI5lx9jihlodcdk=;
        b=g4jaAEGKvbCZVmlCBq4xhvJKSj+uIAsos8QNZ2HCsiT9RTH3tuoNmR4usyDErJiPX3
         +NjpBAsMZqLR7YUnEyHY1aWmDDJvm+W2Ss9D0ZFrN+eLTMbR0IO4nfFP3cu7f8GQbJaO
         8OQSPqEmLu+WpS4YlV2EWIEfblcLOa3pwTWt4ic8fxgJpPYowJyFQkTNA8VH3ahtEEBW
         jkLPYKtP+6iLVZaZDnpyLO00n6E4FR1lAQC/HJIxn0GEVno+aAlcYfQX1Uc4FkkUhOR2
         X67t6ifZt1r2OnUddcuM9d4aYVxoG0Yefnm5UKflKtgYuqfS+9gDPWPSnatWl3Tqroq6
         fUfg==
X-Forwarded-Encrypted: i=1; AFNElJ+Qxeb9fY+3+SWB2DxrhilXfo85lFvgeUxQci8Dx2bqtvyMtsU02Ospty97zzE43/ql5lfTQNweBu/WAh5Cj6to@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/LJQwKYLytqaGx4egV/Ho5iYwB0p5aB46FJtbWPV5+Bu/AhP
	VNutL7GuFMXWmjGTFzwrZCprgy3eeRCnaxHOFlyD2b/IHw+Bpdev1cBhF5G7SJGfnlbMcJ584g3
	GRWCFTso/S68DFnDeA3ud6qsNfd8OSYYrwQzrljR96NMDgpFEmKmTqOE4PmzjV3kwfsYjI6o0
X-Gm-Gg: AeBDietCuBUKKKkNkzF+VdjW8snSelgKRl3wk6RdmfAmQ7eRPEOyh8OpNIGqocSd1sE
	fYSYLL+jrWK4pR3bhXo9b7ozKQNRIOzghnRiF3q2WaLcaK32Q6qBm6GhbqhizrLsrS7fa9lCcGL
	9SN2R/auYgd2YzgMijL4UNVJpkOfu7y+ABjJQ7wictZAj4dviZRp2C9l6tQXHhquEds0xccgxAW
	SlFkMKzHbMpkOCJ0Le/jlO+wQCMO4E88q8pm/CEcBZYi2G0Vm2IV1jnld2sAFkzjTM9b9VujatE
	vFhLQKGJ40p0+o9eQWgBg4aWFe3ddcy68fHXbaZxV3iDJMASq2Ft2egGQo8E/tCUy8k9I/xZbP6
	G/SXw08L9OFLWsLCYpp9ZbCoo4k5tSNd+eyg/wHszPEihTpHA55V/caXV1+Y=
X-Received: by 2002:a17:90a:e7cd:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-36490cb851bmr284254a91.20.1777316787988;
        Mon, 27 Apr 2026 12:06:27 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:35f:bb33:d727 with SMTP id 98e67ed59e1d1-36490cb851bmr284227a91.20.1777316787443;
        Mon, 27 Apr 2026 12:06:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490aa527bsm87306a91.3.2026.04.27.12.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:06:27 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi CDSP compatible
Date: Tue, 28 Apr 2026 00:36:14 +0530
Message-ID: <20260427190614.3679937-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
References: <20260427190614.3679937-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIwNCBTYWx0ZWRfX7i2svWhHAZ2N
 pm8REx1d4oz64g7+MtBNwfCwoHa0S36xuhQeaVVTWrngwxrB1P0o3gVHxH50edD5YYiMFCeFklo
 v3nStE1V0UwTmiMWkQGNrQZN3mGayxxzeC/oLFqTSDlxS/LpRugOVsb+BfcMMD1Lr4RrPU/7SxJ
 ZwzlEJUnUoWibaqzW5qlW6dxfyM1S5TGR/lR3mq8yrG5bs+SC0bTninNvIkZ6peW/isThpUFRMu
 CBrUuf7WxTRfFoGAlDY6eqg6jyDAMoG/ZlmCdNSbtN/NFHLKk4e9DAtViaUXzvFQPizHX574U+Q
 BGKfp7pvpqo9vgjtTn6FoLQN+0uA2ksU8tXnmyEES33UYU+xlyE7KGtO2Bvo0CshALcywrZ+PA/
 nYbgZyrRfOMyTAPNJSYzNUnHkWqst9j+xaS3mqGNXv/Y/W8xGhBuK2G3sdVb3cXTEvb0To/VLyV
 W4GkCxNYVFNJ/UhDc2g==
X-Proofpoint-GUID: S1ARCCzSwkB6YNfC52yFpOTZ2WT-8sPd
X-Proofpoint-ORIG-GUID: S1ARCCzSwkB6YNfC52yFpOTZ2WT-8sPd
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69efb3b5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0pp5giOrAzlh4QsvPMEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270204

Document compatible string for the CDSP Peripheral Authentication
Service on the Hawi SoC, which is compatible with the Qualcomm SM8550
SoC except for the one additional interrupt ("shutdown-ack") and
similar to the Qualcomm Kaanapali SoC, "global_sync_mem" is not
managed by the kernel so it remains unlisted.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 161e9b55cb3e..9f30a38152a3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
+              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
@@ -106,6 +107,7 @@ allOf:
               - qcom,glymur-adsp-pas
               - qcom,glymur-cdsp-pas
               - qcom,hawi-adsp-pas
+              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.53.0

