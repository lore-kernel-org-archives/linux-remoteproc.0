Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774B2C2349
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 11:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758540874; cv=none; b=BFLiEOtZOYTCM8je3XauC/hhxLCU+PVLRVINybFs/pIYBqRmURLjFUfdNamKgu8TcY+WCtJ1dS1qW7A24GJYRd0hPE+POjh9NLy3D+GlCFmS3wwjhLDnwD+avB00KZ/nfLMOSHVa9C2LY4yBdlTVMSvRFeFju0q4dHt6cY74g2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758540874; c=relaxed/simple;
	bh=nCwdjfI0SURBS39EG5PHMSwXsuzdyAL0qCvr1aiINNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXZTTjpGYWVqfFIQU4Lq+LeWxtYn3cxMrE/9w6DeV7ohdJ8eEa3ev3ZU7WZLUDvSeDYS8YZd9f/a/k5AKOOBndu2l8rcGm266L56sKBE4PQ+f8sfKtev+HHllxCkzpe/+ly8ZOJIFth67EKseUmnNMUD9M6Tz0wdt0XcyDGsLTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROBmfsUw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROBmfsUw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M90FbO002252
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 11:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uUfGDGkZAIgCqIbzcLqPc9KO
	qLECjBVf8MruWksh034=; b=ROBmfsUwwH3z67s5w0cWtnjMZVnuTwznNjstj93r
	AczuCNfDxAD7HIp/PHkoJW/OMF9X/FqyofcC6gLEsItoGKTIFIjwa2i22snlpzsG
	ptl/znopxqys7KmdWkqq6NAc5LDpWSGcRTU41SddAxY7CdzqOEUPt/Ibj2ARGsyr
	g9Qs7ZHVIrBd2vtm44Khw6vqzRqOgaynEWcbbXZeXM7goh6Vmm1O3cnZCHsvICjW
	JDqj2QtkrM73EFFheM8uPCQWuBVRIo8dtpuEi6xoKrq465eVSp242fX2nN0qTvOB
	wcIaPrnBShZTVauCVepKFNmHZla+Ji4ty5srZTwS0EbC7A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7svpkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 11:34:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5535902495so1378352a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 04:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540871; x=1759145671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUfGDGkZAIgCqIbzcLqPc9KOqLECjBVf8MruWksh034=;
        b=XEHBfI81+fOfc8WCpEVpv21CCS5MmXD8LhA73Qy5nqr0K+lLWoGnQV3RvB2YI6lfNd
         4xGkMLs6eav2om0RhUWQqLIXk44ymIbgdYiAqUQyKZKQzh4j41sX/hWmZUIPkfbGjkqD
         E+PcZ8sjAN2AfQj6kv03nGdXwFXwrANsrIAi3WhT+RzkdkbjclpYNnj9o2yIdCayGP5H
         OavQC+x+mac+OWyB3WP6NsH6ER6Xy5sfSV1WywANRLndclq7iR80zdic8KgDiBB/6gm4
         IiDZxapC6bgue72VHIa40qsW6YYguCJAkZ75W/9kpLz96XIs+84U1prSAbQkglg9e2SG
         k5xw==
X-Forwarded-Encrypted: i=1; AJvYcCWN/0fAnvdwW+t/l5LuzU49Nu/9TRBzdO9IvUEiLnTChsTNuA02z7qOFWKLnEqMxO+1exvMRAtyd2MockpH8ERm@vger.kernel.org
X-Gm-Message-State: AOJu0YxmfHyU1/UeuyXorN7e/FBFR/Ok/aNCkPcsvTBkROrDU0J9FMVo
	FMBKU6YRMko7vTiiGpV8B5gcHi/qzljn2FuCnlfMzR5xAPgC+4DI4M9T9xMfJ8KRky839EAgi3v
	r4m4HlyNyuohzZaoFLSfbBOTgAxHqvJxcaWfUU8Sn9GThcSWVOrF9A1S529f6LjTZpOZSJ74I
X-Gm-Gg: ASbGncubnk9XLsoFW2eriMfINHIEYB3vcZf0EEAtNilSM4ygFxJ9FcBO6V1V3OcrpXI
	UA5twkNmiH+5mMf0K4jEhzXhCaX990Ddnhthzrrl8eOknVq+5eCMg3UUq5k6dMkj13rrwcmSbSu
	r0qFZfcY0T5B4CZle/jmqYyrmYJDC5itoN8MfPCzPeRWcakcrn74hlWJ4cF6RdHRxtkUPDl6jxD
	7zhGRM4HFn9QIhZviNQoYssFN6jlgDrjw/KQ2xKCIeuAcj7oqidVzeVvbW5Eqf0euDV0rk7Pm6k
	Q2HcW+w1RzwgP0lJCDLbfLiqRIuSiIhMT/Ll6847hvlOiOZ1Hcpm8oR8ZJyv6TIUvA4=
X-Received: by 2002:a05:6a20:6a06:b0:246:354:e0ff with SMTP id adf61e73a8af0-292588a2f8dmr16971110637.8.1758540870843;
        Mon, 22 Sep 2025 04:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHty8IzAd2wpBrlPbxbu6yitTq6fHhUzkUsvSD8PXXyURoyq578xMByJmjC5QPDFGqgklDEA==
X-Received: by 2002:a05:6a20:6a06:b0:246:354:e0ff with SMTP id adf61e73a8af0-292588a2f8dmr16971069637.8.1758540870326;
        Mon, 22 Sep 2025 04:34:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff3fd7easm11994949a12.30.2025.09.22.04.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:34:29 -0700 (PDT)
Date: Mon, 22 Sep 2025 17:04:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/12] firmware: qcom_scm: Introduce PAS context
 initialization and destroy helper
Message-ID: <20250922113424.zpweoe5cgcfticzt@hu-mojha-hyd.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <VaE1QImrKf8gxtMr-dFBEHJ0Mv9-1ugwsOz5I1Uaz1PXt6aJMrWR7G3c5bN74hJYzy5v6_obB1OqKgtgdbCUcw==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-3-458f09647920@oss.qualcomm.com>
 <9139706a-708c-4be6-a994-120cce0cd0e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9139706a-708c-4be6-a994-120cce0cd0e6@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXxgu/OeGMEoin
 9HCZvBFGgvazC6tyg1Sn2UeiHqne0NZhlOBYz40Dn8DM83j+vjrSuWvLFXybkTWiZbzWQleI765
 fGTUt/9mf84thBzILrKK+PNe3FslZGIGXyYsg8RAb5yax2zDJqAV5kyLSpWwGIcIq3spCd49XvG
 GsZkA6jwmA4aTCKZ4eF9Kz2SY0ta532UGI6ph3IXTeaIfARVLFGqinG1d+Fv5VwMxQycQ0OH9ql
 +oGKEchU+XgUjPpPbdLJpzjl/XTOI7dqXBO0kbxhxTS6X9gqREDpPQ/MF6jSxhAJr0BIPnFD8oV
 R1aIdpqqobSpGh+2QwNMg68y67j36+iuS2oYsv4ZTBrKin6i4BmOQviKNYuPNEL883KbpIAOgj9
 wDICC/j8
X-Proofpoint-ORIG-GUID: TJ1yISv_B5MTmcTIMtvwSfdeTvu2wiP4
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68d13447 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=HFU0YHx6uJ8-sYg2Z9IA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TJ1yISv_B5MTmcTIMtvwSfdeTvu2wiP4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Sun, Sep 21, 2025 at 10:40:55PM +0100, Bryan O'Donoghue wrote:
> On 20/09/2025 20:41, Mukesh Ojha wrote:
> > When Secure Peripheral Authentication Service (PAS) method runs on a
> > SoC where Linux runs at EL2 (Gunyah absence) where reset sequences
> 
> "i.e. runs without the Gynyah Hypervisor then, reset sequences"
> 
> > move to EL3 and Linux need to do some extra stuff before calling PAS
> > SMC calls like creating SHMbridge. So, PAS SMC call need awareness and
> > need handling of things required when Linux run at EL2.
> 
> "Therefore the PAS SMC call"
> 
> > 
> > Currently, remoteproc and non-remoteproc subsystems use different
> 
> "Currently remoteproc"
> 
> > variants of the MDT loader helper API, primarily due to the handling of
> > the metadata context. Remoteproc subsystems retain metadata context
> > until authentication and reset is done, while non-remoteproc subsystems
> > (e.g., video, graphics, ipa etc.) do not need to retain it and can free
> 
> "do not need to retain metadata context"
> 
> > the context right inside qcom_scm_pas_init() call based on passed context
> > parameter as NULL.
> > 
> > So, in an attempt to unify the metadata API process for both remoteproc
> 
> "In an attempt to unify"
> 
> > and non-remoteproc subsystems and to make the SMC helper function
> > cleaner whether SoC running with Gunyah presence or absence by introducing
> > a dedicated PAS context initialization and destroy function. Context
> > initialization beforehand would help all SMC function to carry it and do
> > the right thing whether SoC is running with Gunyah presence or absence.
> 
> Since you need to do another version of this patch re: below, please tidy up
> the commit log here a bit too.
> 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c       | 53 ++++++++++++++++++++++++++++++++++
> >   include/linux/firmware/qcom/qcom_scm.h | 11 +++++++
> >   2 files changed, 64 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 3379607eaf94..1c6b4c6f5513 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -558,6 +558,59 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> >   		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> >   }
> > 
> > +/**
> > + * qcom_scm_pas_ctx_init() - Initialize peripheral authentication service
> > + *			     context for a given peripheral and it can be
> > + *			     destroyed with qcom_scm_pas_ctx_destroy() to
> > + *			     release the context
> > + *
> > + * @dev:	  PAS firmware device
> > + * @pas_id:	  peripheral authentication service id
> > + * @mem_phys:	  Subsystem reserve memory start address
> > + * @mem_size:	  Subsystem reserve memory size
> > + *
> > + * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
> > + */
> > +void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> > +			    size_t mem_size)
> > +{
> > +	struct qcom_scm_pas_ctx *ctx;
> > +
> > +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ctx->dev = dev;
> > +	ctx->pas_id = pas_id;
> > +	ctx->mem_phys = mem_phys;
> > +	ctx->mem_size = mem_size;
> > +
> > +	ctx->metadata = kzalloc(sizeof(*ctx->metadata), GFP_KERNEL);
> > +	if (!ctx->metadata) {
> > +		kfree(ctx);
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +
> > +	return ctx;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> > +
> > +/**
> > + * qcom_scm_pas_ctx_destroy() - release PAS context
> > + * @ctx:	PAS context
> > + */
> > +void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx)
> > +{
> > +	kfree(ctx->metadata);
> > +	ctx->metadata = NULL;
> > +	ctx->dev = NULL;
> > +	ctx->pas_id = 0;
> > +	ctx->mem_phys = 0;
> > +	ctx->mem_size = 0;
> > +	kfree(ctx);
> > +}
> 
> This looks a bit strange, manually destructing an object you then free. I
> get the argument you might make about use-after-free but, I don't think this
> level of defensive coding is necessary.

I agreed with Pavan in my last version about adding destroy version of
it., otherwise, it looked a bit odd to just do init and forget and not
do corresponding destroy however, I do agree the only place we are going
to do in ->remove() but would not that look nicer to have _destroy() as well ?

> 
> > +EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_destroy);
> > +
> >   /**
> >    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
> >    *			       state machine for a given peripheral, using the
> > diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> > index a13f703b16cd..e3e9e9e9077f 100644
> > --- a/include/linux/firmware/qcom/qcom_scm.h
> > +++ b/include/linux/firmware/qcom/qcom_scm.h
> > @@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
> >   	ssize_t size;
> >   };
> > 
> > +struct qcom_scm_pas_ctx {
> > +	struct device *dev;
> > +	u32 pas_id;
> > +	phys_addr_t mem_phys;
> > +	size_t mem_size;
> > +	struct qcom_scm_pas_metadata *metadata;
> > +};
> > +
> > +void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> > +			    size_t mem_size);
> > +void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx);
> >   int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> >   			    struct qcom_scm_pas_metadata *ctx);
> >   void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> > 
> > --
> > 2.50.1
> > 
> > 
> 
> Once fixed.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod

-- 
-Mukesh Ojha
