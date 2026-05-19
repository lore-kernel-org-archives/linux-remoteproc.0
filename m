Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C3F3CEBA9
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175214; cv=none; b=gyoSEA9qAsFmUMlBoaI5Rkb8J1GXTE6kmJR4WjusJ4pbd5qwVNPq87DPiA90BO2WnlC0f+obYVYB/439FiLRxpB8wuzPpWN3DLsYGuiEl1Ok5AH/ubrhucpqeSU+fADeIhJv1FnenIjsBmCBDnJPPAL/Ym9A3PcIYwJ0z5Nql0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175214; c=relaxed/simple;
	bh=KUBTHjR9fClN5nBMUku5TVvCoLwf0jKq3RiHKtA4rAg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZP1bMw+eVeLlgWeQXWaSPgHI7O00QbJSYTtlxhNFgf8oVXtnthjw5GG0Jl4y5IbHliGTD1qSnZ+VqbCMn5X0kdSU48poOEW1674+l8cyXZlqMUPhirx+C/VgeASPJ/xiMc/HFdIqP6QAMaD4JWXGrTWJD4PjYlexNkXhbjwZ67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDXGc+Qn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+U+pi/g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDXGc+Qn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+U+pi/g"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J2rsta2090993
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4Gic4LlWjXHK/3zkTftimn
	tFFOq6iM+d9vboJW7do14=; b=NDXGc+QnPQtl47d4YwBrQrHJoHQG4TF74m0cJ5
	SUeViCyOdwyHOjLB82fABcAc12KKj7qAas5FrX1D6OLQtNX910Q4rMRphoJmn0/6
	PsUf1DpA34O0DfXTfh8WfnhPP6jXESoOO9WSJnTh+rZPjdBNOOn/s3XpqAC4GIU9
	x4nnTrg/IpV0gtT+Dr3seXBScHObAicedJ0qn9FUGCy3qdE4kFBZrmmO/w0E499m
	8uIH8x7zraRB+4S6q4g9FqAiTTjKiX661xWyAc4KaO1lOYVhtLhnNsd41WdTgXAa
	xe9o73vioEY+oxUbt/91kt+ZryAcda9W8D02mHiLZ5NcIVMg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpma48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so14612758eec.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175209; x=1779780009; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Gic4LlWjXHK/3zkTftimntFFOq6iM+d9vboJW7do14=;
        b=O+U+pi/gS79skLy39paEki43jlKPVJ7lavuEwJDgHnDWsdnmAJX3GGenNEU0LQlsXh
         tquwmVhJ3n0uZLRSL3efqFz4dOxt6sfYcUQjIO+IQcI6mgzWMyQd6rAyUcXDx76TlLhW
         BeYer8HyXKjmW6GWab7HwgTIa307ZZwh7RS10GzeUQXcVi4rMbWQHbQ73GOqq5QOjxBD
         Xh857yDUxHlUIgLg4eixowXOIzgrubJqEMtfx8ewKxZf2vhSPPVXj/d/GpwnxP5ZVv07
         lPQZ44aGsDtEmlxXgt0VuGkGk7rQwG8OMBpXLq8EfNDiNO6ZQmQABmatNiA0x4CkL7eU
         A7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175209; x=1779780009;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Gic4LlWjXHK/3zkTftimntFFOq6iM+d9vboJW7do14=;
        b=hBm1LL3S/+Bb1oFgtYdmkiAkni5p8TzffqNLswdHk6gCDV939qSGY3RbifzZ1cFp0N
         Q/ZTue396vizTC+P7VVanRtn/SngdURqCWXT7hwuQVyHaRa8tzH/9+JtaNqycyEmymv/
         zZL+rbjq+MCESJeyuRMaciM/VNWuHEmjh+1gsVzmxuqOGQQfJ9clBa41QOXQtDE6cS2/
         9IocVktfYHi/QzyF3SFx/wmsdGmz9XsvYPKpRkLhL0GFDMo2JRXggovOsLv3TMICozHq
         nJpR2IRZtHOOHmd1NK14qsjkYT/limSmR4E/cx37pCMZG0ZmMdMbwqW+XexbmZL+1/9u
         5tkg==
X-Forwarded-Encrypted: i=1; AFNElJ+EZaTSkx/0spqfHXWn28rrS4+q9GPcZxrZREY5lAB71IzZH1LqP8t1dH/oPwT0Q9eUhmT7I8fBEfsb7gh5alZ6@vger.kernel.org
X-Gm-Message-State: AOJu0YypUlS8coBX1HeQ+GG2bGCSk8T9k5czosNxJhSlysVFs735WkBp
	2Kx09u8bYsh5t+FCKsEf2QHW+1dP3lBQbXzbR1w1hN14TD3uCO9W3sP+xdnMCZ1xRXp93pJJdLq
	evi7h+fmmoV0ZGcLdrCez6dzih+2q5ikOH/CdxXjTlQH3b1Ebh8wRzMtaqYRvFOJVmQxRSPIhU5
	3S6Vn/4nQ=
X-Gm-Gg: Acq92OGZjoyEtl4TcAuA74GsF33qpYIp3uLCTyTebg2ohFtWAC/E6aYjDMTNu6pCpY1
	pkBKmxZ6iSAnjAoGGkq41QxJX4EUiMhu0Px0LgMT/nVPjwerx0WpEtiQTGsiwXkt5sPv1pH7xpx
	FRHCvhtOqox3si1yG4Ww46xl7yXaWKK1ZrzaaIRyH2gMhWzhlADCH4mbj9u3zaP6f3/WuTRN172
	AKFF/dyLJwKYwobvkyhGYfMMjWZtngAp2IjchnbLzdpL9tefdQOWtBhlMF7CzmL8UK2DxBzwYvG
	rNfDm5uq8k1pstS3eQweI/whzxCWH5z5oGwtbEqvB7NgF854dqzE8Dlt5rvCFAn5v9muoDNkljL
	nEtJSW1I+8x8oflzcNRFo6UtEG9T7rL1/Ph6EGyi2cgJ1u+Iq7CCaUQD0J1sVec3obbyCWlQs
X-Received: by 2002:a05:7301:fa0e:b0:2db:2089:460f with SMTP id 5a478bee46e88-30398626b67mr8400096eec.19.1779175208770;
        Tue, 19 May 2026 00:20:08 -0700 (PDT)
X-Received: by 2002:a05:7301:fa0e:b0:2db:2089:460f with SMTP id 5a478bee46e88-30398626b67mr8400081eec.19.1779175208222;
        Tue, 19 May 2026 00:20:08 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm16438595eec.24.2026.05.19.00.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:20:07 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/3] remoteproc: improve robustness for rproc_attach
 fail cases
Date: Tue, 19 May 2026 00:20:01 -0700
Message-Id: <20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACEPDGoC/22NwQ6CMBBEf4X07JJtBaye/A/DYSnVNhGKXSAaw
 r9b8OplkpfMzFsE2+gti0u2iGhnzz70CdQhE8ZR/7Dg28RCoaqwlBriEIMBGkcyDjzzZKFsVdV
 qhdRoFGk4RHv37/30ViduiC00kXrjtissUW8153kM8bOrZ7mVf5YCz/8sswQE1JqkORbanugam
 PPXRE8Tui5PIep1Xb/t9X5X0gAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175207; l=1098;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=KUBTHjR9fClN5nBMUku5TVvCoLwf0jKq3RiHKtA4rAg=;
 b=3ZtlQbHupJ8BBq4cXPY8lC+n/J5RLDjo4sn/v80QMPIfmYAQ1FwfKmm68xR99hOA/kn55QsUV
 lAF0sKrAdHBDVJX+T6/rHyrKtbIPaesMC3QoTbQ+/GIv6d08S50e74N
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: daHLHPH6xDqC1a-CHAwSPWFA0JZYRGbR
X-Proofpoint-ORIG-GUID: daHLHPH6xDqC1a-CHAwSPWFA0JZYRGbR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MCBTYWx0ZWRfX7in3Pxs4L9pZ
 nIigIMy6llCTZZlNK+dhI2siCujjJhMyjABUp6adwWzKVQMgLBfZtDlpnFTISxU2/eOIZP0jl5P
 hEOc1bCYaplIbs+fOh0017rr2ufgrp0Zu5hB/Lpwi6m/XgNaFav1Gg8XcC9uGoYW6WdxKrRRsPQ
 oJnhB+lsVMp5ELEPHwfAN+MDaRaJ7hMSDiyB4LUsM09Z3yTFyTi9DqoaOr81xnqkvA1/CHcUKrX
 kFHKHk/wAgDvhbnlrtMUwYcYKiReHc/7OAocDBF3UQcynJ/L4TaODgJoXVrro887JKYA2v4qUXW
 CvfjZotwQn0jTXdDyKm4p5dn8IFheflelBNCFuiCPhmPh9PWjLTuWSsGt5cHzIqfA9rpvVKsHR9
 QiBcfUYH0nxuSyvVLY+R6kEwueYtNfDfNZ4bTM7ixLFcyM9eeJDpyZTvUQqmdkU/52ObFIgF/em
 wYZn04EVanzZrhI6/Tw==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0c0f2a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7MscnEEq7jiLvNd0ocYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190070

Failure in rproc_attach() path can cause issues like NULL pointer
dereference when doing recovery and rproc_add() fail, improve the
robustness for rproc_attach fail cases.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- commit msg update
- Introduce subdevs_started flag instead of check nullptr
- Add change to cancel crash_handler work
- Link to v1: https://lore.kernel.org/r/20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com

---
Jingyi Wang (3):
      remoteproc: core: Attach rproc asynchronously in rproc_add() path via schedule_work()
      remoteproc: core: Check subdev start status in rproc_stop()
      remoteproc: core: cancel crash_handler work in rproc_add() error path

 drivers/remoteproc/remoteproc_core.c | 25 ++++++++++++++++---------
 include/linux/remoteproc.h           |  4 ++++
 2 files changed, 20 insertions(+), 9 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260518-rproc-attach-issue-5d26d820ab80

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

