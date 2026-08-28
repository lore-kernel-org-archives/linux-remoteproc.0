Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905D53A3E9A
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940813; cv=none; b=fsv4MgTcKskeat8RFzqYmUAl0gGPKW31phxbMim09A/1/BhE+INO+G30/KAA46Ht26mM6r3SnGCoAeYBMf1GoOj1Jj5LvS7PfMBl6RWGqj/ibYZ5yxQtyfIF1f4T656WdO/VYEYJqStmdnxvB0W4iiwHrt135OQBg8GV4ZCxSDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940813; c=relaxed/simple;
	bh=vtcYHy2m1MJJoXht1OpyQ+fLPocDu3s2AQvO5UcaALY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVrjkWuNw1bpjHeHavC1NE8ZAkvJLxSwvCvo7n9SA44eC2BZesqrcX2MlCANmeHg4QqfabY9PCWzVQNKMDkboygqcJ6DtkC7zK4frrd+3YW44xcjl7rpGQTdzlhLIAlVtvE4v+yLxTotW3tgmmRsfrOC9Nv0GgI5Pc3zo5EJpCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgWBun9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aq+hQ5+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgWBun9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aq+hQ5+Y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SGK4Fh3310227
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 18:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0UzAoBfsq6o
	gZO7Uv+cRArAo7OR3AbLv7IJO/MUHyAI=; b=jgWBun9dg6nFeb+Vx3IXWrZ/TLV
	lajwsqx1YLyWQMxansxfzuDYNzvSBAS6xRlFoo+vN86E7Cd7/b+W9ao35hW+eq0G
	ulqUEqNeiasqZpWDBfJhfm0eihtU2DhrM9z7OeVnz1Duv91lPO/PuXkN/OX4EDOo
	1N37vvOzTCSy6iOTWdV2AYkvEgwBR0pZ/odzNNAY6JF2ZbKxD+WZ47nRUGMq8n/W
	ASYRUXImrC41mpzoHWbNrR4P0TVameE4agFiNxG1zKizzqi7850TiSbQ1ajN7SJd
	O7PnVM+jf9HS+9oRAAJ0ESV15WPRHCphO9sEn3o9Gqtq75X+mT/UydLw8Bw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3hs345u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 18:13:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8aee88725so2075906a12.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Aug 2026 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787940809; x=1788545609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UzAoBfsq6ogZO7Uv+cRArAo7OR3AbLv7IJO/MUHyAI=;
        b=Aq+hQ5+YXzaB0HPGeA8ANMXKNq+DoOd8g1Sj3QHfenhJHr9jYMqMCl0MKznHyiYYJ9
         3UPJUIRdKZxh3u8Ei7dIn0zFx+Q/RRibVp1wWGLcvstUjHKbJq/jaQ3/HoqPzKGskCiI
         xky2E/Sp0rtoI7B9u/+lMiKJ26P/P8GKXz/nnFdrEOxORFAyQdJgTeproGy/il4Ko57y
         T398+MpXssTvf03mls6tHGQdE7Ni87e3v57PkVcGA7OkJns3/IZbHYcePUHyFJMYXPOF
         PF0HKaHXPthVwoZ0OV82tB8ksrvV2bSKdgfPyREgT+7MtBChj5C3V2A8Dqnr8Xlw8hGc
         bpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940809; x=1788545609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0UzAoBfsq6ogZO7Uv+cRArAo7OR3AbLv7IJO/MUHyAI=;
        b=jhv3XoKAE6m9sjKtsULaqPbD5o1OTbDKGVyToOqKtPzkj1Wg6DSAvwoeKA8ROFamlv
         HbOTCaiFNQIMGUWi8bGOXS9hmR2SEc8l1DIhgP0SmpcOY6btaf1pYDgrKy8UG8X1zB5I
         RvCXOQyjXG+CmbTpYCg5du5uU9LWnhHLKm2Uopqv0Bbq61/AIsEm+CWAK3UIDs0Z/GWj
         fcqfzXixFAJ25WAyh89CsvoOpLZhLb/eLExwXkt5j8a8ckGYQ2OUKFVpO1PwKvcaNFkQ
         Xdo+qV4r+qryCfGKxyg/oeWXCmycspwaRMJzU7Bnlly0uZmwpJQZaigMNn/isE9TeOiP
         8tzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYljdx4UF4CWX4PArqL5KqBrTvKtoWPfcOlIyMp5r9Cn0gpKa99rFtrhtxPE+vRHTA4nOC2j4wMNL0moo5EOSU@vger.kernel.org
X-Gm-Message-State: AFuF++mIxMU49ANfM6RlO/yzF8OJGNkEeuB/lbmcJcICfk6u18q6dgCX
	rA0+Ue2FAAqY1NNFZo1prhP18/bRAmc6xsA8cpSqBQ/Bh8Wg+0wNifLEZetu+vsirlQdTTNE6uI
	40VTRursNoeNDMftraZNPjUZZo/Od+iz4HV8/G+Nk89v3wRJH8hwH0GjOOmlwHrw2K/Ho99gl
X-Gm-Gg: AR+sD12Hwj8uxk6Y9buT+IRyfZyrMIF5lSZe6bv7mQjbFdDfhLYfEaHnRPmlTc+EPje
	l90dVPcV6wkW+V81qvXkoSKZ/PLqs5ZkaQYhMkRQr/32BRLgg8SOh0DfKJrPFI0Tdg9Ksl9368y
	SlV2b8sx3wU6CNZEG8ZZ9WTWuRbeN1/Pr+AUutGjXR+t9FeI7jyg+bf6n131Xy8x68cveKV66bN
	Su9w7uzpruclz+McFxF66+vmI+5x07+eEnKaoQA4dXBTbEKPGeJnSH/z+MsHLA9LyS9Sv8H7niT
	NFZ0PvxH74D3v+Fg7EqUkD41tKt1dqD6kEhq8qP7rUMRlBgNXYpNCkuGsfUZQMg0bBA9JwpEfCT
	/kcSCorIQdDhJJ9h4IlZfirpmP7A=
X-Received: by 2002:a05:6a20:c784:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3d268cf77bemr17891575637.9.1787940809375;
        Fri, 28 Aug 2026 11:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:c784:b0:3cd:61d5:f342 with SMTP id adf61e73a8af0-3d268cf77bemr17891508637.9.1787940808861;
        Fri, 28 Aug 2026 11:13:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784845sm8575600eec.2.2026.08.28.11.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:13:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/3] remoteproc: qcom_q6v5: Skip handover callback if already issued
Date: Fri, 28 Aug 2026 23:43:10 +0530
Message-ID: <20260828181311.4038346-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
References: <20260828181311.4038346-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKYAjwhE c=1 sm=1 tr=0 ts=6a91cfca cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=GHr-1HkMQwPlg4gqiLcA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX2Ywgl2Au62Kj
 dn3RGeXvhew84+Nzh9zYYkz4roU0n4PXbmLJTN/sYGLtSR5EUThA3WbgqU1gQtb7PgiCn2BpxjI
 SOxMJwkz79lfVAUs4qB/wvR3tv03DbGEQCnM9TBf8YRUcIp3x+BRIbNYGB/8haxU+1pZ2nejZer
 VVQ9ir3YQ2F50oHx2ESysy3rSHcj9MEd71SLlI4ZWnTWD+97FMk5N7xPLHzNzi3PppVyZoGn/A1
 VKfg0IgKlK10NoDyERppS4BnkhcV/CVsZYGkpgIjxUKtD9xU8IgdTIkMTuKN43WMYwaJhYp88kc
 x65HFuqDuKdD2i+r16Z/aLUO838TQqWW6SGCYyVOiL5bzBbnBQZwch0ncN6GBHCaTQh/vGx19h4
 kvK7k64SjVfjsrjchG9GgK1FrBGaQOcIt9N7s0kVn848LckAzKzrDBYomPFJ0vaQ+ZOTX41n/qT
 QwRV7hgwM2IZMz9FEfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE1OSBTYWx0ZWRfX7dC7gTSG+Wl3
 LWcB9ADheSiXCgyd7ZPmc+8L5QctspH0VxQa2uN7QaQTj8WcoqTLDEWUELhEsovywqb9qXdd3n7
 4/BEQ6tCO73pAlvS+0emifrEh+D9VRc=
X-Proofpoint-GUID: aTpntV27taw8h0nWTh2MKCd16dWMDXx9
X-Proofpoint-ORIG-GUID: aTpntV27taw8h0nWTh2MKCd16dWMDXx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280159

When qcom_pas_attach() is called (subsystem already running at kernel
probe time), it sets handover_issued = true before enabling the handover
IRQ. The handover line may be high already (from bootloader boot), causing
the IRQ to fire immediately. Since proxy resources were never acquired via
qcom_pas_pds_enable() in the attach path, the resulting handover callback
calls pm_runtime_put() on proxy power domains with usage count = 0:

  genpd genpd:0:d00000.remoteproc: Runtime PM usage count underflow!
  genpd genpd:1:d00000.remoteproc: Runtime PM usage count underflow!

Also, because the old code left handover_irq_enabled = false after attach
(fixed separately), the handover IRQ was never disabled inside the handler,
allowing it to fire repeatedly and generating multiple underflows.

Fix by recording whether handover_issued was already set before the IRQ
fires and skipping the handover callback in that case. The callback
releases proxy resources that are only held when the normal start path
ran qcom_pas_pds_enable(); if handover was already marked as issued,
those resources were never acquired and must not be released.

Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fe148b4b3775..12ba0b80ad3e 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -198,12 +198,18 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_wait_for_start);
 static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 {
 	struct qcom_q6v5 *q6v5 = data;
+	bool previously_issued;
 
+	previously_issued = q6v5->handover_issued;
 	q6v5->handover_issued = true;
 
 	q6v5_handover_irq_disable(q6v5, false);
 
-	if (q6v5->handover)
+	/*
+	 * Skip the handover callback if it was already issued (e.g. attach
+	 * path), as the proxy resources were never acquired in that case.
+	 */
+	if (!previously_issued && q6v5->handover)
 		q6v5->handover(q6v5);
 
 	icc_set_bw(q6v5->path, 0, 0);
-- 
2.55.0

