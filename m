Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C283F7898
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Jun 2026 08:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562592; cv=none; b=E3GmXBcYLw7J34UeWSp1Gtu84Yo+HmeSV+DK1mgV615isYoxu8FGN++bSa6ziVM8WiOiPVug9vhoYywdOpv6eUzd/HR6kJXkKniL34F9k/6+VKpBk3oXLQvk7+rvDLVbsPguXFTqiKifNH5KnjatSOsIf9T+DjHemlhFnFFSrj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562592; c=relaxed/simple;
	bh=GXJ69utKWyPJgnkZag1w62NuJE11Qx1+7KpvKSRoBR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J+50rjVtMt4P1leJzCZ4E7utZCasjnHCl5agUoIdcrj87JIg24A40OHlE8ojYmp3Pbpd+2KRy3PGAjPSnYxCpWcLsRu0Kna9EXqL33qlHlHmv1Jh/KAd8VWXVx9YoiW/z+6lLSjv/XFzA+rzSa/7eGibNcTAST7iSFVtpGDNNAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHejtn7g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqCW5Jdc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHejtn7g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqCW5Jdc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548Akiq140442
	for <linux-remoteproc@vger.kernel.org>; Thu, 4 Jun 2026 08:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nej8eXPfMjROiliR051aSd
	DqaCCBaa43ZcZOqpmcZMQ=; b=XHejtn7guIuHzC2SMLiluSdhOKdVVgjxp+Exb3
	hgn0ju/X+WO54yTAFnCi7IME7r9wPuJd+pwNrr4rJ+dc4BAyZ92JGTmW1uGQXmhG
	7EV1woe44+RiLYUG5HYTTzmuk8OLMpiW+JG+wG3OBFWSon1ypRUMLCXyzuTRpHQZ
	S5ySVyu/UBODJS05VPhAu5d5s/rRvGuRsTQmukzJNPCGybWAu2lB6QiE/97lFz5i
	B96FcAAKl5YYzkVmR3Y7CdHG9a5gp1ehlzVI3ufO+F5otaSEnAtz+QythaJbIHiQ
	LMz0RENJ2k0H30vcdR2XHW+okuRpZV62sr3k1t5N1EokqxnQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen9e3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2026 08:43:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c1e112dfso8136875ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Jun 2026 01:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780562589; x=1781167389; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nej8eXPfMjROiliR051aSdDqaCCBaa43ZcZOqpmcZMQ=;
        b=SqCW5Jdcrxhdipd1Pao6V14BTDdHuEhJJ3wsRp7ZEN8Vzn2DJEVLrqHnEA+MrXTWJp
         dFPp3X16k1Pdh2Ue0lqZWYzJo9EJ2BCjfc2Fp3B5D3e84oYKX1wdmB2XXvfMIWeoV5vq
         XmAJ9lDY1gnOArn2Y/mNmYCg1kifc6Ul+tbL7rIkM0Bwgjt7jv2tMf/TdPLcedVp3Toz
         F2xFQMxtwsG+mml2w4of3di0VadVf3aCDw/H2ZluwwtgTqJ3Vzk0cHdtAX5EqvpI16ic
         anyEmzyNLYXG2L7e6Qa9e5EM4WMJNLo8C6fyN4UacSnWIo8atAxmJvZyD1J2GhJcRNpt
         lRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780562589; x=1781167389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nej8eXPfMjROiliR051aSdDqaCCBaa43ZcZOqpmcZMQ=;
        b=WLZpES56Ng8SlJPRM1TbbFAxZbV7exvHjD/3ASeEO1W2RMhcMof06HszrvcKWmTWLk
         kTKmyCWy01P6sVeHHVfFn8LRp6SLipP+XNJIgnmJGBEoX1/CUsW4bi2KbgxBDE3sw4m7
         Rb8L4BqlyWZPQvsttKLj8EijGd/fFfLylkk0OpQLAw9c0PWdzOU7reTEvPG4V2XMdibY
         DTy4df0Bc720fG7x90JEbWXc52FLHiW8BWB+3IOClbtHUs99rL+h/8XH9L3xZ357bAjL
         9tAURmHaLjDXj4xpUTQ4CO9YyBkVZNAU7e37zyFO7TZb0u6MZU0wxE/d6hNpDT/NnN8k
         x95g==
X-Forwarded-Encrypted: i=1; AFNElJ/KqGlElo+cwLHG9+4s/PXpzFxn7elQ5ZNUjblUpZPrcL29JrJjq77kT2sUuT+D3JfWkeMyUJHt80GMkJ9S2ftw@vger.kernel.org
X-Gm-Message-State: AOJu0YxTIfyPtkcFDmAjyzIXymzxDY2UBO7xnCU0p/bGSCYe+yLjGK3o
	OiIWf8DIXsCm3FxsXM6eVTCEItEMkfNzHHQNNBtnhL+r4kW7HkF5b5rUJMQk2IHFuSh5/tFR1Td
	wjqpri00lCwuEkFgFd7UXunz1FDG8smMHbmIXnv2eNf9Pm1/ItY86l14B70aLucagtDkSP75k
X-Gm-Gg: Acq92OG/i2P+C/HXF29ECgkp6ubusQke5AiauuqyVZsSo7ZkzPWIhfRiIXVnSX8FJVU
	gnaMGnCFN/2WLsVGJmq8TdB8aIBv/tUI4YCcxcHXi48DySZop6/xQ3uMskfSx/8Rfz1qeflmFzI
	qHH9yOPuBNJFBwilFyNENzszDABZKNbnq6fyacSw/P8429RcWlyGeBc0ETYKe8utO/WVtS2OWsS
	slTmCFl8NiV5ywmFVTMpNre2gpM6Bul9rIKOYQjxZfmUqQxE6ABv2Wfy3g9G2BF42mixErrkFP1
	BEJg9MLtgtEkJaORiwg7Mvq+2JxuD5Wle+43X9y+dMW+uUoBQPaQJX8Fch8yUD7yh9G3wUAWpwX
	y7JUGpVDwK0ig98mkHmJQU3eH9buvPgTgNr5U1YPJGZbaEAEALFiyRr5frgRIU79T80n9
X-Received: by 2002:a17:903:1a83:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2c1644b08c7mr74707885ad.33.1780562588589;
        Thu, 04 Jun 2026 01:43:08 -0700 (PDT)
X-Received: by 2002:a17:903:1a83:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2c1644b08c7mr74707585ad.33.1780562588086;
        Thu, 04 Jun 2026 01:43:08 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0a2sm52759175ad.46.2026.06.04.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 01:43:07 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 14:12:53 +0530
Subject: [PATCH] rpmsg: glink: fix deadlock in endpoint destroy during
 driver detach
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIw6IWoC/42NTQ6CMBCFr0K6dgittiSuvIdhUdsBGn6KHSQSw
 t0d8QJuJu97eZlvE4QpIIlrtomES6AQRwZ5yoRr7dggBM8sVKFMcZEG0jRQA00fxg7q8AaP1vf
 RdRxoTnEFnGbQzpXWOq2ULQS/mhLy9tDcK+Y20BzTelgX+W1/Aq30f4JFgoTa4bm0svQPY26RK
 H++bO/iMOR8RLXv+wcACwm43wAAAA==
X-Change-ID: 20260416-rpmsg-glink-fix-deadlock-destroy-ept-5cc7aac522a0
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780562584; l=2762;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=GXJ69utKWyPJgnkZag1w62NuJE11Qx1+7KpvKSRoBR0=;
 b=fYI1bhxnSangRLv/Vc5ovSILygfo+4TwhXpGS52FH6qITIQOn11EMLxEHP/1hy7ZVj/hzIJPP
 0WPAfXlGsCsDMq2bx/NAsEsOPehyhdEEpQmFRVofKjtGe0cVXVz5Bjj
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a213a9d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tbFSlT_ZUQ3aV-P4CqIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: OkLrIKwhM7Sh7K957iW2ak0nXG0sAMay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA4NCBTYWx0ZWRfX5QujudfvsPo1
 C6ZypzGlnvvjNc0CY9GxwIKOa2PoXIsUJ8kNaGYn5aqzL2+2HqDOmNVLp3ggnScEgc06G5EAG7U
 5HValnwXP/r1exYZcWzm9O0sBQN7BOO2uh/Nt6XbR4d9Ksni3o71ZfHeya795Se10TE7cu3HO0B
 LM7XgJK50MYT6pcqIRfPBOr/OhOmw9VxFFX/dGAzTTQtx0qSPz+8aRAozrWzMOjapcpndt0Nubw
 4C2SqFzcjqMxogt3Lf3sj+T6cPLUO7mM3Fe/QdQJiortwVnvCHYOQ9KolENeCeFXWqUxKa7xQja
 BuZPkarYsEwmfnhFPljVuP6eip0mKlWd4UI3IdUATRbNGnE6UZQ3kgX2Eh22r+/UkTFiaduk0AG
 PjzdDxOpsvBDtRePaLX3pPMlnBJVr3MslynnLhDCxMXiXHXQywfUkT8z0eVwhiwp59jWmO9LKX8
 uVQmgPQsFsuL4XvhzQQ==
X-Proofpoint-GUID: OkLrIKwhM7Sh7K957iW2ak0nXG0sAMay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040084

During driver detach, the device core holds the device mutex throughout
the driver's remove callback chain.  When the rpmsg endpoint is
destroyed as part of that teardown, the GLINK endpoint destroy
implementation attempts to unregister the underlying rpmsg device.
That unregistration calls device_del(), which tries to re-acquire the
same device mutex already held higher up the stack, causing rmmod to
hang indefinitely.

The deadlock manifests with the following call chain:

[<0>] device_del+0x44/0x414  <- tries to acquire same mutex
[<0>] device_unregister+0x18/0x34
[<0>] rpmsg_unregister_device+0x28/0x4c
[<0>] qcom_glink_remove_rpmsg_device+0x70/0xc0
[<0>] qcom_glink_destroy_ept+0x58/0xbc
[<0>] rpmsg_dev_remove+0x50/0x60
[<0>] device_remove+0x4c/0x80
[<0>] device_release_driver_internal+0x1cc/0x228  <- acquires device mutex
[<0>] driver_detach+0x4c/0x98
[<0>] bus_remove_driver+0x6c/0xbc
[<0>] driver_unregister+0x30/0x60
[<0>] unregister_rpmsg_driver+0x10/0x1c
[<0>] fastrpc_exit+0x28/0x38 [fastrpc]
[<0>] __arm64_sys_delete_module+0x1b8/0x294
[<0>] invoke_syscall+0x48/0x10c
[<0>] el0_svc_common.constprop.0+0xc0/0xe0
[<0>] do_el0_svc+0x1c/0x28
[<0>] el0_svc+0x34/0x108
[<0>] el0t_64_sync_handler+0xa0/0xe4
[<0>] el0t_64_sync+0x198/0x19c

The rpmsg device unregistration inside endpoint destroy is redundant.
In both contexts where endpoint destruction is triggered:

- Driver detach path: the driver core already tears down the rpmsg
  device.

- Channel close path: the rpmsg device is already unregistered before
  endpoint destruction is reached.

Remove the redundant unregistration to fix the deadlock.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 401a4ece0c9777398837d4427746fae0a5003e88..ab7ff3d2f56bf797592fc4227ce5b730bce72226 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1418,9 +1418,6 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
 	channel->ept.cb = NULL;
 	spin_unlock_irqrestore(&channel->recv_lock, flags);
 
-	/* Decouple the potential rpdev from the channel */
-	qcom_glink_remove_rpmsg_device(glink, channel);
-
 	qcom_glink_send_close_req(glink, channel);
 }
 

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260416-rpmsg-glink-fix-deadlock-destroy-ept-5cc7aac522a0

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

