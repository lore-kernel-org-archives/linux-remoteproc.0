Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1797940A955
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 13:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343819; cv=none; b=VfHMAoDtLMmAba5eMyHbcOL8PjBhogO7D+NhduatVjxrOKvmr16cKEpT0df5HdEdcGUJQD9GPusmBSZrF4xgMi1XyNC6cxbx42loDxcbU/wyVjObAWLLa/SK5mnPtnE6X2kvjOOtFoClqBKuhNuDdy5FWHbd78KPnpz5S5LtX88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343819; c=relaxed/simple;
	bh=osYfKtMdqTMsFlJUTP73i98DkAo9zxWqgwDdKf3SxAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyPQqpQF82dgdwfr85++WUdD9qikJzYS/GdiBG7kZ4hsHjQzxr5C5d95m6kE628G2Iw5+oyPsGKRb4CtUaTpoHkkUKG/nZ/Z25ETJyn2rACTj2DQebbgJV/220cYwrJT3OGbZkqgHEfQaMdiAYBZ+xgDlxCE1bskda2fmt9lGuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxURCHyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSLydRiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxURCHyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSLydRiK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxXua175088
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 13:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vz86zd3go04za6BKCrEOJJ5A
	QbsnL3kIqNm4xRq1ahk=; b=gxURCHyC5Uby2DEF/Sz+/5yNg3sVS5RYamD/XHiq
	Oeg+y1LJwkhEFbOaeUT/NQGKPdVK2zZ8VlG3hv6H4S/me/nezIWTxoEm9In3Bs8g
	ZvdBIq0+/gprmciBEXPztT6Da/pNCqKAPXP77qtywx46VRNq9dIbfHagzvAaAEIl
	E6hG0pwACBSPp2ODRqZ5jgVnHaYTwWXW8Uuan0qZj5WO8InmLPD6We8EBKixryDx
	iPil71OMzHER33szNYpl62CNRKnWkJ2P7UpjNxjXjQ3Ou5rCnNsvVYC1bhpBPa1w
	4pcAqdWpoDmeLyJqbgihNBYMa0DBssjFzMUnNnE2Yj0Udg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxsdx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 13:16:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38108fb9d83so1962040a91.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343815; x=1783948615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
        b=PSLydRiK2CDkWpT4WyX5bNVjKC0Is9+e0DgSPd47JnLRGDbMCaFeSwtvH6e4S7HXQ4
         L2ctbF95R+K8dxA85tqd2kIkO+vq9dSsx5MkkFH48eGdJH2CYJX4oD6RskkwmTxHmeOL
         BTH/bd8IPVyLaFLlidF8lufbYjdP7IaMSkcUZB4u4tO5ZgJPUjxDtA4HbhNI90523H7B
         YWne1O2XGxsZF9D7FtQHbU0qDGXg6YN3n4h219/POtajnqIeshFrWxMPk/cTZC8chVA3
         x2otchr6MFAblBuP3TbW4YeP6XfWCth5L32Hg7asZ/HXvZCp09pfzPZz5U9cbvBnk5G/
         wIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343815; x=1783948615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vz86zd3go04za6BKCrEOJJ5AQbsnL3kIqNm4xRq1ahk=;
        b=sPYK3SZnLUgx8XABPlaWl/6j9oHrGOhcWpq9+gYwNE62M4VmaXqe4G0jRVgC81pUtZ
         dcoohwaTNDNvQsIiCUONIDxtDE864yXuo3Bgbt9Au72D3rhQiNPq3+OsEq8SkKziIG/U
         8DgOySC2eh9PLVtkLALH17QRTYAoWH5/p5cU8TMNbbhOkQ8B2lnPi5zWATO95PwTkDhr
         vBCa5pWTscL2zvjzGBJpfqCpUeoRtgFKVU0uqJvBlMCExPy7YHH7bZSxndawpZN8OPbO
         GB1J3O+4SdWJmSk6MrT/kStd8bucXx+Cvg70YRMaZEM2rAEC5fev+KLFsXRevs0XMPZS
         FREA==
X-Forwarded-Encrypted: i=1; AHgh+Rq17d7soz8pvfZCptLq8a/kMK7kPXHef7QJY8LXJqhkLnjpZUUcBy+TvcaDxITqNPww7fGaE16SRn8/okLadw7k@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1z1KiNk29MDvx9bn4WzC5KyRiScQ5JvaOqQJo1uoDw7ocA/66
	moGDXDBrcFtiNOO6DbOum94NWx3tuJmIwIEc6c49G8RXYBd5oxS9kkQyXWwmY/JsNCc3+jH6Phg
	wcrNx28qgukvUbYlK/HWZZsg7I+NPVJdGzGhjrudiP61JNWXjL/NnZEldzRmA2sS8MAUe1/A/
X-Gm-Gg: AfdE7ckydRzScW9UlxFKs65EAXxpFZFseT5v/kPhT/C3MnxBVOANlYT5SoMRTgthYPQ
	IT7xi06aTh+VliU4P5B9KA1eKVYc+0Ljw1dnD5LY4JTjrMYkt9uEgZvapPosNhTEEf7xFFlbX3h
	ByMQT93e6vr+H4VGOFK1+HuOPPuxUZNmDZI17WFIUTslarnUHOC5lakejS1yU0M+ImGmNMQubl4
	mCXeQEzYLwbLuWi9bmfDwlm5aiD6z7NJj9qOGgHJmBbAKJO4az2FUKhP7mqK8ChlyqGA0ATAha1
	4gYSWQnRJgm5gUOQU5KPQJb3W165+CE6hC7dVum+LRSVnA5zlGjNh73YVg2EbOKk6xIM1CEPbYh
	+VnPprsr1NLif+pIPPYrJv59/BVeaUOtxieCrtw==
X-Received: by 2002:a17:90b:4ccc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38755769514mr376391a91.11.1783343814426;
        Mon, 06 Jul 2026 06:16:54 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-38755769514mr376272a91.11.1783343813871;
        Mon, 06 Jul 2026 06:16:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311561dd3a1sm16176449eec.22.2026.07.06.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:16:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 18:46:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
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
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 00/42] of: reserved_mem: Introduce devres helpers and
 convert drivers
Message-ID: <20260706131625.nygqmu2usgifmias@hu-mojha-hyd.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <ceeca378-3c76-4b2c-81b4-0ff1bb1e99be@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceeca378-3c76-4b2c-81b4-0ff1bb1e99be@sirena.org.uk>
X-Proofpoint-ORIG-GUID: cxfyxPmySH8QLfDKxjftDgV3OIXXQlF0
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4baac8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=1XWaLZrsAAAA:8 a=sOACTKiIrrgCOb8DNPwA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX8GTkOnBoR6/9
 0KB1gIangUyso2ktLrIHAXRuYOnsNLXgLipsXd7hGFQt1uAAm41gvyD/jwb6vBYPk9GeeCGaKim
 vuHya9u2QpFQZivASlj2k9B3OY+eJu8=
X-Proofpoint-GUID: cxfyxPmySH8QLfDKxjftDgV3OIXXQlF0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNSBTYWx0ZWRfX25KqR13XwEPR
 QtSStik091qozihjUuNq2/V5qu6GaHXpr2GiyWZ7+74RkMhCRIMj47velkHKfokbm4SPIUj+cRO
 hPeLv9ylCaor9HyPY/t1KKgbDx5iime/gU1ZoHimpogy7DnrhOM3L0ihP1hOECEpqnQuNfbyBoE
 oCkBRKqEeWWdv4bDDqb2xhrGPzPh2h5naizb3HPHAOafmgOZQpQCJP4FVvhcFRRp2i0ZGe0c2Rq
 yu5yaTtODEKpJUnKmdJPE01TOiVaNt0JmAG2xwyAUVW58WEb1DJ5QAeNeupdoqTXOljyb34cq1p
 djkstTxOfotlSxXswPntpIbl4fnaixsvpdl879oC1ZjkgMGre8Zp5jHIOZESsRuaisqFx6LkEUm
 AgMCgWyFPmLmfYEky5bee/WWRBFbpMp5tlQSB7OBDiISFmqrOHPchPBgxJE0WtDn8eISF99lDgf
 JFfYG1ACzj8ga5+3vMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060135

On Mon, Jul 06, 2026 at 01:14:13PM +0100, Mark Brown wrote:
> On Sat, Jul 04, 2026 at 01:08:13AM +0530, Mukesh Ojha wrote:
> > Drivers using of_reserved_mem_device_init() and its variants must
> > manually call of_reserved_mem_device_release() in their remove and
> > error-unwind paths. This is repetitive boilerplate that is easy to
> > get wrong, and several drivers have open-coded the teardown
> > inconsistently or skipped it entirely, leading to dangling reserved
> > memory references.
> 
> Just as a general thing, rather than sending a huge cross subsystem
> series for something like this it's probably better to just send a
> couple of examples, then once the new API is introduced and either has a
> pullable tag or has made it to mainline go and do the conversion.  This
> avoids clogging everyone's inbox with very big serieses.

Apologies for this; this is my first series touching these many
subsystems, and I also learned the hard way when the entire
series was not sent in one shot due to the daily sending limit
via git send-email[1], and I had to cut many cc lists for patches
33/42 to 42/42.

[1]
4.5.3 Your message has too many recipients. For more information regarding
  4.5.3 Google's sending limits, go to
  4.5.3  https://support.google.com/mail/?p=TooManyRecipientsError 5a478bee46e88-30f0bbd2362sm49597158eec.20 - gsmtp


Thanks for the suggestion; point noted.

-- 
-Mukesh Ojha
