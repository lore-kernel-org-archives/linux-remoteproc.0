Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604463C141A
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751037; cv=none; b=iQbCk4dyn8eH6K3oITJGHFNNrIyZ5IzkERR6W79bO74VK2ZkBkkG0326ltJTNqOb59bha0jvVHc5vnGayRxcD4KMbHrscRQW0vzQe+EXwCLNqJGW9C3fXoV7H8f0M9MU1oXb3Im1fy8V69K0I2C15VA36ftWV4MKTrjRP1J1ol4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751037; c=relaxed/simple;
	bh=/LQ5g80XzsL/5CYAV3ISomhAgBWuAHns7jP627oUkDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FIKJwIaeulG4h3TREVShE3iYisae500I8x17L0d0RDaAElt4yaO19qz0UZ2SWnFMUByRB+mJaG9ph07eyWLjAAFuLxCjNy9XIs599YZynyCEDjHo9h5ij/snMKa3CyuFOttzRyJaHJ1PpSklPtLCP0q2Dft2VUx8a7v3siHtRhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbKAAK1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6Y6yPHb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbKAAK1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6Y6yPHb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H82EJa2314565
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 12:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=; b=FbKAAK1L3AL/kMQL
	f+JgJitK6FzWufXruPRpNmpR/N97YYfGYs+qhXsYzFWU/djN2twZJQc7qjiTnnBu
	qTt5/eNxB3b/2vLfotFc4Y7XuqM4fHblNM4eierINCK1B4jabTQSbKLsrurGjciZ
	7aGfFsUvNSX4w3U09s76lf6h6x0DvWhcuaPILTyPGruHE/f0kP2huBNEhON9uZjj
	gsdq3+4KSJiBHmo+66/zT8vLQqawfThkN3wqsjpcczFuFPKRoNwmgma/E8T0/rAE
	6VSigu2z1dUjkcakUvTmm5MFDPQuW9wFV/GvxZg0QGiyrhCJEYOSIH83YJBphHZm
	ukS20g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2bunm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 12:37:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd80c4965aso497214185a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Mar 2026 05:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751034; x=1774355834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=;
        b=V6Y6yPHbF7qZedlpzkE+jtJ4gX2vtiE4pPjiGjBrwX9OXXT817/uSlHQZcrP5Yep2u
         6y0QNqBod0zJTgFhua0Bs3R0U2c/u1hr4hEUhn5zofDKY7UegRSGG46SO9li/7qB4un9
         SvIFOKeNHCKAbSbKf0iFmzu/DPIeDHW3Hnx8YtsX7JEhZxxg08fPthVhlAszoktYFr9+
         y+WEOSVofxQRyFhl4/oXvrUcj5J69SG0IECoUz9ncx9wYSz3ShIxMgJuwPfBT5qSD08w
         XZ4omKn+/AlI/T180ynFeTkGM4MPbc6EzM7y0s1s/mIwqh19Bb/38i0yw71+UP3MSiTU
         dZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751034; x=1774355834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PcpTwB54irJqs240PvVV/4GT4ehMjn9PnMnfxN7sXBw=;
        b=FC6sikdAUoFpDOgFFfCaOY3O6cV8AD3Zap0+NSgxzg/0XND+heW1Bintu16wQX8gzq
         sSLB16YFqY30daL2NntlECQXkfTMqQm0jIMb1dy01nyiFN0/aaxvykaGeOU8fKuiigpr
         g39sauiJWW+O5CwoXYaQpWze+oDz8YCiouvqRskLA9IVi1vP0KGn7Jiw1gUtnbi59y5B
         OvS5UKpQEERyGkR3eJhmShKNM91sdpAqAM6pS2MOilyxwlU3RpkhQBNXTiOb0ThFm18a
         Yj7530DDDH6QkfuxMd/Rs8Cjsdq2adLvLZuPPus5QJ+7vbsFTS0a5LyIX3462qav900q
         DxqQ==
X-Gm-Message-State: AOJu0YwjAhA8vIMTeKIWSA+1LPz0rWFinDO+oXvJ1qckMnhN1de7/nC/
	xziVz7kHNlLjO3x6As0G8rg8caX2UCPe25tw3r9zyr5flR2DXhWpxEm7T/niVHsRkevmTqJ9T/y
	85mfp7eT/uuNdIEu/eFNtcpwfWro/k+ISF9fWmXySNaVLQsyZ1lJxG/TWjV+myUAFDWQSWKU+
X-Gm-Gg: ATEYQzyHu1/5f+pJ3FmPietzaRXMF5rtOTmNMXAiP9hr8925P6b1HL47h+1mTl808Qb
	aWUHX2LtdgnB5IbqE3+B5wMFG/to21IQOeyqwvM/00/TwBti/Cij1VVRPPCXWAhNKjmFTmXxNVd
	Fswdtl3HDU3/2zf83TWwWOzlJLT9nyKANj/6wWIjfSGhoVevncjrMArDQrGRa9/UEwDQUXbF5tX
	TOeBmpcCBVB30tUhlM9xr/pOG+BT6/HVMff2SoS+qjNQKZAqw133iv9DuKWJ6YGOs77IoMXVmN+
	OLKgSSrn9DtGu+QFn9PM8FjnlEWTIOmltEwySFOiQ/7ZLK/ZVGpADK7YEjN2ENECOQBNdG75MVL
	Cd77Xs5TeBYgoGqb+O3Kn64+3XSaKNiCZ74AIWsW+RRIQ
X-Received: by 2002:a05:620a:3710:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cde1313ac7mr379626485a.6.1773751033818;
        Tue, 17 Mar 2026 05:37:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:8cd:7833:7e3b with SMTP id af79cd13be357-8cde1313ac7mr379621885a.6.1773751033207;
        Tue, 17 Mar 2026 05:37:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:54 +0100
Subject: [PATCH v3 5/5] media: platform: mtk-mdp3: Constify buffer passed
 to mdp_vpu_sendmsg()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-5-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/LQ5g80XzsL/5CYAV3ISomhAgBWuAHns7jP627oUkDo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrqgmtdERuN3F27OHUmSHYeKw5e7+/d1vJYu
 lQtMLR4gguJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK6gAKCRDBN2bmhouD
 15jcD/4/Gi4pOzQo6bWmArEEKAEmKpSLeGaLTVR6yuNG8KwvwphE6E4w2Yi5wy5L4TV30U31R2I
 Cku6v9OjiaWcvGVp2wSSpAkv1HMyqXkUqKM3VHfhP6RHCCNEC8TLnAiGUnDmcYZ5niVVFzVmw8m
 v/1WQa9G1p2v/jzVM3WzKfga6U5SoFezZzU4cWQbM8mJUZUZVMjwaeLqLMyciB80jz8RDRSN24Y
 COQyhl/3m/c1wL8pNJDR8QkNDDJ1GdRmE/ege3JxLwdsVSez4uED0bXNsD53wFk9/9mC5uNOzZy
 3oFPRNIINZbspDiBrcbP8d9229ebKfUr9bndPzjyJbjoLLmHbcmghV90ZlFbO6Gs7b0YxYQW3lK
 VWc1iQJ4PKJ0ocO7WDxrztmD7MIHbH6IepDsz4MPOhFdalKDCrDXa0CfC2bSI1VFGFy2VFAxOBp
 8BGEJmqzGF4zhrXoSPG/6sIoRxAqlGYbCccADWHJClI5JBUqno7bmssBht1lTz7W3+Rs/5ILg1L
 zeQ9pis01EF8YVgyfAXkwrlU+HDue1nOXa21u1ELAm8sWnPWYD9AdR4W4TlYC2aktq5E9xaRTk1
 ZQ0zROlLiome5squwaqzQd3/PTC5FhHbuVFHq1nOwR7UoCDxw1FTX6zYgvjV4ALFXnkbevg3mZC
 Dr9djLjyQVcSO2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: zKcpz0NEi7Uaz7vrzeIuTNeoa8UPV91A
X-Proofpoint-GUID: zKcpz0NEi7Uaz7vrzeIuTNeoa8UPV91A
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b94afa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=lY2TEL3CVMzQJMwj26oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX2l90oJR4204E
 EtYrUrDgi8Y0Z29SiHwCXre2+/ftPwfNmxx1EgdX1fc2AMYybw8CFXuqR4DQh9HB91sBB6G9bbi
 7ygozbUkk48zjwrCkvJLGtbwA+uygjUQBQHM7pGIX4kYSUnZ1L9x1vPc82+VxUdGfNxz5HB0pDD
 Hi6MqisGc345FGeU1Z6xfhTz6mwpeFYCUwIa/NyY/WEjnlRtxNBqaROdrspIWRKD12YyvraOBTZ
 ONRNX6g0FNdAKeRAk+Jda0LqqastBkUX40Booi2PwBneZDwbkzKFFYXTrUq+I+prLyRTh6xD6RA
 IxF6VaP28d2bD8nfw5Ropgftkbz1itM7MG+zujCoMa9wmuht4EjMKnw7DcKDLQY2xeLBqr3TF4i
 NQXQwAmmpNKAuq3FDGbkfxEpqEL4lMGJVCtjcZ1zAhxLStqZdwelNVi1feNZxpMv9ySd0k+8gaV
 9xFypTFtLSGBwxteJ1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170111

mdp_vpu_sendmsg() passes the buffer to scp_ipi_send(), which takes now
pointer to const, so adjust this interface as well for increased code
safety and code readability.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index fae3e1ad2df7..67f3001153ae 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -163,7 +163,7 @@ void mdp_vpu_unregister(struct mdp_dev *mdp)
 }
 
 static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum scp_ipi_id id,
-			   void *buf, unsigned int len)
+			   const void *buf, unsigned int len)
 {
 	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	unsigned int t = MDP_VPU_MESSAGE_TIMEOUT;

-- 
2.51.0

