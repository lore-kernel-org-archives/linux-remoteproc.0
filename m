Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8926F44E043
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Jun 2026 10:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481685; cv=none; b=Tm6xogg/6DCaQGoV1jyBPerVemv76IQZdG3hwbWKaFPc2ws3nGNsbSbfkJhu+TD5hIoZs+fz+ykcefkwtS7kOiUkPMz+hpJJqDvQsxMyeAbiD5DYPm3ZctVpPb5mxXGPrYp+2ifyrxj4H/HuoIudrTo+j7a8kprwNPdYuVUdEg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481685; c=relaxed/simple;
	bh=UdgwrPs59zMJ4eRy794D1R1z9mrbLfLKaDvwv5BaDs0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m1AsU3XKizZGF1SP62djUwDQ1Cfjo7+8B1KPbihyAg+0oEbSs7UZLZRw6BAtT5xchpf0MFsNh6C3AjaNZ+gbxswBuZspCAhEzj61QGmV5Oh88D7GElBfP2/0up9cZw9AAsjX8TM5g2baVcpUhwrNZvTNyNQPThny3PSmK64QWL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGtpZ2Yb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxTMgbTb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGtpZ2Yb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxTMgbTb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653AB5q83552300
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Jun 2026 10:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LnbS4S8scpmlpCiNC5rbWe
	BiS/XtufgOSI7MG2jtorY=; b=mGtpZ2YbEg09pe6btlTHmO9seMEskf1338dwuw
	XoPmrXZmApOQcxmw1RB7ahwGesw+BdTYXeXylPzArraTRrYcjE9VGkxk451zv1Ig
	kQk94CfCkgxVz/uN/qseMz0C2aO0SPBsCrBJqQf/c2rENwnTi/mQYUO7O9mXvVBF
	vTmI6vqAsxcHDHc9kieHaMiCU6G1njX6Ob9n+E9TKXk9lNSDi9E4OB2UKjPNl/73
	dZzNDz73mH7yxY6v/9RGIJlNxrDNCuDKv65Lm/CH2usnSB7nSxptdt4LEWKqPLoZ
	UHtNswdn/bwBSgTHq4qxHVTrqG0H2yOX3jShG+BGwnROKQdA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mr0fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 10:14:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8421f5d76aaso3142932b3a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 03:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481683; x=1781086483; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LnbS4S8scpmlpCiNC5rbWeBiS/XtufgOSI7MG2jtorY=;
        b=KxTMgbTbUHftGtoqQCJOKh8ojyoiIK4TtAhtCo/SocTOkffjpVcZNw1e9Zd+dmqPu6
         RfgPSNvacn3z9Ls/0qyvoL2hSKp1mnVl5a/3GvcfvwbJ6WJXlLUeg3rRpmr4ieRb//wJ
         p2/ORW8zOUbtfDNkoVZidJmqHZ3CFziw6p+fJnmySbtc7aAj/sFXG9nlrDmkIQeZMQ//
         8YIErDXtLDR1HXgMwLXwXrer0sxk16aiBnMlLXf5X88XO4xHbv74iwYJ0C3PNbU/D+lO
         wU+yNz94l6G4VuhbISqNsH+NBAVEyctZHrUPeGHk2+vw+fQkNUdnmlobQqfbst8xdHXp
         xomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481683; x=1781086483;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnbS4S8scpmlpCiNC5rbWeBiS/XtufgOSI7MG2jtorY=;
        b=NJv9jf0/Tb2j/JZ2xAohHh7K2zduvi+DZm8WtdoXtyggvyVYE+w19XD1ptIQlU99in
         Q3XjGUbwKk09pzHqOHNBGhJPiFkwDM8TvUmaDBEhKdhHjtg/rVoDrREnqxKUiaEhl7LR
         MVzYF3eHhtZ38aVWbExhOxcasYClVVjVPHm5sI+d9CF+GmlKdoho8LNGwoBeK6TgI6xt
         bOFemeLKRi9Vfs64asKd4PusEdTmE8Pzl0JCU84n15qSy5+0zWkqeekvd2kY1LmdRGgg
         k/MUWTlKsp0kLVFklX01Z56iq28PuNfpFJnuRxjCjoa7r6aZJiQYzEblAi9gqtOGsgBc
         Sg4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+jAKplx5y7xzOtz0tnx/394+ASoz73H/EDp5lmmBj5BP4ljtzuG3nCo6rGLu7UzOtrHepD/Hk6isKwNGLWQMWk@vger.kernel.org
X-Gm-Message-State: AOJu0YykvsWIXvojUviGjYP19RQTbOcOkQkpbYTkN1ZsEKuSNUisH5sa
	Fcl682lX9uvQPeNnUoWJqMR/gh+Y32R7RJHPwvJ8cEVD4PlZqj1oHiEfUH6hL6mdU+gKuX5ui4z
	PZ+617Tvygsx2PnwZ3QrE01/WFvI2ayl7mWlx74YPQHUZnPp/RL/ylouOtx1hO6uO2LVmexHa
X-Gm-Gg: Acq92OHA4N2XEbMJ+kgWzmBDbp6KIi9w14WMBRDBhfm2+SI4AFIKpzpZJYl8WmCxW5r
	3OWgk7fptAqEmcSlYrQIIhdLXZrmXYbEhYy4S0HPa/s5KwMFN9gbH1gGo1IvNc1KVtEAEKcmfbY
	acEwxiw5uxWz74WE3LjzHhe7cJifilb0O6KBwKwG3jk9J/ddCe6TOxLoL4KQLV0GpZ9pO3dX6pR
	a10e4xwRdz6X/x+IT6sdnJMdAMsQy1DtTNz4m59ufkDR3Snpd/eyT5tv8bmvYPaZeb6k9YhrNpq
	Fm0qk+RgnTlX0zqnJSBPnFoC5+csh3oywqlzpyK3Vii7Z4NUjNs/7hAwxLooGApdUeQSPR8fKzX
	oos1QZQhqfFPKuV+GXaruCfT1VDVoJlfrKseCJXzrHdo25UULEH6OmCWKMLQ=
X-Received: by 2002:a05:6a00:4b16:b0:842:7fc8:eba with SMTP id d2e1a72fcca58-84284e6ffccmr2664451b3a.11.1780481683049;
        Wed, 03 Jun 2026 03:14:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b16:b0:842:7fc8:eba with SMTP id d2e1a72fcca58-84284e6ffccmr2664419b3a.11.1780481682578;
        Wed, 03 Jun 2026 03:14:42 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm2463747b3a.48.2026.06.03.03.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:14:42 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: [PATCH 0/3] rpmsg: glink: smem: robustness and debuggability fixes
Date: Wed, 03 Jun 2026 18:14:27 +0800
Message-Id: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIT+H2oC/yXMQQ6CMBBG4auQWdukpWYWXsW4QPzBMWlpZpCQE
 O5uweW3eG8jgwqMbs1GikVMplwRLg317y6PcPKqpta37NkHpyXZ6CQVnRYk5NkcX2PHCDEOzFT
 DohhkPaf3x9/2fX7Qz8eJ9v0Hm6qWonYAAAA=
X-Change-ID: 20260601-rpmsg-improvements-643a6e133f66
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780481679; l=1327;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=UdgwrPs59zMJ4eRy794D1R1z9mrbLfLKaDvwv5BaDs0=;
 b=sheDCtCL05bMlt/bm7DYIScR3WD3L4vIE9GWvQbF7xEJDrvHdseZ2dY/mOALKdS2QvBoYCRaz
 IJlPR3jFmBUA/sgwyF+DrMQclec1IclfC+CYBJe6LZSo63iFAGwWt4x
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-GUID: nAj1eZZk26P0VSFT_nms3aldqyFG2gW4
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a1ffe93 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jgieur2UFhqAYsTxqV0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX9mNScpW1xDK7
 oMSomWlQ4FxUUr0YG+12McpCcL7QiN9Pe5lwffll2NZAiKscD2gh4o0qBvOKd/SWtku3EJ2v3KT
 RezXlFQ4KYLOnkc6K1CWj5R5Dme7o1e5/ybn5gxpNaBRdLIYdLJwtOWwYtGraSB4dr8vf7CQhNu
 Y6GB0aeGPkgdBicKws7tjTIaD/HLOVDalw/1sbixPEJfLZ0NY84kxeO3ZOhPsBp0lp14XwgaC9z
 SJyVle/BNaUyKrq9eO9RSpPlEPe3nDOgTNdEn9kkVHJVErXm9gHsvserkGWdmqGkIEPhBkoSJwD
 LZkZJvXq5wKyktWNHYKRy05eQVOdWvHgQbUoSgQFP7Zn8MWrjdPA6I1r/KsgXVPs/i9KkxsTFJ1
 otraAYiNKvv2LNKWHsJFYXfo6hr5PcCfS1wSPyTE1P1ajUq6PvoRmNZjoEVAnYsxVx0z+M/i4gW
 1JHct96/Sxx1DrtgfrA==
X-Proofpoint-ORIG-GUID: nAj1eZZk26P0VSFT_nms3aldqyFG2gW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097

This series makes three small improvements to the SMEM GLINK transport:

1. Use modulo instead of subtraction for FIFO tail wrap-around in
   rx_advance, so the index is always normalised back into [0, length)
   regardless of the advance count.

2. Add WARN_ON_ONCE checks in the FIFO read/write helpers to catch and
   report broken index invariants early, rather than proceeding with an
   out-of-bounds offset into the FIFO.

3. Pass dev_name(&smem->dev) as the IRQ name instead of the static string
   "glink-smem". On platforms with multiple remoteprocs each SMEM GLINK
   instance registers its own IRQ, and the unique device name makes each
   entry in /proc/interrupts identifiable without adding a new struct field.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
Chunkai Deng (3):
      rpmsg: glink: smem: Use device name as IRQ name
      rpmsg: glink: smem: Add WARN_ON_ONCE for FIFO index invariants
      rpmsg: glink: smem: Use modulo for FIFO tail wrap-around in rx_advance

 drivers/rpmsg/qcom_glink_smem.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260601-rpmsg-improvements-643a6e133f66

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>

