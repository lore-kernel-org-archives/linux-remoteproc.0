Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E594252A8
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554147; cv=none; b=CKBtZb/fadkI3TyhLuKcX6yQFKOuj3ovvCUOrbYQH8pVS3tbgtU2DaaICctIFf+nmY/7WvSTMLNsq+KcZC05Ilcz75XIdogP3Hn0JtdtkNNW9GlDA5diou+Uqq2G7J8CWTJv0XpVug44TaXB0CMPX4AZQ9UlCg+rrkUywJN7Fl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554147; c=relaxed/simple;
	bh=f1RJ74a76PW53KK+1xdt52Qum59vHAAPDpQ+wyRWZLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvFG+ipNbHeh97rtveYdhXkUkHyGnbhOVwGSoYaW109cIMO9V6Zs9Ueo4idS9qSzE7cvekgNfa+so7OipCwB3hvrknqP0UROMXGyFckbxlEl54lw5DBTaR5TeZL5WVU9Qre+aixMvJF1nwZrauE/zfJujSRPoh62td5fgMp6jMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxH3DvR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmzIRkB9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxH3DvR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmzIRkB9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvRkJ2183581
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 13:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tSAwREJ9fN+/n5hiVtWkjLEHl1v3XArrjXhPEVMyZvw=; b=hxH3DvR/TKs7tSd3
	LCfkDOwqsZppI/Wivpx2IqG3PwpCwSCdunjlAiuH+hH31zlkzMezp9u9/BClSVLc
	7ZeE+WEaqPgAdQzqWQdkbCSQPA8XD8GT6mYBeQjR3fnKaLu+eGUTRZJ+t/X39RCv
	w6+3iWSq36F72kwE3CNPU0PfqsLdhFDcMeRFfPl+nN/KeDI/3VVC+oCraDxBe17k
	DNFXTQDtatXmyEWswDTq5Pg3BYiq/WlVxkk1M6Nd1/OaedPRDYjc2VX2E4371sm1
	A31o2yYBO4mvach4I2CKTwaPbOiE9N7KVsDL47ojmSmY9cP1DXz3xq1eq9buzlwr
	xlQ0Ew==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhggg99n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 13:29:03 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a651759a2so12639162b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 06:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784554142; x=1785158942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSAwREJ9fN+/n5hiVtWkjLEHl1v3XArrjXhPEVMyZvw=;
        b=LmzIRkB9QEhhYVolTZyA0BoO1e/KxyoaBHH6O0PfftbHX7PpVLST5I4edMIXWNDs40
         PGn+NT5fCSk6daAiEgOh0nuHfmWtQFYWEmltzDxngKw0J+q2fI8b2LZtIZ5k+WdltYJL
         CBTbkbY2JJabKtUltXYe+jkJquEeRKTFxlXFtfdOmlFuVf/SKNGNLmoi2sCuYqPfwPSG
         eMkkF4NZpYkJKZdaZ/mcc89zJHQOY7Nl1cODefU8z7R3k+esy87Hlafl6SVa5TpGvNj1
         lP1lalpBH1XTxQL4y0/GBxHf+98YqAWmDv3cu0NGIq4YopmAt/pOT1HyLZB/iF2VNsvY
         o1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784554142; x=1785158942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSAwREJ9fN+/n5hiVtWkjLEHl1v3XArrjXhPEVMyZvw=;
        b=Jo20lBBVZiRYC8ltkxkd7KQsVXOSdfjiqex662HAhi02P0jkA7CNiuMM7Q5MqKxVAz
         1VHzjqv/WFxDKRVsrFwZlrB5zcnxFcT0IYG3P230aI+xqYYoUQbRnHhg0QFy+pCFsu5f
         ahhxYVLgw4F8sTJ5gloorUuyxS9vqgqGiU2ZdVSYu1HhrruKsc8chZpEHyo12b1Ia8pH
         9DXq7knDPAcwdUS3hdjepWKPHC1lIpwr9w3Fs03F1goCq2kxpcmxIdOs0UACCO3w24rI
         fJgc3vBoGgREqlZDhLB9Ek/Im4xZnjUR+nBxzImgzuduYRX1twAyW600TiLuwz70Hk57
         AbOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHenoqiiIZAfq26yCE2R8lNez4VtNE6R9s5Z1+04tYAGPXtySF22thgCcPQwHabsF8lty/9+X3XhIT0yoREDL9@vger.kernel.org
X-Gm-Message-State: AOJu0Yztr8VEcxKuqZK96uvQ+SsNJ/Fop3Hggc7x6yAe23uC9GgI/Zye
	rE98LkBr4G8VDvYne0f644fLEo+9WX80Ee+eqmDPmOQ8mvFh5EIUYWnsL5G7IFn315ohdUYaIOt
	nxT+iMkCReGmf2BMDZvhic2yD2/EhYjvTv4NHnuqM6mnnRPyqwpbigFouPFgQwK/jmFwX0qRM
X-Gm-Gg: AfdE7cm37U6/32J/obg7KZE34o626y35axKzToBWbySedIVzlXlj490VR9F6xgFRlif
	WDiHQHoAE9N6mDOkqkp0HX5TY/ZBSUDmmnLq+dINlf3iiVThck/CoE1SQ9pPf4IynS2v4XTDSPS
	VtpFUVSZB+oHiQq5F+Ci9E3cqKhwEpqN4kygWKS3ZJbda01kWGYVp9OIjp6MkBjQixk9VHy66FS
	GS/3vASQxXYZVZfPZzMtq4Driuxb/Mmu1JIbdJTowCcH3F3UiVoLPQrYDX0n1FL0NKu863JmnoB
	jsRI4I6Xfcsa8dffbvYFPlWf5yR1JzUCgWEJJ97a4I9rVXSaihliUwp69/lGl87qmfrJTY2nS0M
	WymKjAmNVhlU9OpAmjqjg6FjNuz1gYYP7GSKtrIpVbU5cPX2hhAdp+O9pW1oGexcxFSuPI+s=
X-Received: by 2002:a05:6a00:3cd3:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-84c292b4922mr14094463b3a.18.1784554141879;
        Mon, 20 Jul 2026 06:29:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cd3:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-84c292b4922mr14094431b3a.18.1784554141294;
        Mon, 20 Jul 2026 06:29:01 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e3e0sm5628822b3a.43.2026.07.20.06.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:29:01 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:25:53 +0800
Subject: [PATCH v3 2/2] rpmsg: glink: smem: Validate FIFO indices before
 use
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-rpmsg-improvements-v3-2-e7b6070186bd@oss.qualcomm.com>
References: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
In-Reply-To: <20260720-rpmsg-improvements-v3-0-e7b6070186bd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784554132; l=3666;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=f1RJ74a76PW53KK+1xdt52Qum59vHAAPDpQ+wyRWZLE=;
 b=nCxSZFKsWJ+VWDLc/mo34bGZi2uJ8GrpAYX2ilml05yN9poLI9eKKjCiD1aUKcHmNoyq6aMFx
 jpA14otxz5/DOcou81CLBHLzFm1o1aw9YWc7aFX2UoKnXwWxBeN1Jxk
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-ORIG-GUID: Of8djjD-Capz3UzKDZPq9xwI7m01FGs0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfX9MTHE9I2ey7a
 i6UVlf0+6v5/FrPcQoCwcez9VkxrynxGE8QxhLWxT08NlApna3BERzs1FJ8FLkLx2Qny7LXFZ3U
 /BBsip8r5rIwTvTlAib/SKWuhKD3t/KTXN+OOUnWVYYJoQ94+amLpyoQ8GKOwFcutXKOAvQw4EM
 ypTUDJlssE3FtOzGLlUFRKK/XrcZj+lIKFrXSbvYGrvD+xYI+IMB29ZuAjvSJxN6LB1m/8S6pdY
 kyoaOPQ/irgC9Gn4zYDO3yASRWyDgFYZkmZmyQzhu9R7ehZdHw1Hdhm7Hu0Z8xs8T93GzNVMSUx
 AIXYOgkb0a22wyxVhXxbe0S2PXixmLNCROlDiFNPh1nOo7SkseMmfjsI4RlUdHjSAIoke89sjHx
 d2IVC0U5DTpNUPCBSQ4gcgitpseCOjXBw+4cRYnlDOg1G62WZ25VTP/9JC7GSJwSKF56C/nfLYn
 j3tB4fDtPKiLM0f83fw==
X-Authority-Analysis: v=2.4 cv=RPmD2Yi+ c=1 sm=1 tr=0 ts=6a5e229f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q5iom6PKYtt-AqbUL74A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Of8djjD-Capz3UzKDZPq9xwI7m01FGs0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1MCBTYWx0ZWRfXz7z5m1R1XZfJ
 ZA3eXbntYD97W7r15GjCwAr4sZRl7/EGMsoa055R65hEsyRmWgasZlwRu5PyQpBVklmWuQJcwd8
 ui8XGuCQWhTUaexKqGPb0EuYihwwRRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200150

The FIFO read/write helpers assume the head and tail indices stay within
[0, pipe->native.length) and use them directly as offsets into the
mapped FIFO region. If that invariant is ever broken, the subsequent
memcpy or memcpy_fromio would access memory outside the FIFO.

Validate the raw head and tail values (and, where applicable, the
caller-supplied offset/count) against pipe->native.length in the
avail/peek/write helpers. Checking the derived length or the
post-normalized index is not sufficient: two out-of-range indices can
still produce an in-range difference, and reducing a bad index modulo
the FIFO length hides the original invariant violation.

Fixes: caf989c350e8 ("rpmsg: glink: Introduce glink smem based transport")
Cc: stable@vger.kernel.org
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index edab912557ac..df3081855b02 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -85,6 +85,22 @@ static size_t glink_smem_rx_avail(struct qcom_glink_pipe *np)
 	head = le32_to_cpu(*pipe->head);
 	tail = le32_to_cpu(*pipe->tail);
 
+	/*
+	 * head is written by the remote peer via SMEM; tail is written
+	 * locally. Check the raw values, not a derived length: two
+	 * out-of-range indices can still produce an in-range difference,
+	 * and reducing a bad index modulo the FIFO length would hide the
+	 * invariant violation.
+	 */
+	if (unlikely(head >= pipe->native.length)) {
+		dev_warn_ratelimited(&smem->dev,
+				     "rx head out of range: head=%u length=%zu\n",
+				     head, pipe->native.length);
+		return 0;
+	}
+	if (WARN_ON_ONCE(tail >= pipe->native.length))
+		return 0;
+
 	if (head < tail)
 		return pipe->native.length - tail + head;
 	else
@@ -99,6 +115,11 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
 	u32 tail;
 
 	tail = le32_to_cpu(*pipe->tail);
+	if (WARN_ON_ONCE(tail >= pipe->native.length))
+		return;
+	if (WARN_ON_ONCE(offset + count > pipe->native.length))
+		return;
+
 	tail += offset;
 	if (tail >= pipe->native.length)
 		tail -= pipe->native.length;
@@ -129,6 +150,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
 static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
 {
 	struct glink_smem_pipe *pipe = to_smem_pipe(np);
+	struct qcom_glink_smem *smem = pipe->smem;
 	u32 head;
 	u32 tail;
 	u32 avail;
@@ -136,6 +158,19 @@ static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
 	head = le32_to_cpu(*pipe->head);
 	tail = le32_to_cpu(*pipe->tail);
 
+	/*
+	 * head is written locally; tail is written by the remote peer via
+	 * SMEM. Check the raw values, not a derived length.
+	 */
+	if (WARN_ON_ONCE(head >= pipe->native.length))
+		return 0;
+	if (unlikely(tail >= pipe->native.length)) {
+		dev_warn_ratelimited(&smem->dev,
+				     "tx tail out of range: tail=%u length=%zu\n",
+				     tail, pipe->native.length);
+		return 0;
+	}
+
 	if (tail <= head)
 		avail = pipe->native.length - head + tail;
 	else
@@ -177,6 +212,10 @@ static void glink_smem_tx_write(struct qcom_glink_pipe *glink_pipe,
 	unsigned int head;
 
 	head = le32_to_cpu(*pipe->head);
+	if (WARN_ON_ONCE(head >= pipe->native.length))
+		return;
+	if (WARN_ON_ONCE(hlen + dlen > pipe->native.length))
+		return;
 
 	head = glink_smem_tx_write_one(pipe, head, hdr, hlen);
 	head = glink_smem_tx_write_one(pipe, head, data, dlen);

-- 
2.34.1

