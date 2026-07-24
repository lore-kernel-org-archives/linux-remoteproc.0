Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBDB413D9C
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917751; cv=none; b=UbYvrNvnu7JXiZvusiAeI6NpfK8g2ZSFZBs7eBZhU/5OJfmvoEdXcp+jUSSNdaEvf/XQ5fHmrt8Hix8rBRT5EItN1e64YhAeLtujD+9ELuJAVnuJMCxSKTLySS8SW0KWV9bSAeAVYAW/6ROCqvmIuQ+MmQ4MwGLs7qHcTP2uBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917751; c=relaxed/simple;
	bh=WPgCvH2gb2oeEDvDDFVu1OrHqQ+OtMynV0OcFiMm/m0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K1qriHFx4diL3TYpd/7KNco9w11fIXVnbRAEJKVVNYO40UyvACRWvR8ZrAiCjIKW1xBSnkHS3A0swzte0SCBxsXPst/xqVrHIMLD5zKUPx/DskSt58wrixa3QEdnDQqyq7wrI5oryjlxCa/qQqEA01U4FSKeJp8FaX1pHACR0HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QASREFS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXJlFHIs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QASREFS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXJlFHIs"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqmxJ595431
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tyuLKAsbbSnD/aUHou1wop
	Zpn/sYBaQhfJipC2SaYHE=; b=QASREFS5/g41b629az1uNOONwN1obxJDdWlOzr
	tuwaP9vAxTkViw3L4vTUbbIZ7j8jJSquTfJWtv4KV95o23OBWAmH8iRdTQTOSKrr
	HHeSN2FIj8Ie1YLJ8182fuF1nLIJ/yaFwrA7G+5fbX0VZJ+MkHLjsRH7UFdLx/cR
	H2s/rnJVAkmxcaUdLWpfbZM4dM3cjNS9OcwmoOYOTmpLgqSK41A0q78pvYop/r74
	n2qy6rz7wgqAWpnFBbiXqOhslbIBDiv8zCeGQxwHV9Jh/2t+Ph1svv1KTgFtkgPk
	7yauNH56QzFuG+ZfQ/t+dWEZ/z7UNR8f1MvZE02i9y2ywYAg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck96mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:29:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so1143278a12.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917748; x=1785522548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tyuLKAsbbSnD/aUHou1wopZpn/sYBaQhfJipC2SaYHE=;
        b=OXJlFHIsm9Vbhsp3TK/Ks/quZZhWc89e+WrMS1M4rAy/3Wk8h9ytVL6tOMQnAX7R5g
         N2LIjr6qOBQugTEAnCdenuLoQ35F57O3Upw+emyF1dZyWUkCgT/L+n4jdBwyymdcONjK
         TLnJd/oFLud+2bnseBBR8hSCPz54wGVmgoPYjOJOIKD57H0iyL1U0IRzzEEL9MjxDsW6
         1EqXzJjmws1YFalYEiE7ZUoK2s03216mF+I2bCIqMX1PWZ2MqYzbv7zPY6WEUchQnH6Z
         7SqVM1weTuoIUpLKf/EU8IzU+f2wQbb3+clBuroJcRfp4geVIXJfudOncQd0Oa3c3TU7
         DtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917748; x=1785522548;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tyuLKAsbbSnD/aUHou1wopZpn/sYBaQhfJipC2SaYHE=;
        b=Mn2aNmHAc68CdFAoSb5hZ05LXr4ysnqyKAUxqNEnjEB3wH7LBAsHi4xuIyv0F3q+o5
         P8UNHuJFcpK7rlXqUVKvQg+bbrebp5aEFVdCw6GCKywk+fXHQ5YyvpL7nn+Si4JcoF7c
         XHFCZICypCREtSmfoRCSntyJoWumMrSISGPPzx6q8q41wPkYAQMIEWyVCxjT2sE4gnbk
         hBCtvlwv6D31nDvSBlY+Xidt3eIQHmTaamwYNO9MIQqqAft4S+0A7rfGHMhOtW8xCaRV
         mNsllzdUs7/GEPbPAKq49ld0ctld+DnIX0pvrOz9SGmlqBGINlCCrlk4tKR9hlXTM9/S
         ++Ng==
X-Forwarded-Encrypted: i=1; AHgh+RomblCNEUiILaANL1Ur4JjZbux9Jw0RKIoq7NjEpj//6lmCKU6yThDbrk8UtWC+aWo0EsVeCBxcjxR/1dTt1aTS@vger.kernel.org
X-Gm-Message-State: AOJu0YxggcQBikDvtFD6tbJ9663if+ytvQqDWEYy0HjSBgn3kMJn0aRQ
	vNRp+c7kub4V9sxbq8nQuOyElZHcUeRK6E2ZaFbcGOfT9+GcHplZS67NkrZPOGkNpJ4P4tkTF8g
	kDcUcUOsGbdf8YxEyXsJeVtaYh6+vCthH+7iFzZYLERXUgM1z2J/4xWTLPKy8dKrMFHVWS1ED
X-Gm-Gg: AR+sD12xEAsFz2TASzcBKciKng5IsiFHii2T40pSaKfxIiCjpSje7UkwZSs6uHRPvmm
	8nwJjkC/mKBMUjYOszG3GcuOT5B2xmQm5nh2ZKosu2C35UUeKL+CJ52C58p/o8MIOMdgHUsvA60
	h6YfkH9tjmOX7Hkrj0ki76PD2vQaj3Vfd6p5bz2NknqDwmOIRFIHxAvO/6uqoBKrDS8oDMoYs4J
	hGr5TAj4k3hjH2aeNrQ5sTxDBxejm2b6WJxUNN4+bqnzwrpBOdsG9tzGQpERo77pltf8walhEI9
	M+MMNlF9XPRyE0sGjJQ2KZi2SnjBtYp0ttfQqFWsniAqujoOPvWuM97+Hro1oUWFPGODVstubzS
	yJ+zwby3gTk7cTKsTm6YItuvCbzA=
X-Received: by 2002:a05:6a21:44c8:b0:3c1:fbf:1e2e with SMTP id adf61e73a8af0-3c44afa2d9cmr8978805637.10.1784917748433;
        Fri, 24 Jul 2026 11:29:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:44c8:b0:3c1:fbf:1e2e with SMTP id adf61e73a8af0-3c44afa2d9cmr8978776637.10.1784917747796;
        Fri, 24 Jul 2026 11:29:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm1341510eec.30.2026.07.24.11.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:29:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v5 0/6] remoteproc: qcom: pas: Misc fixes
Date: Fri, 24 Jul 2026 23:58:52 +0530
Message-ID: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX9Bk5+HhJcVd2
 PssqzcCyuArHKtHsiaz+STpjypMo4qM0mJIqAgMnXSuFXI/+7UzJn6tcRQCjAMVqqiLjCpBOrI5
 WrO90NfltrGbMeCsaqVaowB1+lY3WkWJSx7EVBZCpOaoEUmDIZrYLs2i8jJUktn1sW2Ur1JWP50
 aGasFGVDCaglutjpcQzHFKXk5OIKDdxcRgwqRgVQc3PBdX9xWa5WABIDqGzlYpCSUcUmYAoIFl9
 6Z+OPDarnTiMtpNeDqAM3ATIpzvM7rwgwOylkxr6fwE/UFz1cQm8cwAtBAxi2g9Qfd2p95WJilh
 uGkGMpSJGV06oek5IXaEnNxMDuQncKcfCO1h00ujPyKpVu9HMCqRiqXqkobu7yPnt4+MjZgBWrT
 ZcotlAHR2M3Po2mKDPcpUDkOFNvdtUH62jg0Z0jZjyelffwmPxCAOaMtdUUcsOoymhI9MmdqZeJ
 7WcU6neNDbHW4PQeiGw==
X-Proofpoint-GUID: ySIcamFPacKVYVC6aEwae7P2tOye6d5P
X-Proofpoint-ORIG-GUID: ySIcamFPacKVYVC6aEwae7P2tOye6d5P
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a63aef5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=H_pUXcL6yfwzq-Dby1gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NiBTYWx0ZWRfX1Icac8cbuwLz
 /WfQoFlS/wOlCE3KzeW6j6lFRnb53B+WhEC3y8Etwc9v+SRZh7ZPNLrLgcZKE7panDmqnCqeoUC
 MDCVY9M3Ed120bnAnd9Uyo4jWg7W44Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240166

This series is a collection of misc fixes for the Qualcomm PAS remoteproc
driver and its supporting SCM/MDT loader infrastructure.

- Fix sparse __iomem warnings in qcom_adsp, qcom_pas and qcom_wcnss by
  annotating mem_region fields with __iomem and using __force at call sites.
- Guard the DTB metadata release in qcom_pas_load() with a dtb_pas_id check,
  consistent with all other release sites in the driver.
- Move PAS context allocation from probe into qcom_pas_alloc_memory_region()
  so the DTB context is only created for subsystems that actually use it.
- Map/unmap the subsystem memory region on demand around firmware load and
  coredump, avoiding potential XPU violations on EL2 platforms where the
  region may be handed off to the remote side.
- Drop the now-unused dtb_mem_region field from struct qcom_pas.
- Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
  buffer retention explicit rather than implicit.

Depends on:
https://lore.kernel.org/lkml/20260702115835.167602-1-sumit.garg@kernel.org/
https://lore.kernel.org/lkml/20260724094939.613844-1-mukesh.ojha@oss.qualcomm.com/

Changes in v5:
   link to v4(https://lore.kernel.org/lkml/20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com/)
 - Rebased it latest changes on Generic PAS changes.
 - Changed a bit related to map API so that it can be used by both
   by mdt_loader and pas.( 4/6 )

Changes in v4:
 https://lore.kernel.org/lkml/20260331183957.2015440-1-mukesh.ojha@oss.qualcomm.com/
 https://lore.kernel.org/lkml/20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com/

 - Last series mistakenly divided two series cause laptop shutdown.
 - Some minor refactor common code rest is same a rebased on latest
   kernel.
 - Added new 6/6 to the series.

Mukesh Ojha (6):
  remoteproc: qcom: annotate mem_region fields with __iomem
  remoteproc: qcom: pas: Guard dtb metadata release with dtb_pas_id
    check
  remoteproc: qcom: pas: Fix the PAS context creation placement
  remoteproc: qcom: pas: Map/unmap subsystem region before
    auth_and_reset
  remoteproc: qcom: pas: Drop unused dtb_mem_region field
  firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context

 drivers/firmware/qcom/qcom_scm.c       | 18 +++++-
 drivers/remoteproc/qcom_q6v5_adsp.c    |  6 +-
 drivers/remoteproc/qcom_q6v5_pas.c     | 87 ++++++++++++++------------
 drivers/remoteproc/qcom_wcnss.c        |  6 +-
 drivers/soc/qcom/mdt_loader.c          | 15 +++--
 include/linux/firmware/qcom/qcom_pas.h | 13 ++++
 include/linux/soc/qcom/mdt_loader.h    |  4 +-
 7 files changed, 94 insertions(+), 55 deletions(-)

-- 
2.53.0

