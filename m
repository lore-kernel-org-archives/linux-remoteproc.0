Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596032;
	b=w+fxDN0MV1T8jMieFojBdP0jPVs/xo97nd8ByQrjbggPsxvrFq5SINOtfhunEQMDuBE8
	 q5T4xNPvWh3MfZ2R6/o45EgmMEYBONprK/JL4gvyQTq6GmUg9kESXnOwTl4rdwNolMuOx
	 Nn/178excKTaSUr1kuY/az71YiqG+5FTsPHuHw9qJ9+d13mJGEjfBokTKtksj8MRWR4jf
	 vwd35V/B39CAUPwtP0nYnLkKMjhWZvOUHb3D5INvt+dzW4Lcc/ePV9ZBeT2XmNa7FwWX3
	 lYMDQEps9FrTLb2OEhv2iWrkIHHB94LMrb2P11U+tgEDL6uZ1IQuHDDw6MfyH6Kbt+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
	b=qZCQdpDVX40DVYOFXCV5NXkZrqlmlb4POAbw9eFYxWUOi8eSNx4NI0ZgCgIvW+XVuqpL
	 VIOOyikkTECRe29hacDCfUJQffy2PW61uJS6jBFohpWpvO4Wzs0qA3ePeMn3y29qRlcFr
	 8uuvyaImrmptKPZZ4E/VuEjFkMoZMK82SkA2ywiCufMMo4XdiFyBGxce8IrDhYe0Y//+r
	 z4oRurHJ0A1uxFsVhTjtcM/ijlt2arGDoTwV7543ZDH41v38bkZ/ScT7vyh3Tf7ywz9gs
	 Tn92+5o9TqZmAi+BbXl4z7VdtGylO0fTs2krWDDYFZCTGlkdBCa+/XZmvCJaRR7R7Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chlWtNlF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dPG4klm8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D961E606A32D
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D961E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chlWtNlF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dPG4klm8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQtBm074761
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/5IBT6uyH8
	wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=; b=chlWtNlFOsXFLmcefZtYaJNjW5x
	vy4O8EZdPf0zimj6RIz1A1D7MSx6iXjy7hDhXUfl/ad8fAVY2g3nyKLdbIsD/VO0
	fTeyNigeR9xlG2JaYFW3w5mG0fTreYlRb6BR27cUseLWXV8LlCIRgxiKYXva/twy
	xHBqPV6C+MiphHXqXgYfN/lr8EHponBTaA+2nxafx9I/h7OBHHbCxZfFSNyo8qi7
	HNGuwmxpZlhyr56WCuFDE9sBAmtjLV+/GacKnuXMQKi7vllonn0MUvQk7Tic9BLV
	gYqZb/a+S8yUTIGpcPVtN5NgfYidUal/f/dgNlvOCH0PEMi2kX7b8SQbfOQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mu3wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:53:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1618688eec.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 10:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596031; x=1795200831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=dPG4klm8AlnyiSVqib7A3PX1VNCseKJ1gE4D4oLLNmJTnIKSiJ+ooTpcxBMjizsCMo
         /zXp1mJ/KRNL4tk8o0QX9Fi7Zxpgj/YcqIYag6gPVv9skLuyISFwYKMpRVKMVX6igKOp
         jSwDwXbLVuLY21vM+ZlmdR3KqMZm+urIq0GsYJHuCezAc+NPK2DhWG+Cj/Kw2QCubAzN
         oVl3GUVZ8gNtA3r/3yuosY9WYqB4wdnc1SkEBGAyFaDXeoEPniH5cIlx3bQlSy6XkLDt
         2nftTYSZ1E8yJ7+BJiHpCY2YiXCTOnMhTFUVdjhU0QhnoeRfB655fv9DNlg9NHarrRnB
         ofgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596031; x=1795200831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/5IBT6uyH8wqYvt8xbeed+YTnT5UfX4kyDmhIwv65c=;
        b=XROujwkzMIH9sN1VBqHtLSe7ebEusUIR9uOoH8Rdcd/n0C5x/Pd3bXeeVQQ5mr9jfv
         nzVN938ijER409sXpLd6xo2twLq0RCdHY8HUmcXbsyBvRsmrNc5MGx5FFuby7zxTWR1k
         BpjEFiAlCM2paa2pYBybEn+bYnCbShH/slL3bXNkJM2nnnfAyoqSiW1bVo/uxVs54wIX
         H96HnsO1gFn2+TRWe5an8TE2Vys0NUjsQXKH7SVwzthYz6Wmh9J0C/BiyG7i2/8vFUPK
         xG8xVEsnFEAEQN1jJ/qO8O7uDFuwikRDeP7jFow1J4MEVr0612C7dhDGMvyVvHW44Qel
         b41Q==
X-Forwarded-Encrypted: i=1; AL+hErG/FU2IB6UAb6+0M0Al6U/gacoJ8YGup1UfZo4VbkMHIANkQKmJfTBrq37BKAIxBrEz1wKDIqIY01PL68gcpmEz@vger.kernel.org
X-Gm-Message-State: APuU4Z+luCMbt/Y9WxA+77wgVF1gXMzf4LxjPUcN7E5TgW/3Thu7esq7
	0JP3u0iiObTuk15gDRFcgowFyOrrraqfu1om+8WNsd7tnVDb4Oi41jRqav/CgfAMJYzyS6WPo3r
	zoA7PQ0YfTa5vlDEvlGZQ58vkmejk6HLw87KACAT1lSWlUcouvuCrDccSWs/sqZ7TzqPjmkuC
X-Gm-Gg: AYBFou2nx97u5mroSiESsY9sNOTgr2JSoRWPuYL/Btczx9cLyG0SFmK17Lw0ROwqRma
	75kVLcS/YA4J7jY8PyJmruL2c/K58ku3v7dJbFCeT0ndomaMhRQDDCuFH53JYsp0ZEANAC3Isc4
	eE6UOOmKfI3Fx+R+CMWKqZCc30s4SLhPb4VjAhPuooDRUHcLr1xVOJtowEHfsbeBIsr9/1Y8m4W
	DlcX4ksaPubXG4QFgP5yZD0bqvGmwWmUpJ4z13pWo9ft7vv0oge8Ll+L3F0MgyH/ZajU1YN0onC
	rVgWjTDt1crC5DEmnDIb+i5gh9ORDAJh89jwRBwHFx6UYVthKt3L+4DGS/2F7TGiIfwmgzgC6XZ
	bcxWZmX0QOJQIbzjUXfV35WEM5fq8QKdz3xIp9EIL6caqFVtgm2+CC5JQHw3pn8VvcSWQfWd/Ex
	o=
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr3108394eec.26.1794596030372;
        Fri, 13 Nov 2026 10:53:50 -0800 (PST)
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr3108341eec.26.1794596029602;
        Fri, 13 Nov 2026 10:53:49 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:49 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 4/9] media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:04 +0530
Message-ID: <20261113185009.157893-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _HArM90ciKjJCeMVydMrxvt_lIf02oMp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX2hecNFoTpgMH
 PAloKQ7IhygHDDG5ENGBemtd+uxwN8pfdVQTLou3/JSgANNnkFeNwaZReDoTym9NfIEVNqKflZg
 nXanM31R3iu9kEtK7Z6CTRMTw3/Y0t9M0q/gztOLYzlbINpcS0yaPeeqocbxavmDtGQbvfnMZSB
 2qIZczljYssfpCk/T8e7bIPLDfb0hqNmCjAkbA7Gd7Y25xmZ0yi31Qu4pJd+/gseQQLaxmF9zBm
 Ic+jZvBzCXIRysObkbZL56LkfzSumjq9vacEnKugumXUzz1gVxzGbSCeQ+mCxwsYBIMe2AOGjw/
 RTg4JUggDVtAv5/j7iHPrTdd84Qwp5/LI9c1Rza2ZwntHedzw+H7l9e5xmbQ8fwt6nThqIzESQP
 QA+JnM/8CzY6gFgte8djLXckyl0B1I/87jGXZLRe7W0lc3S4Jta/+N8V3OgRjyfWaW+y3v1tggC
 NSUm/h8Lpp9SMVdFPxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXyeRzRAAhLYxX
 AuQ0Epe8aD8BfHbzeoqj9kojnuvDqNFnmKQLsNAfKLdlfpcpbW55VmnNFChwc8SBh3vL5Oynmf8
 sUCHDssu12w3Xl6Snv4Lpy9ydzyWwBE=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af75cbf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=0taKFLn-hLWpjNWZEgwA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: _HArM90ciKjJCeMVydMrxvt_lIf02oMp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

iris_load_fw_to_memory() calls qcom_mdt_load(), which bundles
metadata initialization, memory setup, and segment loading into a
single API that does not expose a PAS context.  iris_fw_load()
calls qcom_pas_auth_and_reset() for TrustZone authentication,
which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with
a PAS context and can handle everything qcom_mdt_load() provides,
along with additional functionality such as shmbridge creation
and retrieving memory from the shmbridge buffer when the same
remote processor needs to run while Linux runs at EL2.

Embed a struct qcom_pas_context directly in struct iris_core and
initialize it with qcom_pas_context_init() inside
iris_load_fw_to_memory() on each call.  Replace qcom_mdt_load()
with qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset()
with qcom_pas_prepare_and_auth_reset().  The
iris_detect_firmware() scan retains a separate memremap window
after qcom_mdt_pas_load() completes, since it needs to read back
the loaded image data.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
 .../media/platform/qcom/iris/iris_firmware.c  | 27 +++++++++----------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39..ac73bda072f8 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_domain.h>
+#include <linux/firmware/qcom/qcom_pas.h>
 #include <media/v4l2-device.h>
 
 #include "iris_hfi_common.h"
@@ -129,6 +130,7 @@ struct iris_core {
 	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
 	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
 	struct dma_iova_state			*iova_state;
+	struct qcom_pas_context			pas_ctx;
 };
 
 int iris_core_init(struct iris_core *core);
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 21f57d37da18..b701a7f43514 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
 		goto err_release_fw;
 	}
 
-	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
-	if (!mem_virt) {
-		ret = -ENOMEM;
-		goto err_release_fw;
-	}
-
-	memset(mem_virt, 0, res_size);
-
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
+	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
+			      res_size);
+
+	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
+	if (!ret) {
+		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
+		if (!mem_virt) {
+			ret = -ENOMEM;
+			goto err_release_fw;
+		}
 
-	if (!ret)
 		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
-
-	memunmap(mem_virt);
+		memunmap(mem_virt);
+	}
 err_release_fw:
 	release_firmware(firmware);
 
@@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
+	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
 	if (ret)  {
 		dev_err(core->dev, "auth and reset failed: %d\n", ret);
 		return ret;
-- 
2.55.0

