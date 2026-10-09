Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B833F3A453B
	for <linux-remoteproc@vger.kernel.org>; Fri,  9 Oct 2026 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530296; cv=none; b=RQ2THboOIEmBGqQJplQMNQf9UCxXw2cNyxzGETrcyQ2bog5gnxDDVyPdreocyqifWe/N7u/Mu69l8TXfL6Ly0DxLOXYiXObRIj5MvbeRCuMuLKDr0mvgzRaG8r7j0ShR2u65KnN6GiuaSm9wdqMV9ZhPFz99AXk862H+V40BoAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530296; c=relaxed/simple;
	bh=2nUyjIaHLKFi5X3ejPlMLU+6LJZM3sK1x15oKrJa7RM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h0TzWmhLYBNCTD6Y9ejQOc+REoXyPyTeIPKALgmrFMJ2RVqs6SQK9gez4kdq5+44uoj1KyqFNqCxLhgWYMgkJj0bBMM+8y34mwrR3LCbyaEdbcX1SF96w1tR3F4re2kJe3S6IBy7gaBfbpHNRVeDGq0rbamZJcj7dSln2AkPhgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QHgQf0Ae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8xIw6tm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHgQf0Ae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8xIw6tm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HSkI966595
	for <linux-remoteproc@vger.kernel.org>; Fri, 9 Oct 2026 07:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g5O+9O9HeSDjYjJYDTxCrw
	PB6czEpC7YrfyKs/iuA5g=; b=QHgQf0AelHdYzU7H9SOxtM6Bjs3eRLamhTJ6Wr
	ibaRhnjyEJDW9kTn1HrnDMrQHo1ibXiKJ/7SNCK5oiv2qm72pw3k1QzYnWWBEw2M
	Va3e/AMQPYhCG0KnUdbLxZAB8FoqH+6gPzgNgohFaRkegXAK09bXDBlyK0HAsqkl
	iOLEN6V3EmO7vIbexx/vkcvQJgdFVkwLsOU/axwHlJgGhvQg6nsVmQaDvesEPPAr
	RX0IupsYdxE7NDMw/vM+j3Bqos/8j82tI1Tn597k1PxTRIM+IJeRZzIhJvUCjNq1
	nipK8Wke34ME3VsE83JyqB9ysbkP5ObTewjJUugVtLZh0QGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj2cxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 07:18:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so1999350a91.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Oct 2026 00:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791530294; x=1792135094; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g5O+9O9HeSDjYjJYDTxCrwPB6czEpC7YrfyKs/iuA5g=;
        b=G8xIw6tmwFB3f5azqhmi5wNZfdEepl+2OAmSpjfsGGhHLITK1iy68KD8ZLCM7POXm5
         qqYh2PY3yIcAUFQTM7n8qJn6HpWNo8XkB/kdcuz/wC+bMEiFDo5ZbiOy79q9mSL15IJf
         y8Pb5n8X0I17cI5jSEi5FuPhg1LkNaqBz+TjMFz636+1rpWxff2T/UbCw+OxAOgg/NNG
         qYCaHnQziMlyoC3N2PuF/zIK5OTJYvtAtaBwrR1T0rTKgcuUnRL2MfSIWetfnr/CDMhI
         0Zc0gTsaf3LO6yyX2nEj3YNhtisxpYtCPdTAPnudDXK/B9JzYSmEYLhnyqu9kLjQJHS6
         MByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530294; x=1792135094;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g5O+9O9HeSDjYjJYDTxCrwPB6czEpC7YrfyKs/iuA5g=;
        b=pyGJQmvUQQixLYARd6y36Q41dM5fRtVagKtGbufVec5hOdWTTLwA34BwfMD5n57o6A
         HoY7rDfrsSBgGH4jCcHebmJyS9+RAVUXF15w8DP73kmh6oGfe3Ms5dequnf4R5dtDyYq
         G3tW6Mpt7HkJJW8hpfGXv1GULqf11/Grmpznlxny4MeLyszaXBK+xe6+yJEQ6Nb1G+d1
         L3ySTgh3CjB48vt0AVUq3zWWuK38TshhzkaseQ5RS3CDBs/crdZO/bkpeVGwJyOPSkzo
         4H4uc2Rrxu9jShhyp++uxSFfSQZPO9wiDbxIS7ENKZDQ8zTctkF7AsjviUW/g6vkieY4
         U7dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGI0y0mAYJsLi5hd2AtcOIHdzL2umVZSNNFTtfBak3OJn6HPc25/qb4j/uo3rGODK6vUyCGBMJ8Laog5w3f7R4@vger.kernel.org
X-Gm-Message-State: AFq9FYIh8DJp2kNm8pT0kCXTtE9p4RsgjduJg5KB2/dhc9dy538f8P16
	nWpjv83M5aSNdOeGtOkjnbdD4NkLrxc9xPZ24Y2hDE73OLEhWuK80UcxuGRy+9BRsSk2VjakBzO
	Ok8Bja9B+UJ0U4HeZYLR/cHByNcWyjn57fBcv3x41ruVgmwThIZ3wTft4dTV4cTKA6byPCuXe
X-Gm-Gg: AYBFou2lKxR23Ob/C+Am7Rogs5vFAJJNVrv/dtu5o5LAXoEHUS1LvlY6PaTyZOi5ebO
	XQLFw2SgxzORMu/f1R/hSm2+eXdbwX2tfOXvPnZfy9Qpz59ZbzXUJ7ieYmaZkrj1LpocpfEmdrP
	o0hqyZoFnmfRq/zOTMs6k/tDAwMM5HSd5Wqks/PAVfn4RmfhdEAAdus6BiPH7hjDBec0kn4hi4y
	5LbpLm7n3be69e4GmsviWKXgC+7d/W2W4uHdjc4uJwTu6nIXLTZwv9Nwk73FHMF3Mir6yNS9BQb
	T3fqXXC/kqjW+2YkmAOlIX2sly05Sfxa4vOcGQ+ssDhYiCXVzBWYbt8MNdwKgkxgb+5KHfbkyiM
	oKFI7dP4lQIkaprqkIsjzi0Y3d7qhMpC3DMqk8IwVTAV8CQJLo6s+Ju/KCFrQzNNxNDdH0xB7Az
	1YlwGnOxxpmCy1
X-Received: by 2002:a17:90b:5826:b0:3a4:c1f0:ab1a with SMTP id 98e67ed59e1d1-3ab36db604dmr1043461a91.29.1791530293473;
        Fri, 09 Oct 2026 00:18:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5826:b0:3a4:c1f0:ab1a with SMTP id 98e67ed59e1d1-3ab36db604dmr1043457a91.29.1791530292996;
        Fri, 09 Oct 2026 00:18:12 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1d287sm494387a12.13.2026.10.09.00.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:18:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH 0/4] Add Glymur OOBMSS support
Date: Fri, 09 Oct 2026 12:47:38 +0530
Message-Id: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKVyGoC/yXMQQ6CMBBA0auQWTMJFjHUqxAWbR1xiNJmhhoN4
 e5WXb7F/xsoCZPCudpA6MnKcSk41BWEm1smQr4Ug2nMqbGmxRg9ak4pyorT/f3Igs7aY+e61vQ
 +QAmT0JVfv+kw/q3ZzxTW7wn2/QOFFMLndgAAAA==
X-Change-ID: 20260923-oob-support-glymur-a9945a5328bc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791530288; l=2165;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=2nUyjIaHLKFi5X3ejPlMLU+6LJZM3sK1x15oKrJa7RM=;
 b=aHjQgZG6ppIdYCCje7XLn2GCBgRHpKw8vrRamQbcD6RqFriLDNJq4LB5rkwf1B3PVXzxTviEa
 FYP74SaFAmuD0HQQkmA8YxNtaecscI37Q5Q5KerOxIGIvglJxLYE9HT
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac89536 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Sg9nDdXpY9lkW-gxszAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 7Jla10l8kdhzoO4gMsbFLDqDTyU09N4O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX0Y4TWtvtAdHy
 FJyconS/kQDyNgMx3M8rt2Awj6UEj0YLZ6SJqK2a6H5YcyLZdkUnCx8XedzBAwe1uvjJkYheP3C
 h06+MGUEdpKlBj/EgZ3Kgt2JX3qMkmoXfMZKoVV4ebJs6cXNxVjPjakr4WLAYbMnZiZuJlDD6lS
 8VRFlHwbqpDTSQNQhDGgS+PkanGgMysLQX56x0F5dHp+DQJ9xrAX5RhnGs0Be8Rl151ppeFFwhy
 gnceCLY2l5PYJBWE4H3JuIwzSQS0ffQPaTLe0qBb9ZzUjXP97PfkUQtIQSKPp7YDm2BOHAy64hx
 dPIdKNM4H1TqedZ/ToKcnzapAFjU8FG6+qXw2tPI5VjQv4nLEY+GKvblYgbYTB+iWdicMhpEk6V
 1S5STJ9/7qcSCDeCrAZ7jpdBxltbXfGsCMBtADUyz3ejTnnlGoxTNxNWjBLttyv+RTeR2zTd6i9
 oslueUj63zbOZQtA+8g==
X-Proofpoint-GUID: 7Jla10l8kdhzoO4gMsbFLDqDTyU09N4O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyOCBTYWx0ZWRfX5c+nnbV+XyT2
 7GCk8zpdHp/OLiDQ4RAMKwCXjDFKfnqQxuW2xi6ivAYwR62OqqTw5qBkrOTGz1qlsJYTT0X6jjZ
 NvXYJEcJqAKN9M2hkdBquSH+R+0KwAQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1011
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090028

Out-of-Band Management Subsystem (OOBMSS) is managed by a common remote
processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

The series adds the OOBMSS device-tree binding, generic support for
secondary images, PAS parameters, secure and non-secure coredump
support, Shared Memory Point-to-Point (SMP2P) signaling, Inter-Processor
Communication Controller (IPCC) clients, power resources, firmware
carveouts, and the required Generic Link (GLink) edge.

---
Anvesh Jain P (4):
      dt-bindings: remoteproc: qcom: Add Glymur OOBMSS PAS binding
      remoteproc: qcom: pas: Support secondary images
      remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters
      remoteproc: qcom: pas: Add Glymur OOBMSS coredump support

 .../bindings/remoteproc/qcom,glymur-oob-pas.yaml   | 156 ++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 345 +++++++++++++++++++--
 2 files changed, 476 insertions(+), 25 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260923-oob-support-glymur-a9945a5328bc

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

