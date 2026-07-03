Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01041330B14
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783107737; cv=none; b=D3xcR9UfhOIDq7Hy44cpEOepWn4inXcus9T5jcUbnVWShi+MjtBxsk0b3Cxl7YMq+xI2WKVyATDvvZTeLMdTSkXhCRN1bOEAO1Ls9w0R4IH4qg24qlkf2LeqZ6f+APUq6wK+kCnEMlJ4ueTLZNVEhNWo59BzqVhJhoGDgsxBaEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783107737; c=relaxed/simple;
	bh=tVq3ml5TJnZAT6aj46tV37eRc8vSQAjGRbxPs8s3WzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCYYUaOtbUYwQ40k7p1hM0EsJ+xXDTrIYdXP6Qa0+5KgCancZLxfRvASkd2+iQhvj8c4Z1H0PfcN1zpOvU213XvFWbpmSYG0oL1joFAF0+XWUp4t4IGo7iJ0KalZ29xIjPSIAhQzG9UkhZV/JemRj1zFshVljIR+w0Z+QE7t+6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ri6qsvH0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1/AeOSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ri6qsvH0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1/AeOSj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HiHaL494256
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 19:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fk9/GLsPy9M
	HMLueq2DDIsdR8wBa5mOqZj4lU8apFQg=; b=Ri6qsvH0IQB7xkBldT85DbEuPR+
	V38c/QBjrTx3QAafrYlhGfVLLgywea6jC0l65ZPVm+U3OmpMLlZ2VV+buorCWD04
	bPspMhxpQP3PxJgSkqo5xItrUqIdk/3FX8SpHBpXs4HooIhx3sX33Vm6KIAIvuuO
	V+zfVc1wJpwX93k13QZzhz9J8673uBXFJQFPim6Amvhm2v5TN3gUh0UgLqfi+nD3
	BBivAzeFqowQTT99u2jDYsv71gJbnTCR7VBBQLywg7pl2+GwxpAmKoOyAAxYXYRC
	H0KctSWMLFGXaAlJi6ZSIXtE97kU1lZAseBWBP7EoFJBmuUPuQyLsm2DrLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytkrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 19:42:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fc66ee6a4so1459552a91.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783107734; x=1783712534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fk9/GLsPy9MHMLueq2DDIsdR8wBa5mOqZj4lU8apFQg=;
        b=W1/AeOSjrTk8EsOuyoajchk9r8job3ND2jlKqh+1LGlGTbGDqsbUKENVY4no1/SbVE
         TTTfEVnsPBNCopKbq9MQBW3VToXKVCMB2njJpPSAN23uPAcBdeuKWPif1V0MXlwR9m5b
         kO4KB4ww8WGnSEJ+PIwtk/Ul736hcai3JTLr3Py/ktqXoa8OfQFsL4WPLqSmk9ZlqkPO
         gmfgzh93Fy6uTJB8dQIehAyIIi2kyF5sp+uDVpFbpts6yD4UlCvd9wAHconubFiRFFOi
         z3HzbKworvTslHH3ywxleIM+0FMKFPV11opE5ESw3e6cg+DXgRTA2voZt5qvnwVjq3T6
         UcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783107734; x=1783712534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fk9/GLsPy9MHMLueq2DDIsdR8wBa5mOqZj4lU8apFQg=;
        b=R8tanOrUo+NkEXDqUFHCSY4l5hdy/mQfeuZRpH8p9mlCVEhhNe+KcL7s8afGBZ4Myf
         PUXJNK6le1461K5uV4hG38CTrsNHjZyVEpBGwOLmeevULtXIfd1vDJ+eBJnr2/jR+nC+
         LjCjnL4n7m03GEO9YwxGm8XdWzwHE7AhgtkdozqCe0qL0EORTsyQwlrMamxwXnllTmMG
         ajW2e1NlBIj4jFMWWs1iybp6RwXlDt04t3meZz7ae/S8sP1JstKh2MOJrOGJCKK+WoOe
         jKDWledYUNuxz807Vs8p77YF4T36chUndpLsrRLxKsWuB5GJ7Ecu28AJdj9YFYxXmNm8
         LIdw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3SKQ4As+1yyXJJe+5208XCjnKDGl+8h3Pnbjv/IHoF7GFqLZ2KeWNhiPGOKJB/HSj+qms/VZFsDRFfSokA4FI@vger.kernel.org
X-Gm-Message-State: AOJu0YzPxCKNlrBRMqUw/o1jC917lbZV11vSYZ7ZX6j7xGgxdocIAwXq
	cHUzbRBpGlCKF8os83V/SEV02NivY6ARFoITcnoZ+hWuY3fEOazBtKoh1rrAIDP9KXAOZOsrrSF
	rqpjb8L0OYzErzSHjSTmkTOKSg+ItiLd4skiqPB3m14xnEKPyAcOy8DjTijiDy0n8Wc9j7PlT
X-Gm-Gg: AfdE7cmsfGWFnvotwBsfWy10zH6tN4Jh4BrxcpOc8YfYFqYmRHVH1qjsb76p4fR9bpP
	uUGyeW+984jKwjLvo4lpkhaMqpkkBxXmyDSPnqxBGe2Wn1ut6LH0qFTP9nOYtfg27wYsvj9Fdcz
	0AajooIUv8MDKVgEMjE4KFGJFJynLH5wv6g9kNxgtHXm/HLD/CWjSFtVM7VkxpaZS1deX+QQJ9p
	iIoY1XTfKvK72x53O4kilG5OWGEqKscg3xHZPty8rQ+5QztqwQo5MNnMx17MNF44QWEh0hyFdst
	izusf696rlCg6fpkMnuLcXSNEQ/h6/B/aObGrlYE3AmIlTdvZYfd9Ca9b7hEKdkko1eUJlG6v3+
	rlwhsIpKhB2z9BqfUxdcslY2gMwa7BpgHrOVLdw==
X-Received: by 2002:a17:90a:d408:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3829e933299mr718633a91.20.1783107734435;
        Fri, 03 Jul 2026 12:42:14 -0700 (PDT)
X-Received: by 2002:a17:90a:d408:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3829e933299mr718564a91.20.1783107733767;
        Fri, 03 Jul 2026 12:42:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:42:13 -0700 (PDT)
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
Subject: [PATCH 07/42] remoteproc: omap: Use devm_of_reserved_mem_device_init()
Date: Sat,  4 Jul 2026 01:08:20 +0530
Message-ID: <20260703193855.110619-8-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX1vdtnBHDvIOq
 7KEaFufW1tc+RW657fvIT68h4C75NyJf1uBpl/PlOCHrjy1Pom20un3Ml864SIyEKGq1W1iIewe
 +pZLcHuCOmUhkrhcVVTxX5jo1yaMNI13ZsudDbtazrcaTGJDy6hLXqQKOO2t4e6I7F3xhKd8B8d
 5TYBXuCrUs9YyeZ/lHQnzWuP3ZDuue5LA6bBP5FhRKB4wkVpfPXZwlRLqNTWGj9lifezQYKqP37
 VncXCLyP7g83BSlqB7CF1nzgrYVcBISt6sXPOEFTss85BcghXsswNB1VYEMvGZnAqZyKVRIqpDH
 oR4VEoQPF9M5cA0sRpwth1++FoFdKJla9eG15+zZZC2r+lPt1xUQdYDpcyZDY3TmXO6mDlRVplw
 cpzX0Pr1zBXVYMUAkdrHXPxz760/LGVz3ToLqtzNx3rj/hp2kpjTTZ599ceVE1NRmtxiIv9WXi0
 0l5+33akbqrZil9x6zA==
X-Proofpoint-GUID: 0UjOuIk3V8E_34vdWBbb-QY_zrNK6_BU
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a481097 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=NeIE-sOIGFWZl2hhsKQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 0UjOuIk3V8E_34vdWBbb-QY_zrNK6_BU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE5OCBTYWx0ZWRfX/2QRUq6Fwwzk
 A1pzjBCg8Crt1OXniU78ytutEIv5ikjodP4peSlrGaE9NaemfuPCPbeqh5w8cf0bHEZ2ZhrNA/G
 02nqvOG+YcFzCd5jVG4iy7mrx4Mgrm4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030198

Replace the hand-rolled omap_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/omap_remoteproc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 6ed0f28edac9..74262f873d40 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1276,13 +1276,6 @@ static int omap_rproc_of_get_timers(struct platform_device *pdev,
 	return 0;
 }
 
-static void omap_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int omap_rproc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1359,15 +1352,11 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	if (IS_ERR(oproc->fck))
 		return PTR_ERR(oproc->fck);
 
-	ret = of_reserved_mem_device_init(&pdev->dev);
-	if (ret) {
+	if (devm_of_reserved_mem_device_init(&pdev->dev)) {
 		dev_warn(&pdev->dev, "device does not have specific CMA pool.\n");
 		dev_warn(&pdev->dev, "Typically this should be provided,\n");
 		dev_warn(&pdev->dev, "only omit if you know what you are doing.\n");
 	}
-	ret = devm_add_action_or_reset(&pdev->dev, omap_rproc_mem_release, &pdev->dev);
-	if (ret)
-		return ret;
 
 	platform_set_drvdata(pdev, rproc);
 
-- 
2.53.0

