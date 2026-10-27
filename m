Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102496;
	b=wYrhdl594sLmQhgBXXv/N0S//gJSgLkh16ehTIwoD6eu1wEllZBanWAS9Hmr/c8GLJ79
	 32ap4qTVYBHb70NH2zX/GMuBBQ6EJ1QgdAlaXiQH+byVK0qa08Uv/2wMY+jb8moUHaq5A
	 GNKgD/uQAUXT+6Vuw8OHYnrQielWu6mDk4ee7mQt7NQ7zhggQCTjW7wymtS8y6mW+yGhj
	 Vvia+1xt3Caq5d1o8r+4WtK+XwHyGd3MDav8hnE1Uhe/omf9e7S1x6GQGItMDOJFZsrpS
	 D3DmvgQzY06NBhJap1R8W/g05/6vwOPB/oW2xM3Vc4zcWeNgOj/1hOwXx/STD0665MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KNE237mj1MNRlMgpVoOvUADUwZrvTfIRUQM33z2ltSI=;
	b=X7yyTptFqImqzV8L01lOfp7mm4eopPwEt037m7izwCoix7HXi2wVnaf/0RJtI6z++DLC
	 +Mf2hmXKOpD5eJiBMPomMMKXEATHqQSyELD1lXUdkKOsxp4cuWDvBMLTFqdh3dC0ref2I
	 e2p7mSADgl43OzSUc13k6J4kBnuNKJhiOVQzjush2owNVzJvrror6rk3jYASEZ70D+DmR
	 ffP6mETTndgQhHPu7ZtCN9Mnok8ZEhLwNmtK7H+ijuh0H3MyUjaSxWOownx8oIWhGXc4C
	 Zcorrqwqjc0noTMVIaj8JBD89rpW5PL1ES2HEn4jIjiR9H5ncjSn2Q8z453y2PdSXJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3jL96oI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L06dpYr7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D11E60A263D
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 12:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D11E60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3jL96oI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L06dpYr7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsBn1921592
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 12:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KNE237mj1MNRlMgpVoOvUA
	DUwZrvTfIRUQM33z2ltSI=; b=a3jL96oIYi1MaDo2m07xgWy3ARXVIdcyH/IIHt
	xQX0JYNGBw0v6ChJnqI+0gMJcR3IfDzt6VlfelqZDY7meh6fcSfC2946WrDoaMlC
	foAOhZrevvo446fAl0owCfsTfQ4FhDDS/R5HYRmFeGLn/vn1O3R0pZ1WG1MSN+Gf
	Ul1NQX+0Mu14mu2VZ1mxAbzvk1hrTmkv1EjXC1qoZWMxbCBOZKFzMy1SQFN4TZM/
	S2PcIzu7k62KtqA9gKV33WzAalXxV+sIUI91vi9ds+qyLKUZ4kBL5HOMNF3/dkji
	OoCkbxWZrqadoauKWSkCcdX03LoN42RO8bnvr+zxw2/asd+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68r2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 12:01:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso2236594a91.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102493; x=1793707293; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KNE237mj1MNRlMgpVoOvUADUwZrvTfIRUQM33z2ltSI=;
        b=L06dpYr7LFRtIeZjBUpo5NPFejxkBo+52M3CazyafIkUsdZukuJ1pDh9d9gW/Y8rCn
         WtJZ7DFYYBEJg5C3jqO/voFvEIGtmZo/kliVslmPvy6fO3LqBws4L85HWmqdlNE7syZg
         hliN5z0MqHOOLvaNz5vVjd/NOqq4xN5FwVwqw0m6Sioa8KMRPpzcp1fHcFukG5fVCgyV
         ez3g0PJBF6c6aliSjIUQCxFy73TlmNpDFPIjempLI56FRCwtj2xEIxseMuohrjjvda88
         VYABJosRIL57tyxXWezNFx774+hSUaXgpqT1IBpsPTe3fpTtnBaxqJ+VKRliZ0mbOSLg
         ZggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102493; x=1793707293;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KNE237mj1MNRlMgpVoOvUADUwZrvTfIRUQM33z2ltSI=;
        b=AQhRZCXHK6WRIjwa7vHwObVmZTEdGrtKATGoVZQNXMEFpPqmGHEQeMsz8YY2x0vmwg
         jrx/B1HFnlCz8whk2G6ss9qxAcpDL/rLH0XktkK/hjYngpY2Fep1Y3JWZZSJFmYkTAdu
         2idrmCrjvCcm0hdPCogKpfDii/fPFccNmWaiSb+VFAwBfbrEZsm4l9PCDGe+vb+UcPSZ
         abdwzkPHlHOSq0i+d9ZCXPAISVH+DnTBZF2AiLpDumz2XjWNM1Kp/yN+sBTFjsXdbQwg
         l/4QSbnR9tiRExiNV/QavXXXSD0fR7oI46LGon+qYNi6tX7PBdaEYLmd2UKkJOq4Mc63
         qJ+A==
X-Forwarded-Encrypted: i=1; AKwUvBxFHp+YusXmSrFWH2BMUydmDuzQHirBjqb/Z7KXOuUHhvPX6LWxNGMcMXWvN10y0XASlGIQJ92GNySs2yGWIBXZ@vger.kernel.org
X-Gm-Message-State: AFq9FYJgqq99hyEdmgtm5GuMKTBPJoNVbhecLhum3VVIcGRBy2XuLRtF
	JhbsAn7WwDqbXWYKySoZimhtnjwwW9rOqIVjbM3gxu/07L0woo0o0G73Z3OIa6WANECtigLldlL
	OCBWsMblQsnsySRWpZiJ5DYfuTPivSWMn5jvbjd14ZeVHxmWj8ctsXUdZlDLJoqMAzAA8/134
X-Gm-Gg: AYBFou21OAz/4Trjc7RWqCLFkkaVpGoiDVa+oaSMkxjRUZNc6QDsZe2v0xJLTBXhb4p
	9a1rnWcUCUJQwQnDZ3KCEmk/Aj7CFQMOjZd2Zo/nWc2+qix41Zx9GCjggamiuogQv8QZ5L+5ovH
	95mC9n0ZGIiSvOfAUj3Hci2gsdrkoR2ihJJqMOnmH1JmB2p4zWx9h6MUbMf7qX1YGjM/rlWuGTa
	CGD9ylxIMpJMpnrEcFO8Yt9tTU7iyz0gTgr9ePe37KatOApfVzTXy693dvilW49ivyhY2zFqMvp
	/BCZQF0SCZOmHa8n+QG9PCQ3qH6bWUcFuWyPvs0vqGQtINA96lVIAd2icB3a2pRes6cv51MCpGe
	ndyAqjdbr8OqI1LeErVcxYaHbxnNqEgSCeRs4lUPqouRIRRA4XwO7/wuOGTBcSxCkstODbCoW4+
	7PATrhCHWXgA==
X-Received: by 2002:a17:90b:4cd1:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3adead44808mr7390175a91.18.1793102492924;
        Tue, 27 Oct 2026 05:01:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd1:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3adead44808mr7390113a91.18.1793102491931;
        Tue, 27 Oct 2026 05:01:31 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40651560sm3672037a91.13.2026.10.27.05.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:28 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:31:22 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Fix proxy regulator array
 overflow
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-b4-q6v5_mss_proxy_regs-v1-1-6c5557e42462@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJGS4GoC/yXMQQqDMBBA0avIrBsYQ422VyklaBx1ClU7U8Ui3
 r1Rl2/x/wpKwqRwT1YQmll56CPSSwKhK/uWDNfRYNG6FG1uqqv5uDnzb1U/yrD8vFCrxtZ5gQH
 xlgUHMR6FGl6O8eN5WqfqReG732Db/rMFwYp6AAAA
X-Change-ID: 20261027-b4-q6v5_mss_proxy_regs-2d780c0095c6
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Luca Weiss <luca@lucaweiss.eu>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793102485; l=1400;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=TJzPJNVsxPFGtMeNzrXT5vOZP2+aBDhH2ctGaurMUUQ=;
 b=jWhUUIWporDqHDdpejnELQLUFf//pLhMvR5mqllgDSbaBgGClVK1s9ny5BdYA/5+aFfwP3LRm
 Xa0GRyOmqItDfaSCSQir1BbZzqlMbnA1+IB1FOZXkP3Db40jTkQdbTY
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0929e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=isYqYfF-chSf2xzEknkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: cBlZ9WtV6idFo6iDKhAWJF_eWcYPL_fL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX+ClOL1+0wd/+
 svnKhocDtI/rL0ZAfFdTzafAZDN2Yup2cbjbpvGuAF7rptK6P9+e8dhKVPZeIBvE3vJo6sx9BgF
 Wh0mmtLGynblB1wxOYnwkw5kBOrmNSE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfXy3pfwrxRbmzM
 AtyIgV1zOtH/MPVJ+V1+B0Fz93rQHZ64ZLoRa6uhUEP0w/q6Hvuzfto4sjAL4swQsirmqQEBT2C
 uyI0HGl6pQnUYkwCcKVIfMJ6EEKMppy4fRfJmSVJpyPrf19vcsYE6Rp1ush0Q8jbHCdOkzTRM9H
 C5HdysTt17kxLbAb4/Z/vUzC/M/3E93TJ3BExOcdNaEjzDzCKNSkTJB5QRhryvuGOIUdsxZaJE5
 QiSqC4E9jDUFYHcGUDSTspe94KO13k9FDzW0PlRvAtwuTxWwrtZPQPnAis0jEyhK5eyK/HaD3Xd
 XA1uM+rkUbL5WeZWvWc+OLAMjYqw9ciJsGxP+wo83gaTnlz+T1SHRz/9utXOcEtgRTR/OLClzQ4
 6OTXbe60yHalDmXQwURBzXENsh6Shf3zl3RL49Rjqzptz5jtb+4WtZUo5eJ1fNNL7GI49bheKoW
 XsXJAcY+0gY7Qavsy2A==
X-Proofpoint-ORIG-GUID: cBlZ9WtV6idFo6iDKhAWJF_eWcYPL_fL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

The proxy supply tables of msm8974, msm8226 and msm8926 list two
regulators (pll and mx), but proxy_regs[] has room for one. The second
entry written by q6v5_regulator_init() lands in fallback_proxy_regs[0].

On msm8974 with a device tree that has no cx power domain, the
fallback table then overwrites that entry with cx, so mx is never
enabled and cx is enabled twice.

Make proxy_regs[] large enough for the largest proxy supply table.

Fixes: 4641840341f3 ("remoteproc: qcom_q6v5_mss: Handle platforms with one power domain")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..7dea3bad9f5d 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -216,7 +216,7 @@ struct q6v5 {
 	int proxy_pd_count;
 
 	struct reg_info active_regs[1];
-	struct reg_info proxy_regs[1];
+	struct reg_info proxy_regs[2];
 	struct reg_info fallback_proxy_regs[2];
 	int active_reg_count;
 	int proxy_reg_count;

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261027-b4-q6v5_mss_proxy_regs-2d780c0095c6

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

