Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A24129D272
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 Aug 2025 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793791; cv=none; b=SQa6eShGzUtwevApwcYK6kbM9ol8mMcpggRRCnnYidzuJj2LWZlHozsr1k0aavsU3ASqIBgcvEtN6FcJN2qY1OXnZ+0EKcegZJsUODIDD4hUWRWoy7m2kXqkDL3wZV2jBYqWh2xNev1hYixfy2GT6dKVKlA8b4BU6i5P3E89x50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793791; c=relaxed/simple;
	bh=/tbXBa6r0uSu+NPSmXQFYhFY4TeDHvKdeP7yIapjbxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MosCFKmGb18jTmc7uo4xulE9PcQN6TyornCJuxrPpOmfZ/X+2DYxCdAWX6i8v3D46x8gY71SzzR5pp0APiFkz9gtYweFVhI0SZxYNXo/ZMHZHEYuOX2175s15E1jcaUn7glSJDF7kuTtXg1hevQsIOIda6d3nRqBBMTw6I9fKys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqDZeuO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqDZeuO/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bDOt015290
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 Aug 2025 16:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zIhKFueIyr4p/yFGjoDpxYA4
	IzoEZUqKsKS0QB3Gip8=; b=gqDZeuO/ilYuppctcwwO5szg9iQ/C7BbwZfK15xn
	m0e6SqLB4lHcjMOIGXfvwxLAqO7lvJOftrIxqwRvG+NizFhk2p1639VdEoXeOJ6Z
	Vl+8QnMjfKyqM3lMiE3LmsYMQuomxMcutivszXLLB76ZveRioNXJy21eKp3rPizx
	VrUZ3rtxp4bC5QMsHZXiN/JuJXaKplsSQgqcjx3JCrDDHOhqteFSwRUD/h3TnhKB
	0H3+FlLLaPkbMoM2PUHuPARZtDdDiBe5Tncjhb7JlWOrbNNA3bovvbbRV6PLyqoN
	1tpq11IPpyEl7Q3ruLhzFAUIvVxyeEuU6VQImJdKYSJZwg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cp4jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 21 Aug 2025 16:29:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2449b4f316fso10014445ad.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Aug 2025 09:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793787; x=1756398587;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIhKFueIyr4p/yFGjoDpxYA4IzoEZUqKsKS0QB3Gip8=;
        b=HvC75nKw+wfkgT9m2GOPTbfrUSEcpGhFrESOGWI/Z3Fys9ChLu+DLYmuQHkg376hQs
         bmZxS4WYuE97yrCSY8qn8cwQjeM//EIdYObY5PVQ10+skAnSTyF/WXQ8X7fpQLZSiIUC
         QyFLomzsN/rPrGaUtz6izeapLE4cy5g5w7H7u2ISLlrGRr8bpYRVTwHp0Zllh8P7yn0V
         YsHGN8HsSt5uI04H95yvjA2vnqX91HlXAhN+dl8ARwbiNByBMEuh/CNPGSg30Mnio7y8
         4e8AWqVo9eOE9/VVzPZT6/9X7hUlqDAwp69egOKoCWAXmVQ+fSbKQfA8qcbXLiKVnIVR
         bhEw==
X-Forwarded-Encrypted: i=1; AJvYcCVaxJKUQGw2mfabdHlNDy/rElPzbDlTTjprP1Gk4gCjEAbFwNf38XFaBYuWfDtL+UyfjJFAq4olv00Izf+LLsJ/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgkh/YHJnro26vuXDyeGdhuRIXNASrvIiCr6gmw3ogKOR3sKEZ
	MfnwY+H5Kq2uZlASiQrMDFnAu8MhV/Xnxzcx7TJRKVAV3ED+IpqTXXt/9oLlUoRE5EmpaiT0PyK
	OYpKyTuzzGNEWfw/ZqHaBvp4lCIzzKuiFD0esasy3RLndPtBIZrfxH8HVCvsZIh4gPDGrulUB
X-Gm-Gg: ASbGnctJDDy9AgIfXBvkaN5rL+aMF5WZa5+xM2GcupGfCgMqXqQn0lDEmt0FBk3Bswo
	OFxVyy3jRvH0oPV+1L2iPreQI4Y+rJ77QgW1zMOvFrLwFQR/ZniwszW+axkxezas2+IhP/wcJgw
	jSOBSC/pfoyj64EahitSCteqUyLmDYYb1ZDXteuS96LYgR6hkIJl+W43Ui+BZOILsyj4s9RJPBJ
	+9lWhLzUyjJilQatlekfuMm8mDPbXvzOrL9+84ONjiV3GUJLxZx0i/IV5vdpcO1ERKF2jYekVvD
	hx8YTzQns4qB80569EZdccqT3V1CIik9DCWH++DMvapGJVsnyJF3Z7YkqFgyAPikUAE=
X-Received: by 2002:a17:902:ebc7:b0:240:3ef:e17d with SMTP id d9443c01a7336-245fedd4260mr47644405ad.40.1755793786720;
        Thu, 21 Aug 2025 09:29:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFztsB+0vyvGfd9GpFN/m6bhvsalSkka7TFzQDwuhyvsOAKhMpUjb0k8uC05DSbFLMBUCGz9Q==
X-Received: by 2002:a17:902:ebc7:b0:240:3ef:e17d with SMTP id d9443c01a7336-245fedd4260mr47643755ad.40.1755793786041;
        Thu, 21 Aug 2025 09:29:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4e9bc2sm59691575ad.113.2025.08.21.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:29:45 -0700 (PDT)
Date: Thu, 21 Aug 2025 21:59:39 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 04/11] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Message-ID: <20250821162939.6s5hjsc36bmelmvl@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-5-mukesh.ojha@oss.qualcomm.com>
 <10d91d9d-b6d6-4a83-a697-909f97abc503@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10d91d9d-b6d6-4a83-a697-909f97abc503@linaro.org>
X-Proofpoint-GUID: cY8psWCyGCFr0oZyLO8FiX5jKd5wlWLI
X-Proofpoint-ORIG-GUID: cY8psWCyGCFr0oZyLO8FiX5jKd5wlWLI
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a7497b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=oHMyjcGywICXLiFiIg0A:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5dIqxQXAKDpo
 i5qkjgq8VQKAv3YM8PKdhF7FhHJRlRxbUqzN6V8/TBgq1Sw4wJHcnqENE30x6VQfGGBNZ5T4SQh
 OH7/sdqlhVj5VTGFaLv16iu549eP5YG5uLs8K5/nLW9YSbjaFOjSypJ+7sgc14eLSKA3hJWlyt4
 SYooDsCW0vwyx3wRUcOvG36a07TBD3sHjQB2lL5K5HZOfXWlBY3hhFOg4SKmGaKKITyLqbtQNF7
 CxorxAiNilfJEDqzPfn+4B7Qql6LEi/ej+8/bnx/+Bw8rOWBcAi8kghNPlFNCkXJ+5nVDIhYxY1
 NUWi+p/kFnxIAr7CQlYmPFKkHqUjI6WbMAohBxGnk+fkyE+dOF6QENVn4yTkUPCPSjCRj94wD4N
 z6AycB9zsUS4SsMtV52YFRmTPuCapg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 03:36:26PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Simplify qcom_scm_pas_init_image() by making the memory
> > allocation, copy and free work in a separate function
> > then the actual SMC call.
> 
> then is temporal
> than is disjunctive
> 
> you mean than here, not then.

Thanks, its a typo.

> 
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c | 59 ++++++++++++++++++--------------
> >   1 file changed, 34 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 9a5b34f5bacb..7827699e277c 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -584,6 +584,38 @@ void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> > +static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
> > +				     void *metadata, size_t size,
> > +				     struct qcom_scm_res *res)
> > +{
> > +	int ret;
> > +	struct qcom_scm_desc desc = {
> > +		.svc = QCOM_SCM_SVC_PIL,
> > +		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> > +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> > +		.args[0] = peripheral,
> > +		.owner = ARM_SMCCC_OWNER_SIP,
> > +	};
> 
> A minor detail but please reverse christmas tree your defintions and try to
> make int ret come last.

Sure.

> 
> > +
> > +	ret = qcom_scm_clk_enable();
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = qcom_scm_bw_enable();
> > +	if (ret)
> > +		goto disable_clk;
> > +
> > +	desc.args[1] = mdata_phys;
> > +
> > +	ret = qcom_scm_call(__scm->dev, &desc, res);
> > +	qcom_scm_bw_disable();
> > +
> > +disable_clk:
> > +	qcom_scm_clk_disable();
> > +
> > +	return ret;
> > +}
> > +
> >   /**
> >    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
> >    *			       state machine for a given peripheral, using the
> > @@ -604,17 +636,10 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> >   int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> >   			    struct qcom_scm_pas_metadata *ctx)
> >   {
> > +	struct qcom_scm_res res;
> >   	dma_addr_t mdata_phys;
> >   	void *mdata_buf;
> >   	int ret;
> > -	struct qcom_scm_desc desc = {
> > -		.svc = QCOM_SCM_SVC_PIL,
> > -		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> > -		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> > -		.args[0] = peripheral,
> > -		.owner = ARM_SMCCC_OWNER_SIP,
> > -	};
> > -	struct qcom_scm_res res;
> >   	/*
> >   	 * During the scm call memory protection will be enabled for the meta
> > @@ -635,23 +660,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> >   	memcpy(mdata_buf, metadata, size);
> > -	ret = qcom_scm_clk_enable();
> > -	if (ret)
> > -		goto out;
> > -
> > -	ret = qcom_scm_bw_enable();
> > -	if (ret)
> > -		goto disable_clk;
> > -
> > -	desc.args[1] = mdata_phys;
> > -
> > -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> > -	qcom_scm_bw_disable();
> > -
> > -disable_clk:
> > -	qcom_scm_clk_disable();
> > -
> > -out:
> > +	ret = __qcom_scm_pas_init_image(peripheral, mdata_phys, mdata_buf, size, &res);
> >   	if (ret < 0 || !ctx) {
> >   		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> >   	} else if (ctx) {
> 
> With those changes.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

-- 
-Mukesh Ojha
