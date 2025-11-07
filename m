Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF11DE3C0
	for <linux-remoteproc@vger.kernel.org>; Fri,  7 Nov 2025 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762515292; cv=none; b=Q4FOSuFOGwZA5HdRutp+B0w1CB+Cr7SbYMW6bW5s86w5yC3v93WrD/306O+xnusc+qxCfQxu3zAluZyes9IaM+0tUyRqIx9lR+BxAkC7q8EF8DVlMyXpEKyiERa3G0nDYDcysZ8NKRseGKA62HhO79AJm4OSD/9XNivysgky9ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762515292; c=relaxed/simple;
	bh=MQXsnjnfIpZGCTh04vWN3x36IFSv+n8I/lg/WXT96n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGUBAAEAGv49KQptHuoJBXPknS8qr3pKvY0T8TgXQ52c8RCXkhfzXBfgmYqJ24r6/uCdbKwc8ke0/nH/0OFyCzmUeK9Cd4veX5UNsAV/dNkd9FkyW2ZhCL7J75ppVRVuT3gFYVkeP2Fm2QRjGmaq3Dfn7HRIm74I431aKESMMqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipnMDxEZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFtO1X6V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipnMDxEZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFtO1X6V"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7BEkIr583595
	for <linux-remoteproc@vger.kernel.org>; Fri, 7 Nov 2025 11:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vZWka9X/5uROFI+18ZwN5+YD
	qQ7ZdMbSuHHh59YqHZY=; b=ipnMDxEZnE5JiNDp8YepmzxOlukJiZSYRz79qfeh
	gLM6COUIQkbBOGJ71uwZGXX+DIoTmwCoKskG57HIe+muhbday0Pz3qbU2c7Cm8GP
	KbCk+1Zo0rptIh96XiTcTjJQujPW+EUCTwdwSu+vfKyTasxe7xVkVj8BYiTlw3WX
	7GxUDBClAvg9ufmuDi/We2x792qmBP1JO6o6EQcukVPqejkI0hI+AVGGJYwYl1em
	EcO4po2ex0hwJaMk5hs+pM6Kp5v2jy4n4mwWIAOyVl9mVhVTXWrdklLeCXOfWb/M
	b1zhk2jE9frsvEbCzbKXjrB7CCqBL03jONwDTeexboNpIA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktjwh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 11:34:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7afd7789d4cso1043663b3a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 07 Nov 2025 03:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762515290; x=1763120090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vZWka9X/5uROFI+18ZwN5+YDqQ7ZdMbSuHHh59YqHZY=;
        b=EFtO1X6VZCevJYpdLopzxYvLV4EuHZ0ROLHkeXQ6n1J/Y5z32l6RQDPUwn9kMFNQDg
         B6Uo9A1u+EbqzKpGAayeWP0Q14DCEeRMZGN+m+80UMX4909CA3R+/HM4CFjgi/FiNDlN
         raLw9vJ+yl8LlgnSa7VQ4hkzkFiBl0Dqa4LA1xBTdridCMJoI5JS8iKzRajM93c7UJRe
         i5WZ5jn4rycqcaP3mCUUtKjGpJLKQIBm8ncA4wm0znVmlh/n/YKpbPdLU1BuvwmpXL/l
         uQfl3d37LpWDdt1m2m/BXAel9BuP7FqvG3BEs+eXm6lm+MZamc99CWUEZFQlqQndyVVZ
         dWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762515290; x=1763120090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZWka9X/5uROFI+18ZwN5+YDqQ7ZdMbSuHHh59YqHZY=;
        b=VJ6D6HGnrEcT9bt4zdPEcLzuPKC6mpMlzd4x+aRK3zSTarFVIruUDy13iWEr1vW72o
         tmVzr9Aqgm8fFvGB0Q233PMuTabJaW1GRzgc0FKdIp4m0TqZJAnIke222eunEspSRhyo
         5B9qpB/01rGP2CnSNgSsJ8bYhmUDEcswSLwGmXt1d3DtiI/Sl/ol8/NiqZooPUq+owLB
         W1OP6f+Se6aQVR8yQUFFNr+aMpNFea0r37ajndwDjYxYIcUHLwdYncEIAc4v+BNj3wB1
         4ikxn+NJZ5az8NhA55bBbseAEnmS+LclVFcoFWfpovqpBn8CLhWHWYvVpFaDYA23lyuI
         H7RA==
X-Forwarded-Encrypted: i=1; AJvYcCVlpLXycpAeG2iGW61eOLVcZP2h+Ur5bXudn+OaYP+PLkT7dGlzuYvi66vZ5sJkCMv5RgCQ9lFrpEBglw+u85Sa@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKGwfp2MIDi67Tzabys3/6cVWZuZdw9PMdW1UmvLpNVjRekrH
	wc8754toubC/DM5VDcFvRZBQSftCl599PNvIYRNuHCNkfxNCcD/3q0Fq/ctOk8dqhXALAVTpS4B
	ArSIF1cHDh8jcA7a+FckNbHx+8iPX5GGU1SRFJjJ+nR5T+g473EEfZtQsaxxZC7N9qLX80StD
X-Gm-Gg: ASbGncv5q7VfHE/vCxlDX8hVnMVyvpLPCjsYMJ9+UKZbXavjfkLN4k5ntRL2UWgYZWo
	0ce4pO0wIO6Snnh5CrasH+hAm1nJUSUcLh4xFaGlegi4tA0FwJmnqYopChgkM2Qb9TMeLpzjeIp
	0rDAkGwiyyHe14quy3wFBzBazwAXOlpeLIURvKcaag2+BoOph0qfKTOFsfdAbk0y0oesyRKHQ3f
	mvpYqWW8kK8SkxVHdiTQxby9N1yFm31qypOhIdJJHofBuz58vHIgha2XxvSHbFKFCUfB9VzHMYK
	Afz3rMivgrEfNk1K3mnEboQAynm22bV09uQHEFHZbzvAxlCKTsw8naRr1BXcGFBoXf0/eLjK3+x
	6U52J3asbOTpdrYgEGxn45uqE6w==
X-Received: by 2002:a05:6a00:1812:b0:7ab:f72e:8faa with SMTP id d2e1a72fcca58-7b0bdb873cdmr3778419b3a.27.1762515289758;
        Fri, 07 Nov 2025 03:34:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWwrPXDpHf0VORSSfbxDz+3mYFgZW9OhUNZ+39bE+mQIPXy5tKbSJ0RtFga+TqnfE2aoBL5Q==
X-Received: by 2002:a05:6a00:1812:b0:7ab:f72e:8faa with SMTP id d2e1a72fcca58-7b0bdb873cdmr3778378b3a.27.1762515289047;
        Fri, 07 Nov 2025 03:34:49 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9632e22sm2786673b3a.8.2025.11.07.03.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:34:48 -0800 (PST)
Date: Fri, 7 Nov 2025 17:04:42 +0530
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
Subject: Re: [PATCH v6 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Message-ID: <20251107113442.e2qxn6ifmo2rprus@hu-mojha-hyd.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-12-7017b0adc24e@oss.qualcomm.com>
 <89e65adf-fdd4-4b98-a220-fb0f77dae7c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89e65adf-fdd4-4b98-a220-fb0f77dae7c6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690dd95a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=MZ-GuwlMPDuacp9TLA8A:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: NjPmwAxgl6Yc-b_tz_02Q4wI9EsXw9tC
X-Proofpoint-GUID: NjPmwAxgl6Yc-b_tz_02Q4wI9EsXw9tC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5NCBTYWx0ZWRfX6ttCjhtM4SG7
 B6t8YO42qI/Y2O5pcp3Vf1bu16p3ICvxElT8r1KgLdHYBUE4qwZvv74U3u6he27NaT8+Cfnm8t+
 PS/ww+Cssu91aV31vfOn2h/a5ICSlCquYto94KYjdbHJ0RaZkSaBnQhGf9uVbQP1HD/yl9NiAeQ
 OuCZmu5nZAG69CpzXbzoihOsqzigNtDCRpo+iOZjiLwekiyFQu8WAZQ/w1Fw5lzX6lD79lS/cJX
 G/NDNNwFATl94XiAhoufYNRZkEVRSA6nfSdP9Tycyu784l1iYdB5dzIa28HMDk8M/t6Rt4XztKa
 g7qBPJy5BAUlutdverSZxui2W6tQxO+wQeDo9936opy0/lUYuwalsQbtn9QiTCfHd7c65gV8X7M
 07vZ/cF7dhC/8fawmZNSc4tfA/yv7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070094

On Fri, Nov 07, 2025 at 11:47:02AM +0100, Konrad Dybcio wrote:
> On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> > Qualcomm remote processor may rely on static and dynamic resources for
> > it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> > or older QHEE hypervisor, all the resources whether it is static or
> > dynamic, is managed by the hypervisor. Dynamic resources if it is
> > present for a remote processor will always be coming from secure world
> > via SMC call while static resources may be present in remote processor
> > firmware binary or it may be coming from SMC call along with dynamic
> > resources.
> 
> [...]
> 
> > +	/*
> > +	 * Qualcomm remote processor may rely on static and dynamic resources for
> > +	 * it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> > +	 * or older QHEE hypervisor, all the resources whether it is static or dynamic,
> > +	 * is managed by present hypervisor. Dynamic resources if it is present for
> > +	 * a remote processor will always be coming from secure world via SMC call
> > +	 * while static resources may be present in remote processor firmware binary
> > +	 * or it may be coming from SMC call along with dynamic resources.
> 
> How about:
> 
> """
> The resources consumed by Qualcomm remote processors fall into two categories:
> static (such as the memory carveouts for the rproc firmware) and dynamic (like
> shared memory pools).
> 
> Both are managed by a Qualcomm hypervisor (such as QHEE or Gunyah), if one is
> present.
> 
> Otherwise, a resource table must be retrieved via an SCM call. That table will
> list all dynamic resources (if any) and possibly the static ones.
> The static resources may also come from a resource table embedded in the rproc
> firmware instead.
> """
> 
> ?

Concise, thanks for the effort.

> 
> > +	 *
> > +	 * Here, we call rproc_elf_load_rsc_table() to check firmware binary has resources
> > +	 * or not and if it is not having then we pass NULL and zero as input resource
> > +	 * table pointer and size respectively to the argument of qcom_scm_pas_get_rsc_table()
> > +	 * and this is even true for Qualcomm remote processor who does follow remoteproc
> > +	 * framework.
> > +	 */
> > +	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, table, table_sz, &output_rt,
> > +					 &output_rt_size);
> > +	if (ret) {
> > +		dev_err(pas->dev, "Error in getting resource table: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	kfree(rproc->cached_table);
> 
> Would this not simply discard the firmware binary table in the "split case"?
> 

For split case, it will have resource table from remote processor firmware,
which we are passing as part of qcom_scm_pas_get_rsc_table(), TZ firmware
will append dynamic one after authentication the static one and will copy
the final table in output_rt and its total size in output_rt_size.

> Konrad
> 
> > +	rproc->cached_table = output_rt;
> > +	rproc->table_ptr = rproc->cached_table;
> > +	rproc->table_sz = output_rt_size;
> > +
> > +	return ret;
> > +}
> > +
> >  static unsigned long qcom_pas_panic(struct rproc *rproc)
> >  {
> >  	struct qcom_pas *pas = rproc->priv;
> > @@ -425,7 +481,7 @@ static const struct rproc_ops qcom_pas_ops = {
> >  	.start = qcom_pas_start,
> >  	.stop = qcom_pas_stop,
> >  	.da_to_va = qcom_pas_da_to_va,
> > -	.parse_fw = qcom_register_dump_segments,
> > +	.parse_fw = qcom_pas_parse_firmware,
> >  	.load = qcom_pas_load,
> >  	.panic = qcom_pas_panic,
> >  };
> > @@ -435,7 +491,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
> >  	.start = qcom_pas_start,
> >  	.stop = qcom_pas_stop,
> >  	.da_to_va = qcom_pas_da_to_va,
> > -	.parse_fw = qcom_register_dump_segments,
> > +	.parse_fw = qcom_pas_parse_firmware,
> >  	.load = qcom_pas_load,
> >  	.panic = qcom_pas_panic,
> >  	.coredump = qcom_pas_minidump,
> > 

-- 
-Mukesh Ojha
