Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5B547D461
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961286; cv=none; b=SDKtmoP0e27yp7bTJ8Vid0DlChpB3gw+1xoNVUWkDmMnbM68X9KF2nZ6HnhHJYEiJXkHWDvLLQsHT+C+l7jKLMGv7TCtcAyK2r3lGF26lhCTV2TK06BIDRAZJevdZo/xNgeiCs4TnL92K9IBQGjnji16oTmiBAuZQrvmd+8kPdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961286; c=relaxed/simple;
	bh=apnoy91dpzjKRO6w2zUJFjvkqIZJxJcXeNNlwpaBDxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b6Yzue8IgEc/70Vt24ymuitNT9Hqx/Fn+mTpf4vVzXW38m/O0/TCAllUxKfHtcUv3McAtYtQRicta+HSgH6JBU+T4m8tKs8SGUGofSHNN5niYJnmyiXuc0jYJrMc4a78ZkXJRluJRyoVJ4s4NvqkD5DS1U/0JQMtbmn9FW1eMng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmEbdwVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJEGOYRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmEbdwVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJEGOYRj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67ip32685304
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ko+cClJSxeQogXCrR62uZ3/hrlEQNg5g4Kw
	Dn9KGHPs=; b=BmEbdwVhhhfX8QobxbHzbfw11e8YmcZbCJ25NwfwGuMDzFAbbky
	wWtaOPAb7kbj8jkTUqRTtvVZ5N4KJiNOMNHC6JH0T/RoGyk3nXlAReU+LsCLThBb
	RsydbbJ67QlYEjpMkrB0sX5+joU0mlkR9G8Sko+J6tK/gj733deyf8W5FmcUhgW6
	jlqWOfTOxm00oxLeJZnFgNWiNnzrtB8jLfQB69xLpHDkgnoZbMX1Kk6XbnzLkLCj
	6hJgJWwdJCGz6eETWp6Dn9T56m5TD/ABBaPICMHotsjOo1nAmvMwKS+TyYfsyDxH
	YkTCWuRAQu02J4ObCpaFsl+TrJg5DHK63BA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u06wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:01:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a813204f87so62537a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 00:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961277; x=1792566077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ko+cClJSxeQogXCrR62uZ3/hrlEQNg5g4KwDn9KGHPs=;
        b=iJEGOYRjDsHgUU8ZipakuzrdDXEUPCTVGfMlUaVu3qnDks7Ir/ucGTP+BFeZxBNXYK
         oAKOIoqtUc7C7oCahliwHHgvow2+uk+mSdNt2iG7BnQNrM05sZdGmnSJk/kO9oF+A6O9
         lQYosSZI0TN/atCsGRABKFjSqY5G3fwkMoGlq3fKVXOotksCqc6sQL4jnMtVKhxqhNEP
         9P9PLwTtb/i/7yFVRrOU0eNfcoRmewABgcgAWvlIXrN48Flx2t7MvKYSs52946456Wyy
         cpGu+HN9b0fAxlRI2mOm05kp8cqceYw1uymMlUZY5LU/GxkyymIbPN7OPwrBNBKQlmIR
         nB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961277; x=1792566077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ko+cClJSxeQogXCrR62uZ3/hrlEQNg5g4KwDn9KGHPs=;
        b=S+jEhF7uyQlfPK8ePI+ZtF5CVWOV0RT9r6q1eeAwnQGsFoqda30imrzWSsCBdPtFox
         jY95XXMTzkyp5/w/ckqsRBV2Uj+NAyD5NJY60GZp5hNVaEW/YVaan3rHh42RDvxJn9S+
         X29CAlQlV6hl2Yp0TjKR6Oh/m5HD77hq9K7MWxmNRMkgqHxF3QD13G/Tkv5cD/QZ61iv
         1gp8oMMN4e9eSl7hN7USEAY6mnoLyeWRwzyIVMOhDAaH/5YQweRvKCILNkl2ZXN0iXWi
         KW4/k2rjdQnRG0kRXxb1FvDUDs/OOt+TXaOKr5f0Lt79sHsr8yUqS7/bLK/+BBNQnNkq
         rjSA==
X-Forwarded-Encrypted: i=1; AKwUvBzSjhdYSL2l7g6YZ7NgaVm0YGG8mANz0m81vej+HXamGeZeYTxSBpyEn6eTxZlTfihpvAZuf+GGPZNhi5IzZwVT@vger.kernel.org
X-Gm-Message-State: AFq9FYIFkc8+OPsjwRW+PukfV1xwqqyZ90egQQ54M29qVks4xzvffgAB
	Lz+5LoA4V+5T+PBmLOu8IZmDG+zzvbxmJCEGZjybnc1VQiWNu1JsTmIGNircN5wTLESigtWjZ9G
	x281SK3+OdQXYwZjTJYS+R8wqCNBm2K/wGc07ouWwTqptuOXToLqQF+5ilBp9mIYV4ea4aISO
X-Gm-Gg: AYBFou1m5mb5ZNi4zap9Gn1VB0UjVy/l2toNFxi4tJloVsVGg4xlx3Omo2gdcBQKVL4
	NLyCaQ9pMmGmhQz4OmupagF6RmuVTP5SEI1J6oxO0H++/EYNlm/hgxx5xS2iV0uKjUh1U9twiO5
	THc2UvdhZFTKLLN87qI99rvCsKu//HzxZ2dAuf0PJlsCT8/TLYNxk3/3Fs/et+9jaiSb1lOt+iS
	aoL2nLF/VnSb9xzc6V2M6LlqSOj8n1nsXoMooKkCCYcrUkdEE/BIzcisOvf5dp1SqUQ60OsSopD
	7mc/COAbC8eKwi9OR/YsyrQ4VfmddBeWDcQHbt4fwCqi0CUwmt0XjzErNigACXPkRBV2SuGAji8
	FYOz274Yjnrnm5fwYetkdpQwaxzGzgJo7cgDrUHAqbsRzyLrBn3bn9Eo0jDw=
X-Received: by 2002:a17:90b:570f:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ab3ac5e4damr11724041a91.48.1791961276665;
        Wed, 14 Oct 2026 00:01:16 -0700 (PDT)
X-Received: by 2002:a17:90b:570f:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ab3ac5e4damr11724011a91.48.1791961276087;
        Wed, 14 Oct 2026 00:01:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac77441306sm444568a91.2.2026.10.14.00.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:01:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 0/2] remoteproc: qcom: pas: Fix early_boot attach for not running and crashed remotes
Date: Wed, 14 Oct 2026 15:00:36 +0800
Message-ID: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX09zQrIjUcU8I
 ytoyFkJNDheHJUR5SWp9wcr93wbHjdOe1iVo8auet+jdxnMdxbgBxE5pUAxxp5w/vQ9OG0/srJx
 oCHxcBNpvgYcvGyZsv2R2Z1dpiDsohg=
X-Proofpoint-GUID: 7ejGYLMve77enp2O27i_lmBii5z7ekOq
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf28c3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4g9CDqq4PbN_pkt7hJQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfXxkFMd1k1Rm93
 KNZPRvSMpEimlrrG9hyeKHqT4gv3iUS7rlFTcYHjsQj9eJYCys1kHATSyxnr0uGJjkR297XkZN9
 bD3PuOlUUUhL5/87GLXN2WZvGWWaO0TY3Sd1JW5XUHtN9SbEOFTs3ezl5hLSRr3ESz2suIog3FJ
 QTrE3S3YMx5CGHnLnSyRzZ8YQOZhNKWuxaYIPjBto4du+nr2t4GpxJo9OWaN2ylM7AwJO5SVdGF
 mmV5aa4HJUHYiUbYZwNgj3CQQLmBXB21+KAIl+nY1738Q6UiplwdPTsd85iIjrVEImonjRjb4h0
 vEIOMf9JzrgUHzd2mAtfweKCykbN57LIAwDZcxQLBWIiesjunjOxmyQ0F5sn/rbb5YFvHg0YUaI
 0xY62JyaID4+nhPtInDEmwaCJQHBaOlZyVRfbmCNOH/f4OhJI23LuhstTH8/qwc5MN4Q/zkr25b
 tKtQHLpK5WyypXSSWCg==
X-Proofpoint-ORIG-GUID: 7ejGYLMve77enp2O27i_lmBii5z7ekOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140027

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

