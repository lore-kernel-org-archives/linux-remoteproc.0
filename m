Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A795E282F18
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 01:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028328; cv=none; b=n+ajrqvSzLPUc/Ro6RK8JNW2zVbUl8+5LGTgkqS8/SHgs6UaFmTVG3ZzkX6ijIQH+wXrECrI2R9N4wT8gBukBbembbFIIs4dbd07Kt7vcGIrtZGGqC09j0VPmTUnTrsIaFd6VAh+8dikCm1RFRLeINqn2RU+ERZoaQhRTc7tVz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028328; c=relaxed/simple;
	bh=YeQNjVuY8zDG2dM8Uf7ilk2B57bAGaYVOew3uOXK0jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzJFu2wHj75EPJC7VE+hjYJAYiFFvD/x/rUVX7icJ6EKq1oNAHpWZ04MeMtOWp7CghMBrXp/7wrwxQfGYLJqrqjnm+nY5g+Y+6rfToh3rs/sp7V4H5wNwgI/SZmrQgvzfT1WLMuRScEfGi+RdpWZ6rjSx5clWdIsoYrXaHxfI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8DI3Vws; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbfRxWXf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8DI3Vws";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbfRxWXf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMXIGc152313
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 01:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0VbCdcNMz+ZyVU06ypyUUEhbvhxX8jIAO2M
	0s8c06bI=; b=E8DI3VwsAIMMIIbBmgXXGPgomJxC6zAyFQP9oEuABOY1yTkO/lr
	ehGuRlnBPBj+Cu8rEChoC/CE+Hxt6ej6S6TYTbYJB6sBtNUPrmT03uT2McqSGp0e
	m71ETQrDljHPBG6eiIZO/wONjGv7AFOZnW5kZ2C0HouW5luMPi7+Ejr7i4YXXQyd
	jNg3kbqEryTVbY9AvpYKJijunGLHt629Z26u2BBX4ZGItMXldDzKBg6qH4MiClzL
	a9OaEDBC/0Mpjc2AweTw9nODeMU5H+STPYg9XpKzhGiGc4/ue8MjvnrGqbJZb5qe
	TQxIfrBJL6d+6kfuPtKooxAQnB1dmNjGYCg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aeke8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 01:38:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3515266f6eeso2873594eec.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 18:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792028324; x=1792633124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0VbCdcNMz+ZyVU06ypyUUEhbvhxX8jIAO2M0s8c06bI=;
        b=EbfRxWXfwSLjKVg+YnkfOm3RU7W1W9GgXqnsWFZrbQoVEz0diBsCeRkOV9YjEexBVY
         RfoECoJ1UvQb/4qpLDcXsJhaqzsp5cUyZziJ1mlmSjp3eDn9+cPZDD6gl2hMDs7RjJiu
         Q3+Mggflzmto0/eWO11a9/xqr35SmC++RWLY6595G2DwuYMpezIY5EbDgRylnhSTSHHj
         xQwHp0Em4S0Hkq5qN9y7FaF+cALaT7V/SHQF2vkOj4J1ZigbX1go8IwnSae/sRvgfcUa
         1Y9cE3RU1pl3GqIigpLK4SMHAVaNxbht6Z1uuVRXYsFSC1v7A7WLruB7ZREktDLVAwbF
         xLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028324; x=1792633124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VbCdcNMz+ZyVU06ypyUUEhbvhxX8jIAO2M0s8c06bI=;
        b=JpEhRAPFFfizVdLytHpxYPe4RLQz2nEpUH6gr0URJjGc1cM5La/UDIUs275pTZjVNl
         MwTRfp7xfZOuH49HGW6RVyGTziN+rp0HMEgIXmLqmC6BrPpIbDk/0wrxWe5hWw17pj6W
         3Zcnqb1EuO8bRV3r/2k2tOFzZIv/MxUUdqGrduKbf3lPlvQssFxHeLHaTol8D4t/jdr7
         ABUuhLulQgFIc/k0601yTOGBzdA9PwIqhSrR3ggVHjzSaL/hwqmjgqNTSqyaGkDQbu7P
         OEvcIt7NJW317ldHyqKYP0QDQNHHdXXAwSQVapMpz7Ep46LV+EtfEz/kkHGTupFFpmvb
         +Emw==
X-Forwarded-Encrypted: i=1; AKwUvBzjnnRn13ldKYlCMz5L0K4OP0f+OXw3wNJy9QQgkyG+XUI95jn9T6sob09RjElo65d05lV30ZrmukdEsXEKlXAD@vger.kernel.org
X-Gm-Message-State: AFq9FYJhzYYCM/LA7ZzkJQXNzWazPrQuSB4hlce7BnOnBEsOOF+ujyqj
	k+/G4W0Yl5ocIOwTilU8Y7olmKnw67NIkyiUxT6qu/6cSozpPhK7TzC2/VCtB6XVyp7Kb0N0i5s
	b1v5poB1vmBdagv4uEZWILmi3BN0GSC78FZZ2kuVHSvFUa1tgwMZroWXjd3WKyV83HXxmaLNd
X-Gm-Gg: AYBFou1AJBxjzUo+CjSv03/atLxeDM06qAD/+WRGm+L+3XCjlgIluxO1WEulYv9EoJ1
	VMHOmxWTm9LKjSb7ygglkay+I8uPxqL7l0tdsVAhRAIpCHTJ92rqegFZBiYmekr20xTXURt3Ke/
	5geiNihX7MbAof5bRbNkuS3md++gS/X8oD3+SaadBhmG4yMlwMKO7PIvpsnEuxD9VCFBfGwF0+E
	sRU2jLjnBzGgdjyprztEFxBDgw6djwI06Vv81wh+C127HzxzItW4x3FTxNOxV52p/RxTnpbTpGx
	Hz66md1OW+MS4JECznYCpFs/FHSxwQDEU5/tRKVcZUHnlL8jkoxH1EoqSdoSN/cj8gKngwrje1Y
	yJwWTccair4Ie6AhjuOYpB40XhSEMM97tgA9CVt74eOyaZArboC+rQSs6ix4=
X-Received: by 2002:a05:7301:5005:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-3537e0be018mr24270821eec.22.1792028324202;
        Wed, 14 Oct 2026 18:38:44 -0700 (PDT)
X-Received: by 2002:a05:7301:5005:b0:34b:4b99:24ab with SMTP id 5a478bee46e88-3537e0be018mr24270774eec.22.1792028323430;
        Wed, 14 Oct 2026 18:38:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm56908182eec.16.2026.10.14.18.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:38:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 0/2] remoteproc: qcom: pas: Fix early_boot attach for not running and crashed remotes
Date: Thu, 15 Oct 2026 09:38:25 +0800
Message-ID: <20261015013827.716465-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mjXBuV8lvEqoR71rcp9xpHF7nEphnhUa
X-Proofpoint-GUID: mjXBuV8lvEqoR71rcp9xpHF7nEphnhUa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfX1gU9UQlR+8G1
 v0yZZ19g425jOSCHlMFJiQIhSU+iJUsrn2KXD1fWC6Fx//Jmiq27GXY03WUe4/Uwaeexn3prTg+
 VgVAcfUK+fwEkrMnn0WCQSsvCmiC51w=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6ad02ea5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4g9CDqq4PbN_pkt7hJQA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAwNiBTYWx0ZWRfXy8UseSNVaRG2
 Ffcfz4JtEWl3utmA3t1bdpk3FnRZiP5TZvlXJb1oyilKKUEp6DipldXR3TDkNnlCWvFhlB6eS6d
 /ozgIB4r/ymN/e4sjQkS8yurBt8lblyOxDYlzDRUZET+Vy0ysB5yH8ZBJ/kLt7r0HssX62rNy4+
 0XvzrcVKgkK1WMgmhgbijv2Ne2aZE4kjTgBfkXS+o0PhRFEDpJBDFEzPEA12UwgzINqduVC3Hqc
 FVW9tAxD02QVoJAM80u5Z6GTBS/V++Kc+uiGwAkc/d2B11ytJzkpayxocN/2rj7UD4EXcU7A1Ik
 A4DuoRj42S8EhHKyBelUgX4TlFqqixtepzWjtW42pAlzZxvdETWKj4i7CHoJW0gR0/HVRGRmWD6
 8avzFz9AMERAWL8VKNOAy5wR3KX5yRfADIU5CszWv7WPjprliIyEvVnASsj384/C3ub6zWkJZGV
 2P0Q33ggLXJ+oYvaYHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150006

The late attach support for early_boot subsystems has two problems.

1) A remote that the bootloader did not start is never booted. The
   checks for that case live in qcom_pas_attach(), which marks the rproc
   RPROC_OFFLINE and fails, but the core treats the failure as fatal and
   never loads the firmware. This shows up on Nord, where newer XBL
   firmware for the IoT variant leaves ADSP in reset for Linux to boot:

     remoteproc remoteproc0: can't attach to rproc adsp: -19

   Patch 1 moves the ready/stop-ack/shutdown-ack checks into probe, as
   these signals are static until Linux interacts with the remote, and
   only marks the rproc RPROC_DETACHED if the remote is running.

2) A remote found crashed at attach is recovered on top of the state the
   failed attach has already unwound. Recovery leaves the rproc running
   with a zero power refcount, so a following sysfs stop is a no-op and
   start boots the firmware again on the running remote. Patch 2 lets
   the attach succeed after reporting the crash, as the fatal interrupt
   handler does, so recovery runs from the attached state.

This replaces the earlier patch dropping the early_boot flag from Nord
ADSP, following Konrad's and Stephan's comments [1]. With this series
the flag is kept, since the Nord Auto variant still has ADSP started by
XBL.

Changes for v4:
- Pick up Bartosz's Review-by tag and Cc stable
- Link to v3: https://lore.kernel.org/all/20261014070038.564879-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Reword the "Subsystem has stop state set" info messages
- Pick up Fixes and Review-by tags (Thanks Stephan!)
- Link to v2: https://lore.kernel.org/all/20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Reword the "not attaching" info messages, as early_boot doesn't imply
  auto_boot
- Factor crash handling out of q6v5_fatal_interrupt() into
  qcom_q6v5_report_fatal() and use it in qcom_pas_attach() so the SMEM
  crash reason is logged
- Link to v1: https://lore.kernel.org/all/20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/r/20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  remoteproc: qcom: pas: Decide early_boot attach at probe time
  remoteproc: qcom: pas: Don't fail attach if the remote has crashed

 drivers/remoteproc/qcom_q6v5.c     | 22 ++++++---
 drivers/remoteproc/qcom_q6v5.h     |  1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 71 ++++++++++++++++--------------
 3 files changed, 56 insertions(+), 38 deletions(-)

-- 
2.43.0

