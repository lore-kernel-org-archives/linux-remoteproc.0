Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F261E3A48CE
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326767; cv=none; b=KpUyY07tsXmR+A0fpAKxrze1+IA+VGLKowlIQvePYi92We5G6Ag2MHQ2S5K1rniSDOG5KwBLwy9jSvfgH4S6jUe6BpVvPLUI4bT9hZGeNC9NicI/+31hDu6bot5AZQzTz7dmyZJW1b1ZNpG4uiA+uWHIS8MPDVBfOMZz3S6nLgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326767; c=relaxed/simple;
	bh=BOh+Hb4ZxI0byKHwLdu1YMSdOQ8nQdY5hZERfclrwks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5V7KWhliemcSM7TQfPZPAiRtgv1TRBCnwBODTI/w2TveVTb5+9KHjf75cpZSCMyhooYLJTx1Ng5z1Fib/7MQIxaelgXStThrpE63kciwbzGh6m+q2phw6Ro46i6WK6T5G3hJWV2vkufLF6EmKWjte8pM+Lnqq1Fj6DMlKVsa80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tt1g9aWR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrwL+YZJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt1g9aWR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrwL+YZJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641U6K3623853
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 08:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=; b=Tt1g9aWRdhyI3BpO
	bvxcoGq7kYOipwI8sI86zxkmNdiblCbEIIy0D6ekqZISLjLM2a33y7RzY76GbicN
	Opq7MS5ZQyamKmgeZkedVYAFfw1KRPYi8hl3Y7h7kuir3yf0DUot7pMFqfcV2RX7
	X6ly6HXPcg70fqU+dH3N/iuMe5KE0DqLRF0s4qeJ6w03zgeEubZlkFJyH6FDUo2t
	Et+Ig2j6kpZC/v51lNaj0P+xbzzB2QuKkvGbM4AuZdQSxZloAH/4eroeiJwOgPxx
	kOehTF0x3+rZPy9CPDosN5R/kMP09AyBofAR6Pe/VMGVWMs1S1vCPm7OD23UZkSl
	ZSPxow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swedx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 08:32:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so6470551cf.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 01:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326758; x=1783931558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
        b=RrwL+YZJ5eYHO8zvSFvL7oh+HhM3IlZKXjVA96grBUP21/5vvLDpZVi6mGocVpMVQI
         En4wvnUBpKsKdPUB6cbY8Eg3AOX/dzi+55OFQesuE/nY+nJMBtKwIAqNLcCVhqWr2ZBn
         5iU7rZ/VBeb0KW7tOZO2GSrDuZESmXxc+tdp3RGGctNka9DcihahQeAqVo/BXcPKSeAR
         NtAGhq2JGqHVbqUD7flsqmYYU1qjZJ8iU6vrYotu+Rw42K3pbJiiOJ2uNKGY6eMtdLgZ
         4BJRmb6wxhElkHOGHwaV/t+WTjDFDdYLQrCsHRLwoR+CyHfufqXItcFLQ95AN9vTkw+e
         hB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326758; x=1783931558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
        b=aitnuo0oF7wu0e+kV6WsO8RbJ8GyUVpoEddC4GSia1tCf+c3A3EcECdfJZYrXW3qEf
         NjmNlgHFfKmSyDnaxHgnG9O4Bj/k4w0x3BRNGYrDcwzXIqJgrSg54aDT97bMKw+Rn0t1
         DphoLwtpXanENiLpea/BSnGwCI0gHkVY5YIpZasjuQW0a+mlfrsWjFAh1krmuANH2E7i
         XWGmJekVD2jDoDdHSz3b3EzRQwFa6PR/pF5LusN4dwh5KnMUiynhAhWEVK7ZNyvWrLfb
         c4xtJJRiewEtbVCc8/FBVCK2mGvytyfzhQ5EsYtgxngR4lpZmFRpebgpN3knkFi2bwaj
         /1Gg==
X-Forwarded-Encrypted: i=1; AHgh+RpECk8mVmwBLVvIvX9Dd7+iWxPtD6hX1xTuxrKUnm85+IAnC8QWPPoxq/WhfwT68AMKliuEttx6fZlpyuokjF0g@vger.kernel.org
X-Gm-Message-State: AOJu0YyCpRiIVrOjZlFrClO6izgAbNF6TQ275j9PFM0BzriyPrBmwGBG
	CvOmTJhSRLnbAdm1HbrxJGTywhOsQtx3uJpYSztbWIa+5GfVUsKyHfMIRgNIej1Yi8gCm9L9/Va
	h9e50lagcruTPnUbVgIIlLAOJBzDNZVxxwzmV5fQF7mzI6uFLe6eZH7h9FVnz6yJ2ozw/cKnB
X-Gm-Gg: AfdE7clsJLV9hDam3zG+Nec/Q0vrohgPz+kI0jV9M/hnt6IBlKI5c47NX89q2RHFXcn
	ud1EpkfQCYVqpRJsvgzFjVEv7flXJd+zxqaL9QMQBDCOWysIHCs7OgKPYE1yNMcib8mFEp7MbES
	yIspcbdeLIPzSEgnQoO5Rolh0jGz5P5iIUltwMmF8Tx8MGGROXrSMrODrZLtncdrBzbnF38TmkW
	BJyntKOShWZqg3lQZh4soYBCY7RvB30gIGr+mywrZ/tnP2mDXERn0/gJwQYZcoSbakOy0w0fgqf
	Xc8qlD/GK55pnZ81U1q2ZsIqhTTeJLI2uLSDj5xieLnD4pHhhEkYsPo5lgf/UKRwOJBm4NafXWQ
	FobcyL3Hgx2FQNBm6u+EUXRqKIHEcQ+Uy8mg=
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr79016471cf.5.1783326757956;
        Mon, 06 Jul 2026 01:32:37 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr79016281cf.5.1783326757507;
        Mon, 06 Jul 2026 01:32:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6093786sm694743966b.20.2026.07.06.01.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:32:36 -0700 (PDT)
Message-ID: <f1e7ef14-7186-4854-a832-a34596d3313f@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:32:27 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/42] firmware: qcom: scm: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Alexey Brodkin
 <abrodkin@synopsys.com>,
        Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
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
        Ge Gordon
 <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
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
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX1MzSogRtByMI
 /dd4FZKqPEJwkckiovfD1zIntQV7FphdmbIcP3LOd3XykPlbrJsLb+382KT6iP8u6UlbErTzW1+
 XbQSeFBJNL8ryA7df/lYiuchok7XUqs=
X-Proofpoint-ORIG-GUID: sthoHvexk4GfrMkWb8YWFbL_jRXtSlEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX72uNl+6MAieB
 JDp90K8DJARBITljsIk7vnY+sYEVzV7jfWaNxmdgnexEWRc+NHHVEAajkqBJrVbCktLxTSLc3md
 O085rSyWic0DNE3t2Wq+1KtgXkZP2mWu2CoqexUhJQ1QacAd5ffwoxQj5V4KLD+FVTJoYSIYjdt
 ujjb5CnNBystWEwFCuSYMopwDGL8j+/u/1Q8smhPUPhwt/m56czmvYspjPM+Tf3dIQAnjWT1GrU
 f4oTc8agDZi6cS4b4n0ztZIMTNNzUcRjXlupWrN7SLFVXzILFGMFCKRO0t6Xx8XEMzSxSt4hpxL
 ryIO56R+/Aly83Nzn+wr9SumeEtGJlcvMMATJm8BOxPasAa/5FZQhmptm1UjSsa62WDmLO1WsPa
 16UjS7Ki5uK7fAmVkaqahZnlOuh9Dj8co2+b7g9aJsO5r/+nExoSLbvPTBL5S6tt6FFRMSdykrw
 e7okDmr/7gEDvwaakNg==
X-Proofpoint-GUID: sthoHvexk4GfrMkWb8YWFbL_jRXtSlEO
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b6827 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7yxQZbK4ublJ3xJh_1MA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083

On 7/3/26 9:38 PM, Mukesh Ojha wrote:
> Switch from of_reserved_mem_device_init() to the new resource managed
> devm_of_reserved_mem_device_init() so that the reserved memory region
> is released automatically on probe failure or device unbind. This
> eliminates the err_rmem cleanup label and the need to call
> of_reserved_mem_device_release() explicitly on error paths.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
