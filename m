Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA16217F29
	for <linux-remoteproc@vger.kernel.org>; Sun, 18 May 2025 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565889; cv=none; b=jKYde4JcCbXeU3Mac7waRqp1euwbIRahSLtwEQRRtHw78PCWoswlAsSNk6MMz4S/8hLr9v0YIFvTgY5LCSnXVwEw6SQ7HlEkLMM6Y0m7tjx50LT5V0UilqlBKpJ6Y8XwLHmt7VXl3JgUchcvgTB52HUz1L3hOvJMyMQnvkpnZnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565889; c=relaxed/simple;
	bh=wbhMWuxG5fh3NDb+f07MwU3tcgUMddB1rGVGfxSrYiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXQLy9qLVomRtG6AF9Te/O2N8jleFNsvCD7Ec6gu5l2XFhz5SxiaWbsg641tPiMboXnnNrhVcHyICgKxYZKS09CreEfhD2d9iW+iNWZutAS18cywlr+qXagBqWlzw3K0DwoNPVByXLosrwmpdqZEfUyEShtsOTBDVLJiILeXO0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/Ci+QC1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/Ci+QC1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAlPRN014049
	for <linux-remoteproc@vger.kernel.org>; Sun, 18 May 2025 10:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iLdOutGzmsrt/UF3NVdrXkuj
	TR2biMWYZW1VWeAAWwE=; b=S/Ci+QC1+0iBsLFf7DzO2GXQETx5bSH6UgZDXNEy
	KVA8IstrarqucPPxBX6C1NdamZBL/r/ryuz7B7PlYtMmBcC60p0I0SwT6pp3jCyW
	+/HQi3YaPXPizOpra2fJWbXaX4MtjOVIPXB4Lj3Tz9xvaBYpM3O7Ad8KprxSokkL
	BqrQr1sOjfdx/JC9leYr1sIKLxcIxo5vKYAprR/V4jG1ikugff6WeaL+ZVhOBlA1
	RsA+lbFMFaPFJmShRI4uWMJVAc6Q01HY4GIN75fAsdU7+QXW8Q1A4ctDEo1JZUjr
	6t62U0cwHiFqBR7ymM/rVnvKjfRZo1+0ET7N1FRK6NMC3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp31vm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 18 May 2025 10:58:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso37051566d6.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 18 May 2025 03:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565886; x=1748170686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLdOutGzmsrt/UF3NVdrXkujTR2biMWYZW1VWeAAWwE=;
        b=sPO2cX68/qT/CpV+O3ilyT60Vod8yyaOnLn4aDEVofqF5m//iAcZI8LyonS7jEVWfh
         7x1mVjXoyEPngUkTk78K8WkaorW6Bnm1QQE4PDj0RfO5/PpmAGBxaCYngzx/GIzdKRW0
         gZxgRw+/eTBsylXdh/oX4SX3xlPHCFiPGjLZDtnG8H/Fe/3F+MaApmK+W760J9sK32yb
         watNI529KehM5MupaFXG6qwl74FHX/KLzc21WwYYqNa8VQy4YuM9ZdIi2OrJa2q5ACkN
         mZ0LhkVbgyOw6wlXI4TOFO9wJ3xZGIzCIdadh7OIGJmrmiUfry6KojSUVcEnzKP6+xim
         6Diw==
X-Forwarded-Encrypted: i=1; AJvYcCXmFdmhZ7a1Dz5P+JNKsS4FWHAWcLPakv05pX6JJmWi/7LPsdHL3n3pFYnXc96lb1uAzaJx3U1KmjTlYYm4NzuH@vger.kernel.org
X-Gm-Message-State: AOJu0YzwRAkm61cIOp+jsFum91yal+oyUyoNKB20nzP2Nr4JUA2Wa2ba
	1XATIz/DbGBUgwsuTUyjqpjP2dqh78Oits0AztShakm2OIUI/jt39zj74mfHS8ab9iS1hE12o8r
	dmKxX00OiG7sih9/JaeJwCZLnqKbszuSkTVsQdGYHhkgih+/6d2GeqD27LQ1Bukrpmgi/NiCm
X-Gm-Gg: ASbGncsWNKddSS8fRBEonP+QTq1KqboBMExEqtotYiMbtfkbOwi1AzxHtSubVO5ireE
	eBgGFkb7pX+N7BtQEpY5I1bDi9KvdrZbYz6l5/KQqdo2x3bb1Hf7qoADqxovdIq6RdATiofirEO
	yZIuaaRFH973ZRmKKLQR3Y420MqMj9fFnS7mZJvkpdFD/dYew3cHvLkCxtMSWPGxzgWwy5loipb
	kSQPPjA5QbJwogY4gHlYMgqssuVcgROdvOW5xR9QpmPSTYABPO6NRKFtUU4pf1MkZz1M36yL5o3
	nzhqUEvm4UEW9U4nWHcbVzhJhvkgfNMlf/ZIGk4PRFx0sUJW5bfFNyWL27GDrWOpGESe3XBmlL8
	=
X-Received: by 2002:a05:6214:e6f:b0:6f2:b0a7:397e with SMTP id 6a1803df08f44-6f8b096648fmr123290776d6.43.1747565885942;
        Sun, 18 May 2025 03:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSwDJ6+OnE6K6EThjS3fvyH6EvLrfeYN3boNr9X1QbYgVvhY5K0EHdCIh4iay1IE035asl0g==
X-Received: by 2002:a05:6214:e6f:b0:6f2:b0a7:397e with SMTP id 6a1803df08f44-6f8b096648fmr123290606d6.43.1747565885510;
        Sun, 18 May 2025 03:58:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8d24sm13764321fa.26.2025.05.18.03.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:58:04 -0700 (PDT)
Date: Sun, 18 May 2025 13:58:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: sc8280xp: Fix node order
Message-ID: <bj57ytifzaj42n2jvjedaaptweospj73wd2ezyzn5zp7jkbrz4@rdidejwcrwrc>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <20250517-topic-8280_slpi-v2-2-1f96f86ac3ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-8280_slpi-v2-2-1f96f86ac3ae@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=6829bd3f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Zg2izb72UxZypc-W5EYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: FTdZIHaWPpiSuc1m4HS6-imYxmAgSPhQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfXzSli5JccAdBJ
 RJAgWrJ6xaNiHzPr8fYHFtJO85sIDpZXt3sKgpl3DjlhRbFvkK2UTWrI5XaxyzkonGzOaHzmNq8
 mRg2nBBHBfxXNsPycVBu5JrS6sgwXWqotiOBH/8jGYKfv1Di2bDHYz50HnASmO5PYchyecF/npF
 6vYAYpvqysgqx2pByU+RWAL2d2rB+5alMsGBtRXapG67iv58peKaY4+7z5AAabC+j1G3uwxj/wm
 dDx3OCaNQovbh3gmf9Z7eLDM6vWhwCBZFc7jRx6X9vhcYUkj7NGR0iQI27TYUIKJ1bGZU64+a60
 8vi+rqh5vjCC0y2kpEVydMTjPD1hfo16znWIOG53JFpLM1crfZ+Dj51j8hV7LM+WBKcHtM6+QLN
 d8KC+SMQiWRznbgvWiBOsBGf53qIMqtoNPzJ1qAriyf+pUkUaRifZON9fZMWHlWCWdDxRyzb
X-Proofpoint-GUID: FTdZIHaWPpiSuc1m4HS6-imYxmAgSPhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=796 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104

On Sat, May 17, 2025 at 07:27:51PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Certain /soc@0 subnodes are very out of order. Reshuffle them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 574 ++++++++++++++++-----------------
>  1 file changed, 287 insertions(+), 287 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
