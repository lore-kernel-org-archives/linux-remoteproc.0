Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CDC264A9D
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762520666; cv=none; b=QAH1B9xXE845dZqG7Joz57vS2KU+/s2+tRy17ueX1vEsjfjp4uOGDJXeHIn2I6sWykxoEPc/K4Bwj6xwFjZyLNfksOq9+c9bSeaOmJT3IljFo3BMAG/HhdCsPGlmqqS0oABM8DsrbBl8tIHbBzargmL/uxpv/L81t+1jqT3r1zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762520666; c=relaxed/simple;
	bh=Ted6AZIFVphD/F8lSCH5ehpbw5jTq6uqRnlR0itDLB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5VbZP+KbixuGUhEIBOM56pNSmG1FUWC2VbjNmjjUB8EKZ3sDadDEHxTCoHlgGRpswpvdbJBPIkucS3YGqYQG4/BpBqqTLK01z51T/XuDWXiH8fOTF3hyCcL2g/QPuiTYdvKtzOPHj90ffW2lvMtEr07xj7ml+jDLDyiKglgpIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOEPCMAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZVuY1Vg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOEPCMAO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZVuY1Vg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7BCHbC1864565
	for <linux-remoteproc@vger.kernel.org>; Fri, 7 Nov 2025 13:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kS3XC1Ni5FhZbMpzDDtKCVF4
	F8GiZA0Y/05CysERk9o=; b=dOEPCMAOWcaga3C0izeYIoAFzPyuTV4xY26zcPJs
	Qb7yBGTQJtPvcTOvIGeHngbVgkDiarDyJo5lpZB521OpGqVSDzKmImHI89QeNTCJ
	7FzvZDuPbEgYrZrWNFPx/ytCJY4NzMD5o9yZ9k2S6UIKVdebMGGx08KFq9z/A0nU
	m4CUAR8GY5nYJRdymkSKMcCKdkPIKh3VodflxwMwrPt4+RvYxmu/YvXKxt+XkQ5I
	kopDLn2WqGjkh65qcsKTwju3ws8CcfNyRZKxkrbR97wB7KgCG8QeU0lrhLb19C1I
	mMBGZ51SektIaBaBAO84WO1HbDma5yTis8yqQ9laZuiFsw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a98ta1jbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 13:04:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2904e9e0ef9so18146885ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 05:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762520664; x=1763125464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kS3XC1Ni5FhZbMpzDDtKCVF4F8GiZA0Y/05CysERk9o=;
        b=RZVuY1Vg+Sra5fDKGuXWEyDuMQAc4zbkdxIBxCYWJRxupi+KlGZ74Li82mxeRGQpit
         9fOib18OB0mkSfpoJs3aTQkXgDDqmlhPGd0rPl2UWrE4pPxoYN+aij359Um+DAAQ/wSq
         KPqdmfKn8ap+NwE6SPKCvqrtJxhI5Ih94gwS2s9vs6b6naZOLYTgUxLli9JyzCBgWf94
         72SSb0HTTcpBw7GZJv7dwYWDC8mwrxyfboe2tRi/BtpEE0d0uuYIDZf5GowEaFsij7M5
         DBUa5df0pk78AmT6uup12VWsGpL5CcHV7oFm2m1w9P7KgKHHOhOAHB0oB8FN6NyAAO1B
         j7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762520664; x=1763125464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kS3XC1Ni5FhZbMpzDDtKCVF4F8GiZA0Y/05CysERk9o=;
        b=E2dXYEfRF7pbIKGStsCzxAupdQBHNQOBzTDbIi6RoXInmoi4aCoudvrWDm+ieaLDl1
         uKK91lE53eQQMdSaDBeGzSrxhRBAA12oAnJsygUqWkfClS6Zqy7+tlgYNYnHx8FJQgUy
         qh2dUWZ8AsMZOV4gce24yET3x3kVzrgctxsER4WR4i2bylXTJSkkHBmSp0nVuE9wybl3
         6WSEVH6X3uvJ1TvGqp4hgTkPOgjVmvquPvz7dKyScZboQ3z+EWt1kU2d8K/PkErh+TXg
         Ktdj/ob6dxkZtOmxpR7B4FJrisX9vITUMHbSE4u1eeWPLSMnsCXpr8E4K7leV5u5jSmd
         AJQw==
X-Forwarded-Encrypted: i=1; AJvYcCXcLvmpXzrV+nWBuwLFWSy1g4C6dOUZkZqMfyHUfnDQ/QQEIvT4KYYynu0/9i0TeXArwmr3xtREQDSpcWpw6hY6@vger.kernel.org
X-Gm-Message-State: AOJu0YxCuUjvHw61/jIYwIQCfGK4jhr0psb2zwseG+cqDYpFG5nvY4Ys
	W8Ne7VQaSZUbC4CHuj1jSr1SXah4zRxLgDCARQgomzCd7RyUmE8i01Yi/DPWHUCu67vT59JQ3h5
	He2cHVoScfz99hy8Y/gb0wo+XDU42Nnnv4CYOq+O+Tq51mDJl+DY5EqiIDZbAGfNaia0LF/tJ
X-Gm-Gg: ASbGncvt6rhHCAj3I1ZdxuY/kvkjwWMfzOlObKU02OQi7Bbku0DsjZMR/SW1f76993F
	CHqJN9Ip1FH6htwN7qdkpeuclco+2EcCI3kPR84hPpV/gU3Z5qEkmDpqtYmGQvN7r+GdgcoktA8
	HOq6RtdgEqnGWojCKoRSfp+QyBQqFOmIeaqljVX6xfawAag+3+5+8MboD63o5SzSq7bAwC4XUSZ
	AREl8wNwJruyieZ3A4iLuAAntTfM587lO1Nmf3VVYEnNQ9fAX6BzDucb+1BBiBMd+uHz/PsW+8p
	9ix1XWI07ia3Z6Ed+UwHTZonfRVFTTrHttuuV8vDk4/1oTryiDKXYHD2/yGzOvajegJuOF+ltF4
	S1Doz6VvJ140YLCnkSWugN8XYdA==
X-Received: by 2002:a17:902:d488:b0:296:5b82:abb8 with SMTP id d9443c01a7336-297c03e87edmr41728225ad.25.1762520663678;
        Fri, 07 Nov 2025 05:04:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDi3VCG+jeQPZKjaDhNHY0E8KIkUAIShvjAZuhx0bHnqGMm1WhD/k5gY8hxa9TPWGiaTBl1A==
X-Received: by 2002:a17:902:d488:b0:296:5b82:abb8 with SMTP id d9443c01a7336-297c03e87edmr41727605ad.25.1762520663029;
        Fri, 07 Nov 2025 05:04:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953e791sm3028775b3a.7.2025.11.07.05.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 05:04:22 -0800 (PST)
Date: Fri, 7 Nov 2025 18:34:16 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
Message-ID: <20251107130416.owdceicrivofyfxi@hu-mojha-hyd.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-10-7017b0adc24e@oss.qualcomm.com>
 <7a5d188d-989f-4843-a10d-0fbad94a9ef0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a5d188d-989f-4843-a10d-0fbad94a9ef0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEwNiBTYWx0ZWRfX5PPmbqGm+z27
 Y93+fvQNYAKpSfkh5Yduu2cZ89eVQITVD+2TusvCBGUZX+xfOzfc2wBhxtjiJXhrK0LOxwZlYDP
 23TOrnAieVBzEZGSGpNp7fi7yiCF0L7Ug6+O6jlNg+83uZOtzNmpBUnyBAoAxgsuTpOuWkXTJ7m
 H1hifcPt7AJ/th1fWPXLPaq8v2/bgd4yQOBOQsuLxiyzJTRCFE9od7WzJVQRyDf4J+VHISO59XU
 36pjFjIw/oqEFT7TGbtKpS1/p53jCj05ALTOQ0R/si5Qd7+VswnvXHhKkmpnr5/v5LIAtRbmEco
 ja/3JsjXzD6E/+7/138MsI1g78DHdUcaYdR96Rsyt0+PR/f9bwSQT3nlPiVjQOBJ/A4jghpiUVZ
 DOo+ONlcKgfoJsOyW1hnFbWMCTknLQ==
X-Proofpoint-ORIG-GUID: CoZYdqfNTy5AfBnfU1DhXxQJQL4NE4CL
X-Proofpoint-GUID: CoZYdqfNTy5AfBnfU1DhXxQJQL4NE4CL
X-Authority-Analysis: v=2.4 cv=G9IR0tk5 c=1 sm=1 tr=0 ts=690dee58 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HuBIHT5r4gaFfCbWWWsA:9
 a=CjuIK1q_8ugA:10 a=s5zKW874KtQA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=Soy3cZ2v3rD3IzUh-QDm:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070106

On Fri, Nov 07, 2025 at 11:17:23AM +0100, Konrad Dybcio wrote:
> On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> > On SoCs running with a non-Gunyah-based hypervisor, Linux must take
> > responsibility for creating the SHM bridge both for metadata (before
> > calling qcom_scm_pas_init_image()) and for remoteproc memory (before
> > calling qcom_scm_pas_auth_and_reset()). We have taken care the things
> > required for qcom_scm_pas_auth_and_reset().
> > 
> > Lets put these awareness of above conditions into
> > qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release().
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index aabdef295492..9d3e45ec73ac 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -625,6 +625,33 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *me
> >  	return ret;
> >  }
> >  
> > +static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
> > +					    const void *metadata, size_t size)
> > +{
> > +	struct qcom_scm_pas_metadata *mdt_ctx;
> > +	struct qcom_scm_res res;
> > +	phys_addr_t mdata_phys;
> > +	void *mdata_buf;
> > +	int ret;
> > +
> > +	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> > +	if (!mdata_buf)
> > +		return -ENOMEM;
> 
> I'm still a little sour about this function having to be separate just
> because we use a different allocator..
> 
> Did we conclude that using set_dma_ops(some_tzmem_ops) was not going to
> work?

I think, you asked here [1], and we discussed on this. It is not
something plain that we can hook every DMA api to tzmem. This SMC function
or any such buffer which is passed to TZ when QHEE is present, is a
special case as QHEE makes shmbridge and Linux need to do when it is absent. 

are you saying set_dma_ops() every case or just when ctx->has_iommu = true ?
If it is for every case, we will observe crash during call of this
function when we will run with QHEE.

And doing it only for non-gunyah does not make sense..

or let me know if I did not understand your question ?


[1]
http://shc-kerarch-hyd:8080/kernel_archive/ed0b8ec3-035f-4ea4-83ba-8f2aba9ea623@oss.qualcomm.com/


> 
> Konrad

-- 
-Mukesh Ojha
