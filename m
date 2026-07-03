Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0E633F5B4
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 19:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108294; cv=none; b=SWnltXs8QFKR5sNVNKmWGOgVSntTFHvTxQ2rMRO2i8Lydoq7N0AxLA4GPTot08gNVqN01YvXM/SslPBGM9JadJEc0GaksBroj0u6jm+ZI2g7VGnO0cSwj03S7zxJx/h1a0aznHsGD4J5+n0xOOYj3BadYJcEzx+YDcFjflVxmiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108294; c=relaxed/simple;
	bh=xodAhjykuWl7xQ1UdgzLNcKCY0aCbpXjk2b7LKvOUCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRxFWaWs8ei63ufCWRKfHNAS9fNIiVZbRJHLvRRgZNB/KYiEDeiFSgwSKdlFgKcRmIlfw9TooGVQSi95J8l5ig60gKmEtbMEu8OoihSgBqPBixnLoaOsm/N6aOPQ93Ye7uBx0WRnn4AJ+LI0b8RcxmsQmoQ0s0cxaofLKPOAchI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0HtX2hL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvrOPvXW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0HtX2hL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvrOPvXW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiIh2677630
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 19:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u+7rJ5pi7vc
	jWlKDY8Vdn8sewCr1uk0qSBX0f/87mts=; b=H0HtX2hLDru8JMoQArzbaE5LOfw
	0PmOhP+7x9PpJ44C1wYElB/pEE/AadwSvdrwi0uIzZkJk/QMUX5DyU6x0o7BkRFk
	8BJpVSuejk9iXVULoRbC2X6gud1gTQ4xHn1YSU9/IQtx4Ky+EWzSsQmcA3xp/pC6
	+MnOGJzMV0nL+VUgoZbFhVvPmVMOotmHWORnNZhy7/1ZGREbb1EnOprFlXUDAVlN
	RfTVoap57G0Zs7pQbe0oOXHWnxLSOibADzoCmaPEwP9yIk12i6WygXVRdg04GFoO
	P7I/gd52Ko2ce8DjPb84hpH1LvMNhQUKCGrtABkrlazO6G9itCuO6l0h60A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u32kex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 19:51:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c7cfa17fe6so14439315ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108291; x=1783713091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+7rJ5pi7vcjWlKDY8Vdn8sewCr1uk0qSBX0f/87mts=;
        b=OvrOPvXWQ6HgNzE91sjmhGZv85YFCHW2MRU59rYU1n6yTYMPdSD4Rbx3h/xdhsdho/
         wLNeP3xFgLjlE3jr0UoOhkrHtTIe9jFAAf1xFMBrJ0cyJxs65sU2rgraakwunK66OAVL
         6/uPfRoFWJe9vrIfsOFmQ8bESLkgugLi2ha8s7ybumeJzymgzZHxNzekiWyPxjBEV5h6
         t/ckDBUQ/apRt6DJa5tAj0vQg6qSZ35F2x8FvZLpn6oK6lAXihiALetXbfe1mVyXimUE
         ZqOkG3sgY2KaDf67enASbkpSU3u2hsBoNQY0eVOIV12wsprgwCGXt/IwwNenafiusg80
         ZoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108291; x=1783713091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+7rJ5pi7vcjWlKDY8Vdn8sewCr1uk0qSBX0f/87mts=;
        b=LKucDZKDVon16S/f2S73qVeSF6TTOl16KGAyR+RICF6pxcAvDXH8qEwkMiHyA+XSTq
         D39MmmYgKZJzNFqrX/BB9xe25DOyAUeglu7cOto9ka9MhhpySfpH2IciGYFDqjTC8knJ
         RFll2wZSTz6uyY9V3DShUfjGprLtvSh2okVHhc3BCYOAi0aX7QoBZGoBt5utYs/8BCRH
         Ic4KuJvWdVG2wuhudFrzqsIOu/WMKUMX9Mi6CXb1qY+UCqe3YiuowK37yQpXB3DjM9XS
         JKYBgK5p89BvrcaLYlh4j3nLTcB4Oion2HiaCLea2tKhsWsoUXvtqCzNazA4a9ypNbCl
         7Xcg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0OhkNk0TZ+/ITQFlwubIgdNbO/cTM7goCBBfAxe6HHAH0kxvdCtTPkYeZyyeLHqKEVQ9W6i45/CX6x0nhM9DI@vger.kernel.org
X-Gm-Message-State: AOJu0YyilbL3e7Zm6BiAJmEFMzRGXHSV+a4LxHJVylEcQel+DcFXL3bW
	bktyku4WnZDLljbtyogBvHkX79tseMoqzPtZAL6IXREzuVhQ7q2/a62JGq7pW2i/p5eJDaNyqOm
	9A4kFjcFDr0N2IN1OBmhshH3Yp339N+06UukBYPRG1aafuSBUM5/2cgYoIziZVHDxjE/qVwUf
X-Gm-Gg: AfdE7cl3WyOpjRCNFBo0ecglnF9PRfSn4fhTVaiSSojcQe/0QkLXQbNTmjKRcHDiZoF
	BbWbh7pzb4KgZ97ZWQvKa9fQPdOc9obGZK379Xm+1FpcdoNwrc4hCd9TSrJ8KR5dLI7efA+ROQd
	jO8v820J2AKIj6Ji7dh2E2+coGC81eeJmXEPpdc9S9ab6atjUCaExqLBiNGe4oiHlGj4LJbKDpP
	mA2KOTrgj3bXKu5CimMbobqQXsJ0EClag0cwev6ixkQKEwRy5qwhMfFiA7p8b4sb6RbOGE7PmIW
	H4W3pijuOTIZ/fxeOPuMmIbVsFt6y853qVk8hWnK4x/Go6nukDq17SeR++Upb5IWDJJfX6OpueJ
	z08qf1lTAc1gKnZYbRtN1v/FFGPC/GxWUgTKCMQ==
X-Received: by 2002:a17:90b:1845:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38280d98d29mr843461a91.11.1783108291244;
        Fri, 03 Jul 2026 12:51:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1845:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38280d98d29mr843393a91.11.1783108290587;
        Fri, 03 Jul 2026 12:51:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:51:30 -0700 (PDT)
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
Subject: [PATCH 30/42] staging: media: cedrus: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:43 +0530
Message-ID: <20260703193855.110619-31-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: sayAQ13CRHXlzk3Kk7avfjNOxKC-9Z0O
X-Proofpoint-ORIG-GUID: sayAQ13CRHXlzk3Kk7avfjNOxKC-9Z0O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX1wPe88lKBa4H
 l3IQdPkDGjRpRFDmQgXns4uAzpGglicT+5NahCxXPB69zJLNZcktiYMyt81oS05h6QpjK7HcwMg
 YgF474uus3wEkL7qGjrdbmeRDRigMh0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX1Aoo3hq0VXL9
 yYndrltE7++jY2k05btgDqLuPNnaKYGzaC22BidSl89v/boMHV0C+MDR7124ql5QTGzaoCUVthn
 Hpm/TwcgaJJmvca0Q0/qVfhGAs6FvJgD2MIpkt7wmKIm/9fCS+fUi8FsDPIUvLGbYOqbZelPMZP
 l5tGjjd98dWcXjDXwbzDHoAxQuIZl/I5ZEvm5hROc121WF9FNpxQ0jWEdVOwpLEBkW3GH/+4pAR
 /JxASf4yCom5YKIya0GS5V5fA0HrNzb2ymtwS0IU4MYksSd3q9RTSuXkFyg5uWDDTug9kO60srL
 tsEeyocw7pLyAZ4aYxKNXmdOPqwCsdW0fWh2jwrIk3kuiEhfdD4qh5ZA5wsDIqOf5LLACsJFEcj
 oPasTFfIbyj6IrzocnX0MPgAVdEGYZMNI7nQEmeoU4/d0yiXxUBhmWz4W9URvY9FnE5uSysnqYO
 FwdGdAzDjxPkp9zcynQ==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a4812c4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BsJah_a05XtIl1EiQYAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030200

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..7b5aa94064a1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -266,7 +266,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return ret;
 	}
 
-	ret = of_reserved_mem_device_init(dev->dev);
+	ret = devm_of_reserved_mem_device_init(dev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev->dev, "Failed to reserve memory\n");
 
@@ -341,8 +341,6 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 err_sram:
 	sunxi_sram_release(dev->dev);
 err_mem:
-	of_reserved_mem_device_release(dev->dev);
-
 	return ret;
 }
 
@@ -353,6 +351,4 @@ void cedrus_hw_remove(struct cedrus_dev *dev)
 		cedrus_hw_suspend(dev->dev);
 
 	sunxi_sram_release(dev->dev);
-
-	of_reserved_mem_device_release(dev->dev);
 }
-- 
2.53.0

