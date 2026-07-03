Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828CA33CEB5
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 19:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107956; cv=none; b=JgUu79eZB1we/6I4bsmhWwdJt+brGXevUwV6QK9ei9bmkgt11kj17VAZJZk4ovvy3bykPvEDUzamlbJ5tWWiKvA7E6SNLi6oTf3Ee8WSwum7lWgV2iBBMFGP7/SAot52Rf/UObitfYEISjfH89VWXynOS2esRezZAjKhcFatveI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107956; c=relaxed/simple;
	bh=ce4q4N0ozbFmR4Y74MqhyD63KKGOf5CRYn/pTXxHINI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZCJkj8zKuTK8QyqJiDamp+jEPEA4JZH1Hyw+SKgfHhAtf1JQ8tfTw7szOUN21rNlrcKY/hXl87faM7y7rn+8ygYib7RortsKbZdRcIQjxvwBC7Vq+ppN8N3Jmb6xiZHPo31SLqKTLZFvs5oKBOdHjb5HvTU8fFMYa/br+QmawM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gb5iSDap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJiwmkL0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gb5iSDap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJiwmkL0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HjGJW686162
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 19:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j1lwYspU1A2
	U5EbbDH49pPsamREmL4P/yJyzYostlIQ=; b=gb5iSDapMq7o3MqL2/LIqb33K3g
	0Pdzuw6XKQM0a2+QFEDOC9CiNfibenplvyPz8NZeAhvpQA1nFugJk21ANwSvLc/X
	ieS7pEbmZLoneOlPen31kwzLe/6r6y8sac/YejEQzsE47S6jRJpmO6RcLHfi1cf9
	Jn1LynpmVilkwQTPBjEw/Zf7dPvwiTFQxtshXlMe83IJNx+CllsXSUTdrF9wRBjy
	SHzGnjWSCQ8Sz/15QC2dKRXMO3DdtOyER5uQo9gNk66TBLFTcuPHHi7uxyN6EloY
	h1vTF59Kptrbasun+lVb/DJ07ylnu5F8XN1GIDgzYC3y5WYifMMJIL7a0qw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qckf5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 19:45:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847e78d656bso1464968b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107952; x=1783712752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1lwYspU1A2U5EbbDH49pPsamREmL4P/yJyzYostlIQ=;
        b=OJiwmkL0b5F3pddpTySmkLK7xDLjHqzj/KLG0Q9l38L+pFCJLFIpHEqesGY0+Awn2A
         CVRJtoKnS8TCMRazpCLU93Frx724ZJKxuAK65hM5eDc2Eki3N8Ddns2IwdzEaOTkssMo
         DIRfiwKY2lRRTLUHsCMQnUrETAS83ReKqb13XE3WDjf+L/M7+vXmavamNXL8acxy/nE+
         NRkxpCIRmx60NmCxf4SOzvp2thtDJrJVLhpSV2cq4khZuJ3wk+rbr+izL9ui3QN+Dz+J
         sSXH63ylDoLwo/B4uEXqpWgobMk2dxx3n6H3V+9atQlU/NMWjsHIgubgUYjk/PBV+BGs
         rztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107952; x=1783712752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j1lwYspU1A2U5EbbDH49pPsamREmL4P/yJyzYostlIQ=;
        b=lQ6ULh4iV53swofgwcEF5ZsKLbHkspsrWCInQGCnrLMNyf+AC1GbXd+7rRQMvLjOXk
         AfVw/9xGHW3N7sh3KT9WLAPObU3f6JQqj/H7XIJ84n9ehkyydjs/896IjrMy2bN4Wk2X
         rVvyG7mRP/dhLLVs0h2HqTEVFRdmSE7pWro34fDdV5+EteBwEtknNVEoxiFbpMdAJ0Zs
         i7Y3Jw6WCUXzi35kDSeAGyr6dGuGYCcYhyAGtTMtgwjXbIL2cpSPDIx10Vwth9eSatCS
         tpEL5+F4V2ZxWtML9m9cUFIDtK446om2iUWfxgYfRW3RaZ5O8Vboy8YXVvBDeSMM5ayk
         25SA==
X-Forwarded-Encrypted: i=1; AFNElJ+7ce0m3M/WzfySIs2wFOhoqLK0wpAtfGasAkNmbWnUcrXjSbEnXuIEqmejneQjFKdspHjMNaZTjXEj+y09wM8X@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsz4U6ceCrvMzhYI90zn+VFtEslqnImVtmHMfwcjxgQ2HJRDOB
	IA8KiBnDQMR83Dv+7M9Abp6eM8eZwEl9ib4mTpdMp7tl8s4tMWUg+eug4tmda6JPuJqHxu69FDP
	aah1avLPJTR1XPpnJTx0dajJ14vTvomtEeYZO2Z8NB096kkRMjQpWPmL+EIw2DSXTmQCedunt
X-Gm-Gg: AfdE7ck57ZjWYQC2VmJgyIZnrM1hMMkzaqx9UHq3H+5RLz+yJObEj7vnir4kAsaG9uV
	jCJEwNxGw5IPD+aKRQo7lutNUAkp0bn4g3GfzKdNUu0x/lQDy4NjEjNJVq2rBNW/Z0BuMLs4+0N
	R4P34cYEKvc66fHPl0jztQT/MeFOErt10d0bSDrpCHZ/S1y92tkHzOVdr5JYm21t+t0soxQEbDZ
	9EcwFOxCqM+em7nQ7lVphD+83FjF/YoK/nJcUrEEUfHvZCxkADdeBaKTHUlSHkcNkvlx8Xcftu8
	OF3aJaOIwIcp5ptp4/MX9JxCs3NXtAN/zh2RQvS2zcAnayJcjl6FCwrpFwzJyFKTI3vzvD3Jbjp
	OAogU5gVsynIC2mAuvEVJ22tfHY1akRgyvVs0mQ==
X-Received: by 2002:a05:6a20:5499:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c03e50d4a8mr737384637.53.1783107952160;
        Fri, 03 Jul 2026 12:45:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:5499:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c03e50d4a8mr737303637.53.1783107951614;
        Fri, 03 Jul 2026 12:45:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:45:50 -0700 (PDT)
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
Subject: [PATCH 16/42] drm: malidp: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:29 +0530
Message-ID: <20260703193855.110619-17-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: oCksFXekeec4UGDFH6UDeqXAUPyEjT4M
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a481171 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=JOjAg5lxkONN77W759IA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: oCksFXekeec4UGDFH6UDeqXAUPyEjT4M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfX1SH2tFnmMttT
 O0Ce1VypriM+0qy/Qp7wAZyRwy7/uw1Mwvfp9NJtSKi7qoa0PEP0Z8AwHmPDIMZwTGET5wt+x3f
 BVbvVaKhvefof3UaRvHs/Fe+6+9IvHR/84HZtZXxWPSwqqi0n2zHiX1tiWTseEso52yHfnksPC7
 3Xic+joxfzLuHghdcBLtuy02xluqmwlIrdPYKHBeepdPfXgqQMbotG/qMZcattmkFEP/ZFFRjBW
 1uAANOYFp6MS2eVl/agvVcO3Ux8msvKowl38Eslqv29dAr3+Z1D9TYtYWGMR4/Q2BzBlHj/4dc7
 KVPxbF17u5cO4oUnOm2oD1uepVfFAHZUVQLGIxIlCew7zB4DQ57No1A6ukJlL9YacFj7Fui8d+K
 oUx9ag4qPZTjmlaQ32e6R/lqeQpr2gQBgiVlouQaSL9BnHQnmXbi013BNi45htkS4vDLBUm4qqU
 31Jvp0kIHJZE/ODW/cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OSBTYWx0ZWRfXwEVDg511Y33d
 FEDtMB8AVbj/MDXLcOueiE7qyyOEN+ok5n9/NXgKby6S0M8VKtoK5q/uIsNgNLixcJv6212ASsH
 h28ZQHPy+r6ktNf4Hq1H3yqwaai5zGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030199

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 23fa942ae4bb..3e17513c3114 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -758,7 +758,7 @@ static int malidp_bind(struct device *dev)
 		return PTR_ERR(hwdev->pxlclk);
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -887,7 +887,6 @@ static int malidp_bind(struct device *dev)
 	else
 		malidp_runtime_pm_suspend(dev);
 	dev_set_drvdata(dev, NULL);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -913,7 +912,6 @@ static void malidp_unbind(struct device *dev)
 	else
 		malidp_runtime_pm_suspend(dev);
 	dev_set_drvdata(dev, NULL);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct component_master_ops malidp_master_ops = {
-- 
2.53.0

