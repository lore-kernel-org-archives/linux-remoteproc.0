Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64368331A61
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107690; cv=none; b=oSmohUYvilxalsR953u3Lq47euntHeGgpPjcuO6wnKMlfTg9L8kbj5VuFyUSHEXRRnEbCrt7c5KwPQMQh/nyTg86B/E6ruz9fq0GfaH8HzDjXG7FeeA/TpJB5UZ2hvLNtxPGUBYJN4rOkI05allx8eG6uL+Cfc/QfguUuFPF4eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107690; c=relaxed/simple;
	bh=TXNTREvaGC/jZ8A/tJSBrcPg0+JUVpdj2AGCKR3ba9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqLEcrD6iFKTACNDOIr5u1If9Slx8LE7SXuc837eCBcXFx+9A4i9VJM5fJ47FpaNftRya22tUXJuZp3lZvISjBGdnUNSdfLH0cqLsZpX6kHboDfj/ixXnvtKeV39dHau5t/2Ddpo3c9eKuwgFCOFwMnHCeuO35hKXQUWdgEEFws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GDm5wsiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ny7mS+9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GDm5wsiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ny7mS+9R"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiLfc546530
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 19:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iMva+1PZ1+K
	dQNeTwrqYOxfRk7+6bOU700RhvaCTUnI=; b=GDm5wsiLQ2TMvz973C+7bjcmlR+
	KGiJp336Y4oOTICwBdUWMVqI146VpcWF6oH7l76OWtFhwQr/KC5Zs9E8CvG9J7Kv
	ghE5vT6lPIQaV3lb9//L6Y16OAJRpWdlXWygrH0x16FdDhVXJ6kE44kz/Z1ZCaPJ
	hhl03lmmTzIpMfqywvxTc/MkGVPxMgdFzcQsj9e+Ow4Q19hKKQpCdYr4vstuLfN5
	nFuUJpQSD/qPK2d7c2OTxO/zefd1KvlVaVXKOCYcganHPsX8mha4UUsMTkmcYIvJ
	oWbjPlo3Oz2VXqGEBrs0OQWWevT4vm0EG6eaNXNQU4rdU4R44hcOITOVEqg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j02veb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 19:41:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca53c486f2so10341715ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107687; x=1783712487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMva+1PZ1+KdQNeTwrqYOxfRk7+6bOU700RhvaCTUnI=;
        b=Ny7mS+9RnzWIxLJJ32PsSfG5kr2qeOB3BwTjDLddj6OinObsM3kVDYfg2/z2k4M5U9
         /xtPCzfaEN8pfC7zGmzlk3hCAZhcr5K9oG8SnDvmNuvncELhq1/CJnvKk6QLT5B094E8
         jnnYVXxU9zmj7GGMhXFVNH/SDRq65Dk51A20T5eVZuvjK+cCF6Uc64ye6heI4uQhYBbd
         vmKffEUXzYIG/op9lWqdpiTbUrhhtgMRqYvir8YV6RZ9tnpZNgA2pYr+VkNSef/x29v/
         smkVUpP7B8k4/gq+JIiNwknC+XlpPCmovajemHImJIczjGHa0sla09Jvbqfcn77OGzM9
         6D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107687; x=1783712487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMva+1PZ1+KdQNeTwrqYOxfRk7+6bOU700RhvaCTUnI=;
        b=JKmQu6+laHXlt6a89yKEEUch0KB1u25BVNN3jeklB+8N07Ier/yXJEf/Kb8knQuPXL
         FJAaXf7B8AcaMVWY9d5ycVg6HjvpFDdhmj9R/tNidJ8SccQjzzQ1Rpjl5ao6eQ+i3s9d
         eXvfTs+u0Qiw72NlYTKDEg9vNehzccUVRUGbC/cWeWGr82r1tjb3ey2+Q+4fqeEToOY8
         8ryBvFQg58X5lIsGiZCJOeXGFzfvk1NFXw4jeIY571/Y0skn4o6YohKhCLdP6IJ04mr9
         YFuitV5eMNTgzWaPqrsAv/mvBSiCvj2u/2AmMCi01wZ4nBgtx5xUMJFbVL+LNsWKc1CR
         7tTw==
X-Forwarded-Encrypted: i=1; AFNElJ9IYsx7TShEq0bD4pQAOFlhD/jywNc5prScPmDqm6WsY1tRTqj+bbVbncHWZMNezbu8xwgRiCmZrLMf7AX3fKUk@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXb6ydqAGhtfAicbKigLTf8uz8CihhEREwgGsueF52y6BNvb8
	b/AOfrvmsOHrsH2euh/ntSxWDSA/lNzVpAMlmJhmnD8wX/GBbE5SEjtSTSSLHlQFd0E3LNQ6+86
	6D2tjrGOL2i2ac8EdQBObi1LHk+Ol8Zv0CPRc66N8CXpLidjjesx2pIG7iiCFbksqAvehZuCy
X-Gm-Gg: AfdE7cmcSe6iR11J07X6rNWNuobWU04mbLm0Ub303PGIYxlJR4pA4+Z6Yj/dR96myjl
	Ja+cp8rw9ThgFJzEI4CQMZBPkNPh2VBlwRJ4FTHkrgCSYQVzjwCLU+E57O+X4xqCk/B4xaVAd5N
	HfsWeUpLkCiz/XGo9ex2WAZJ5kGKMJKvp478FpAZovTvfVenSY1LiCEdLyIAieBes0Sp+MjKfTN
	C9wbpeFOOVoARXLmeCsw4iTDYXuTHJmuoGfTFV0fLUIdexYAuZj+qk/25Y4ieepjAkPI9nkmDC0
	EZZBSSaXXVFJ4QCMUXKHudgcd2HYoSwc8IL6aHHUSEdGL5sWGeodQiYCtLcZinmlMEJhBCU4if2
	+KCJJ2Wxjjzj1DaIAJcSt5izUCqOFVERL9eQYuQ==
X-Received: by 2002:a05:6a21:10e:b0:3bf:bc9a:db16 with SMTP id adf61e73a8af0-3c03e1ff210mr802299637.11.1783107686242;
        Fri, 03 Jul 2026 12:41:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:10e:b0:3bf:bc9a:db16 with SMTP id adf61e73a8af0-3c03e1ff210mr802255637.11.1783107685626;
        Fri, 03 Jul 2026 12:41:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:41:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 05/42] remoteproc: keystone: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:18 +0530
Message-ID: <20260703193855.110619-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AKq0k7w0sffD3kfkDrt6QkenR1kBtG4u
X-Proofpoint-ORIG-GUID: AKq0k7w0sffD3kfkDrt6QkenR1kBtG4u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfXx1Ko2hWv9Ze1
 TtlSYxo706bPQ4f4q+JwknaKriw1QzSv5Mc+YRaKfyCVvrIIbqElsWo83cWso4OGsMovAlulwrK
 JuTntpZiK839xCjYXIPOiEOHnWlhXd0=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a481067 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=eZD8004roD30yaJJyL0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX/eYR32WXnjJp
 XF/ZWbsWnv3LeIXEAIX3qXVxCLciHGX9LBRYbt19MbSWtp6fVc7w/FxxSzSYns/OwFNnkCie7rg
 Qn9OHcNhRJpAkxEk7ckB4H6eZlF8V8tAYvBAZdKOD07KuaNPlhDauMATWLD6d2GefWkc3b0gRDy
 hFv2s/w5UpbLbUn8I2cfGOdnIxoigmLfOmZFMUeUm9zAW2+FnUlcqT6RRU9pdtqWUrzDY97bk/d
 Vs3jUGdjfH/6JxJUXSPLX/Y41pLHIJCl+IUOEDEH3V0vzrGA+rfH5NNd/Ks7bnui7m85GAdR0aa
 m8LCyYNqMMjwpW5q5G2G+PM+/9wsVCgnK2V1sgZuwp/E8ZvKyBD4cnouQwJfsFG3G8aZzztfuXA
 iu56WUWb92EBlfhmzOqsGdvlqtjVBkVfwMIUoW2dyAwzHPV1UdWhBpaGlVWv4R7E5hYFlytxM0E
 YQv9ZZhX2uJv8hwjVYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Replace the hand-rolled keystone_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 83763d640c4e..7834a50da209 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -330,13 +330,6 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 	return 0;
 }
 
-static void keystone_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static void keystone_rproc_pm_runtime_put(void *data)
 {
 	struct device *dev = data;
@@ -426,14 +419,9 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get gpio for virtio kicks\n");
 
-	ret = of_reserved_mem_device_init(dev);
-	if (ret) {
+	ret = devm_of_reserved_mem_device_init(dev);
+	if (ret)
 		dev_warn(dev, "device does not have specific CMA pool\n");
-	} else {
-		ret = devm_add_action_or_reset(dev, keystone_rproc_mem_release, dev);
-		if (ret)
-			return ret;
-	}
 
 	/* ensure the DSP is in reset before loading firmware */
 	ret = reset_control_status(ksproc->reset);
-- 
2.53.0

