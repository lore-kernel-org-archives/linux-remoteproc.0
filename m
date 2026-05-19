Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0403AF67C
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218786; cv=none; b=sED49ZhMnddyEcX+ETmHWiI4BtiPD6kIPJh9i2G7ZGEpS4NlZZZeMnDP9nfVSzNyPTUH2Y6gDac/TJ0+dK4rAdjKwY+nwrJSf70QaXNNXF6dglMT3nrSEq9ZcQ2oWuKgUbdQ2iVtfWrgN4IWgZTzD08biC42i6O2CO3g6W97WKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218786; c=relaxed/simple;
	bh=zW5b499U1TRt5p8wBJGiaSnPdrSlS9J0lZWt9neayxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mHdMF0pPgUqThaiMZ23WNwmErh4W4Nj+9KCGZA5NAJCkEcyImAVOlvHxRd3mVTZfD38UfksoxyDy6o5uMeWNpn6HKPz8vHMFM3Allh++yX0q4bNh6usgr/GijZuuFS1CuwsBtjKJ/uAaimqrKGwa8xT6JpjiQTlCuO3OWA/GEAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c40ezBTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drjaAY9F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c40ezBTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drjaAY9F"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwe1n1725401
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 19:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uf6vNedqKPBjY1rsrsWPqV
	vcKV6iDdSc9+qVonvoMYI=; b=c40ezBTk7JM2WUoSwHH1E9kdVj5kozuG5CzZG4
	wgV+2ZPhqoxkgP/DrX/CjzfkK9CKx88gXf4RRSs6iYcOZwLq5FHDwmBSUHCDflR4
	4ZoXArEmxltWLvr2yZ/qU3cFD3TqGYXK8IQO9aeuwYbKf6v3bSIYONkJREENSsrL
	l0MZS5uHmkaucCFKTNCnWSGHhzCCZXs9pvAA4NHFkxhqTnQ4PaC4BdOat4k9V+dM
	F5jmOa0740F6yShyutvBB8KO1GJbnuUBYWekLZFtXghlpmQmZ5PhORUwTqQweu/K
	PjrDzxaoe2IoP7btHJEhPHAZHJld7kyRMQgd4sx1rrZT91lw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qh5q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 19:26:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7748d0aso37679645ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 12:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779218783; x=1779823583; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uf6vNedqKPBjY1rsrsWPqVvcKV6iDdSc9+qVonvoMYI=;
        b=drjaAY9FIhpglk7R+XujL1kwxqqqSij6+E2jYfeeLdn3uQUGLuwEb46v3F8k7DElLr
         BSnfp55IFy1kvivaKPQThCVRapFigR/BYI4gjmH6BZaVNzqgMgA9D1bScRBn2c39yIk8
         HNrF5rD8trg8gcL2QY486aHXsDpRRZ0TMhUChmn/AA9Rl0oNv2nJenoLpAVbTpmedsBo
         xDT+QWTCWd6gHWfkKVadE/r0oD2LIBZNwYTAqrlT3xSVi5hv1OSCBOSHrhbdQyHHcLSY
         jdW7SbJOoE9oPf0JAlRR5im0cZP4s9fs3elcbY1D+U+0RmEeqIcuRpXz1oSJA070zV5O
         puGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218783; x=1779823583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf6vNedqKPBjY1rsrsWPqVvcKV6iDdSc9+qVonvoMYI=;
        b=ZLDDntu2E7r1azqEDxePsCkEf3tJymXPRhgdwNOK09k0ylgd+3A1dOyB3lgn6KEMRd
         GPEfyKWU6x/NRXuGO8KPgUJnYtScfKV0H9OkApwiOaqphOvRdjMC+l5nxG+KloiZsMrG
         j+cLWD4AJW7LO9mwSZ802S+nRB2stvwKcpk+NnS3L6w2cpm5XXlOjwTJc2cSv93BW/27
         2VinskOQwlVQk4y8LJx0Se2rtKueDxyk+dXlUV2MKcjDQ6sruijHCL2ZAkA7gSUicTV6
         bCQMUpMOLwps37HciZQJUxgFhepOPCBwerd1loVO7TK2E3qVmXbrU5bv/xgw7Lsr74HW
         +LXA==
X-Forwarded-Encrypted: i=1; AFNElJ8kCHFgSmzNGBEUJVo1qWGH5OBuEYSiNFj99Y+z0sxI4XoaJNrRfVhzpxaXbHP3WqBqpaJLVk68WBFgHDZZiI65@vger.kernel.org
X-Gm-Message-State: AOJu0YxvmutrJOvd3YP7AQgDBtczgcTTz8H5fp8uu4nkDeTu/SM/OoI1
	RGqlDPoD2GSaVxoH/wY/q3AbneeIIQw+I9aSUhtwB2iuESeoM3OzNxUxRhcqDGWZu+MdjXy/Y/T
	QCakvJ5tALY+K1VyzG3Evn8Qkh6RGfne+MqM4XeuWxFPsaNIzBed0SWef6Q0wnA5tOFVqLnmG
X-Gm-Gg: Acq92OFnv+Mqztz+tkV3KsdY+P8EDxfg80xX6gy8C+jAg70OcSCf27DKOMMOdoQVM/N
	exj9ZlEOP/VaOTKp4bgsJYc0uNvaCqF6jm/ojvUpgXG3FAc3KpuwMT94/Ls2OX+Lg+wJrQsJTxU
	Q6DcMjdb88hNHymWeVV99OfRqMVB4oVfsAKxQB9tRqk39M4URgGuOM1ZTlRaJ4iPDmX0A2K7aOX
	JXztgbnHsOELyUs70yUOQ90/bS7VkT5COSH+7q8DE+YU6NFRfRWr06VskhyTzDNbSZDDbp69Y80
	bTP7RpZkrmMFIxl2RKpPyb9I61GHID3oQI7JROQkQuPr+8WjXpWSptPmJSJPdfNC0nQcNIQJmxY
	5TIuaWNDjS9Fui2WHByGWRTGfZzOLLw/sxFR9CU8f/DqIidcNO6ad+0JZGJh3KG/39Wz0v9me2B
	ViteX74VehY3/u8Wjq7mNSNNeg4hBZwiY1SCZTBsjH/13U/hZjLQ4=
X-Received: by 2002:a17:903:907:b0:2bd:8822:d8cb with SMTP id d9443c01a7336-2bd8822da42mr207978965ad.23.1779218783121;
        Tue, 19 May 2026 12:26:23 -0700 (PDT)
X-Received: by 2002:a17:903:907:b0:2bd:8822:d8cb with SMTP id d9443c01a7336-2bd8822da42mr207978675ad.23.1779218782632;
        Tue, 19 May 2026 12:26:22 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd791e0b06sm173927925ad.22.2026.05.19.12.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:26:22 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add support for IPQ9650 CDSP remoteproc
Date: Wed, 20 May 2026 00:56:16 +0530
Message-Id: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFi5DGoC/x3MQQqAIBBA0avErBMmQ6muEi1Ep5pFaWNEEN09a
 fkW/z+QSZgyDNUDQhdnjntBU1fgV7cvpDgUg0Zt0WhUnI7eGlRCWzwpSfSqd67zNqAJ1EIJk9D
 M9z8dp/f9AIeryFpkAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779218778; l=1212;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=zW5b499U1TRt5p8wBJGiaSnPdrSlS9J0lZWt9neayxE=;
 b=S2O9xp9AA/AxpOhTEWGwN5XpSAoR6Zr3M3VVWw1DqU+TexMsboarRuYHN9yEBIWUgWJ88qJE8
 NXvv7rLjRHiDx9qhLN2aqHX28maZqV6VS2d/1KsSZzTEV4w9R0vb5LS
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5MiBTYWx0ZWRfX6zY0WBKxdE35
 WdRKQstYh0atec3r3MFUX29Kjw+hV0Of7lJj2wtzdIcEEjqAc3TAMTKAGd3qW28qtKbANl/2av/
 3KuAjzBrjcO7kPlRNz0vGD91uWbj0YSTX0nebjO55CdqV0PLb4OgJ3UTrWuaO35u1w+nVmCg6cn
 xNBKEnWFAQ2YumrJOWJRSopTzvr/Cd/TgnXaKxLuQzqjPbDp3WMMHio/n36iyf9jY04mamH8DgR
 jOSxexbUzyHb9IXGSWbhU6yOn9DeNNFiVJXqn8KDHL26clGWl8mMLlJx0DqWGxlsXHB9a6wnjyT
 SPW62vfvUonw8xIuwO/TNOURQdTcv5vDf766FBud+W6hFpf4tUy2LbX5uGDNM/jNdRgOAvgWLHF
 kxjjtJOWJKdJl7VlahyhA1AYxCqGVfFoZshDrW2eEuA64iN4nAlpZTR607qoXtTFT0G/SBFqyiO
 carSlCxxcDkpmlTbwUQ==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0cb95f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=995uESR89bAMFbUx9B0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: SsCbOActCS1WH1Jfriz1njKfpxQiTJGz
X-Proofpoint-ORIG-GUID: SsCbOActCS1WH1Jfriz1njKfpxQiTJGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190192

Add changes to enable IPQ9650 CDSP. This series adds new Devicetree
bindings for IPQ9650 PAS and also adds required changes in qcom_q6v5_pas
driver to support IPQ9650 CDSP remoteproc.

This series depends on [1], [2] and [3] to functionally bring up the CDSP
remoteproc on IPQ9650, but does not contain any compilation dependencies.

[1] https://lore.kernel.org/linux-arm-msm/20260518072856.22790-1-sumit.garg@kernel.org/
[2] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t
[3] https://lore.kernel.org/linux-arm-msm/20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com/T/#t

---
Vignesh Viswanathan (2):
      dt-bindings: remoteproc: Document IPQ9650 Compute DSP
      drivers: remoteproc: qcom_q6v5_pas: Add support for IPQ9650 CDSP

 .../bindings/remoteproc/qcom,ipq9650-pas.yaml      | 136 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  38 +++++-
 2 files changed, 172 insertions(+), 2 deletions(-)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260520-ipq9650-remoteproc-9aa8c6d05de3

Best regards,
-- 
Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

