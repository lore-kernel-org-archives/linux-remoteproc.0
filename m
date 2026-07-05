Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3032E06EF
	for <linux-remoteproc@vger.kernel.org>; Sun,  5 Jul 2026 17:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783272244; cv=none; b=LcB2BtoTsjzEfjBqQys4ypuR5/mlUkCly7y3zoOXrAvXQkTBt2NAAJzsdbEOb5hKxtBs9WmNgNFeebZUuXaiSXzTtld8eMgPNdQBwKCoPRhgpwRcDpq9OfrMUmgh6xMJwkVRaE9sWN+11s3jdxj8UoKTjxkduauSDe04t9NXqo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783272244; c=relaxed/simple;
	bh=CE4RgFi7DQqHKh+A/BGmao1lXaIkDK/a7nnFbyrpkH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bv5PZHQZ9aJMeVOZOVVFh2JLHpjdkQ392H3rqwSfGnLLH03rscecKgPfxlJUihNjEH5MEMJNLfFuMkvFxoR2frksenOhbPw3CTQXkOc6TLACC2plq6bj1hqf5MEHkRSz3qDQCHp9zVRhqFqvOIsBjTQzojFJtRGuDczwBotCUsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F/dk8w2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZqq7djc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/dk8w2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZqq7djc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664KYQdZ3831707
	for <linux-remoteproc@vger.kernel.org>; Sun, 5 Jul 2026 17:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0RLSEMgtqrZ/Zkor9I7/hWBvWIfkRUPYRUZ
	trPM4IbM=; b=F/dk8w2VUJaBZF/Ozzj8hInsFGnw3ZHs6j9Gc+HUZYOW2n3v1bu
	E46+6wLDBmUcgFHXzcN9vAbK2iIRChvOv6E5f0GwBAgj9UhZN16hgnlxNmeBDJ9G
	jxwXQ6K3LSqj7XBhvGBjOvLRqDa3UG8bEu1ZHP9so+V3BZkRImJp3iy7NYAeGxp5
	cNxPgNyE3q7oyiZCs7NM0crwG8lcJYmiR/iZeU44BFZbPS3eljO+O2zPqUp0yuWj
	vjGFlTktFhoiTJhL9LOl5Vj7o0ci3nZp09vkMdVahigw0yQu8BKCmzWKxkpHkYLU
	KDjgmSwNK+kxJCjmBpiyDZCzJzycAIozFUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txek0mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 17:24:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ea24a2db9so116205585a.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 05 Jul 2026 10:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783272242; x=1783877042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0RLSEMgtqrZ/Zkor9I7/hWBvWIfkRUPYRUZtrPM4IbM=;
        b=GZqq7djcTgkS28C/wgns/9XlPUtVwH7+793PF1eLP0IR7Yv/uvlKknUAtG+8UrXo/R
         T6U7jv1YG4QdeDJpUWPvlywcgJKlccNomweeyzrfKYhzzULfPWWT3ZKsJpJ4tRxQoGcn
         DLpIoyi2iwrksIma5y/If6H83vpugdqdLmg2ck4a1elaFSrNMp55ZQdV5mQON4irKt+9
         siLmFweJx1QwxtX0ajSiuXDYNBbnwY9KBIYsUpnBWKsyCKbJbmsakBTg9tWwAgV7iCmz
         KoGsLOpXOmweWpRvOJd+00zfdvDGczL0Gm9Q3H7pz2RfLf/Wpd89f1ZZOZobWdP4mCxI
         aIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783272242; x=1783877042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RLSEMgtqrZ/Zkor9I7/hWBvWIfkRUPYRUZtrPM4IbM=;
        b=N7ExmRyujiAcxz8RHRHtre2MB2dGGte5khAZiOAzcXpGejn17dGR+Upm0lGN9yclUh
         ik8RUjKUmKy1+PspQFCBv/iWjemnFUFFoIeYUa+716aR6E32gAUWQPGv9CU+lWjIEaLn
         EcGw4pPKnhSOC0ip/mv15cGRqFi/22IlUjGkqyiWIblt1WCxRNa0ndvPnh7/xrOWMaQ2
         8M61wHCoJ4h8vWk+JmU9bhsKpDwZkqsnWZiVKN+iHRCKGEOTLbsoQVFkF1jnEPEXvWHp
         LlubbjrFK+n4WKww/sgYgpPDOI2iS8esRMX2jL10FQvpMJUd+yEisrLKZNr8nCf5bEgs
         0EQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDsK1KalHspLz6zoJZLquB6xlyNDlPNwfww4EAxWiyr5rzUU6biZJNQKSSl52cngG0eeQvEaaoO0Ey/XOPD3ip@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7f/0uC60YXHxuFKGn7vKKn67W/bHoBJQfCCcLfs3L69A9Q6md
	pifBScSM5g1BeC8DZM3pLcGx5XYCOpwO7NlG65g46+ZzncQKBD5INZeEpMg9rct82fTPzmHpCPG
	OziZjjwasA7ZjMsZuEX6yjVB+hBHVFanjwmbL07yXVo5ElfwF1UhlLrdPZsbASNyYEjuch2Ys
X-Gm-Gg: AfdE7cn/speglDUqMbKO05FhFed0hjMB/TNTXZguB3KmwCnst4CXcAHkS0Oni/OtbPR
	Qc5MltDPkqni2qes6/75IQk6yuaJGw/kxOqUISJbY4yDDSO1jQWMIUa5IN7g9GcgNNpdplN4xsO
	RttGbWLzltIbbEH4yvOVMde4s5SNUEGi5VbBY1LDbFOPhgWMzqHN7KMG7ODlN01825x/AYsuDFw
	qBjKbjwDRvJPl66PRwKyXyJdMh2lnI/t8RE/Z5kPXcFsvKygHkfR7aI9ZcYfVR06jpOy1sYQBm8
	LpkE3m2cHHa4pptirDibT0AB78PdS3bdGhZis6ZcfcyNciGaR3u7yrRMpRJdSvxytDF+2WSJsR9
	v05iCVKtDzu3IbzEyHLf2KpbUPUI=
X-Received: by 2002:a05:620a:1999:b0:92b:67e6:4b66 with SMTP id af79cd13be357-92e9a4f7f4emr969811885a.61.1783272241913;
        Sun, 05 Jul 2026 10:24:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1999:b0:92b:67e6:4b66 with SMTP id af79cd13be357-92e9a4f7f4emr969788285a.61.1783272237275;
        Sun, 05 Jul 2026 10:23:57 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm19436887f8f.7.2026.07.05.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 10:23:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] remoteproc: ti_k3_r5: Drop redundant NULL check on reset control get
Date: Sun,  5 Jul 2026 19:23:54 +0200
Message-ID: <20260705172353.119031-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=CE4RgFi7DQqHKh+A/BGmao1lXaIkDK/a7nnFbyrpkH0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqSpMpXxN+AniluNu90oDhsBO8jvDzr6CNYFd7a
 HhHEUuYchaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakqTKQAKCRDBN2bmhouD
 19zAD/9IT3pfU+o6AAt7McpJ2ppFTI4xN5qbEOnxWmKrwlXPkgpf0MzuTSCTX6PN5sGw3JSg+5l
 02P4lel4f9WVMvQCagS5xSUp+jiQpuwXwIeJpyiZwm+bfsO2OTvtzP8tfYuhtMh2aAUIjFpeDrp
 S5L/pyHoYjYk9iB2CG9wL47HSyP7BsS3yil9HvOaovC9OmCP481yx6pYnhruQd0ESouXPgBlV4p
 JjpGOgOhRYMdPyLB+J0xgoDew22ws8Gl2vvvY0QafMh4hS6FnbpjrFqupEI5tX0IrA/HvOWDEhJ
 eozt+nGe1w1rzUWDUUTZ8TNl+Qv/mMWO221I5T21eypM/zxgqfC96djrZQEZHUcoaQLtVFSrp0t
 6XB+lq5LL5esXVrY215A7TZ2B7dt/+7pTiyVdV5w/iE88T+Xqd0w1u4mOqnouzb5/2APr66iEFj
 aZoFy7Nf0Ss3JZ8Gn9L6h4TYAyFUkqEjn8KRcffEdAgEFst/4Nq/ovxI68aAUiMk7xEHtrXGidt
 CegLnwp9DhynqCh8sDREHFmVSVkg4Jab0AkUZQWbHXKfXSsfxeUaEoIUM0AM4T99ky14hf2G3d3
 AiZLKkUFzssP221Ny6Ts+JHVzXnIYfjOkYdI0iu9KLOT80kbaRk+8lU8IWO7gNXn6yNU3/m8Pl3 /XL3BsBl0B+HA5A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX9l3iawpPrloE
 qvhhoTaBo5y8JLDlEbiUL7P5X+mYjk29Q8T8fUMSW+5irBRWXkiH9eM8kNNbycGSfxEiqsYnRlv
 8EC3rx0t5eCd61qdXsZ/tpW0ELb2+84=
X-Proofpoint-GUID: x2vYbqg_zoknUVmfZ-EKKRFXmOTJvOZq
X-Proofpoint-ORIG-GUID: x2vYbqg_zoknUVmfZ-EKKRFXmOTJvOZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDE4NyBTYWx0ZWRfX/QlCLBi8GOcU
 zmtdJxVmRy/UpmGukGuESIG2bLLt8yg22nWcPVfI73QvMgCmfXfGNtQr08tdOYtxDezgUdIBzJh
 HURNW3eUa6HD0L3aM9W8TQhwDkEUZxjFzq/U1g5ogEzMnRNr0znwdwl495MYwY0e9t4v+eXPP0R
 oYYn1y+xkv4/f1IeZCKdnsDI3YWmLXvtPp5AqmpMkCbODZTAop7jPUX8USyCH4JST61hiwU8sc5
 4fsZoMTZbwXOCFMdlFERPGbhQ3DaMvU3nhv5uwSywp5KRr2j6Q2Msrb3pPTQOHxH5iD1kiR4JDf
 Om/gDwzCpr7r69WszmRXbjivbXmyv0OzIqK1q2gye8tt7sRyqRf9UU7bN7XrRWb5env5Yepjpbu
 8mH+FhmIVSxgHLnb+psFP/XwR6MUnWDK7XgOyIeQ/dSaz6P1K2Ct5bM7RxPsRy1Rp/swH/C/8XH
 wb0ZaHB/Klv2XcCLc+A==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a9332 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=-_U2nvDm71-hBeOAev8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050187

devm_reset_control_get_exclusive() does not return NULL (only valid
clock or ERR pointer in case for non-optional get), so simplify the code
to drop redundant IS_ERR_OR_NULL().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 04f23295ffc1..b1d04d082e44 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1074,11 +1074,9 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 		}
 
 		kproc->reset = devm_reset_control_get_exclusive(cdev, NULL);
-		if (IS_ERR_OR_NULL(kproc->reset)) {
-			ret = PTR_ERR_OR_ZERO(kproc->reset);
-			if (!ret)
-				ret = -ENODEV;
-			dev_err_probe(cdev, ret, "failed to get reset handle\n");
+		if (IS_ERR(kproc->reset)) {
+			ret = dev_err_probe(cdev, PTR_ERR(kproc->reset),
+					    "failed to get reset handle\n");
 			goto out;
 		}
 
-- 
2.53.0

