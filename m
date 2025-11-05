Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40192C21FB
	for <linux-remoteproc@vger.kernel.org>; Wed,  5 Nov 2025 06:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762325942; cv=none; b=qe30ba8vAWLBws7tcA5yQ/07bkhP67eR3i4YTqQ7NECzUmfV59OZlxuBcGu99gSSV3rZ6ulvam9Rhd6gyByGufnlT36Zmt69ThtugAX1Bd56DncVevHusBsazQvufzhnWvnzX/bj244IfxhjeS0Aa/G1HaA9RMRxBWgb0j6A/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762325942; c=relaxed/simple;
	bh=h8jeUXOPEWHjBZ/v71fpiBeCmHncTj3cjcGix9nyi/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOQHn3w34IImeBfcUvM9y32OTonmw+KrL3HRYrNiwmkg/GK0sSVctNz4LkcpiWpnI3b1qjBoGCmfJq+4ovdPpzahWQ/U8xBwJGlKuDxKcMVDC4S6xdJO6ubSfgUUn+79HcHFF59a1D04kd5iaQem0IU+qFIuw2doC9nTFFO9Ebo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJO+vP7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DFtt1y9D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJO+vP7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DFtt1y9D"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KfkIk3049610
	for <linux-remoteproc@vger.kernel.org>; Wed, 5 Nov 2025 06:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HEM1LFM1zi8Gc6HqJqM7X30t
	DM7ApP1caBVZOcNYVv4=; b=mJO+vP7ZAYYmlPBjck1JGaOoGYMBmxAYHvvERR6L
	AkVkWCaAOirxTeADvTNX8a9JZ84IvGI1C+RIe8hJxE7gvzQgWjQrPUD8bRuIh9bK
	yk2exPMD/2yHwhhi8i0t+UGewPweLyRk9HYTx8CrQOZR3VGDLq3PnQlMV+P0QlYl
	cExEwU9LZwoLw1bqkXpRDQW0YGOMEcIw0YuAtdoQ74m9fxpYn4CsBiTeufi5sabU
	jqoV/BmqoguZFYIyrvES4bukLrvcBt6jRU8eEtkeuNs3UL/rowEaP4DzMdVbHJJU
	MxwrtF+8piohwv/aVix5BXRXRh9zYxybfGOEUzKopVAegA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ex7uchw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 05 Nov 2025 06:58:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-341616a6fb7so2670001a91.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 22:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762325937; x=1762930737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HEM1LFM1zi8Gc6HqJqM7X30tDM7ApP1caBVZOcNYVv4=;
        b=DFtt1y9Db4LSj5B4TmIYmAtpJiE/kSznH8ESgvbMWqbaToRhVK7FO7riX2RccdlERj
         ikoBjodRBPVrapUXJlXao/cThwKFz05WCzy9biBayWIJlS0AEd0f7jQYYpGBGMyYLPXh
         8WTk13kdtH1YtuTWWvTaLXuHZJV2ZVWOFFuxTjPzh2GRUMLIcQ9IzjnCQrGgl9fAjjTw
         QMoI7jxSKZ+nEtUCUK7U2qQsJn8UkNriHb+LAm870J0j5gPbsFyagMPHGeF8nOkmMtdO
         q2NWzS9PyeSrIXQlw8Iw8qo3/YuT/ZrL3igiseN6E/YP77sdbYCKOKJqtLPAIhN0QKRH
         B/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762325937; x=1762930737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEM1LFM1zi8Gc6HqJqM7X30tDM7ApP1caBVZOcNYVv4=;
        b=NVxVc5crJPILnbQZ1HNRp+sk5+e3NE4oDrNEzVTRZitmS/uxGAcLmIUpV97gZ73fzP
         vsDgMPY7LiuogkB/I3iOqWLqS5vuG6qmZhp7t3B9bp0Xgspqq9+euMOC+/u/KxKsV94v
         QOqIUK2HpLGoaZd4os3jQ5R0CPpalpyot8A9FFVfvXsPxEDO3LI4DZ0boGRJaC6AjVvg
         GQFnJKz2yYmUa+BCTErxQivE/uIcBLfmZQaVEk/WXCqauHzN8H4DZEuDzWH/rooXcddJ
         Xrbkvxagxu29Zl+yE1/ThTItCoJT0AO8XOes6NGgFioekxWhbwI+jkeq0zumlFg+FJyy
         x6+A==
X-Forwarded-Encrypted: i=1; AJvYcCXzZmJwK+S8we1dJyOHGqh7H/1tDOK+n2x78B/hdzMQl1IlD4gHoK/g4/La1AA4kfA2ya2k1adDo/b/GxqgeJbj@vger.kernel.org
X-Gm-Message-State: AOJu0YzOqRxVCfH3d7Yl//lwfpS5EDIO8lGlUVQnpFo45FjKohuLf0S3
	GRrg7D297IFX32xJDkUa7DwnURvbMDQ4Kqwk5jqYYSTt0wfx+SSWgl50EHFmys9w/Rq9XOYcMra
	QaLnOJssjXgCqwsJuH/LhoFzPvQ3/LNmQAdHO8sfeOkMtnttizu+f4cajIkzp0+SJBbLaxs8z
X-Gm-Gg: ASbGnctwa8PVViqby9OjwQjX3eS//GcmGDhx5E9qdIHJ16mvVhXxfD2siryhhbTn9Za
	b4LcBblVjhRb3q5SsdIDUqZ2kbgVWTFAXZe79CiCf5GA3KEzs4+MYvWi4ZsMlSm6AVm4YPqIjM2
	+bVMiSRKv7+BaQoJq4L2ZijKujo9/QJCZmMpx6Q1YW/++EG4YmG4ENAisjpbwOZZpCtKV+hOdNY
	xzZGQa2D3mO3seoU7Nynzl5aKhgcGWt+dloeFfw1poykXE3Z92MGD9LgsTbxj1k/aSclUIJVAwO
	mJJYKkqk3n9zzoJMkKS5cjZ5vPcTNva7ZYHILG57+Ea0glZTxhTDt4qGmBZBPbzfWmoHjl3JkrG
	AUHKWrLX5iZLGUm/M2iSEe050lQ==
X-Received: by 2002:a17:90b:350d:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-341a6dc59b0mr2189056a91.22.1762325937245;
        Tue, 04 Nov 2025 22:58:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw4ZF0K0SBRUAhZQ1BlurHJnjB4/a4CV+U30Alqbq8q4r/L18cO7AsOSgcElBJqrOWXpPksw==
X-Received: by 2002:a17:90b:350d:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-341a6dc59b0mr2189020a91.22.1762325936515;
        Tue, 04 Nov 2025 22:58:56 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f86b0688sm4501045a12.28.2025.11.04.22.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 22:58:56 -0800 (PST)
Date: Wed, 5 Nov 2025 12:28:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/14] firmware: qcom_scm: Remove redundant piece of
 code
Message-ID: <20251105065850.iyywczjunyb42vwz@hu-mojha-hyd.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <hYkrnjg1UIGrFwo6STFGKeRf--qSPLYkFuXckQNSLhqo75WL969Gk2ZA_gwICZpY0aIMpTCt3WLrO_0aHhqWxA==@protonmail.internalid>
 <20251104-kvm_rproc_v6-v6-2-7017b0adc24e@oss.qualcomm.com>
 <ee324fd3-bd1b-4255-9899-a0e1a58ad1c2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee324fd3-bd1b-4255-9899-a0e1a58ad1c2@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA0OSBTYWx0ZWRfXzlMxfrOkSxic
 oeeQ+K+nYslkSG6LYaN/V8pzLkBCvdfzLnRmh0ptrkM5UXvacDmfkjdEhQhaiR8KA10RVH4a6f9
 M7fXE1fa3vCGwTRQr0DPGf2z2INt3igTWn+qSV2IvVUlDmWzQHu1weyrrgnkUbrUEFcWy3GA6tF
 HHvgF8DSbqEip/PFDdL2fxvtG44WY7QaT0+Pc8qVEPvK+9xf0QZo/C3Z9pGKr1ePa0oLGAWoj4e
 a97e+InkSEOu2zhCcDaJ8qaLkTW5iJkx5CK+TXgHTr9oDM0xVGCOHOBc2bE74Wm0iZfjgWAkyNx
 ENPE8EO5jL7Z0kd22IGq/L8V/9fYyXAQUGW9sHm4+jV7JUXdSvbQUUjZSLZge6VBc6ssMtpYaK7
 4yvc9tBzivtDeueK5Bg0z4qtnrbL5g==
X-Proofpoint-ORIG-GUID: DbypJUEYKi5E0e2j9gTBHNDV95rGUeKc
X-Proofpoint-GUID: DbypJUEYKi5E0e2j9gTBHNDV95rGUeKc
X-Authority-Analysis: v=2.4 cv=auy/yCZV c=1 sm=1 tr=0 ts=690af5b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fZA9lW_KvhpsZj0-wjAA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050049

On Tue, Nov 04, 2025 at 04:58:58PM +0000, Bryan O'Donoghue wrote:
> On 04/11/2025 07:35, Mukesh Ojha wrote:
> > Remove some redundant piece of code to save some machine cycle.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index e777b7cb9b12..26969bcd763c 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -650,8 +650,6 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
> >   	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> > 
> >   	ctx->ptr = NULL;
> > -	ctx->phys = 0;
> > -	ctx->size = 0;
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
> > 
> > 
> > --
> > 2.50.1
> > 
> > 
> 
> Please fix the commit log.

how about this ?

""

The qcom_scm_pas_metadata_release() function already frees the allocated
memory and sets ctx->ptr to NULL. Resetting ctx->phys and ctx->size to
zero is unnecessary because the context is expected to be discarded
after release. 

Lets removes redundant assignments.

""
> 
> ---
> bod

-- 
-Mukesh Ojha
