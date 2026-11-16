Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846186;
	b=q5uH1o5XwGzIYTHLDA73yU352yzlOAlM4RlvjuoqgZpySib3dkZgg27yBJrdts+/odT1
	 +Oqzi3Qu7gLEViJc7iDqoNojCtoDEqdEZVox9pxJLqfdZjJjnimEiCVAD2AWieT50ocuK
	 Rk884pmX35qHSIq5jkkdykrpibmLYfRfvFbcIUJZmIK9lvWg76kZtJePmrUwrqt5GrFBV
	 OloxRV/rinjn4ggOzLRkL2HFdMeqwQ03IUx+8+fYZrMUu+WVTn4fQ3Q1+Rp6u4xHAGRH5
	 Q1e4dL7au9xVFrAl1DbFDJfKHUykyfxVx/3aU3BCB4dfkpGYsQ2IaLWeta4vrbE/Dpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
	b=4C6WtlXK4RLKYqr9n+1tYpeySaIz265wFywreWTB/y5C8UkFlDATvlWWajkYkidIeCU2
	 +EpBHv9DfygoJdR/+aLjX0j6B1fQUfAmKGlTBs/r2BiNSqcUdWpK3DeY7lVMJJH76OhwW
	 NsoMzVa3WMdv2rr2ITdMVJbLZwJW6LP1A3JZ9jmJvF9M57+ZGEgTnF7QPXYtG5Bsa1/+G
	 k4ZGyfvrZS2fyRTX+naFD9lej+4QKRsQvhKbBNM+eQVWaqp2nE4YFbe+I9AwgVShmERJL
	 D/OIdGx/bfWD6aN02MyaiCuqUAER+SlruoPDdVfXyh2gGQynLu76IAI3X7Shg7iHCyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmVTds2r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkMT9f5V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84F606A329
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD84F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmVTds2r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DkMT9f5V
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIGGv3045350
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BZVUNIWMPuP
	DdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=mmVTds2r5rkgKTwEnGI5LCpN5b2
	/tLsDWF6guoPca0gYr5QEN4hCVmdEc+pATQVG1P751FBpszfBZsJ4Wybc7N//Cyq
	43ND00eDQ58lfF/yy5tgXS62HcNfy8tR1JIkrA+VHr+eEd8xANlKBfWkJcFZ5j4H
	zeGe2aop2OFMX+rcBxESBd3QXyhNOIS0pEoUptM9zXiDPChmK7gDObRqHAG8TYph
	4v9/DfUuuNaEQj3EDbVGsS9aHrWhzrkEJn2bcONk/h+wY9NimNbIfnqZK+vAT6+7
	R4/5QQkkWc8KSYkzM2upY1JO0UgXH0Hz7eOs39KTTK7pf/GC77z+GqgB9bQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038m8kdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:23:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso5055eec.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846184; x=1795450984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=DkMT9f5VmNHjHlXwYqRyUbNqwzIvW7+VYHRCXlY1t1Egzbd/VLPPZoKi2T9GYAyUh7
         DedFpAjngg+J8FbIhCk0XY6cWv2FkwaJYUTKAYkX9TEDewgvhNSLok2By+m6IzvmWcIh
         7vZeBn6LdmAjRp5Mi8KIdAqxpQWht1EBLHl/zUrFuTSJJdxJOuY9VYDizjIJx2qvUbJs
         jWuUOQYwfbKh0+Yxco6PgdX0E6/SAQCvn/++8RCgAnWKKToz3CPs7xwI+lpBKmHhH6mg
         +tgVkA3LQ9t7gvtJwER0bO/Nx11e0yh0ib24/qgB11ZH3Ey/5JbzHpUQKyf1j577Z1D7
         NGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846184; x=1795450984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=EGp5FRAD0yNgyPP/3V8x5SjTocsNV+Ic+PeoL8yZeGvI21T6oJ3x0Gj4qr38Jv3TYK
         sltsr0Ya4zaRX9BVaUltNpOk7Awe0/dBfY7SkJ+YDzSrekeHU4jeZNC1eRSwh3jm3OKS
         wrfA6dMKHmqmoxwSvmINdg5oXdtwSn4fsYV+3WseU0lsKosQb7NaQnEKl6rGgsJw1l0z
         3l8H582lR8mmINTQ19mdCo2iYJOgmxHmlJy6iuWNPdoqMDhUsRHd1noxpCkDDfn2PCJ5
         NrhPC1b5SGVUHIxnGUE1LR2IYQPKW8ybp4E0H2l/Y3LumavYmSMSwSpaYgVzgJdYUATL
         A2JA==
X-Forwarded-Encrypted: i=1; AL+hErFWUMgAgWPFboaj/uuN/VKoTdyKfuTW76RjN+h9V8zHWC3bHmsWLkVgyMcqf1LniC2wDmaXfStT7nBifZi7AAZo@vger.kernel.org
X-Gm-Message-State: APuU4Z9ljX4nemlG5A05KzpoGRbLOmmPIKLik+lYxUgH4UgXzk6ixylQ
	TiFHwINwaFARY64kbkYpn7WMh2z+yxj3R0EXBkpcWfoh0BtRwWwbUQbN7B6Dxz1XwLynDot8YOl
	uZpnfAkTp+rKJUutdTaxyR0TgiINvuICjY3mh8uLG115FbmsZV6VX8SDUXXbk3fUZpHrbtb4i
X-Gm-Gg: AYBFou3UmDOH9JCQEGrkP0uR0B9vUhi7I4h30aTOSxaPMadWp2lBpnckMaf4yoQiKLq
	Cpa2+PcSyQ9IHJRYMcDdld63O0vgs9+vbH06DsE51Tp6vt77fgtSiHq6KVym1ZcDfGUMmt8dn2e
	tISev4llLB1ZMsSLj/9KoBX916OJ/aeLhRAouQU6mcyR+Ate7utZDZTy197tPF50CKZ79EoQrkM
	cmIh0jGFgqWzvYFVrqDbwgr4V/5oS3AqxRp9yfzyoplsmyeuaZE72xTaXPmvOsPmBa3G+amtwo5
	X0N3LBGP2dVhT2kP9fSCNK6RMW7cmrU7utEnMDEJSGYgL+44GaZrO+Z0JaxzE9A9BaSamyqci0K
	uAWUOtj/m4a4M5NH31DPaXHtIMTINVj87WwXGO62E2IBm2CboGK+MfMBXTPJV0s1SUfkhrIsIEr
	iw
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr11218995c88.18.1794846184088;
        Mon, 16 Nov 2026 08:23:04 -0800 (PST)
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr11218947c88.18.1794846183414;
        Mon, 16 Nov 2026 08:23:03 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:03 -0800 (PST)
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v3 6/9] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:45 +0530
Message-ID: <20261116162148.2864501-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX/69MzYc47iuN
 tbln+na7mok1WOp6x0fMCVd0svyVeuuhTmqMAR0FivUahJeKLsDN9E/iiJfb2PIdjrMn6w2ljK6
 WnIR7bc/qAZk6GnhtLd58jqEtpatHJWU/7+z2QKiQtvs5QEZLBT8+QPmblHiVHn7+SvR0SPt86n
 yzhdbVNvtOyXDhjzsR8VZuskprNLFGLDIdsq272fHKlkw5jqWVWgjdVKo+oPax0/paYuOmv//YM
 3oeJSYX559UDS9jaqTBP9QzcaG3DTXvGLA7TNUvxzyroN245peRv+YAiX1YdMpdmm2UYP1DlHAI
 z+n931Q4K3tcAme2JYhBlGwwxjoYE1/Oj/nUAfKzM6sm51TKKwfFtVDg//Yh8vLyBPl7OdCmmo+
 OiHc8+0ByDlKIeF2dwr0ehv00XsbGJQfyVv4hxVpaNXd54Es6EKhMsUi+2oIAD2cneqA9xWt/al
 Fpp6Q3qnQLKbF+2d8DA==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afb2de9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=P8P2WCEqvqb6tQ3B-mUA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: A0tzWpBfcO-o0Tzk8oAFblo5dxOjhFlt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX5MS9h7z/7kse
 8vGINag9+dLnx4dHy60I1KTHPUgQ9u8dem1DeoqJnd66LxzeGyo4LPZtPpRE8oG1IjgZcM7S0bA
 QIELDVY/KvGLAfW/C3J0RqxwhUDH9VM=
X-Proofpoint-GUID: A0tzWpBfcO-o0Tzk8oAFblo5dxOjhFlt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160064

ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
qcom_pas_context_init() and qcom_mdt_pas_load() and
qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..0a37741c2285 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
-		goto out_release_firmware;
-	}
+	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0

