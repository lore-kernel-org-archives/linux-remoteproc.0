Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8083A3D410D
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 10:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236879; cv=none; b=Q12ly6q00pJQwJKfz07dr2f2u8Cb6TCOeQLQWglA/sBw8ZrMp4i87GqfQcAArikaotxsti2+Rp7lwLqn+M1+cdkIQuHDhVCgzHpjqUm9QO4TWb96VlRgY59kMu6wk6s36bygiNIBzUEvUrOEP6vkmE56xcBEz7MGnmX/sfUCu/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236879; c=relaxed/simple;
	bh=FdSJT6D2xuJXBvgDlnbYS33t9DDGMH2c6pzndhSzc9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajofJTFgvR1DHqK5TG8du5GFwIj8cMmH34sRZXtzZbXjIlemr8z6it213DlI/D6s23VgV3kaiX4rPMx6QKiO/GRUlFHk5a+5AQ7A4H0cgzCDqww4ElDdEfiWCr9/P12KAgY7aDjFD45hn6gNuekXE1f0KsE6RCungggBZ2bblOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuS4G/KN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGblgnqR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuS4G/KN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TGblgnqR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jGpT257852
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 10:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=; b=PuS4G/KNYMBBCBci
	q2DnS35ikkPFflQqcO8Kq3ulREbYTryHHTsXcqsUGUzjxMwoO4SeFbiaHLIqhyB2
	C3o/QyWNYPlTuf1cXanaAAue/OQlLyk9nzuma6qHaA080GNA+Bms0oZRzvKeMeOV
	7bC7Z4SnLxXuoLcTx5Azm7MOq8RBAUeymzr4KlyrMlJ2GkNNFSBh/vM7FVZ7zcZI
	Ln4nCQPL4wRgzh1ndREsmShLhio2szKc3m3KQ6VcqBfavbKr0WPOw++AmUy81jrH
	lTzb0tuEW0lHAcXjc83JjIua4LiNOpbEdsY0dNThBWYgv0dyP6cxjQCBXAIAUk3n
	EqYC2w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegv4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 10:41:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b461b36990so22683685ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236875; x=1778841675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=;
        b=TGblgnqRxVdzR2ybGaU792yyvYBAhbkSp6NUqc2GzsE8e1+CWRQQ/XlPn9ugVIPF2R
         LV9uGd9T022lFW5o2/r+G305LHS/U1jzjttmPpwbRtcSF4U9Ds6Q4V4QsUyp0Xw86qj3
         kqLts5B1nYZv6ZLrlcn0TpV+sePXJl+fbNMxOVfMB3b9cpV4beaKpyCfx1llauN54Ett
         i1TlueTj2CHOGnkDrOx0z4/f4Vdk2g3n4b56gBdpg8v9zl+DNNwSnH7A1PCO7V/ow8ZE
         GWwo89VM9KjX5a258NrbRt9QZwzGYr8rIjeS/FRgSC7Wvn02Od5F7/0Ux2Lyg0lQdw1z
         Ulug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236875; x=1778841675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hbge0dEv99gSEczZnlBtmLnL5tJ6c+VFnX/wLkDiWLI=;
        b=BxSSzsSy9bcVhkN+GiuHbE82EQ5JDRT4uweI/oEAr6lhV/zYAKOs2g6NXhMgpJ8SfJ
         YgXlRoI3N2PiFxqARc3QE1qYKHuCbyUhRALk/xBqC5nsnVIyF+Z0dH02oMNwE2fLT8Bl
         UJYBNxNJMSo+ERLi4IBRJxd657+zA0XOGbXu99cl8CsfzV9Hvz3NQJ9k7NTMylaUky4z
         ATOMyXTE0wIe5OToRYnZOQtTD6SUov/Hxegao+W1YPWPjWoFdnN4RJLvnlp1BNGssskX
         KR70mVIq9Jr4a5iRAJNodXmhud1JbnGCP5nX6IRRI2UqNVAnK0Sj6sH6fd8XzGH+bDKl
         aVzA==
X-Forwarded-Encrypted: i=1; AFNElJ9v5Qg3b7PN7JNoM6WFgItgfO/gebGA4rVnGatI4cb4H03SBFNI8AdLojhmE/da4v+9aE+0yredNwKQfTu16hUh@vger.kernel.org
X-Gm-Message-State: AOJu0YzAhfwSBDJIWupYISof0Zfvycxjh/6Whujdg5KYdSIUDsO+vuO8
	bAX/6tzKxpJ54h1QFcKkNCMY9+DUoEXaNlu/zIf59srPFdOIyWCxzRyCKtR5ISlCPrk6G0ysU4a
	4b8ZLEqSo6Eacy2e/oS/yRHjGl3xhtU+egbpHko7hmAHEWO+3v/8EJ6vOPaAbSqasvjISQjx/
X-Gm-Gg: Acq92OHIwF6egwsqU5JTyAvhuLwxB/mbaTFWlQUj42z5OHyUn4as/u+CI72qqTHaQyS
	8qSsr8kseXPflMwGAE2+qyE63x5DYBNGk1uV4m0c28BIE8QUm73M/67AvWkjmJnR/M7AxNrDut2
	BnPlIDS0q3pHJGD5S7TQD5a/2k66K20GesLU4aQGpL06pR20TQQWyH8FftS3drcjZWJRSmDSwa3
	kMscF++Za3tuH5glssHDEEqH9+segUtnapjxg3cGO2EcJgH4QVi72M1cIX4729jz1d/AZFPhXU0
	2fjb5ssbwEjB1KvgwPdzbzexrRlMNvZpAQmytMFinXO/CtRlA+pm1qL9XjYczegXng8obQibbBC
	RBrjx0ijK3XlXslhgDpUzQvyospO5erSyh8BmRnxUb8MVcV6tmfo=
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr25002075ad.4.1778236874785;
        Fri, 08 May 2026 03:41:14 -0700 (PDT)
X-Received: by 2002:a17:903:284:b0:2ba:6ca2:be0 with SMTP id d9443c01a7336-2baf0cf3149mr25001695ad.4.1778236874295;
        Fri, 08 May 2026 03:41:14 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm16692455ad.18.2026.05.08.03.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:41:13 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 08 May 2026 16:10:48 +0530
Subject: [PATCH v3 3/3] dt-bindings: mailbox: qcom: Add Shikra APCS
 compatible
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236855; l=1036;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=c8/SeVqVj0VIwMhz140zaO2lQ7IVuDyupHPGVMe/Wdk=;
 b=5n1W1ZjoJldxii4uYKxfCywv1Ykd/6xTuZLCPfUBElSma5qAC+Qaa0cYoh8pZhXl77swfoqKQ
 WN2goHph21eCaEyIyOPugcDESJ30YXUkeI1TL4DBqK2vljOX18wk5Kj
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX0siyL3mc20sE
 4NCG1XF6UeAyLFysd1Gq6cpp7uYEbfFGloJKIPK6wPUaUd57GGMXwJeGtMNWQ7g1d/1X74CfzXl
 1mMMLcw4ledBy3QM2D288fxsFoG7NcNsY9u+Fr/unIvIHmrV2hm2crpmwieytCCdXhiWGSSlvSX
 DnUbxe4hJ5Qq9nJu77/Vb0iZde3ifJ73Phl0FTQJkbHMHqaqQ5hKvCa4Ooo4+NlAHmnKzy8e+G9
 KCReiVbsNA2tbsV+R05mPNJwKmU/OwKDKWTm2j3jE4tD2A1MF96BlLNSFyMg+tYWXivfTOsMArA
 oaGwC0hdLNjICQwsRBRw/Bs4XrVSV3Lh5uE7pLGyoezW/nYySyRDO5QIBbEqAviPDOlyKJYQpQB
 vYZHiOFFJqb/TnSbkXvbmrKMYNxko0GTE6y+24VXXPmtKgv0MHbeKQsBQCpRcmCJo7hmjQQcPQj
 1CY/ds+JpCWGjD1RB+g==
X-Proofpoint-GUID: eZ2EI8c5owWmGyCtFUkYAD1b0fdfFsRM
X-Proofpoint-ORIG-GUID: eZ2EI8c5owWmGyCtFUkYAD1b0fdfFsRM
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdbdcc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QZub9Z3z2oi6Mc85LyMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add compatible for the Qualcomm Shikra APCS block.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f40dc9048327298c6e78d4327bbd5f530a013604..1b4ef0688ca79f92f579d9bf5ab2cfb2bf879392 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -49,6 +49,7 @@ properties:
               - qcom,qcs615-apss-shared
               - qcom,sc7180-apss-shared
               - qcom,sc8180x-apss-shared
+              - qcom,shikra-apss-shared
               - qcom,sm7150-apss-shared
               - qcom,sm8150-apss-shared
           - const: qcom,sdm845-apss-shared

-- 
2.34.1

