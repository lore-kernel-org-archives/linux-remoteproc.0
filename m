Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA821A6808
	for <linux-remoteproc@vger.kernel.org>; Tue,  6 Oct 2026 03:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791257792; cv=none; b=lr32hKuHB2sJ2PdsCZZ713Ru2c2Gb9J7/IfREI7wNSkw2TovUORC8yZXXAMeCitGUMRRiSRL5pdaZ/rDkWDkilJUhJEHiWl5nLNChWMq169XlIBOiuNMYlpQmxYQx1Lmo372v9b8YoUn30mKjteUlGsc51NxjY3nniAEl+KWrXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791257792; c=relaxed/simple;
	bh=1YtTcN5zViPArJxXihKe06EaRhARZfB/vKF+BTixqYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uDsuToBh4aqbyQOpWBIyppomDEmHEWrzmYYDBP/LxbdJLdQWn/qWfdGRHifiNdfr4k8OHhTquy0hRyGcgkeXo5rvV4WaVf4FoLRD1R4HNm7RiLWIMfy6wpsf+WBcdg5LO1+ECEn2Mm7ro529HzJdlXNR59OrsL4sFQcxrRnBDa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCFBDQYq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f1+X+F2c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCFBDQYq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f1+X+F2c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963ATPr2383853
	for <linux-remoteproc@vger.kernel.org>; Tue, 6 Oct 2026 03:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o7hGKobrmy5FOhyS5Fv0wgSY3QcAJpUdWlV
	BVOGua4U=; b=JCFBDQYqTpDkbImoskRCGlTF8uowwMMZVbfXDmZBVawFu0p6N0X
	k/cIpdpW3flrwJ9LfFLj/wm4U/BYLBf/AwrMJrhAs9WV0BwGI7ed4bAd7jcGIqM+
	srUuOiRPxhrbQJ55Ka8R1VePlU/ikb53wJqK07SW/mdMwx1tKKjm1fhwYTjRvalY
	ymnXdDHoR+3RJjSbdklf3HCBpg5S9IGT/9EKomQRuRGMwe5L8dlPFDSkC0dWVkFT
	0EOUyRnlJW51U9q4OgDeFLckYI+FJDv96n/RojvEu1jeI7UQwu4D+CWCN0Nq/xha
	OJD7eazM/40FkcM6JzmWIfYqI4xswZbEy/g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dncjm5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 06 Oct 2026 03:36:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so115117eec.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 20:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791257790; x=1791862590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7hGKobrmy5FOhyS5Fv0wgSY3QcAJpUdWlVBVOGua4U=;
        b=f1+X+F2cU+UL0q+IZiu8KvIqqwmY6eL6ZjJppgZvNPKRyLdQUfrnsMkcDbRqQjAm/R
         H2/bwg4jAEz9c8q2xaBsJLumkGI5jknAizOmpAsBUunmN119ukPRn69ROBE447NxdBq+
         6zyww3Rt1dLhtoEvZRMJyr4wIEIiNHK1R7dIk1yglCkfd1uzvyC1w7cvFHsYpmcWocCr
         tnvt/FRpgdX4Ka8DJ63vWs+6aF/gr8kZiuGSIdyH9CnqwJyVscC84+XrJ3cvj6WUKpgE
         xtbuZHJsUTGf176eeh9IJuOvnS1n87Vw25/KDNBfL8ylGD5OBEpGoRM3737pCorJaRCh
         dlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791257790; x=1791862590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7hGKobrmy5FOhyS5Fv0wgSY3QcAJpUdWlVBVOGua4U=;
        b=rmuYmoxZ4c3FYu0p2yQytbuxOl01tFJwjPR4c62ufAqWyishbvwJwxXQTwGTbFjNFr
         1KekFB2NnrcHOMut+u0X9Ri/Z/oLIh8rnlJcml7FbcMouGNsakPmAgw4NsDwK7K3YDxr
         /jol3JiGjGekbdYuLl3sXj9gZX7BnuSGba+/MU2FVBdU7UdVBEQrfmVIatrfP0ABKB2E
         gZ2KXX0x+Ock0Sa+6cyw3yackRvN1StmkTnu44Q+T0LN+I40BXIbR92NB/6hDTp4Wn6j
         /w4o6E+oqZ/i9wUZcbsSQz4ebECY0kuWmykCHppI3emGX1laD2h7kyM14oP7R15PHSQZ
         6HVQ==
X-Forwarded-Encrypted: i=1; AKwUvByDjQzLaLS5clG8/hqu//94TKLuG+x1KFCE07lGxoJPwJeCKx56h1l/ILGv5bKY48rGXXvF0xrixKolQFu2S18L@vger.kernel.org
X-Gm-Message-State: AFq9FYKM3/78iqlFONeEvgXlZBIl74wJxYym9+EUasHWt3AwBSYv2L2N
	0VTzd+qXSqDXTtsAPVPOMayQVkDf5wayFF4v2KBxLMO9nsXCn5QREplMq4L2s4/CCaf4AKEUNWs
	2EmolF4lj+OBZXWq69wOkAGYB69WujHheAlyNiwMIDzKGv+UiUwQJYyza2QJNtfoSkjJbOFqp
X-Gm-Gg: AYBFou0jASQw9LYUAVPskgp2N0VCubT6RuqqhiG5c4wvCYnYQBIZ2RLdTvDIDy4BhLT
	NOyTJgNfTH5CcYmqVNjDqK1xkhu5YW8EaiIOoeyzx0zZ1Sq46/6SMfp905AYAMi7DWhyIOLNXM7
	OiOlscbSzYfl6gZAhyevI+38tNFm8xruwli6MK2LQ4ErFq2Q6ZM1dk9aGtxN8o/IwE1rhT2vep4
	4iUAs2eYtw2G1EWX4rvJ07a6RVUsse6VDU3Z/hxCwfC5jyfLHIRTGLPw4QlYY7CwTPx+RD7JvRg
	cVb1HxAL9SVDvTZGgJJDrCCy61rFuWzeMqq2AG9jbn5p2n6X9DGtuQ4h5Qv3F67UgL9yCZkkxek
	YQL+OWaqB7CX/bBt4VP0rGeACH5kXaSizO0cVR4Jcgq0hK1aXTm6nJevEp2I=
X-Received: by 2002:a05:693c:8099:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-3514e2b0190mr1864eec.7.1791257789716;
        Mon, 05 Oct 2026 20:36:29 -0700 (PDT)
X-Received: by 2002:a05:693c:8099:b0:33b:c24c:d31c with SMTP id 5a478bee46e88-3514e2b0190mr1836eec.7.1791257789141;
        Mon, 05 Oct 2026 20:36:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469fa189sm3279736eec.6.2026.10.05.20.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 20:36:28 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] remoteproc: qcom: pas: Fix early_boot attach for not running and crashed remotes
Date: Tue,  6 Oct 2026 11:35:48 +0800
Message-ID: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAxNCBTYWx0ZWRfX8hKv0gL7har0
 tBv0kO6BeO86DCvau6R/yN/LiLPHKnPuIgSXCFvQNCnakc0q1mctjPy2KH1TCh5UC6yT//YRbRi
 ciWgw7ErYTjUbevSjHzZYQAeM09mOqo=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac46cbe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jj1koKFtIRecCiTYJFAA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: jqGER5uS_pV_mhuSqscbGJvzp3vAT8nx
X-Proofpoint-ORIG-GUID: jqGER5uS_pV_mhuSqscbGJvzp3vAT8nx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAxNCBTYWx0ZWRfX+qor4nkP7/ku
 YskaV8gLQufwbfDZ+HrPpgTcPO9LFXF2aXWDG1f928CWsyab5Ty7FRWHMu5m2ZoY9VxI8NHO+AM
 ksy6jSIGlJbm0Xdz7gNVM+fmB6nBEsbpvsD6M5jPkE39fVAmJ4Hn0WTroqNCOTKUIrInjY/YzkG
 hgeFwmISmH/lt+0ItlAyksr7lnwuMjCF4GRAX78d5Yqw+r755qfJgHSvqH9dK+PhZ2dQ8kVdShk
 Z7Lr5Btu+tvVxTiOqIkaQxJNGA41q0+2YT/+xYVGPblEJrLKrfxuXj6J0YPBbk5ZGscSqCGlVo4
 QvjG4Ze4mfCJt2ypDpNfh2wyM8IQT82tD1I3PQ8xTRBt+m9ekhLAQBphcOOcpYUmccOguhCSgSr
 IKZeRdDdxZExWV17bqeH4J/ha3twOdqJb/pVTZm1ku3UoB/9Ijfx3rgT0/BbKIMNXhMR+rTIz1l
 dMRllStlP2x59Z4utEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060014

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

[1] https://lore.kernel.org/r/20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  remoteproc: qcom: pas: Decide early_boot attach at probe time
  remoteproc: qcom: pas: Don't fail attach if the remote has crashed

 drivers/remoteproc/qcom_q6v5_pas.c | 72 ++++++++++++++++--------------
 1 file changed, 39 insertions(+), 33 deletions(-)

-- 
2.43.0

