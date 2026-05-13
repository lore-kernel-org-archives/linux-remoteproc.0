Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7AE39281B
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 18:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698067; cv=none; b=rcRizYXzNRTv8Vcg5NojpdlEIBJvS4+fVkXyzg5wt1iSopnnE+0QsijgBttfhO3c9tMzleCjNy0i8WIWQ3M/8b8FgS4x+JvQqPsJ8JeEebEa0ZcVrshVW5kfTQUOms9O22CXHMaDV0/EsP2Oew3SjNNw3JXp8jO6rNGmtAfnOvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698067; c=relaxed/simple;
	bh=7qm4TJ5PlTXgWLtbiBm8P0s0EuJqU6vJB0KebqpWh+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OiFTpUZ4f745/PMw2v0PXkhH/53S+zlValxgOCVAAdW3SCzH0wBTPthu9dgVHqG5KrV2mgki8nRiJqAbIDXhz4fL1t4n63BvAOwGJKCsEsjwMj7uEaOJuCbhtOQyce9R8tFRe6uKFqU0wA3hXMBkOMX1NEjFgHOehc42gODwyUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5ROVzuO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkxAspqG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5ROVzuO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkxAspqG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGlhtr2321254
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 18:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zxe0zN5aRPOB47Cchg8FdQ
	3evbLHaTap619AJnc8UNw=; b=U5ROVzuODN40k2NtCAhhphMUbTlLEfmsewXUkk
	cbr/pZTp4TWguCwBst59dxmdLHziRRlM8vdzGskoz8jtxhDubq1QCTYWlNP36dlh
	tbziNVGlEIuEoN3cnDQB9xbXTI5MlsR26/7HmMFCZ/l2EFCJTiml1BqijHsEfuDo
	85ZI6VglfCAbbSK8J7Y88peF8o7xuwMeehtHtLR/k2Akip5qHBHJAhsVlzV8JQG8
	/9xcQbXdJFuwKINbMRN82bkluVbUdXZLqxG0S6Ea9JDOgTdrf2Vz749Lura19wud
	bDe7Iz4PWb7MnAihSBMEvoBzFvVZzBhpSVWwOpy4VBx0uKMg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hgubj42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 18:47:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc6899bfb1so57428365ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 May 2026 11:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698064; x=1779302864; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxe0zN5aRPOB47Cchg8FdQ3evbLHaTap619AJnc8UNw=;
        b=jkxAspqGQ/Wq89PSRD6Ikm25GxRdTlA4orkHh66TJCmSKy1mgEllMguAmByiNMxDni
         kNiE0eXrozRVQy/k1M9fVq+Szth4Cz3Rzso2mUyc6Dlaf4NRQliiZ0oaydcihHDlhCPe
         1xKKwgpdasMOQVd8es6GAo1FeouJfFe1yUPo3p8H9S/bVLaDgszmef9Go+HbSZgRs+yM
         e1qeL/5v+w9PV6pGD9MKC88YCBI3NUUx2A1+oLmfo0nPqkP6zR9nTEdbRYKFO3T+dxpn
         crf+R5ASsMxfOPTc6j10FfnLaePTHNoboS8KS01fzQKciTgUx+QMM7ju7P1al1j0ZC0g
         A1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698064; x=1779302864;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxe0zN5aRPOB47Cchg8FdQ3evbLHaTap619AJnc8UNw=;
        b=YRNe/PzZAva4nbY0cYnCINJU2stSq7F1B3vXFzLPqxVu8S8aKouIwCaibPlzWKlwhj
         7+o1ba4BUVk51+TPmpLKbemMdWsR5tQFxtsYxAIoUEyN4TdTGFwxf1QTW4ctxLoHGVeA
         CqRBa4CAUEGLKZmFo/rmK0zopIMmJRxzvfuHzdUtV9hWILTeRcI/+3fWog/kquwBR/1x
         vY/VCUr5faAhsVGwrTQjylQ08LYS+sKkEqBJ2sj/gcgxsTasj0v4bOjGkNKTTva5ELLY
         w0QOrMVXaiW8f4OAOpbt9jUkR2J2FkOmjL1x+JQjQd86CuM07paiAQL0ss0WTzFAEI6/
         eImQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CifbzpFDyFOVnFVviEXLZUPEW6yvV5T4XAvMQmbinQtTTbezdBdlhZWxdYdAyGbVIqobcC/8UXFejqQbPnRD2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbgjal0FTQYitPwV73D5ozCuz+0I+/XSI2NRN7Gf2q3AByjzM/
	CAmvyh3VJc13sD4MR20qZePzO8/voxQUoI2c77go80eDcGPGrjK+KYIHQnbXux80CZXRBlycwVx
	DlVsChVHGabzCFHy6uaenBLw34o/ahObNM6UChwmjkp4FaFu2WZT+1Vc/ym1YJnf5GRPO3h9/
X-Gm-Gg: Acq92OFdt0IimmhRSZeeD3aOnrnryCdROfeAF8tX561TVeFCe/McmpTT274tV/Vy7BH
	9siGhg95F6XBVKMAg6uoKWDx+kwm71pK1zZsIZQYmf5XOFk75poCFACqD0wk6KL5iPPG44CUWQb
	ST5bRmjRS0/j5f4rwEvmUkzUrtDQjxg6/wrfQA2cUwogE+M5lH3crAcFQ/+SzTwjLhZCa/xW1Ua
	IlfCA3NsRimZBHq3SuQlq3sk5znCnb4Ly1i/V+G5BKUE11XVwi5F73xJLI7Q8YLGzpJXsOwWduF
	BniMqXgjNc/A2U7dlUj8zvNq7P76cWvDvSf/F5L2+YFRMKOFUr3A3NHG++6nJ878HxUg1oL7yPL
	jRZc4++9waFej5/eMhn0uNcL45DLpefnlPKui
X-Received: by 2002:a17:903:1b4c:b0:2b7:af0e:5942 with SMTP id d9443c01a7336-2bd275cd001mr47009575ad.26.1778698063898;
        Wed, 13 May 2026 11:47:43 -0700 (PDT)
X-Received: by 2002:a17:903:1b4c:b0:2b7:af0e:5942 with SMTP id d9443c01a7336-2bd275cd001mr47009365ad.26.1778698063383;
        Wed, 13 May 2026 11:47:43 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bb9sm187438405ad.52.2026.05.13.11.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:47:42 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom: Add Shikra remoteproc support
Date: Thu, 14 May 2026 00:17:29 +0530
Message-Id: <20260514-shikra-rproc-v1-0-9afdedeee002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEHHBGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0Nj3eKMzOyiRN2igqL8ZF2DlERjU9NkU7NkM0sloJaCotS0zAqwcdG
 xtbUAsjAMWF4AAAA=
X-Change-ID: 20260513-shikra-rproc-0da355c56c69
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778698059; l=922;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7qm4TJ5PlTXgWLtbiBm8P0s0EuJqU6vJB0KebqpWh+4=;
 b=A0JS5zbitFXK5C17m7MLs8sUMIo5xGCeqwk1S8ViTUGS68di5ECQ3JqL8655FKjShKFx2xyS6
 TXhyFMAcb1gCa6ijEu6qaBmmVmh9cEc35AKwM1ohCJWN1hechlVyDu8
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a04c750 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1wa4pLS3tCHV6WQ5_kMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: YtjNUU7GDzaM4FZ-qHm60XEAy_M5rBVv
X-Proofpoint-ORIG-GUID: YtjNUU7GDzaM4FZ-qHm60XEAy_M5rBVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NiBTYWx0ZWRfX+6sq4STbtlV3
 VJUa2QamJfEJ0Zn6pV6F+BYu+fCp7c0w74mZtXN4YyfBP2VxMAYNYV8rJqhMvORnY9HlX3jzI+Z
 YZK6wpFMBezwxdz6HeKkk/v3Yue4rrDqamkSAFuKi62zX7ED7auLtWw7Ck+7+Y7vyWaW34cmaJJ
 qPDshpyHKNg/7mOOdAmzemsF8UBFXtKyOz71CbR18/YD6ijXPjCQW6d+LDI5uZqGv3JGzMFw9kp
 s2qehKkzYWu8+CKhYSBtqjJc0Y/1djeyIEeoelOhte7S4+3esWCgCnJWl8As0Fx6EExSDFIV+gq
 x/Je8gLL2EnpZwdom9Ua6d3Fz5dUu6TZUQwz+gawdyhupA6HvbjO33eqbxZtdIocT14+a61pODG
 1LspeF5Oaq7fUPj8ctjM0Yh38oSydxNu3ZHQGyDRnnbWdvJgrUBXTSyBzzcutveM3OMvWyh1P7J
 qzassY5Tfa9Ba2zf96w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130186

Add Peripheral Authentication Service (PAS) support for the Qualcomm
Shikra SoC. This series introduces the device tree bindings and the
driver resource configurations for the three remoteproc cores present
on Shikra: CDSP, LPAICP and MPSS.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Bibek Kumar Patro (1):
      remoteproc: qcom: pas: Add Shikra remoteproc support

Komal Bajaj (1):
      dt-bindings: remoteproc: qcom,shikra-pas: Document Shikra PAS remoteprocs

 .../bindings/remoteproc/qcom,shikra-pas.yaml       | 141 +++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 |  51 ++++++++
 2 files changed, 192 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260513-shikra-rproc-0da355c56c69

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

