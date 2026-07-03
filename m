Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2656331200
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 19:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108127; cv=none; b=bOvyOb4qMl7sZMScGkg9e3l3hx03/9cLn6k8FRyFvj/OH9OkBtB89vld2E+i4HreQv8rd/5zHJbYtNDW5dXgR8fIEQV0/TcnwpusVfAEpJIYc+ofrCdCduwVNtJLw5kiVCKeTIvxoIFco8tJJeF41OW2F/iLQyCdZJOaVvc0Auc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108127; c=relaxed/simple;
	bh=KKoYBENlGwSryGtgIQNpuBsFHNXkIZL9mEja8t22cvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+QbBYejluSreqQ2NAdWFZMcgEvToEzNLfOwiYZS321vaWRggczsTtH+XiOLGZAEvMqLfJuARHvvd4otJvHylmvad8U/Dmg8DGW4QF+WNHeAa4GEOEZz6+2efbViQWnCZ0CL5I5q/HguDK5wDj6Xw2kNr3CNxqUI1PySszcMLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oe2yBMtu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TON8g9Mf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oe2yBMtu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TON8g9Mf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiX1i675368
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 19:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vTaFds4j6VI
	tza7UvAMztb4cdgVduD/jcDAbw1WAnR0=; b=Oe2yBMtuiakzJoNHyUhWZrUssrK
	VkYy44as8rYFaPVY3qYkY58rW5vsbqBLlEVR1wNCoOP409lsvwRermF3M/2rZckO
	jDRSAa1yhBNtN9Z35pxSi31zhiIjTvpsUGRTw/pqHw+R0wHgO6YcLOKJUyc8SVKP
	c6zl/n2I5OUPpbZRdTcpiWOUvbo0NlKiTQ5N1OKL+St860bWesJlesEKMiGuGXfV
	2eby/uOoEfslWXMef31inHLf1ztWTQyHIMq7e5WpqVs0l1nAzq6GJnq4lPGmaaTM
	w39ZQFAZOHylcs/I2t11wpHn4o1yjBTu6D/2Ao7mpX6BoNbpRrVQAm2oUnQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj1hhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 19:48:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381120d6d62so1548528a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108123; x=1783712923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTaFds4j6VItza7UvAMztb4cdgVduD/jcDAbw1WAnR0=;
        b=TON8g9Mf//vGW18UVbXPJNHGbM+XSUnBfkqfM/Qwu+r4hft7gOqCa9X49LheSPDrV7
         t6SN9B1Sa9Tr0W3zGi5drJbRs/Cwr+MvC3DSntGWtjffn7k2bckBn0RI7vpyYmNUil2/
         R88Vuq7+cr6n1eAcUwr1ImImTvOBKynE/kXnD52aK7opew3CmI9bkIxIj5+yxwN+plxf
         GG+3cvigXWVKd5whEymM3/rQT4UZRdUWkBD3xTuBHFvwFwD437EZQZpEnSyz+UzXpjyg
         +AmnP3VJQKBSm8PkEdf1l+6n1DgsHAxzmIEYPl+XcqCPAHqBJ4764S8WR7l3V7XY9RSi
         zcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108123; x=1783712923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTaFds4j6VItza7UvAMztb4cdgVduD/jcDAbw1WAnR0=;
        b=Vay8039SVoNYDi/fUNHmsgWG9tBLXyXhqxyyJaxn9eWrhIi3paDiUHlwxn+ERyK/kV
         rtSgC2WvXQnwu9axddEwoUB8UZdp0FYexUme6xFegEKqHjA3ik0vAje7s048YZHXKer1
         xIoUFHkrB60E1ZbRVwsjlnPC5cmdlUZCTy36+0GBaG9PmB4z+WyddgF8mDhLWQ36bpuf
         +bfeuHqt6+tjvIbVcaZvkZ/wOy7CJPACUchmq8x8Y1KY/+lNyzos4jrSnV7tYBQW05Ax
         l1nCZGYIXN4Qo4r7LmgRmepYJ0o5+728C2u2CNHHUo5iuUnn4VkX3IYBbVXzh8/92nKw
         io4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpeM26zul474rhxTEwbLhAL+NUyEjbqi+VciQhrqnxK+sX02LpUjsXtwb9tHfuFGcZMkK6Jm9uvVBp2pe6dXNtC@vger.kernel.org
X-Gm-Message-State: AOJu0YzbNsSq8E3V9+vbjjfH632RhuiAwcrIwiRFscI/yGhIR4y8EdEZ
	W+gjtegSa3RIHHb2RjgzLsmN/KnHggevyvMwzDDQFEOMSAoDRSOlVDtPwikdE7dyYpaZe6/xFx4
	Eb9VobDdp5isT7dMsnLuc1EiQYiFCiT0fyRaNdQcEmjqXHbPtjqPCa3tkqD6h2pTb/hW3tdLp
X-Gm-Gg: AfdE7cnr97vJupWp5itv0g5Z03LCqBTW1Bc1cZSz6oj/sfKhxVWF+JEAVX+ywyXK7bB
	gRAt0jXpVGvCjotqhgffYOyngDkjmGzwwGg8vhR9iQtQy2ltu1z4udXxYx+dBphXZi5apWlZfAI
	yI6veZfwMVWC5UxKtlqKC2vGf6/TN5qUJ6rQN97AqWGdlghmcrx4vgmDBVvFMhtA8QDFpe8aZZF
	T9f/iyH5S1fWviraDEeLdpQMWNj9mvhi+xQ3jPIXIJhLtpBEKDM4yYjo6ANgFRqLMiJzLI9+yF2
	mT/DW88fBDhW/rlhB08X3W2BiBQXY07kkZKr4L6nPvklTQoak2SVXStqUQgx5xCMPV1UpQ2BZhQ
	vxWx+sqD3/g5prL8+rhgjsHPiWV+cRECx+FdDKA==
X-Received: by 2002:a17:90b:4a46:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3825c50b0aamr934574a91.0.1783108122658;
        Fri, 03 Jul 2026 12:48:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4a46:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3825c50b0aamr934462a91.0.1783108122019;
        Fri, 03 Jul 2026 12:48:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:48:41 -0700 (PDT)
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
Subject: [PATCH 23/42] mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
Date: Sat,  4 Jul 2026 01:08:36 +0530
Message-ID: <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX6P0fuX21Vhk+
 NNY5BM84+0tFDcfdHO850ibVYKUV+YKkaABLK72UZnFlVDobHBsDyVAjw/ceQ8bLXKOpabwERL2
 l/I4NIcSx7afs3BOtqiGpHyDBodYz70=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a48121b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=BxB3lidwPopAx76cZsYA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: sNLjMM2lRUKY9qNxIvQ5IFl_QlSM-MG1
X-Proofpoint-GUID: sNLjMM2lRUKY9qNxIvQ5IFl_QlSM-MG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX+hAVQ4C0sJqc
 kyvQpl40hevmoY9UK7L0J3jbYtQhcs2fDZaKdiPFJQi9kgTf23WqyMgoZdTu3BnIYnkzdHnorTH
 7x+PPrbUoqRc2MgxGNB7Dqa/syGUGj+JiY6KIwZnOSw4FWe25//f5jDZFiyssX0MQVtgHWoXdjW
 Ct9sJS5yLX5vM0CRdtqjuyNKmLzdhSNVzL/CIGu/W46YnSsgzcbHTyOqIoAHcQtdfp2W4b5nbB1
 a1ZVt8Hw7H2kqby4VW1SkUFcWQOfLmOo/daRKMxQPdZPNzRbabYSbNBL9z1bLSjmIC/6jUS5e6M
 mkmHbkAFQ8YT6sRBDCWa5R2KnHlm4rW9WdB1nvcPJFu7NCeIfCuaD7ggs6J6VgoEXGDya7XCE9l
 rNJsiJF5VIXh1s9NHCl0zil2VVt1j4Z7naf+yjU9fWIkOUd01OLYmC6gMNDV4u/3NvKMDQJIVG4
 UsRI8K+GwOkzqbAIQWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() instead
of the manual of_reserved_mem_device_init_by_idx()/
of_reserved_mem_device_release() pair, letting the device resource
manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-of-bst.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-bst.c
index f8d3df715e1a..304554ced690 100644
--- a/drivers/mmc/host/sdhci-of-bst.c
+++ b/drivers/mmc/host/sdhci-of-bst.c
@@ -405,7 +405,6 @@ static void sdhci_bst_free_bounce_buffer(struct sdhci_host *host)
 				  host->bounce_buffer, host->bounce_addr);
 		host->bounce_buffer = NULL;
 	}
-	of_reserved_mem_device_release(mmc_dev(host->mmc));
 }
 
 static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
@@ -417,7 +416,7 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
 	/* Fixed SRAM bounce size to 32KB: verified config under 32-bit DMA addressing limit */
 	bounce_size = SZ_32K;
 
-	ret = of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(mmc)->of_node, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(mmc)->of_node, 0);
 	if (ret) {
 		dev_err(mmc_dev(mmc), "Failed to initialize reserved memory\n");
 		return ret;
@@ -425,10 +424,8 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
 
 	host->bounce_buffer = dma_alloc_coherent(mmc_dev(mmc), bounce_size,
 						 &host->bounce_addr, GFP_KERNEL);
-	if (!host->bounce_buffer) {
-		of_reserved_mem_device_release(mmc_dev(mmc));
+	if (!host->bounce_buffer)
 		return -ENOMEM;
-	}
 
 	host->bounce_buffer_size = bounce_size;
 
-- 
2.53.0

