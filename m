Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B23209F43
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791685713; cv=none; b=NIjIsWdswk/XF+kFSytyY2zGP5WTXRQjzyGTznat9e3kuZLiGfFDDscmS91FNuqkUB4T5FT5zjCU4mUtJLGN2jxNy2oVj1LLLwwhxUBM2qzdawQnBAp29JAHNutrERlchQIyLmOli0ksb/mNQiOeA5cfdo/nCAANEczM6sA9yzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791685713; c=relaxed/simple;
	bh=KQeTnlYiykR8Lc5gE5kzVLsW99X/R/AWY8C23t4vnYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t7Zwam8UZR6CywgdR9cMO55TheWJB7lr/NgfWdvadd0ED4gQ9LMAMKWzq4HZHo1SrCMwnvPuDLhwrBecZFkSzYxLFzg9Gg4xHUrkZLcDJVN4r9QAK3KyapNMW9axVX20LkgqVfom7cZJaBT717PIdMgHj2DP5C6iiCym5cqk/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/SkMkaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWeH03bC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/SkMkaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GWeH03bC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1p7HP1633063
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JHFTHFZAy++tAZKYDPmzVhUUq8RBe5Nt8GA
	8v855s5o=; b=o/SkMkaXE1iywmuKnhLGMweSReuI2b0Lr0eje/PRaSXWdXuVyGk
	p6B4H9U1xx3SeiD+i2KaX5K4egEx7s1f3OCRwmDYpOCTdsEdZ4VQD8H7gng92lsZ
	XP9w18OtmQ3TBeMX8ueatK30xfIuWRzZi0Ho+8KAgbLF1Suq5wTLpi1eolbj/pOb
	wGtDKMLwMgqxFXdz0bvA+j2KIbcYX+Ta5whju5OrmmkdXbp3h5mwzv5ZoIyD51jE
	xSVrFldsY5dXoZq8RPHbLF9mBGrMG2HQ9P/FBRI9CQ2TTjjVtxELO2eB+wW/SNBl
	stkz9YSs5WWAvXfzKoiDMa1ca2HD3wluMrQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ea2vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 11 Oct 2026 02:28:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3580c07911eso1843839eec.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 10 Oct 2026 19:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791685709; x=1792290509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHFTHFZAy++tAZKYDPmzVhUUq8RBe5Nt8GA8v855s5o=;
        b=GWeH03bC7h9prw1CF0VXzjPIDaLflGaxN1BMmoIQhkYMPCeMvcte9gRXgbzh5u3arN
         CYoJoN5lOCR0EFeJI+sY94N35OYbRiW7oieyxuoZ6XIEp5QaqBOBfsmjzC2tIPeJAAKS
         1PxivJ4zTMZwKvHoNE+rha5N7dIm/9xxOybNrK2LO5LsHPN2SHgLrxGn6zBDgdmKtpLg
         eJdDD8BSHXu821NyZGaWtuGAT5crXYKwSeieiUdYMMOru0LMPe5OOgFS6mBpxQ6DIdAn
         sz2+ee1AGj10BiD/fZInKGQpAsBg14J6xFlNarCc/kdmFFfC4rLvioRwT0yP62ZQQfo2
         Nluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791685709; x=1792290509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHFTHFZAy++tAZKYDPmzVhUUq8RBe5Nt8GA8v855s5o=;
        b=K7JNIhJtlZS9zxhDWSA0jocP2g8Bb9qUgFVuWFXJpqb7Dauy02PKHD9Pd9QXAeAVyz
         3X9+5tgEUBbUOS+5mcRmdycxF7y4HjrA937B9uqyIYEuUmaeP/TlQb3rTAd41hu73GV9
         oqL0mfz6UUNurp6WpcQ3XK46dytoi4UPMsbKvM77aAbv4+tu7wWmDo+EjQa94JSZQERv
         X6bzl2jSPMmPjLp1xRnQlHzwy07GT83ZDkKfKSNW6AuAq+TpY0BEaI2kQeQUNBnnDbGR
         8zmm0/x//3WaLdtYOMfTv93+mb2zxGPRShgPx+vNx/9NAzK5EMvVSqbWE5kA5e+dbhYc
         MFWw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ7DOUt4+ForBp6VtT9bn2R50ivSO4FhYSxoQVFwb5lo6WrztlOZ6uxeag0akPG7vka75bnypX2MMWNP04/MRu@vger.kernel.org
X-Gm-Message-State: AFq9FYJbdHZcGT3BD0OB9U6dQ53dg0ASKWSSm7o7VIgR0yjcza1+szgF
	2dbFcy9840sf6+JRrinq8bjZa1yJsNb4LZmS7kcjGJvl2WvZfVtyDy8pXrPDANqtGO5Au2y9cJQ
	jcb0UOAkdRSP9amBYsEhIzieD7npd5ju29kx1Yyw6XKPhuEgFk5JDvrnTT1eJbUE6Qkr8qrOA
X-Gm-Gg: AYBFou2UUmG/kDvDHst9euqG1y7/PBfOQOzBf8OfpEH6CNN7Ma3yTuNyuXIr/oedP8O
	xGN84t9B6h/ZzmX8WSXG2P1DJh+duUCQaz3xe0m/mRzLN4MBT7M0UiJv4oRX1KHZCLXt2B+B1XT
	JCzDcsOZbofLj27+kQHRkrX6Q/vwhOI9+EqWABWC0f3/S7YWoFp1RKh/3NkqYQPB7DOAewEnsyB
	5BfXjnT9nkZxYStK01NIp2LKbIdPwowj0IK3SA5esTbRX5+IOcDWFHQShBd3DnmUZQJ/ZdSYORn
	i6+PazX3x1egBGHJSKFs7HS7uJ+9Tnjr3VpTybbRS668LSkreBzYM7i/dNiYTJHCi6GoshgxFF3
	HXjqxg1+q/1zKNqEqqOVg9j5DzxqWdxd+8WKaQ7txqrq9FcLztVFwYIErBfI=
X-Received: by 2002:a05:7301:d195:b0:351:6409:25c9 with SMTP id 5a478bee46e88-3537e11c9afmr7214888eec.35.1791685709220;
        Sat, 10 Oct 2026 19:28:29 -0700 (PDT)
X-Received: by 2002:a05:7301:d195:b0:351:6409:25c9 with SMTP id 5a478bee46e88-3537e11c9afmr7214862eec.35.1791685708578;
        Sat, 10 Oct 2026 19:28:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm22068243eec.3.2026.10.10.19.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:28:28 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/2] remoteproc: qcom: pas: Fix early_boot attach for not running and crashed remotes
Date: Sun, 11 Oct 2026 10:28:00 +0800
Message-ID: <20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAwOSBTYWx0ZWRfX4DcYJ1QRTVdq
 86qfR3usZ/rL68x92vozdWoOwCEs4J0joAnFuhAhMJmRdtXilRA5T+X7GAZtwZz16oE3o6LJURC
 xrFzNv/+2VBaFxVpqYKUScq+Jp/WLtF1L0OUPj37Mu2Oz/q8x6xpoBBLjiIMSpmPKEApofT0vsx
 hRWsK0+RbTNcPAV2+3L3PqTaDoxg7LoJuqzKdhPBKAYWNAre/aD9afwZFPgKj+ChjFLXv13ipyb
 EntdmGsSVQ8kBrhjicBuIcs+UClcAiU/Zx0HqlItisifmEC7093wupv5Oa2A+shYwqoZG73uLUN
 cHWjGngqCrwKfUfKzmwOrbnkweKuv0mXixWbw7rgFpDyPXAJSZqZfYYZ/sN4RE36GVjWhT97KRU
 jcn81vjvKw7c3fnH2m2EAFrgwaD7IPT36BPCIWPNZUA5rUTOVbpSAQoV1KkB+6AOgxuWvXgrqFx
 xiaWz1zLFJJmlTlsgaQ==
X-Proofpoint-ORIG-GUID: yoeT1D-ogMoeUpd-3vivJfhgR8NmbOfF
X-Proofpoint-GUID: yoeT1D-ogMoeUpd-3vivJfhgR8NmbOfF
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acaf44e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4g9CDqq4PbN_pkt7hJQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAwOSBTYWx0ZWRfX8946DtKBEwFy
 51DD10hs+tdp0xfO+ixROrcbhojKVUWNkViGGmHP0k6r1gtfGIuVYO9Z2q/Z9bB2gAyfzs6t/u4
 Fk+NtM7FxmDz/uZURKgHQm8zRMxzNB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110009

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

