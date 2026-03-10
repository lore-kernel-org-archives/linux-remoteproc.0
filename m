Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1116D38946E
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141774; cv=none; b=YusLiQ2gJNCm4wZWgzyprS7fBUOGN4rmTGfGlN+LldXPtMKHUSBF5ENgtvUP5l9mRpJuqu90mDnBLE4WX2EeO4/Jud9cofY0SEdRM5I6DTqvakzdYYb6bsuYyfGcn1fqmhupC9M0qyh3FZYhOyWk1W6XOhE+qf8eCeqLe9pgjRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141774; c=relaxed/simple;
	bh=MhZZXUyWfb59oILbyPbh6LcS50AAaVQ8Jux1XwFcQ8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmj7NvqBL4VPgvU8KAoxnDn5DLfOfzRN4toWXXosGL0q5/oFqatkeBoVQ4gjUOAErOZYLrMe2tFl21PY+ql0fsPQ3GyTHnRjWpcJFTK67LtlW/yrVtjwYcTbAfjGqqdOZvK4F/ryZKxmPnVOTGyqBKY+h72M4Qtsow9kXiWx774=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ku1uPC/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NG59ZxKF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ku1uPC/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NG59ZxKF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A98eww2363765
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIgDdQSPHHbW/xDZMWuKTK+oRBDbO81ulYdAvMxwVv4=; b=Ku1uPC/IZy5e02N6
	j0heH1khlSjCw6iao/7RiS/0xxvM0oA7s9rjq+PgLKv+MtnS0j8T68outou4DNJH
	kuVceTvx+0FXeHgCwD204top+wTclk0G7mp7/zKtEF5W140RvXkHmJQsgtwsOlAu
	wW+beES46aAYKxQFudoiZEPcbn4UTYE7VYMRfpB9DWnJ+1Y1p1q7LWY3IfnxwBy4
	5igK1pRpKs0DJluSIriODadG2wqCk4QObhwheFLzsL4l9wlYNyjjs8qg+x1cQnwJ
	HVz0NDJWs+3V8tLLdp3cCOgRvlD/izSRTwfvP6jIvVAAGfRvLrziIEY/Mla7sSQN
	VsgdMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct032byh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091782ab06so7351421cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141770; x=1773746570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIgDdQSPHHbW/xDZMWuKTK+oRBDbO81ulYdAvMxwVv4=;
        b=NG59ZxKFdNxco5+Y/u4on/4Hxu4Q7Zj+Z79FzJrBEJeGewdG3PIbePf6JOKv8vPp29
         jGcpMsAo6HDu5ALzZR1K37CWca87kHljOqKP3+8ZREWgJJwmayBSWpoTkeQUW9fZ2rrd
         8jdjn9vgXt60/294+pzZfIBlwbGt9R/bKzE+zXxcJ17VwXbILvshxaR/ywDlsaynBhSA
         rHImPmVPG8iExStMYBs91DIC2+IQH5Z5YpuX6d9QPunMV+pRlArDdY1mHtcolc30sLmV
         gsBdlrKgR/oZfEPR9grkw3UTZrivauAFB6B+n4z70KUn61C/qfTQ1ilg8S0g6EpPw1lN
         VggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141770; x=1773746570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oIgDdQSPHHbW/xDZMWuKTK+oRBDbO81ulYdAvMxwVv4=;
        b=j83+1FS8TwBAY2JiyhdntOFmMgHW8qAuaBoKwJea5mWFQNnyH5UB9sRTb4JCsUwVnW
         4Jx2fwGoHFggibNBrQbUaDnRNWxc7ZNQS9bOMbzLi7x24Mly5aKJlpaPK+AzaK09V/G3
         E3UcuZ4gYxmborUDAUzfrDwtq873DYEnpqFDG0j+GAtvA91FhFUqz/p8/ziBwZ9PlOYV
         rUME3QZv/4zdfMDE3QalcNGsqJITanTHwQeRfbLJi28kasyQo358fpD54SBf1lTSGHcy
         Cm5nnT0SjhdPc9JPv9z4lnUHlf0GdobJlu9FPzZVIE9+RTERWNfOCP/lE9qfoUhlqx2U
         7G2w==
X-Gm-Message-State: AOJu0Yzqs7x49/0O2ypIcATCeoZQJIJKLpeeqPWU9pErIJ/vVANYcBrk
	o+OVHwLg0OWdnCd5PtMJD9/iz68COH8mK6M2Wx6ASWw2rWLRbP9MG5PDpDmFWIPpH/hhwnUmnHL
	ONld2gKc1VCYkuGtRT5xP60WQDF8kp+9uI6qytGyn9eyhDjOh2doTlp/D6WXcUWDJpa+rlflI
X-Gm-Gg: ATEYQzxOSGLmQrKvqjbdMusRrx314Dh2mBuwzsbbktg4p0G/LC325CnL68Jda6CN4St
	RuPUkXwyhS3a/viQ0CynFs2qqb3dB3Z0xDJxHvDcNPtMZ8r7rN6URpBMrHdOcdieJHPE+AWLSxV
	llj9FzTyJMlZHoAxmaK4oynyUz7QG+4iSMGppIYv6wjIdogqMZv0hRirv2i6CbZ+kfZhrMExH6B
	W+b+IbipwLLv62FF9arGZcUoW66t1TS42iwSORaCktT/xnneZE2LkA43s8qtPtEVu6c4k5grlq/
	xWj968/51jhmjf0cdNWJQDPhnw6sRajJMQ+DfRZZzSVsVSpxy0+MVG2aOZkjtg9F8LRCgRO6qH/
	SSTjwGwA7oSu5bRxVGd//+CCBgPB5Y3VDyDKfCEkGPwqQ
X-Received: by 2002:a05:620a:318d:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cd6d3eaf48mr1956314185a.6.1773141770383;
        Tue, 10 Mar 2026 04:22:50 -0700 (PDT)
X-Received: by 2002:a05:620a:318d:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cd6d3eaf48mr1956311185a.6.1773141769971;
        Tue, 10 Mar 2026 04:22:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:36 +0100
Subject: [PATCH v2 2/5] remoteproc: mtp_scp: Constify buffer passed to
 scp_send_ipi()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-2-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
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
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MhZZXUyWfb59oILbyPbh6LcS50AAaVQ8Jux1XwFcQ8g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/7/GykfeN06ugvQtQkoDM6PNcDwvBeH+8Dt3
 FPaTV7303CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/wAKCRDBN2bmhouD
 1+InD/9J+1xEG6CF2PZMGQySQThP0VZ7hQUI/UT72YfGzryRehuNMY/eZ31woOO2Vu0a0gVzdkV
 efLQ5HCw042qUk5q9JJSAGuRt0G6tBH4bZzi5ZoyTgythpFc/MdY2HF/A/CwoHyYzqBafD+TYRl
 K6F9tzJ3lvA45lkSkeDNKkBgXmR5ZS2Car2ShwTUaoflGU7Neyz8c0bd2sD5u0uQwZwxDgsGOzf
 2uM3gRe8DRSav8N/zQQjnMbr8ous8IxoN5D1QFHpzrWCuFlI/J3Ce52B+rkkXREtuDBq2iN8RHA
 n/LsgVhHbe4oP0X8J8cXyBPaYTUQKcx3Fbq9bemyxVaFEa5ZXEih5L8HMAhb6V35QwAHsAkZ6x4
 HbcS3uUX8az6sMR16tNZ9oHOc3fVHGlcAtub0mGwbi4l6Po69aRWa7nu8MDYjpkyPZzaeBL4W/H
 +40L3j0GFuqbARddLEwBoSs3i5VOHmEm8o4UfLWsmd1lr6dP1hOQVAzo/8tJXiKglh//taqgDRH
 EdigPxJ9TOu/Ey3ozVyP1agqBCvyFJUcDys3Q13/ESZezgipDuHYeSRKv/ahAI5h2pm3NKEJ2Vb
 sM3s8JvQ6bM6k04yN0bb2tR+bej1HZfVaiZCBcRsSYyyKRlW0Q/VXtYMIE+eGInWKVMZOj+DPMW
 xxExYfX+Hg9hlGQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfXywHNi31VJb9a
 2OVqm5CB+eiGC0x8DQMIz/3cJJyuSdudsuX7xoH6JKcfHOx3Xugvk7scBzwrE3dE+IMTWfxPC5X
 6E5qY4Bnga+/UUtupCs44d8zW9klumeRKCSTtW56tBEMPH1uCYbBZY8zXtmVndskdpOycAVhFZt
 6AwLIIF76cgzHpdP58bBbeB9OXta3+u3hpBLqO6Ip0XUWe9L/VdXsbegCfQ4ZSTZzdYviYsv3lw
 ebIA9YcOGiCa4YVxc5iQqFOIO6cliEnqbfMLLOC/bY760IE9ohkxB6cv5v/IB8yAXUVG63m443M
 DWCKj2L+wWGBBPjbGxZPbGeV7k/T6zO8pS2P2zyJaxiRtb0R5yyFGBwJj24n6ySa3x5GQ72783c
 HyIeNlnRZ/1SimuvoW19L3aE8Ur2Lt75/hPhfkwp7+Ii3cMuK9oUIQ3+ySKzVTDF7F0W52/Dbq+
 Y45r+0uXhXlEqRPQrqg==
X-Proofpoint-ORIG-GUID: ISzkje-lRqTVzqRtpsg0GS7cR1N2eG8m
X-Proofpoint-GUID: ISzkje-lRqTVzqRtpsg0GS7cR1N2eG8m
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69afff0b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098

scp_send_ipi() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp.c    | 2 +-
 include/linux/rpmsg/mtk_rpmsg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index bb6f6a16d895..85a74c9ec521 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1078,7 +1078,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
 	scp_ipi_unregister(scp, id);
 }
 
-static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
+static int scp_send_ipi(struct platform_device *pdev, u32 id, const void *buf,
 			unsigned int len, unsigned int wait)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rpmsg.h
index 363b60178040..badcbc89917f 100644
--- a/include/linux/rpmsg/mtk_rpmsg.h
+++ b/include/linux/rpmsg/mtk_rpmsg.h
@@ -25,7 +25,7 @@ struct mtk_rpmsg_info {
 			    ipi_handler_t handler, void *priv);
 	void (*unregister_ipi)(struct platform_device *pdev, u32 id);
 	int (*send_ipi)(struct platform_device *pdev, u32 id,
-			void *buf, unsigned int len, unsigned int wait);
+			const void *buf, unsigned int len, unsigned int wait);
 	int ns_ipi_id;
 };
 

-- 
2.51.0

