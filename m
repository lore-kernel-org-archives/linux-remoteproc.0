Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EEF38A73B
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141778; cv=none; b=o5AXp77LnZExjYIFG1lyKFeD0rtDbaeb5ekEiG/h/I1FisCMlVvdqZC+kMtKB6xOuTxgLS/IW6v3czuMJ+RT0EjNIQEmgwc0HTsyoJpSFEWla3zAjEQNCBbexEhU0kxZGyy+IHF1iwhoR2F9FvzvKzSk+1s0ppocNtXx3tl909k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141778; c=relaxed/simple;
	bh=ObSXKiR97buxky/PvKOJ1j+VJH8Bidr34n3hBEMA+cI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+gNDVq+68GlNEZqvcrO5wT2V6fEW6gvlcS9hpMDJbhwucfLFY9WucyTkaWe7XjedI6vCjs8fh3jccQkIjv/nK6Vk0t9SG6cpOMM/ahPVkrsqCAVHMcXfZB0wUKWecOYoAZOxttjvWhAQ6/i1tEY/FC5McOHzU7RIVs7hyS6dSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JXrm2uLQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGmXjyCf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JXrm2uLQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGmXjyCf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AARLVF4188960
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=; b=JXrm2uLQKi7kTLgq
	M7V7Qg6nGlbCoe0gBMQXEx0E76BQcDjn9GoWrYegfbm1H3BfyRxczwgHHnF/D6X6
	xos8XT9TiW6puiE0266007cOQwQIEgzlYToeQcuRE+N1xaWzaG47wFdjrKl9VLqd
	/GRCCMTiXlVj90sMlIXXUMXTW45vp5glpqdgQpRjm6b4O8eT3kA2b76zr2BZfhiU
	jM9QrP89Vzm5HvyePCqwwzgoXkt2aq7ldbf/hRWo7HTpdpzQ0eMbeiLsESVLLU0W
	nYA9iCt5RwjXAVy05ov32SpzNz8J0dTces544DVoZyFfKrPIErRD+QV58eOeGTYJ
	yxGDOw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf0856-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:22:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd773dd39bso2119607885a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 04:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141775; x=1773746575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=;
        b=BGmXjyCfmjS3LU2S60YWEtVcuiKrRP3oV2AiCMa0d03yIqhaRNEQizAozKJL0OM1y8
         5l7tuoA4eGUTAKjwjLPM1Zsx+AIW/fTchTJ+s6j0eibViZ3FZ5dIDbWqTdYvZoYWNtHQ
         n5glVVLzUoIXXZKqMwJpOzdPVUIaB9jwqyBYFDICgZO5aiyIjFdmNOJZLl02fn/+PtBs
         nRXf0CDZEWnVhjYmE4wSXR74lL4TkPTyZW4i6ygxAwrEbhKKmGniw1pNkcLIOihMEceh
         7koK4PRkUI73rRgUi/fchBWfA26eG28g45SQ+/8RuqCTy1vk9qWqEvAorjUACfOis6tm
         vEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141775; x=1773746575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GksBf/UiRqf0K26bAdDVUWIlZ0hLiFLN/66ysciWV5U=;
        b=oi16IrLWCIJGGfB82Jl1FAMxhbFegMnXjgTJO6uVCyxiB/ylEQOfokgqCuL6wRtvgw
         KGFR5q3rn7lt6LhOoJxneTPiJIXj+R2s8qCWsHuymYsuGgAHfusDs1QeG2zANV7l7C2k
         pDO/iJT35uP0kYvcSlnzaUMffH9qk/gUNl/FZNVZHOUpU/1xh5PZENxhlf17nuT77hVQ
         Q/zsoNPvHlDaWZOW4IoX8GVUg9TT9jyslV1op/Hyq9zVP+AiqoBHM4ntCYC1vhSmaLs+
         9iCIIBajgwKd0CA4PJb1puw7MQBX7qLrvwJdLjCkXivZQlc2Kh8kPT3O0GKDPaPtNmDp
         8cxA==
X-Gm-Message-State: AOJu0Yxle4PyhBgC31EHqvwNz7aEcOd5o4zfHOCnmN7Eau8GQi4MbGyF
	7Drem4WB0xu8HH5kRORFX/17+57Lg0BFbkHVn5KODppHa5BGnuNecQsKMXQHnE1F//0KyfozWS7
	7ileJ5jwmy4lqk65RumrElS/vYS3kmx3R35UmLtOPni4tua2mPMfJSfjL80NG/UW+gmO8as+F
X-Gm-Gg: ATEYQzw9yq9/RMEOj3dwEdF+HkVhnzPBSmybJsPFtdlBqUvKcS5AiNj8VYYKCXxgjGw
	b8WopKDV4mEaUU/TzCn3GJ9zaRf5MoAgNSQzVW3kCbaaFB9uCawOXSdp8lbR8Nna2lm29m2/xAe
	ZvRsoGX86voJGCju2uwf2+soXlPPqMlv32lax5W+W/uvPwONW38JqN3ktF8gnZlfunW70yyrJjd
	+q64OzdCkHFbxghfg8A+YJ93BEPhdX01BDMYuGr+pLU6/uLBzGnuXjtPaZmSmMcvD0SG4ZFMWhf
	9fnDdoBg8bp8pknXDBaRvaM/kvAg1J8Mm8ytgojeV6KdeMXsAiBbewilPCzgMQE3bB5G0LeY93r
	94KE6dkAAhsmEHe4YKV7bblVamXP5OmvwtKy6xFULu7tC
X-Received: by 2002:a05:620a:1a0a:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cd97a7a6b7mr115246785a.6.1773141775140;
        Tue, 10 Mar 2026 04:22:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:8cd:97a7:a345 with SMTP id af79cd13be357-8cd97a7a6b7mr115243385a.6.1773141774703;
        Tue, 10 Mar 2026 04:22:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:38 +0100
Subject: [PATCH v2 4/5] ASoC: qcom:: Constify GPR packet being send over
 GPR interface
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-4-0e94c5db9bf4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5803;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ObSXKiR97buxky/PvKOJ1j+VJH8Bidr34n3hBEMA+cI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/8BBvkL7GdnzghQsZVsVzlQ6xuKDR8hY+hPc
 IpGCSsqCf6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa//AQAKCRDBN2bmhouD
 1x0tD/9jKwfDmntMF5yMlc1fEIOn5KFtHA3kOJbdg8NmqavLKwylVyFbeRfeIELfVTuJTZPiP2J
 ntjYCKKtRvS6juhf1SZsWvs0nGc6J1cQ2Z7htGENVpN/h6pr2g9MYj6jOL7rsWyOIlHxGHcBjiN
 I3QNpG4bZFEGc7nU2MzcusCMtM/T+qiYut14SX9K8tZII/QnJ+VofsnR9zT08J0Y6+jvCrFv4LZ
 zXWvC+NnQgfqmOWRaSsG/nFNY5E2tQP7CJf/ZKxwHYZkqTl85W3yBqFsubK57XGQo56jARyyb+C
 1aIHQE3xwTKWpHjtaAnNWFJ0o31UaSBStTRywTRe4UGcKRhqI3HMTXpcK2ODrMO/M1koglao1Be
 EdaZHY84dxuG9b730qn9ZoP/AO/oVFz9quLdSNTq+qR2/n/8ah1dhBOjtQOy+2PhdFowFFxwqlt
 nZgDqMpCjsTqq9AFXe4pUGYrl/pEfqQZEnmx1/8V0azDfVELg697mUAJ3lgjE9yL4wozOBW9jii
 M7E2FpQFh3XsFTajda66ebiHfXhGouXlwFfVKadNOlRenl0XLLb7HOf5DmM88Q8vCzbtU00ZeDv
 wEt+JIrBeEi7p127S6TMq/2mMebHu+00vydMR5HprYQk8jHuivG2cOrKMXgO/FkhTAP9rNqTmQr
 QgwaVSTGAqkjazA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: AqNEU4jC1cgGHt0H8dO0GKIQdCbaQvlf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX19Ih3UWvt3cj
 P5A2DerbIRp9SaVLtBmxCyC/vnALDM1gcv4uytve0co47uppYN5GkfYBsUyuXjAM+EIKofB50k+
 ZYQpW2re5m8oy6riTkya7aWFxBRNul9vVC1SNI9iv9DDTk+3mrJvTUzp3HbgRv+tMeWpsO/eqa8
 S7ON0fM+qYTo5d8vKx/AypKXQw79w/EMKgD4L5dbTncmPdRAfXPh6V7wUpqYSW/pU/PuVOUnHBc
 7vTZn1QQY95NskCIbbsk58MOL4mMKYnpYI/PI0kNVzrfsAVHS3k5IT3ia7+Ub1XtoUaJkjzqN6a
 WxyordFm/sBbTAhaJPEqDHSCezA0VMZiEjhL733lCCuDfk/LOfbJtVxcceJMS2vE9HC4gExr67P
 88XPlEzzNvNmNXbAgb5tzrYv5n8wtzquobqXGLZur41xi5yjGgrix++iTDt60lPhTo8A7bfEB1B
 WDDZ7zMi/6IiHnQwHfQ==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69afff10 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qTtUXMQ633XYL2vtSbcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AqNEU4jC1cgGHt0H8dO0GKIQdCbaQvlf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098

gpr_send_pkt() and pkt_router_send_svc_pkt() only send the GPR packet
they receive, without any need to actually modify it, so mark the
pointer to GPR packet as pointer to const for code safety and code
self-documentation.  Several usersof this interface can follow up and
also operate on pointer to const.

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on previous patches.
---
 drivers/soc/qcom/apr.c            | 8 ++++----
 include/linux/soc/qcom/apr.h      | 4 ++--
 sound/soc/qcom/qdsp6/audioreach.c | 6 +++---
 sound/soc/qcom/qdsp6/audioreach.h | 4 ++--
 sound/soc/qcom/qdsp6/q6apm.c      | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h      | 2 +-
 6 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 78e72379a6e0..ea7f83916d8d 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -123,10 +123,10 @@ gpr_port_t *gpr_alloc_port(struct apr_device *gdev, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(gpr_alloc_port);
 
-static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *pkt)
+static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, const struct gpr_pkt *pkt)
 {
 	struct packet_router *pr = svc->pr;
-	struct gpr_hdr *hdr;
+	const struct gpr_hdr *hdr;
 	unsigned long flags;
 	int ret;
 
@@ -139,13 +139,13 @@ static int pkt_router_send_svc_pkt(struct pkt_router_svc *svc, struct gpr_pkt *p
 	return ret ? ret : hdr->pkt_size;
 }
 
-int gpr_send_pkt(struct apr_device *gdev, struct gpr_pkt *pkt)
+int gpr_send_pkt(struct apr_device *gdev, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(&gdev->svc, pkt);
 }
 EXPORT_SYMBOL_GPL(gpr_send_pkt);
 
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt)
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt)
 {
 	return pkt_router_send_svc_pkt(port, pkt);
 }
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index 6e1b1202e818..58fa1df96347 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -191,7 +191,7 @@ int apr_send_pkt(struct apr_device *adev, struct apr_pkt *pkt);
 gpr_port_t *gpr_alloc_port(gpr_device_t *gdev, struct device *dev,
 				gpr_port_cb cb, void *priv);
 void gpr_free_port(gpr_port_t *port);
-int gpr_send_port_pkt(gpr_port_t *port, struct gpr_pkt *pkt);
-int gpr_send_pkt(gpr_device_t *gdev, struct gpr_pkt *pkt);
+int gpr_send_port_pkt(gpr_port_t *port, const struct gpr_pkt *pkt);
+int gpr_send_pkt(gpr_device_t *gdev, const struct gpr_pkt *pkt);
 
 #endif /* __QCOM_APR_H_ */
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 241c3b4479c6..c84e098230c6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -579,10 +579,10 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 			     struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
 			     gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode)
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 
-	struct gpr_hdr *hdr = &pkt->hdr;
+	const struct gpr_hdr *hdr = &pkt->hdr;
 	int rc;
 
 	mutex_lock(cmd_lock);
@@ -622,7 +622,7 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
 }
 EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
 
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode)
 {
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 89f172aab8c0..6262b9251440 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -844,8 +844,8 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph,
 				  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
 			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
-int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+			     const struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, const struct gpr_pkt *pkt,
 				   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 44841fde3856..3527ad1acbca 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -29,7 +29,8 @@ struct apm_graph_mgmt_cmd {
 
 static struct q6apm *g_apm;
 
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
+			uint32_t rsp_opcode)
 {
 	gpr_device_t *gdev = apm->gdev;
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..a39f6046f886 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -138,7 +138,7 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph,
 int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
 			       unsigned int dir);
 /* Helpers */
-int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
+int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
 			uint32_t rsp_opcode);
 
 /* Callback for graph specific */

-- 
2.51.0

