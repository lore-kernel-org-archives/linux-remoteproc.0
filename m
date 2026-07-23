Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4835E1A2
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784775655; cv=none; b=VxBIFP5rF4iceWcAPdrQAxKiNaY26DvVzFqaUN3Gk6CsRNREh/RrZ2dUjJeM8JXyjkob3LcPB9u3zXqtkIt2W/9RdGFj5CRklJ+L+lMN1oGgZa2UBYCEDGKZZZN6lh/498UJc+U+LIzcbklEFNaJEbn7eQYp4eYH7165AT4Dea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784775655; c=relaxed/simple;
	bh=9krE9RKMENaD2J5nNh7HWek06yZPzFS1BDOuXgEvhrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o4FyVXhhVRTGf3UlyfjvTGBCeWeCDKykOa+59nPSq8D4cm63AtxrYb5tPOScITBgBIX3YE3dZapOcCdTUGM7RIVkbfkkHlju6z/bJGhde7DVfUWLLxcDBPidj9iv4b+cItxYY/uUyMjCVI5gXrGSgKJqVqe28GOcJAildzH8B1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLVlMVON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2zc01IV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLVlMVON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2zc01IV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WwpB2537782
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kPSjRIyweAz12o/0zapMix
	hkVadFAjMDulal6oSaCak=; b=MLVlMVONMmM+VRHovivzFMyWTSQCUZLdaLA8zu
	iFg6jkuNXb6baMIWD1nG7i0HaumGmXVJwy6kkb3HOxc1P3CfgexHe1OG+FjImSd3
	OrO1NmeuNgnY34Nze7aCmNpA2YGd28cAXpE2QCHGZHxMs8BngaKphd/cnP/BYMBh
	kkvqsooFp/Dof+AP6AOWsY/JyCS1SDR52E4PMItrkaqclRrsxZYPqupb+RNweClm
	+Tt/yMx13S6XdxLnF4FgJy4Yn0oyUYmPCFeo73J88z2+S5H7dsZXXe3lKaO0mkSv
	ljShDVnWk9E1efz5YEJRqWI1Sq5xZFqX3y3Rys2fNE2/lwRA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc13cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:00:52 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9e0e71e05so221816a34.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 20:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784775652; x=1785380452; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kPSjRIyweAz12o/0zapMixhkVadFAjMDulal6oSaCak=;
        b=V2zc01IV2Hs4pD038L2HOrkTuBvPTAtI5HXLzNf3tgOOCg161maWZKnqphmE8e6jOO
         x2hP2q3kXaxsqOFn+sfBNR8Z7bny98wvVc3e9YgP1dmDTcZHPM0wwlfdAkToG/iK18Gf
         3i22411O7gY+xuO2cYVMFDaDoEwi37KPscxjl8lY1zbTo60t7ZYm1z+POnU0hX0WgiV5
         pMSNoSTksyljKnFmDtF0Pdav/Iqg2dFtZCkdjKeQCO7waY2DbR/xW/W33ErDHC5oRD2s
         HUF3oyfPt7tyliMUugn0/vJqkplF4kK2BR9CHpu/WEsuo2Pqn7FQMBDvHDibOoYzfxrY
         FUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784775652; x=1785380452;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kPSjRIyweAz12o/0zapMixhkVadFAjMDulal6oSaCak=;
        b=nyBJQn5eKYpaPibq7zey094sFjVKVdFUxCXUJM9bmof+TcV4g39LVLDKSjzAMw8fo7
         FZ4JHArqNeBlrKtxDTCXFgFdaeZg9GzGofnlDHx54YjVU531cXM32nE+2gmv0olDuM40
         /v/1mDTt8pD9A3OuK07F7KyGZK1a2HGkuQ6/uNEU5PUjJT2zNRqM2AV19ShAyhAib2s+
         Dpa1xkvLnWYP4ZirR8rXuu1uxWQnj2sIO4UBZVgHCch+pw6gAXacnx5nIH+OkDk2kaNc
         z3utqri3tpWFV4fl/RX2ewkWY9ggS33sTZGSjfBSfhjxcuL3zTp22gUh+1Qro2WUtt1k
         D1kw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1Bs78n/htBrxcIUAkd/vFCNC3u/JcvaJrVh/G6vifmYdEx6tI+4vZTzkJXDzNIDAXeQR11ULdxozd1pUoGDXI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57Xkz7K0/XgtwC+JGM2Px2x3p0JBRDP1GLdgEfTQFu170Soll
	PmMr/S3gpnEEK6PGCCW0tGx9w0FS78PZnxKKsThPblNTgOfkq/XkjYaEuZ9Jv/OEO2fE9JK0kiU
	ehlWvP1nfpuOQ3dtYIYhzG1QuNLWHQWnPGxKygriPZZ7cfMVyxiYbC1gvLxdfTarVmRILS7kA
X-Gm-Gg: AR+sD13fKGok/kDWaDFaL9v+bsiw/db2ZJypmWE/emb+zfIodSbsP5odRdWA5WWWb+a
	Tg9ZJuWvfkS4JnQk4QYAdukKeP4CldxhCtjtNXk9bVVsk39c/pKE3ELV1vIMAs1P9leBThjcUN+
	vNenGpbhq7Hm+YA160WJ3tHQE4IywW/NnjfJIh+WDClRqB6h1bzmUL/nVmExaUSpj4sfUdmf3ra
	ek9tKHh54EGlW1n21qSvZLSpzfmBzPLJGUqVxekHAYHUZ2ljBmokbHdUw8muLqPwtP8uMPAe38x
	ZOA1f7PX14GATjPlVptKm4nNNcdUtvo881fnbOhp3oSv7/xcRs0ruF7rOyJbqS5/2yOroP3yC5n
	0Ee8qMLGLzY8SqtiJdDg=
X-Received: by 2002:a05:6830:700b:b0:7e9:eaf2:edff with SMTP id 46e09a7af769-7ee43e0c901mr942059a34.26.1784775652169;
        Wed, 22 Jul 2026 20:00:52 -0700 (PDT)
X-Received: by 2002:a05:6830:700b:b0:7e9:eaf2:edff with SMTP id 46e09a7af769-7ee43e0c901mr942030a34.26.1784775651717;
        Wed, 22 Jul 2026 20:00:51 -0700 (PDT)
Received: from [172.17.0.2] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29e0f1a5sm2583932a34.11.2026.07.22.20.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:00:50 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 03:00:41 +0000
Subject: [PATCH] remoteproc: qcom: q6v5: Request shutdown if crash is
 triggered host-side
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-q6v5-host-side-crash-v1-1-23bd53db90a7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANiDYWoC/yXMMQ6DMAxA0asgz1hKLBHUXqVioMEh7gBtTCMkx
 N0JML7h/w2Uk7DCs9ogcRaVeSqwdQU+9tPIKEMxkCFnWiL8udxgnHVBlYHRp14jmkew1DjPobV
 Q0m/iIOu1fXW39f/+sF/OF+z7AcUgHiZ4AAAA
X-Change-ID: 20260722-q6v5-host-side-crash-09f1256cef71
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=9krE9RKMENaD2J5nNh7HWek06yZPzFS1BDOuXgEvhrQ=;
 b=owEBfAKD/ZANAwAKAQsfOT8Nma3FAcsmYgBqYYPaYzT2tK38jCYCKWVrqZ+cLlIE5JW5cGuhn
 jDdT4xEjFaJAkIEAAEKACwWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCamGD2g4cYmpvcm5Aa3J5
 by5zZQAKCRALHzk/DZmtxdGCEADUD+wv+2iGzRbbndsGdQJbBjOtz9CdEFnpz91HRYgHxGA3G5R
 8T2eMnMriJOfX0Di8qohWrLgl385uh5CCnOoVpzfn2oRTGvdhJtuVEjcFVQn6b/SqQ2bAOHBUE5
 bHbyMjj08+thkSX1MwtDXTaylq5P8P00s6KnqZM5emFka+LEzJCQFPNOrErSt8jDvqyJI2IlyEm
 PQw1cL4PlPjJX9vSVqClGwBxh3zBPP3r8uvZQy9/jDvYQpXNnuCLtzlHC/pQ9ryyoRhin29Zs2d
 gVKQoDl6KE1s1bJEJXdmgCRqbbpLK7k7+3ik0Gr4WwgUeBZtc+18YQ+bNBn1CuGhfXoqHICCgq9
 u0OAQERW3ksR11hO5gH9sV5QwjVWOjJXTV5BuZJTplLzUrmJnl9IztP6QDSYND5YXHIQmoQqehd
 X6hcY7Fx3jYwrjGOxO1L1FRn9TKwslTT2KzhBSRcgxUKAzWPXMTMO7ManCVVL0B6K2kNZtzxaNp
 0fUUpF5IZwvopI2C6rWS5gCY4sHQbOP4mdtLVkw17gCYM3+QQhhxfPT8SpVloSnkZEJB3n177MH
 45XUTf3WaHBzE8TxQNFhuAOjiQq8YUy7tsou/vupKq04bF5ye14JFyklMOpxEEE1b5985q3XgA8
 LbG5ydIjWUHw94hp6i4OCGuCcFq7GDyjLDw==
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: dAM-s-SSiZqBQqWyNHm-h66EyHvkv1yQ
X-Proofpoint-GUID: dAM-s-SSiZqBQqWyNHm-h66EyHvkv1yQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX2UOBGFWPRHWL
 4HmuUob/KiD8D7C6ysfc7M6lKKJ1uXqKroN/l9Q2yyX0ID2NWDcH7qonpbsptOT+si66NvKLhnK
 3N1omQLgn0VbLP1oyHU4rb8EUfwk5v0=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a6183e4 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Bi8UBAkcxtFIQmh453wA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyNyBTYWx0ZWRfX8mpy/LcGTy3L
 6ruyvGbnmAxtBDCdkkKjMJeRWL3VaNonje/HYvCImNb1WsEdwxIAd9wbtmJin608G44bK8SlPCu
 P7oIicKHRYqhWPbdcWGaNjG/Sm6Vl2kGT0CCqIQhC6IL4wdR8t+/Cq+yOoDSWawvn+dj+TQNxoS
 ydPOeldluAnVXq4qG+CLueaYm8rV1kpbp6Rxl3vEsKoyY6Qgo+OWQvqQBVh3q65zaof5v8LdhaI
 s7gCTPWuPKaZTmLPsEVi41qtToLqAZvuiP9BuMsHgEXbpTIWY/VQ1ZBJD8yfxocr6WVW5V+Ukna
 ezS7t2O2hYGydiKbnU/DRUFZQEfAUlMDXkcrvzkxtit3A32eH9dOAi4EhPfz7QMB6AAY6TJMiM/
 KyHCqQq/RJTG957V2NMsj0RvntvYuW3TDji3p+5b+qN+1XQ+Cu8IzzDIGxnEBIolA+C+UkwZSrE
 RN8XMSKb9fG6x7WOBKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230027

rpmsg client drivers are allowed to invoke rproc_report_crash() on their
grandparent when they determine that the otherwise seemingly healthy
remoteproc has entered a functionally broken state.

In the crash handling path qcom_q6v5_request_stop() is invoked, which is
based on the current rproc state whether to request a graceful shutdown.

But the current rproc `state` will be RPROC_CRASHED regardless of where
the crash handler was initiated from, and empirical data shows that
unless the firmware is taking part of the shutdown the system state is
often left such that it's not possible to start the subsystem again.

Use the `running` state in the q6v5 driver to make the decision instead,
as this does represent the actual state of the firmware.

This makes it possible to reliably trigger a restart from client
drivers.

Fixes: 3cc889eb83f5 ("remoteproc: qcom: q6v5: Avoid setting smem bit in case of crash shutdown")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 1075ef4027b7..fe148b4b3775 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -229,13 +229,13 @@ static irqreturn_t q6v5_stop_interrupt(int irq, void *data)
  */
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon)
 {
+	bool was_running = q6v5->running;
 	int ret;
 
 	q6v5->running = false;
 
-	/* Don't perform SMP2P dance if remote isn't running */
-	if ((q6v5->rproc->state != RPROC_RUNNING && q6v5->rproc->state != RPROC_ATTACHED) ||
-	    qcom_sysmon_shutdown_acked(sysmon))
+	/* A watchdog/fatal IRQ clears running; logical crashes still need a stop. */
+	if (!was_running || qcom_sysmon_shutdown_acked(sysmon))
 		return 0;
 
 	qcom_smem_state_update_bits(q6v5->state,

---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-q6v5-host-side-crash-09f1256cef71

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

