Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9F833F8CA
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 02:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785466644; cv=none; b=SkAVZr2crWsA0CbhR8O0hUBIciwqe1NJmFpqK8XuIDhjZVlMgPmOX980ED3ODS/OoFBmq4uzk/N5NqbitNmbbgpao9dbgi7cam24l0dcKO+76cmmt7vAnKw3HWWjBOWVOvZO3nwq4N3W7jwo0Y/mS7MlVmbOnERA7QpxRrm3BLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785466644; c=relaxed/simple;
	bh=cLrf/zARk2rt8yHOVaa/CHkhqLVTJS0gkc1AiPsg4JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sq66dx65DDfG4tE7iP9UtLwyjCWzZff6N52/5OxNHnO+gRaZYgyiMFyKxRf5WZXBF4DaKvtL/2MS+ToDMGQLqSkzJdv/m2WqKjIOOcshJ07jHsK5g9jRV4JbZY+78GaDmbduWCFDlf0YtVwp2CdZp6dJp9iGxeqdnKK06mUPplc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HL2Kp4Ai; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDJMthRC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL2Kp4Ai";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDJMthRC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2MKov2921557
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 02:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MPcYNAnsoa0
	dnKOyxDv0zw482z4FzJpSE7eB03yDaXE=; b=HL2Kp4AiGKPymJrj9KS3AWM9Daf
	GF5FXyfjqO/mWZm6i9kad7ut/9q5sV/AD2wOzgTCus9O2lUWw9oN3RKeI6ne7gEW
	2MFv9Vq/Zgv0QEsUZUmwGsw1hPrwVwEM6kBgZ0YgV/qMqplBJbs8px9rH1ZQ1ylp
	LVsgodKFAz97f/K1aZNxgY8Rovpii2haps3d6FYiYYjnJlrYhG7aaxqKzzFzO9LB
	+HczWJjV7q2IN6SjwOihtTq2tArOzsZ3RnLWMEe78U4zcmneGwr+63W3PPIiaA/V
	UebUG9VdG1nmLTGCtZi4pXnPVEeka/PG1qneVKsaokxEVZyS2CDezDBfOZw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjv583qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 02:57:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38827cee19eso706627a91.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 19:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785466639; x=1786071439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPcYNAnsoa0dnKOyxDv0zw482z4FzJpSE7eB03yDaXE=;
        b=dDJMthRCmOIaR9xuQSCY8YpzdCWmeZUY8hWJOl1NG621CxWBMeSCp8NQUMnnihjp26
         /8Go4kZqmqV9S1V/md6xjndY2YPUzfJh65NM+gxvToYcSDlhg8BqZFCR8a+GQIHwFF/x
         YPgSP8aorZAUAF4Rqlphhwteq9wd46kFe/zpAfdt4BOMG+VO+jXaOJzcL08PU7zeSG8d
         LzU328g7EI6KwCOOQ8bGWXGml9ea5vFs7h+VCPfyAm5yHw3F60z1v8De05Fo58VbnmjZ
         oStWIZ+91cGw+EBe5HlHrzkfUPYtGC1i2qAEprnqxfhrJp6sVBE+O7kCYLZOsMfFr7cH
         61gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785466639; x=1786071439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MPcYNAnsoa0dnKOyxDv0zw482z4FzJpSE7eB03yDaXE=;
        b=VcdAECQgABsc7wmCc37gWUALytqUzpYDRud07X1W5rlTI3eO1nG0SykysHsRGEjnjW
         7EirSCb11+1Rf/KjjnS92wg7eIN95/gdAUh+caFOIiXuqgq4ReumV4b0AbZxwMlfGuZh
         LHNBE2S6XQuuxMBL683q8XwwfPdGpHMgXyi8MeuTvpd7HMHmhw+fNBngqbZvrBN930BU
         ukOoXOXzt8zbv0ug9Y8lqQIpb2Hds13ZVlYctSyJ0rvP35kjo3SiV/TSaAcK+PKV7cNo
         2PjWVizqmC/ZMZicS98SzM0IElct3OtBcc+wbGRvhcxLwrROHZVq3jgceA92gHFbIP01
         H//w==
X-Forwarded-Encrypted: i=1; AHgh+Rqwc+/W21dEXjx0NHxfAQokYfVFQ6G5e+A2gy53k0p/Am6978/ad8ATblK6D17EIHeP/CLsmVObxtYeuNPukmvt@vger.kernel.org
X-Gm-Message-State: AOJu0YyQYnkdC+p9reot1bYWxCySQjfAvEXUXMIyE9mNX2nSJq9ayRfA
	I7Mrn/XRWaWM1w06nkRk+YI331m1mNEKvG72Ec4E8JenRLpfU0MOMlJqG/YjyEmhBl+EbMP05M1
	N3P1iNMNLRoHIsLdN853N8FJPPXM6fTc7s74K3GDaRkiVnveiG/mpy5XJosmkGYYi//CooIrN
X-Gm-Gg: AR+sD13l4QN2cVfAeJ7GkamWRXg5R+02rBCnySBmH8BZFArxG9d4LvKIofkuLU3MLqa
	a5FTv6cScbGSjh5fTr8dFpySeHNVmOllhCnwKzS0VJEHfymU4/2vGY5ie1QlhutkOHEPp9M9HEM
	cu8FWt4Gmn/qF9C+MXHrF4j/SYLlXZ3P474zeGfaRgyVAQgcPT9qcx1MsCx9USvJej61WH+cFJL
	zTTOYK6/tFMtf+TPhVHt6WKcSNsKxSp/QChRnUK1N1xgv0k3+YMhqThxKrKIDmywuzzC5FHCXUq
	fwTRU7Nhwi0FzyNqgesZjdfmwmxHpMkJVBlxVhlbLPK0GlnjuLuknRXzZvQSj9EYR90ReWfjzF7
	sq/m4N7i/q5Q1gJzUhPJ+5rMKZDO4Ph+0H/SMdAmRMpR/rY/ePr/PzLB4G0FG
X-Received: by 2002:a17:90b:3c82:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38fb13bf4e7mr367671a91.34.1785466639264;
        Thu, 30 Jul 2026 19:57:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3c82:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38fb13bf4e7mr367639a91.34.1785466638739;
        Thu, 30 Jul 2026 19:57:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fa748fbc6sm558519c88.8.2026.07.30.19.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 19:57:18 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] remoteproc: qcom: q6v5: Ignore stale handover IRQ delivered on attach
Date: Fri, 31 Jul 2026 10:56:54 +0800
Message-ID: <20260731025655.2642860-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wv5qLwFqQcTZBw5Cq5pm_ojbjZ5sQYhX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxNiBTYWx0ZWRfX33CwGgyIsIOt
 ur0kWKPZFuWDrFLFTEOnjIpI2tGFUG8vQJtxV1EJjNOxbtqk42ZRdMHyq+gZpXLg2HrObqVuz/t
 Y8eOVjGNd9Vo8USkoVG/6DvgV7wo4DI=
X-Proofpoint-ORIG-GUID: Wv5qLwFqQcTZBw5Cq5pm_ojbjZ5sQYhX
X-Authority-Analysis: v=2.4 cv=co2rVV4i c=1 sm=1 tr=0 ts=6a6c0f10 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ucfoF6HzfPYjNhC0tFoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxNiBTYWx0ZWRfX2zGRJrsCKu4S
 D3RWR39Fv6jIjGcdvoOpfDJvQ/c5wewGeubjJ+XdjAfcFTs/41IN4y4OaIXe5uQ6zhvNqq0yc81
 hmpMnJcJoOq5zG44fnzuLxeaYLG1X4ZLEmXxnhx6qeRPa8LkH8eYgzA+LTg0q7ycloCP+bjHAgi
 ztccjmvalnSpTAOevf0vg2CG3Is0SM60DWZ4FLMyRLfxtX4eoDCZZAFMZyvUS025j0NME04HssE
 712janQEmG/CKY5qBiXFvRR9jLR3r7Wgf3Hd1GhCMtBr47hRR/txwfbdEwWogAMbVkeOI7kF7mO
 +aBLHip6PzONWKcDGMG8f9imj3my2KapnflWn2TG0YYq7vN82V0zxoj0FcD2Ou2kELMoL7t2SB5
 2I4svO6Gb8uJq696FhdgdINGfwPgplt5U11EXmS7HwZxBr7TYFB7n8js8dbj7wNHu/B9FH7Rgjg
 1vwj6c8i0QgdDEgxGYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310016

Commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
dropped the check that ignored a handover interrupt after handover
had already been issued, relying instead on disabling the IRQ after
its first delivery to make it one-shot.

That is not sufficient for qcom_pas_attach(): when attaching to a
remote processor that was already booted by the bootloader, handover
has already happened out-of-band, before this driver ever probed.
qcom_pas_attach() sets handover_issued = true and unmasks the
handover IRQ to keep the enable/disable tracking consistent, but the
transition that signals handover is latched at the interrupt
controller while masked, so unmasking still delivers that one IRQ.

Since this driver instance never ran qcom_pas_start() for that boot,
it never took the proxy power-domain/clock/regulator votes that
q6v5->handover() releases. Running the handover callback for this
stale, already-accounted-for signal disables those votes without a
matching enable, producing:

  genpd genpd:0:4c00000.remoteproc: Runtime PM usage count underflow!
  genpd genpd:1:4c00000.remoteproc: Runtime PM usage count underflow!

Restore the early-return when handover_issued is already set, so a
stale IRQ delivered on attach is dropped after being disabled instead
of re-running the handover callback.

Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 10fa38f264c8..e715083846aa 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -210,10 +210,23 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 {
 	struct qcom_q6v5 *q6v5 = data;
 
-	q6v5->handover_issued = true;
-
 	qcom_q6v5_handover_irq_disable(q6v5, false);
 
+	/*
+	 * When attaching to an already-running remote processor,
+	 * handover_issued is set before the IRQ is unmasked, since the
+	 * handover already happened out-of-band, before this driver probed.
+	 * The transition that signals it is latched at the interrupt
+	 * controller while masked, so unmasking still delivers this one
+	 * IRQ. Ignore it: this driver instance never enabled the resources
+	 * (proxy PDs, clocks, etc.) that the handover callback would tear
+	 * down.
+	 */
+	if (q6v5->handover_issued)
+		return IRQ_HANDLED;
+
+	q6v5->handover_issued = true;
+
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 
-- 
2.43.0

