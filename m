Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201A315D22
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997949; cv=none; b=pRW9hCNj1mzeqCtkT/qa5nf3yT3UBiFbCxAzXMOi2ZIHzmhSHPcco9QcX63wnOdaB0iMjgcR2LJGwxBjoFEoya+ANUqEvGor+8rMcbPqEkDgudNof0s8EfmQb5n9PKMpVYLO7O9jtkJBnvNb/9k4VE8XiV2QTq9h0A9H1RLZ0nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997949; c=relaxed/simple;
	bh=9rLc/3CNylDcoUI2xBmO0X0AQBMSrlF6X8puYxz9pC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONTRqmoEmmV6KxpKfa0TrHHrPsYnDm/QwVM02Jao9gtGu+rTBaqkakXdeptayyqty2CfoGkr781xfESfIejEP2WMYRUBU7+H1w80SA9RTqNSHVIagGjDqo/1voacI0GNLLF88aNPWFQZzAMY8KpYBAw770aOnVg0c9ZVdVgCvxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQOPMd+c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSix7EU8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQOPMd+c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSix7EU8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOE8YcE078534
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 15:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fg4PBnZGTltBf0/Grl7qvJuT
	Rdgj7EINCZqJULWJKQE=; b=kQOPMd+cqRCeLDKGxWb3Lg22F8pTTwl2NhgYLioI
	7hAyILvbpwt10wFUIdysL36nFb697OmOK/Px09z5S/M0lZZu/mxGajAg8BKQxbYa
	rMXwRnN52u9CXRdavyXx+Gn2SLDDo0mjKCUmXGMzU7XbNSnvsoDIuCAk6aO5BSj5
	gtci1NVNP2Rs7kU44dXp+KaMfcax4UUFGFDgWPkAkOw3vVBCRDx7+xXowNXReHge
	1AliUw3yU6d8couoTt5PCIKpkndt5YXxdLq+j3IlGOxKRoHsrIhWECapO03tuKYX
	3uM5h5wfEOrTZ4rnCaQv7mQycD7vz1u/VFhJXkbMI/BoPg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amrv687e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 15:25:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b873532cc8so3573606b3a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Nov 2025 07:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763997946; x=1764602746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fg4PBnZGTltBf0/Grl7qvJuTRdgj7EINCZqJULWJKQE=;
        b=eSix7EU8UTL4pg92F2BYQor4mU2sv1EYvFNk62qgrXp56P3lvd1ZckS+hIAxGO1UHS
         f029tKNWwO4twKEkeGtCq7NFypUyifYOVAJ/TvD6g+vDWAoMXiY1dixC5yL7Lm11mhJm
         5psNbZdrcgPBaYLggzErnlcl8RBtbIj7SofQm+H/VXGA91f6L7BBtPi4yLqSdavFf2n7
         LbidiuwQsqOrCqNXKRWnLU/cUvI+rOlK12decjStsOJVmPNwoMjvfNuLxD62bKv8osfU
         CTIiAf+x02qMxmnK92IzjjAFExLjMP/H+CxdFpnpfXFY47IcMo9e86Uu/QdEX2F0joHz
         Dc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763997946; x=1764602746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fg4PBnZGTltBf0/Grl7qvJuTRdgj7EINCZqJULWJKQE=;
        b=up8tdCcptDBLeT4gul6TKYyX3FeR+g+rgoNJCviec5ISl8w91qPvTccdbEZnhEKgrc
         dR+je0KRv6WjKIsLTGBSjjqzj9L7NCkQOcuYIo7tsT9oousTM/o2Vtw+p8cE5dyWRoi9
         /w0NNktrKa7sO0OjGI46hmZbAZqJtQu3au01/CPMg/BVpxVYRLY7/e2QZ2j5FMUAKquP
         Q3MmQWeJMc4jcKBv/sO9ih2Tlrczp+yjWT66WA1C68spcjcj0FcWwMKPXdnvaNZNGXTp
         2qeqNpOUsi3M0qXx32wT5gYqQZo1ysf/bD+OS/TrT77cAjtVrfzE9GFsz1nR77PZcWa5
         EdQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQA/+BkeN50jne0wP/qsDHstnsi1c1JZK3qj6bvrojwBodVME1rX5qBvRymNr7VEHAPmVRSfDUq+BHH27xL7yu@vger.kernel.org
X-Gm-Message-State: AOJu0YyIKAled5hYsGGznYevj1/KZFSi7CI5mrAAbrdVVyQs3JkPj8+v
	A3zShf+xXuAp77Edsef514g8AR4R9QhmYTBqe+Ll22X2j6yb7JHscsHbTefz5/LjnRoYKlz9nxw
	snYVsJmmGlF4NXc5OKokApC1T26alIlacQQYzPly3pfEzwPegZ8yOIKcQv4fUvmOlVj04GhEY
X-Gm-Gg: ASbGnctZ5qIbH1F93y6GGSDdRPxlRd+bAEEYO4QXyykV/Yg8wnX9aRjGyjRAckI9hxO
	s1iGZgSpXmQjSI8GwnRK3kvEPKymsUVw5IiUAN6INJdY+orpWmXItEX+hqeFm0xzleOqjjReRiS
	VK2vC+BCRHfRhzOfjqXo032yfTZfWXdtnkg113dnVF7fwI8vjcz3mwGYQWzPiWWUQ/PcAIfFxao
	d6hn23mztLauEcW2RucqMFgMNr4lQrVB2JWkfPhphsVphDwgX7qqIWidWOrKOANtw2oCtYRIRSz
	n0Upj8eHwjJYYmfUbed04Vam/h4tTF63g5vd/xB9jA3iRTh4jOisuLm0Ajkz1u9i/ias+y8blUW
	60X8cYHk6pgNBzXzMn18qeXaNokZgnl9n0EMF
X-Received: by 2002:a05:6a00:73a7:b0:7aa:8c11:b520 with SMTP id d2e1a72fcca58-7c41e6f85b1mr12477876b3a.7.1763997946324;
        Mon, 24 Nov 2025 07:25:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/UHfsebODaWNAZCLgjrzCkR/LldaPt7pCFEwZe0hWH8/0+EpwOVz0Lq7CT9NvYVD4iY5QWg==
X-Received: by 2002:a05:6a00:73a7:b0:7aa:8c11:b520 with SMTP id d2e1a72fcca58-7c41e6f85b1mr12477828b3a.7.1763997945572;
        Mon, 24 Nov 2025 07:25:45 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed076853sm15027686b3a.2.2025.11.24.07.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 07:25:45 -0800 (PST)
Date: Mon, 24 Nov 2025 20:55:38 +0530
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
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEzNSBTYWx0ZWRfX/PPxG6RzPPwM
 0u2pjUKFOcIrlpcrtTgCV3Fbn73nHrG5auD8t8CVgwiw7Kf+ah53kzIr3KiJQOlCghEBtVKFe3u
 0a7+yD1cuqnFIM13b3bQt24PEiu4UE6cgR+tIO+qkKOVtP6ivavYq8lLU4Czo95ShjlvhSZJNs8
 GZecWvmaovdPqhiDivPsR2HWm5ka992Gt8QoAib+9piTtxnfUZdgvn7jjPB9VHT97whovJCiKcD
 QDje0zcn8PFGr5O0Wd6fr34R9OB44jZuTRF00YqXK0CX0u1AiuXT2mDWY8mcMzjbGDVLSccyouE
 Pl1SE9s9k/EAgvWJR03SNGwMrWADSXDVu1cSOJ8S/cCDdHDz0LssjxRP+rJ+Bm35xeLHlKZHUNU
 y/hbxSHirayWauqn0RwIKZEJs8JSbA==
X-Proofpoint-GUID: 9LOBbBKoanxx0a3cGM3TIEcBmRqoK3ti
X-Authority-Analysis: v=2.4 cv=f7BFxeyM c=1 sm=1 tr=0 ts=692478fb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pnlhYKf0aWWrAWvAJv0A:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 9LOBbBKoanxx0a3cGM3TIEcBmRqoK3ti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_06,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240135

On Mon, Nov 24, 2025 at 12:48:31PM +0100, Konrad Dybcio wrote:
> On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> > Qualcomm remote processor may rely on Static and Dynamic resources for
> > it to be functional. Static resources are fixed like for example,
> > memory-mapped addresses required by the subsystem and dynamic
> > resources, such as shared memory in DDR etc., are determined at
> > runtime during the boot process.
> > 
> > For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> > hypervisor, all the resources whether it is static or dynamic, is
> > managed by the hypervisor. Dynamic resources if it is present for a
> > remote processor will always be coming from secure world via SMC call
> > while static resources may be present in remote processor firmware
> > binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> > with dynamic resources.
> > 
> > Some of the remote processor drivers, such as video, GPU, IPA, etc., do
> > not check whether resources are present in their remote processor
> > firmware binary. In such cases, the caller of this function should set
> > input_rt and input_rt_size as NULL and zero respectively. Remoteproc
> > framework has method to check whether firmware binary contain resources
> > or not and they should be pass resource table pointer to input_rt and
> > resource table size to input_rt_size and this will be forwarded to
> > TrustZone for authentication. TrustZone will then append the dynamic
> > resources and return the complete resource table in output_rt
> > 
> > More about documentation on resource table format can be found in
> > include/linux/remoteproc.h
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> > +			       size_t input_rt_size, void **output_rt,
> > +			       size_t *output_rt_size)
> > +{
> > +	unsigned int retry_num = 5;
> > +	int ret;
> > +
> > +	do {
> > +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
> > +		if (!*output_rt)
> > +			return -ENOMEM;
> > +
> > +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
> > +						   input_rt_size, output_rt,
> > +						   output_rt_size);
> > +		if (ret)
> > +			kfree(*output_rt);
> > +
> > +	} while (ret == -EAGAIN && --retry_num);
> 
> Will firmware return -EAGAIN as a result, or is this to handle the
> "buffer too small case"?

The latter one where a re-attempt could pass..

> 
> I think the latter should use a different errno (EOVERFLOW?) and print
> a message since we decided that it's the caller that suggests a suitable
> output buffer size

Agree with error code..

This is kept on the caller side keeping future in mind. where we can have
resource table coming from the client and it needs to go to TZ for
authentication.

Are you suggesting to move this retry on the caller side ?

Just for information, once video patches becomes ready, we may bring this
qcom_mdt_pas_map_devmem_rscs()[1] helper for video or any other client
should be do this here as well ?

I wanted to optimize this path, where caller is making a guess and
gets the updated output size in return.

[1]
https://lore.kernel.org/lkml/20250819165447.4149674-9-mukesh.ojha@oss.qualcomm.com/#t

> 
> In case it doesn't make sense for the caller to share their expectations,
> the buffer could be allocated (and perhaps resized if necessary) internally
> with some validation (i.e. a rsctable likely won't be 5 GiB)

Are you saying output_size as well should be checked and it should not be
greater than something like UINT_MAX or something.. ?

+	*output_rt_size = res.result[2];


> 
> Konrad

-- 
-Mukesh Ojha
