Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D142F90E6
	for <linux-remoteproc@vger.kernel.org>; Thu,  4 Sep 2025 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756979545; cv=none; b=OIMNKR6sAoOY7325GuIv06uEurQ1Fy3owOfkB57OxFXqBoyizjss2ELsYCYvF03py8ZkOlv9M9iIhXgF0Q0f/WtrkrZ0+0YEv+nKyeIVMGarnFNdw9HQRj2SqzwbqeXDAoxm9uEJYsvDUf+F+jUtGfEceyPkbbAGlg6eMrCgFVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756979545; c=relaxed/simple;
	bh=0Bc3P0XvcGpoRu4+CwZqqb8LlVFA3+CaY9mfLAEHlx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S04atSlzYU2DAvuakQSXHBCr7jx5y+HjT5bVW9vKBBcGGDHxGFViU35PDEo8sXXBk4R/jVJRHbRkofxNcWn+c1VTDkb+T0urZywCIBCJPkMrJIC2OtofRjd9FwLtQTQJNrg2R7BmlKa34oWXW89NUkMkFRQgcxGLdKREaLUWVMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lm/Cv9PC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lm/Cv9PC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8MX022986
	for <linux-remoteproc@vger.kernel.org>; Thu, 4 Sep 2025 09:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=roP2Cb+KhhXpyTf8KVgqlWlP
	8WRvNVjEfW5IK/vjwLs=; b=lm/Cv9PC5Znn2uqmFInlkAGHljCJ3os1xJQB0/2Z
	o3tmIivcPXACqbWofVkdH5JCojub+yncCFUrfwfXxOl62gtUny5YvEUHZYTwJBzP
	iXPTb64VDHQj9LXA7RVCOkr2Zz3L8HoPlen15wHGiI7GQ8j+1S5PI6aWnZlrfkJU
	Iy7l37XP6Ufe+QbNBbb4HL2zYcyg5C+OPLtrc/f491a8bMjDuSvI+m0iSpofzN0P
	rc6Y+Cn9poZNlQvopPmBRyuNAS/BJrCRTqxeHQaqIFumY5yooF4Javc+frWcofxp
	rE7q6DOxkjfe2Iq/jnGBUTcC0eaP7uFtgkdCjlFbJBmeJA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eq6ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 04 Sep 2025 09:52:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724688833bso954214b3a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 Sep 2025 02:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756979542; x=1757584342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roP2Cb+KhhXpyTf8KVgqlWlP8WRvNVjEfW5IK/vjwLs=;
        b=D97ZJ7Rhm63OOsBuTHmZbfZghJdowOT5KEqu5vNy5UgH3LdVCIoaKkeF6+NccNs4SW
         TGFrMAsmLItAM0qwIn8Akv0IE2uXRG4LsImj3Ok3tFNGlUKElYfefBVjmag29151VcfR
         O8lv0jKZca71wr1qEjt8x3Hn8ba2BVF2NOuR/q/YbtdaEMwIG1aSaACkw+Gz30PbiCqb
         kVLXEYnVmH0MAo/4IX9r47sCTv9Wvj5ZIPE8kLTeGonqH5uMEU2f2OVRLjKdr14a+PBP
         TaxvdygvV1YKlgSRQc2rNqVHKl31BYckHhJjo+2bCfpM10tTQxc+obML/q73pn/e0ufX
         o+xA==
X-Forwarded-Encrypted: i=1; AJvYcCX61e2MUuJIsPA/2aauB0h0saxyPErMoJvijkMCliXgOvptkAHb1B/iNSSmejCzB4PIIdMXwI/n70HUfYCAmqD7@vger.kernel.org
X-Gm-Message-State: AOJu0YyRaq4jkSVSmHcYGCZKTDzNHoqX3Z06Qa8huUW16IXTDHvH2xBe
	DKCGbfUa7q1jHScWxl3Oyk4KmvZves8WIOJcET5SXmQhBaAgqxQ39WkAqW/eg0IB5mQb1/FuuMU
	NmF6Z73Nn7yHNCK1RDpEjmNYHsWt0Wau57ltYcMkO1P2ma9GC296cZOZDcjflp9p8KPRlqha9
X-Gm-Gg: ASbGnct0T9NGpl8vte8I3D9Dd34kUxVXDxsWoXLFd22H+9brizST4PMfzLmnhf/9S1h
	kxjlRgGR1dUVyVe/FTf27QjBvK/BnHM4jDQt6RMQYPgbSyORzIZZVrbiNE/+CveIF0PXN1zBpJt
	qSGJvj9KSimO6XFwulQNq1iEUA/LTYxm7Vf+Yd9b1/eigLHLX+rAHQIqt6s7jJTSYzVXTMYWBfo
	51rNtqcH5jpxkctgp6pWOxQOQuIAaK8lbT286zgOCiRvCdZy7x5+KAop5tU3+oF9TOqSmfv9kOg
	VLLYbIqf7d3dtwh1xEiJeWC2UhBX8qiMqkc+vXhNPw867n2nAvpFCBkHBC4TsIQMHTY=
X-Received: by 2002:a05:6a00:4fcd:b0:76b:ec81:bcc9 with SMTP id d2e1a72fcca58-7723e342f6amr22020655b3a.21.1756979542313;
        Thu, 04 Sep 2025 02:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAjN+8ImBourO6S6qeIBIf9ESDV0Fq8gGseTXKI5xhDrlTdekjc+51IX/W1teg14iNdtVOIg==
X-Received: by 2002:a05:6a00:4fcd:b0:76b:ec81:bcc9 with SMTP id d2e1a72fcca58-7723e342f6amr22020630b3a.21.1756979541788;
        Thu, 04 Sep 2025 02:52:21 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772306a1870sm17912598b3a.75.2025.09.04.02.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 02:52:21 -0700 (PDT)
Date: Thu, 4 Sep 2025 15:22:15 +0530
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
Subject: Re: [PATCH v2 02/11] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
Message-ID: <20250904095215.ekkhrt5ql65ap74k@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
 <0b4472cb-0c73-4eb8-a360-22b40aae44f5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b4472cb-0c73-4eb8-a360-22b40aae44f5@linaro.org>
X-Proofpoint-GUID: YUrNwyCPeJ3Pqqvpb9JL5-mqPtIbKaqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX0pl47cSE3EwY
 IB5CJIap0eZwzWvTeW8dSoDXWQkZfpY+XwZBjmtr5SxKBlY4DvRBO1cn2y6yrV5j++1RQ28/iN1
 /lR/ffUy+BdN8vHnhMGxEeMdo5Nj9/RDKULe6wxcT33SLXKnOAsHL32gadVFp+WWk99AyT+V2M/
 YItrOA0qeHiY0WjU5Fj4X+8crfBIoaIqQmCyKXCv7jcX6st0x3gLxRzR6zJQct3FGwtkC7a1Bhg
 qPEW3wzTSmMilUj2OnSEtONnBk1ZxE7XgNoavcC5KQPDtY9vLmKgwNRiB/bef0cqGQWVp7JcPel
 2ULckvTgPpg6Phz2yZ7/BBXU1dM9uDqZwJnoYiahj4l5rY+2+52FEfEZXQpDH81KuVgQ6t3N8nD
 fsv2leCE
X-Proofpoint-ORIG-GUID: YUrNwyCPeJ3Pqqvpb9JL5-mqPtIbKaqC
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b96157 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IDm2FHnpOmf9DK9IQ3YA:9
 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Wed, Sep 03, 2025 at 04:03:05PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Currently, remoteproc and non-remoteproc subsystems use different
> > variants of the MDT loader helper API, primarily due to the handling of
> > the metadata context. Remoteproc subsystems retain this context until
> > authentication and reset, while non-remoteproc subsystems (e.g., video,
> > graphics) do not require it.
> > 
> > Add context aware qcom_mdt_pas_load() function which uses context
> > returned from qcom_scm_pas_ctx_init() and use it till subsystems
> > is out of set. This will also help in unifying the API used by
> > remoteproc and non-remoteproc subsystems drivers.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> I'm struggling with the logic here a little bit.
> 
> You take this function which calls qcom_mtd_load_no_init();
> 
> > -		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> > -					pas->dtb_pas_id, pas->dtb_mem_phys,
> > -					&pas->dtb_pas_metadata);
> > -		if (ret)
> > -			goto release_dtb_firmware;
> > -
> > -		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> > -					    pas->dtb_mem_region, pas->dtb_mem_phys,
> > -					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
> > +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware, pas->dtb_firmware_name,
> > +					pas->dtb_mem_region, &pas->dtb_mem_reloc);
> 
> and then turn it into
> 
> > +int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
> > +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
> > +{
> > +	int ret;
> > +
> > +	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->peripheral,
> > +				  ctx->mem_phys, ctx->metadata);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
> > +			       ctx->mem_size, reloc_base);
> 
> Surely you want to qcom_mdt_load_no_init ?
> 
> On current kernel
> return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx,
> 		       mem_phys, ctx->mem_size,
> 		       reloc_base, true);
> 
> but that's a functional change
> 
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
> the no_init version of this looks like this:
> 
> int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>                           const char *firmware, int pas_id,
>                           void *mem_region, phys_addr_t mem_phys,
>                           size_t mem_size, phys_addr_t *reloc_base)
> {
>         return __qcom_mdt_load(dev, fw, firmware, pas_id, mem_region,
> 			       mem_phys, mem_size, reloc_base, false);
> }
> EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
> 
> So is it really the intention of this patch to change the callsites where
> qcom_mdt_pas_load() away from the init version to the no_init version ?
> 
> Maybe its a symptom of patch collision but hmm, having a hard time
> cherry-picking this to test.

My intention is to unify all subsystems whether it's remoteproc, video,
or others using Secure PIL, so that they all use the same set of APIs
via context (cxt).

Like, we first initialize the context, and then use it for other PIL-related
SMC calls such as pas_init, mem_setup, auth_and_reset, or even for the
new rsc_table SMC call. This way, everything is connected, and it
becomes clear which functions need to be called and it will also be
extensible via a small handling for SHMbridge on gunyah absence. Similar
changes would also apply to the MDT loader APIs.

That's why I asked here after "---" in this patch if this approach is
preferred, I will apply it consistently and eliminate redundant APIs.

Let me know your thought.

> 
> ---
> bod
> 

-- 
-Mukesh Ojha
