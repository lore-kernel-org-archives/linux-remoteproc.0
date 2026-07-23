Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795E934F474
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784778768; cv=none; b=Dn1hNLIdCy7d4rqB2q0fHbttmtNFOcJJXJwQ3vFq5VKiO+zFMBCK0TvOAHhE6Zd8dY4Eh4Ehck4A8fMfOHzQH0keUComet68SNLRRZZ3kjOV585EA2BTmc6RH4uHhdwyy1On8MyceNTGczxs69iBkoC4L8uq9fSvWxHEO8FVcus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784778768; c=relaxed/simple;
	bh=jlWppMMNCG4So8M5/jDBMwGAOo+9cMnyj+UZA8JE2Q4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HirzC2gZN+3M4uifYwGV/D5yuM1ezM4wGe3vQjsV+xloYOxbc0hsEMwWu55kqdIVL7NGEWkYywk0BIEw4uoBEuS61uKSoc3ByamSGVcZwk7UBEvkZWnIK4+3MPyLmEaWpppnaxvBK1QcahLpOz+VzgmOrftAx9u6fKc9IEknLbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BD4K7n9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJteY7Jw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BD4K7n9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJteY7Jw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0XSBb2539108
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OcHcMA+JRLaD5Kh0rZuCYU
	zuONUITqpfx6ybSNI25rM=; b=BD4K7n9J07O7PkJP8QIhn0PGsqXMnXbirGq8+Y
	r5laEvg0uNmdJdnecekY5m6nxLl0Jz4tlfUgZZCmzUKIEKCWLMALcNk0lET+Y1tf
	9AtF3vm5rJgmcS9osGGe+8uxpWVuBPd6RN6bpHPFu76M7vGgZekgdPGja6mUX4Nl
	fsQNOVu4krIQ5GHdAqTLpISlfgjwyjf+eTHrbER5XgM2l+uW7pGV6GmY9D1fzT/S
	Kr6dazW9sLSLSEsPd6jndf9L6Ual7EoYcXi/QH+waU8wak2HhJL3Fo8fcCyZeq+B
	wGZq5+dLIFSPcJQXscryRfiZav4NIBzxKLqJwbJ01PkdSTAA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc18g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:52:46 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-48e2ce64834so101611b6e.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 20:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784778766; x=1785383566; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OcHcMA+JRLaD5Kh0rZuCYUzuONUITqpfx6ybSNI25rM=;
        b=hJteY7JwYF9bD3Vo3LeBnEjvtJR5LgQE2hMwTrUWj790pY87r1luqJ518Ay1MpjQjz
         six2sbjJ81hGCQJp2KjdRACBeoQekQCrgKUE2rPQHwoGoax7V5zAlONc/hS0u40vJFlt
         ZWTWCZGAIzPQ30L+hJjALxovEL/QUmUhGNBvHmHeNcXbVyeS9VRiXGAZM7b0d6GkMsYj
         KoRjf3ZBvM1bUtuBhbOw/vawRFlnlGpxUyArSvrV/7i/XrBJx5YK9ZpSJm+09FHRSRTS
         5LFBnc5rvDp4GAMxK/bzqwSkMH3k2DB09d0XpMtSrJ7v8qzNZnndS+KDidC82ObL556U
         DtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784778766; x=1785383566;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OcHcMA+JRLaD5Kh0rZuCYUzuONUITqpfx6ybSNI25rM=;
        b=sqC0KIuv9xNBCp7F85KK/QXcQHl66C4zy3Fxj2qx7nNo1GKBW2k68itP6hahN2cva8
         UcOdfY/U3dlaEHvyFE+vVktNRQE3MQ1+h+ruMy/0WNac1QoWaLL99YGWWJZSPFTlZQjV
         qrc0ag8JaLR7PXZjAvms82M9+M0mv9f6ji3sF1x/UM5RYTV5hLLcj6RGImm2oWceN1/f
         W947+fubXA/LFc7NS5xqmf6Ky0M3AKt5Rd2eV5AIvktBej9v05yPmJDOzzEJVPw8pW5Q
         1itP2uDpKAmwvSK/Z834GebI+PADHcOQ1cBlnQjc/emXWauaUKiY5QvRmwA05GVxs+4i
         PeRA==
X-Forwarded-Encrypted: i=1; AHgh+Roahb+Wz8a5/yGSZ4osrVaP0Js6BIl+0DFznVdM//LMveiefJuf++WuEsLIgU6H/9wZU2UvU27XFjBXCusRd2js@vger.kernel.org
X-Gm-Message-State: AOJu0YwEr9nHrEeg7PCRgOOyablL2cnyo+0xj+gp4MzH1IHecr6Cn4+J
	aM4e/opAfXmAw6P86328q0n2jh1B7tk5uYxSXv+OLkRtMDDkuxywARDamFsV7BnnUrqn32dhI0A
	SUzkcWb1+mf2zRhskYyPf9bSf2XW1X1XFF+gdUfMBf22xFEhM1tIbcADMR5TJDr+Z9qihT2LO
X-Gm-Gg: AR+sD13bjVwkvcoAiRqG1jEhbg4CeCZO7CaQ5wRWLe5yTpniPAR4nd3JvFy3CqoGizF
	sqfd1VqvaeEYAmLPuya9FN3cNcf3EJHroV5kRztCuUFMa28wZT22LmQKwxPs7+O2g+PCWZtSBJo
	TpXsxu90YGGW0dTjwA3wJvN7Z9Ck+ZuRUBw5V+uzlET+Q1JQF/fy7ynFE4ilDpTD9Mr/oC6mEau
	Azi3eJX7bj1VovYz1UO+nIKjVDk4zW106ygB0JxAxUvY9ukU94udMwo9+CAcDnZlDbWcvXPKEOZ
	RsyM+vz+V6etPan7e0CM/pA2BaxcJ0sB3o2YdjZwCG3+kPeanjyCWIbp3Uv8sVskqU+rbbsr9WX
	zRlejSj4U8o5x2+htcp0=
X-Received: by 2002:a05:6808:f8b:b0:4a4:1dd8:5e35 with SMTP id 5614622812f47-4ab352d61fbmr818548b6e.8.1784778765671;
        Wed, 22 Jul 2026 20:52:45 -0700 (PDT)
X-Received: by 2002:a05:6808:f8b:b0:4a4:1dd8:5e35 with SMTP id 5614622812f47-4ab352d61fbmr818528b6e.8.1784778765159;
        Wed, 22 Jul 2026 20:52:45 -0700 (PDT)
Received: from [172.17.0.2] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45766f238b0sm3302323fac.8.2026.07.22.20.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:52:44 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH 0/3] remoteproc: Improve removal of remoteproc drivers
Date: Thu, 23 Jul 2026 03:52:26 +0000
Message-Id: <20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqPYWoC/yXMTQ6CQAxA4auQrm2Cg+HHqxgXdaZASZghLRoTw
 t0dYfkt3tvAWIUN7sUGyh8xSTHjeinAjxQHRgnZ4EpXl42rUBdNHnWeU8CYVvRKNkocMHSualu
 iW0MEOV+Ue/ke68fztL1fE/v1/4N9/wHUSe33fAAAAA==
X-Change-ID: 20260723-rproc-rmmod-not-crashing-d92388aa47aa
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Fernando Guzman Lugo <fernando.lugo@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=jlWppMMNCG4So8M5/jDBMwGAOo+9cMnyj+UZA8JE2Q4=;
 b=owEBfAKD/ZANAwAKAQsfOT8Nma3FAcsmYgBqYZAKwOjLGPmXSIEMNb1IDVew0y8dQxp6Qeib/
 Zb6lZGLK/aJAkIEAAEKACwWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCamGQCg4cYmpvcm5Aa3J5
 by5zZQAKCRALHzk/DZmtxd1IEADJnVpQdpo44gSt79zRuSgntJ+9Oaay72ukWK3CyZbPDjD6/fH
 07LfljRoUZEDcfvO1DOYmWNy+GAQmmv5Ty2fekelx/ywRflJu/UXTEHZfhgMn1G1nyLX47pOwbT
 5azsNCLyE5DzDyhq+3T6SchE5fwY0MfDkMrr21b9+g52PKqzCB4QTuKS5eZGrB8LrzotYt9eagR
 HFB6xTVNswWzSmMCJc7N5pH5dr+Rp/zcoPbnCZt7U55VgdTqbhRGKBUhNXZA2DkDgmh/Sjik19t
 N7ZtEBewqUnTw1Wx+sRAyna5UPicniUMezaizwiEgddLsk+8MPKdaoCXKhzDdr8tsYWPjw6dD69
 HhzgYbvWtOFpu4k5ROlL4l4kCaKqHgRXTlTReKoNR7isUANw6hWKMztV1w8Fcpub7BcH2/1DFIv
 6EFXoFn2HOv9+w2OHLFy1TugIfjYnUTWmvKEU+8iMTug+JvZP1pYov1oIlZDEAb5Vu0ZTqdBPcP
 oxCNXLDzWdGpOv5vYBlQamzjfIhxur++CkCeWsFNqBZ0aVL+2Sob+5+tp/xtjXwKZsbNckfUgr+
 rcI07Ds26sXliU1GaEnME5xIoO4Qszw0o0WHCacvaUSZK32VFjWKsSlB4cEqGUXA9ouiU/T4UnB
 c2GjIcVr39iFAPbLKEBAHrMVc6ggdMVOH3Q==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: voALWGBRUlTWpfMRHhbuc0fKUegYpplM
X-Proofpoint-GUID: voALWGBRUlTWpfMRHhbuc0fKUegYpplM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAzNCBTYWx0ZWRfX4nJpHrbr9eR+
 a7WEq+qdMU+2YXEHw4I/0dHNUj38npbJ4IuWVtrotEHIZY5Hv3SkHMbinF6y6sCndu8GhFWnZU9
 XQ35n1Za9v/rc0SzGAN/ErFSWGhrvNs=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a61900e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9dRw-LnU2mmOUw1Ut40A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAzNCBTYWx0ZWRfX5aU8k0R7AoCU
 arv9v7fVsfoUtGf/Vud9/ij78eoF5ITLvNHjxm9zRf4noSOzvEflQyB8fWxAMgb3BYz0BBzZr+h
 dtYGpmok1yErAfXL8R+lpd1vgz8OCp9hyjRpH978/jCr/j1T1XuZwuKU7YcEFFvP1GhJJHKbTHX
 szEVa5IjQYUMkZwUkqYCfSEQlYcUT9CZDDQnAKS6uY9lYHvGOOlfL5tRclMXhr8+AXPwkixqLpm
 UAQ1b0STT7XaxMtqLkivffh0b+nCc4p7LReuyDsC+1Clh1PQ3F8Xt/Q0QO1YSwGNwKB4OkkDqre
 itrZ3iIA4mDwSc6YkWdhBPWdHKxqCVNJBFTUkxx90ubGyBXAYi51GV7zRFLGOY/rjuV+A/oiXyG
 NgbSyiIDqpfLXW4eEES/qu8pZWYwA50aHdmZTPyKVU8H2GbklzN5JF7wDnvn1A7kWA7PS+KQUwn
 VFmgt8pELXdQCahnHzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230034

Stopping a remoteproc that has entered a crash loop can be problematic,
as shutdown is only allowed while the instance is in its running state.

One effect of this is that a remoteproc which has entered a crash state,
with `recovery_disabled` can not be stopped, without first attempting
the recovery.

This becomes of particular interest if the user rmmod a remoteproc
driver in such state, since the return value of rproc_shutdown() and
rproc_del() are ignored, which means that the remoteproc is left running
while the remoteproc driver will unmap memory and shut down critical
resources under its feet.

Another variant of this issue comes from the lack of synchronization
between rproc_del() and the crash handler worker, which might be
scheduled concurrently with the removal. Mutual exclusion does ensure
that concurrent progress isn't made, but nothing prevent rproc_del()
from returning to the remoteproc driver and have all the resources
freed/unmapped while the worker is still running.

Lastly, another way to trigger this faulty state is to bump the refcount
for the remoteproc, in which case rproc_shutdown() becomes a nop,
again leaving the remoteproc running while the remoteproc driver removes
critical resources.

There's certainly more work needed in these code paths, but this settles
a few obvious issues.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      remoteproc: Allow shutdown of crashed processors
      remoteproc: Prevent crash handling to race with rproc_del()
      remoteproc: Force shutdown during device removal

 drivers/remoteproc/remoteproc_core.c  | 104 ++++++++++++++++++++++------------
 drivers/remoteproc/remoteproc_sysfs.c |   1 -
 include/linux/remoteproc.h            |  13 +++--
 3 files changed, 76 insertions(+), 42 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260723-rproc-rmmod-not-crashing-d92388aa47aa

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

