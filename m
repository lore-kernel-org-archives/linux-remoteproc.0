Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD643D1718
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 May 2026 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236863; cv=none; b=BBbiKIVKygW7CSAZO5HT6yLZPXDoP/6NWDdcrx2x9lTvmyvW+UuXmAUkGDsaL/bTo7oKPWZIY0wtrUYABcrbPPhWXCGtQwegbLchJ50iNoKWvNHDORqk5kPUSxwro4qLy8ARIQf0moZ6xGBJLHw7xTaugF6i/kIq3QtM3T/IwsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236863; c=relaxed/simple;
	bh=mUPnjNuHqO/bEXTBdmLL/Yjo490bvMFC4mPOt6mriPU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OS23hmnCaZ5quJZFgGy8mVpO7kCijBKBZSW1HnEJ1kJrcDB2tnrnzLiivEEkR7ltXcSK+eTGBTnYZRAMBCaXYuqjwf++8GrZ8XBgYjoR6qZCnweZgN5Rm14eAu+IF0zWQwf4FE8hvW8RACkKx3E1LEa/5W7A2JkmAMyOt0+sa3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxwNF1L3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXvhoaIM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxwNF1L3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXvhoaIM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AP7fW2771642
	for <linux-remoteproc@vger.kernel.org>; Fri, 8 May 2026 10:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TmQHXBxc7t3ZNmR8HxQMlg
	NPCNXa7NZvV0yAvoaouS4=; b=CxwNF1L3DLP7+ElKmvvLfIOo4Cymuthi5o3UOR
	O64epeK0PeTitXmR3OPX6SJid+PnkMkgoZvl8daq1Wgdf0vTDG/sQRMMrDv5l0fQ
	/GExikl6Uh/v1cPw7wSr/+hTQ3Z+MzQgoITk5RtMqF+37jswu43NAwq2FVERmguw
	r4fLP0BZTrRS5+MSdMGLh41a7CvpLgE/xXaLyn2y4qmT74Poo7Ys73wsDPK9JtYM
	zMERB7AwjaR7MNZuAisFZyCuzxV5w7ysFCoOT2cZKwhzTc+qozJWYwP0EY2q9Pb9
	b6aZIrAGF4obaK+ctQ5Wxt5uacxh9O0vIQjdh72v+/L74+Uw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5k9hx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 10:41:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba3245a43dso7201575ad.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 May 2026 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236860; x=1778841660; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmQHXBxc7t3ZNmR8HxQMlgNPCNXa7NZvV0yAvoaouS4=;
        b=CXvhoaIM5Lw14vtlqONmd7yoEpkXFrKU9+OZZEUK4RY94nwLMiabrHQp33D/MhQnSp
         ie60HrF5isSdFIQ9XpmBCchQnD+1s5xjKrIh6T2IVb4suyw3rHtmbr5MZ6q7oo5jQrQ1
         0wK6gXsbj2/d7JDzayzugxmXkTtGXbs+HXaHdXMW7lCgZr8SPM7nOGL3pITG5yqoY5lj
         gvt/2vpr2t/whdLhWRIpipT9rwv2yNmc3Pz9h9fBFpVkd50CZsjRXTgkWd4mWg/lR4zq
         Rq6vH0b6YH4ajjvupYnokXsdxaYUHAWxI1amYmLd2czT/A1Bmt7NBP35yIpJKcm2jMbK
         nzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236860; x=1778841660;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmQHXBxc7t3ZNmR8HxQMlgNPCNXa7NZvV0yAvoaouS4=;
        b=A2QS0uAvHrt0yLfwnAvQEWQGNrUG4oBPaYIOCSKvP4n2bghBEdW9SAaieChcB+NRmM
         0/rwn3Q5uPSWjX6zscdIkgJwBpU3vhmZplsMg3wQkJVQUCNG43q4yymgYrkVD6++WUCW
         rjhVisrTxS6h7m/uiKKgb4Ebvl7i338WKS7gl2zPP27NI8ko6BOYLDkeijngPmLTc+iX
         VAyrPRNPC7oLH3KmTgyeYB7EvS+kjq+f72FeVASnBKcab9JgCgq1TrOAvp0QbhLgO5LW
         BmEI/qDvYQKvfTr1CfiOnHxNH8SjQdkfQI6hNQsfSGbNJ9/+YqGpqm4wEqJPGVA1w3IL
         1afA==
X-Forwarded-Encrypted: i=1; AFNElJ/DJhH9Y6lL5UYOcCajAuGMA7mufpvVsoI0fldkkHOwdQmKpZ9eSKwtT5XoUvm19rT3396bTkQ5BfD5tw4/ARwt@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzfjPJnnbmBzabXrYMyp2/sqwtmouU1mOmFp7zfVxGq6Nz8zn
	pbm5eHW4ZcYu5c3cdJbV731gsMBJqOcWp8tccPPst2RGldWbc8IFZWsrYqTydXnd9wJytg8ejIy
	s4hCHM6qMhFB2Y1ajwRwx54N8qxsoeX2k81wdlXmJDRwm1srHbscOvWlvN/nb6RMpCNMLpAoC
X-Gm-Gg: Acq92OH2FG6Ux709W0fFjHkq1+29nOYyR5xw3yRIEjPsZAuOkr4suM89LcfbvET1etQ
	a40SES3y8q51UO50WB0y2joxV7SbPZR5WUIpnp0xCb8PVZrPwVtVReG0XUXII2QefhHD9kM5G+W
	6B4vWv5E6ZxQuRLiS2WzRlZRiAvEb0IVLY0oXcbo2XfuwBrwIHaOto16TtQI5id59E1dA5G9gc+
	GTijOzTt2TD5+UeHF88rxZ0JH4lSVzAQa4AHEcb+Usy7sCwKb4oABHOUiTlhSIv1eRwvwAZTUlb
	OhcQbaSUaQgv9DS4Od0NDWrxCNgi+EVp8Gn4tdvXZAOIHE6B6Ajiqro5E3mB2+e0kGMSGPWwBMX
	l2qRwAXTAazp2S+NHr6GBrXyl74yR92dTKupkimalSLpMbjNhrj4=
X-Received: by 2002:a17:903:124f:b0:2b4:5c0d:314b with SMTP id d9443c01a7336-2ba798a8fc5mr122637895ad.38.1778236860362;
        Fri, 08 May 2026 03:41:00 -0700 (PDT)
X-Received: by 2002:a17:903:124f:b0:2b4:5c0d:314b with SMTP id d9443c01a7336-2ba798a8fc5mr122637515ad.38.1778236859868;
        Fri, 08 May 2026 03:40:59 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm16692455ad.18.2026.05.08.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:40:59 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add compatible strings for RPM and mailbox devices
 for Shikra
Date: Fri, 08 May 2026 16:10:45 +0530
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK29/WkC/42NQQ6CMBREr0K6tqQUpOrKexjSVPorP1KK/Uowh
 Ltb8QJuJnmTyZuFEUQEYqdsYREmJAxDgnKXsbYzww042sRMClmLqhScOrxHo73B/hpmbQar4+j
 1b0xcWlAODnCsK8eSZIzgcN4OLk3iDukZ4nv7m4pv+7d6KrjgdWGsavcKnFTnQJQ/XqZvg/d5C
 tas6/oB137VxdMAAAA=
X-Change-ID: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236855; l=1378;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=mUPnjNuHqO/bEXTBdmLL/Yjo490bvMFC4mPOt6mriPU=;
 b=E6v6ihhLYwnYWKUw1zs74xf7voBZbjNZ9eeCunTwHJT4NeDUYPy4tbucGWw5S6MhJtqBg7e+5
 mi8oB3QZNnhA+RPmd359y8n+Ve6kp7TwACSar+PKun/WetleTxP0l8V
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdbdbd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JmJi3zLfmrkKxoK4IhAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: d0zhTiFSUcYaqy_PcaxN5NhH58xAcwUx
X-Proofpoint-ORIG-GUID: d0zhTiFSUcYaqy_PcaxN5NhH58xAcwUx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX16JR1KTVzmbt
 3QvtWlFOyZbck0OyIJ7E6XdbqwVagfnd9I8fbXWCwUfKC/dxFFiL8FvzNRa1Rnb3i4nxEjN/eNj
 NF9E+qOAAtuFU0P+1mnDqYAlRHHl+PGAJ/WKn4PxvgKc2JCuikcJ2UZ2turnLTKI0vk1D5EOuSP
 hw8Sc/Po4hOJeRpv5Wka/v9y6jagf3RRCP9OLL49D/rX41wjkscwOPOJyp/QkXmhB7vXpD1QPm2
 5/k+zuQzZZEU54ZWXXpLzy3HYhdIXRlYUvS7i9gbsqV7B2XmRn8jCWQvHB2USoLaTMnXUwO12Cj
 ZLlA7E2y2TFG4giIpfXR/NWP034tWte5RFWFiVrnAG/m97FAxnwQ4Y0gwWqqvFcKvBvCg1FOSqO
 bY6vavPy6J9fRrYHsYXMMCT3C2ut3csCX5r6t4d6O6pk9tNKkXd7FzzNczAYwHlaeJW2B0wUpH/
 Zzc+F6Fsla+d2u1M3vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110

Add support for RPM processor, rpm-smd device and APCS IPC device
for Shikra by adding appropriate compatibles.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v3:
- "qcom,sdm845-apss-shared" compatible is already supported in driver
  and mentioned as fallback in device, so no need to add compatible
  support in driver.
- Link to v2: https://lore.kernel.org/all/20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com 

Changes in v2:
- Require "qcom,shikra-apss-shared" to use "qcom,sdm845-apss-shared" as fallback.
- Link to v1: https://lore.kernel.org/r/20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      dt-bindings: remoteproc: Add Shikra RPM processor compatible
      dt-bindings: mailbox: qcom: Add Shikra APCS compatible

 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml      | 1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml         | 1 +
 3 files changed, 3 insertions(+)
---
base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

