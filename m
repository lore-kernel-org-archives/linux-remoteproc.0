Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A3F37FF7B
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403746; cv=none; b=mgA+9GbW/fjruDXWst6w+/rjNBUC1cta+i4XU7Hyd0WKgH0L5roiuxlJMrNpUW7yOSORKxhx++QUDFa7wE2d7M8yXIz8+zhgs/SmPdGVaYfDaWoO1I42i7SHfXUvfL9wbTTA/w5T1PssmBaWfEjmHIzFTcLiFk53lX3NNi94LRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403746; c=relaxed/simple;
	bh=TbZHaA5vOn1udlECRr5ebxVlfa8fzityrbwOFQl8KJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UwGg501WjSsueDFn/8XsAjnyikuSWwh7PI8hbZq2ujNMW7ROw8Dm3GK6HkjFypqju4ujln5yfk9B2uWdGe6R5cYZdjG0peHZcBb67Vsr5oXQ6fotAR6ZHbAg/JYZExUKT6ArU8JBTOj5sZ3eZFPhj4qI7nZbTJhA9S77JIEy/Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adZxjFEa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fT1rJ6+g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adZxjFEa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fT1rJ6+g"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBnpBi3229734
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bP04qDOHi3y
	ZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=; b=adZxjFEaFGPXbBuc6bt0VXyFXag
	S2m5lb1E6f0ajhnfynpq83YxD3HD9bf09BKI4teFVr7Ca5fPSzvidCbS9uKYR0h5
	h0e4eXK+nZPAx8eRewuzTIH/aSSA3ZkBBulDr0nHoaSGw9n7jSd2MWGQUhe71rZz
	Zx5vVjkF3+plgtZammLSSgE4NcJnk6aFQzY7ntxCDOtr5Xf4EinX4hQz5Vq70jkM
	jFwfTw5knn/B8/lDp61qUtfJUQNp/ZPcEKOCaUI4owrF2adVLP1SOt2rObcBRjZx
	dcqTJ9F94pPwxtNRYPv6QcW596dMPQ4TEQr1YrqhOIZ8ePDnvOho+n+1aVQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7j129-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:09:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a019abd6aso2173298a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 05:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403744; x=1774008544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bP04qDOHi3yZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=;
        b=fT1rJ6+gQhjJJzojhXe109i3VovrTPpWdD7J8UcEe+v9vrXDlcsEac6ehCU/HO2d0b
         KiRkVuvCmrOqTkUdyZ2r2AJvLkMjTrQtq70QxuE63Eh/e+on1ijRMgCGPLUOiSUU8hcS
         LzUUSG9CZ2GKNes3PY3VLk4IXeOR88OLd4o9fsPGHTBXqzZQWXjjirLDYvs0ddLDm/D6
         EdT0LJyxyS6k9nd3CqbgzXso89OGbDbWexnnjImJsckmfb+U0f11a6qiRp8BuY0WyWQF
         LfztdNhykqD36Uc2brwvIt09T1fm8wumC7kjICMDe3bkD8NbQ7d+/VNE6OEPMWS/MR+U
         yBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403744; x=1774008544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bP04qDOHi3yZSiapxHxzYhZg7ajf2prSRAxjflLSrgM=;
        b=aALoqxCNIaZWgRWj3etd8aniCj9BOzI7F1B6kPZjpX01GwG+he60Th+FnlcY7J3d8l
         ATyRHVIHGiU1wHEz+rH2YfvBZdT0E0DvntFsP3LdqL9m9gCtHe8/pMd7eaCBLZ9JY2vE
         1dlvrwDMF9LLqsUSISMC5jUrvtWJcHBVlTI8DBXUo2guox9Qw88Y4qkDQFRUr5VXuk1K
         0nCY6ItsUDY+Y4SzaI5RCLfzse9UNGYo7QlJAQBnhrowWN7a+O3Sye7gPyRjbN1yn4xm
         2f9ZhkLLoEmxg2aqZWLHHb572+Fj4jsDtig7yZV/NgAzzB2OSxlkUrtdFJWOvS5sts6m
         A40g==
X-Forwarded-Encrypted: i=1; AJvYcCUIX9cNn+xPDsYWjBBwvAouv39jEWWn/vJjRpMRf2f9B3+CRY2K4Iq3ljPvlCksIBnLEIe9PkqNzb26H6NDENmY@vger.kernel.org
X-Gm-Message-State: AOJu0YwniPyuDk3rnN97MU1qPqcUqi2IaaGVWQAPSCmHvDgRDlQSwkhA
	ys/Sm3qCtQIEzx7/iwRwIc+1VTGyfxX1Sb6Tad4YekOisgMLlsk8KgPrHcn50otvxLyWxRC18F2
	HrSLwhdaGboRuPXwgZB5EPElK7ddjrwMN06Era5Q/MfLnoNeP/DP98WOmEPrDhLBcw+MflvEY
X-Gm-Gg: ATEYQzyKUeVN4R/b0Lv6FIfu88n58C5L2XfIymvaUlL3kdeCIzaolInOUhKFbl2hRC8
	e/nh8sIlHj9sjnTsSW3LFPxk+aPMtp5N24+xnlNA33gWJr9W2Moy97iMWMsX7rkRG2OzmxOUZ+k
	Mx2A419HhimrXLFPsVeS/6QAFBhYMUTW/JSMDlABaIqZo1cVXDyhC3WU3BKdbDF2ffid4YfUMAj
	9n8+JLtxT2WQpm/3lGANT+FbIBHI0yPHdyX8sN9xBdXSFBiHsPm9qoHWXYoxiDoqf4RvLUwU58X
	D9U5UUP6CI2AL6RmFYkz9Iv31PSOnRzoyrNdz3oS1dvH2XxPCKTLkDyQLlBB0UerNmqSXIUYoYt
	YB/dc8S8F/MgmsolxuCDnGXO1enKf+BJeNb+q4uAtzP14TzbSN3mekXbUqTnPplRypEQMsKNZ+N
	sfpqRBO2l5YDFwDpsE0YZShGmGijUUNNUepqOQ
X-Received: by 2002:a17:90b:3f85:b0:359:8a78:5696 with SMTP id 98e67ed59e1d1-35a21e39beemr2475419a91.1.1773403744273;
        Fri, 13 Mar 2026 05:09:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:359:8a78:5696 with SMTP id 98e67ed59e1d1-35a21e39beemr2475386a91.1.1773403743835;
        Fri, 13 Mar 2026 05:09:03 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm8421945a91.1.2026.03.13.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:09:03 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V5 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Date: Fri, 13 Mar 2026 17:38:14 +0530
Message-Id: <20260313120814.1312410-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8UeFF3Hzd0-j1cimwjQP_Su8tvwvb0I5
X-Proofpoint-GUID: 8UeFF3Hzd0-j1cimwjQP_Su8tvwvb0I5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX+gcow8S2SpZ5
 KpqJY1Rxa1KhZGep3gFHLklInbOCCNT+Mwuyb/qsSEOo+0trL6e6Q0Zdf5wdbwTrVIn8dCo4jzh
 +zCTqHMJNvKpG42jF+pbYNcL4qS1TVx6ivtiR33H7mEtI8O1RiflrpYtQo9IsurDJWIuYOoOBjR
 tT2kJvvjD+iwfQjslP7sFQuZOTePGeiQRR513k7PdeXHfgVkDgIatZjU07JhJDYqrrpYcfM3lIN
 vWBHFv2POA5JGREgjCmdhl6KJgdBaTFoZyNi8PoZPN8onyqDdykJzmItsSLYCD2h5d91Lsx3ByJ
 k+QI4ghJYYEi7txyNp1ccLqvhB7cZ/aCxzXRNHtr83SbPMgMf+mZgBvoZcmo/WuBq0m+YRAkKXi
 UGwxc/pu7gm4oRNn0Ex7lZ7i9/eay1DyK3kfKqk45XISH00qi+KlPR3YhhKhWOM37z/jbuKAtUR
 FGbazi9zBfLyDwEr+ZA==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3fe60 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ePUXPMwdJMzpUIYWY5YA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096

Enable ADSP and CDSP on Glymur CRD board.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..6b7f91a3a968 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -485,6 +485,20 @@ &pon_resin {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
-- 
2.34.1

