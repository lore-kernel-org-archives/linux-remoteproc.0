Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1184B3148A0
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228217; cv=none; b=L0HlhUDavzr74hwitpyZxCIVswhNTi/QlxMuGsT8KY9AicW2/bIngjfCIckX/X9O+g7fa0U/IZnf5oEp1rk/ycEVuDT4izrERR7i5dLa2ZKqwA9kcllcYysm0Ac9fzAc7Pt0uZBbWwzVbmZJakJiPy3uLOsmYoo/2FglDCpyrU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228217; c=relaxed/simple;
	bh=f8ftPV3xiHgDJO3jkGV07dflxj0UejplbYc+1EpIsHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhTPQmY/zLbaukpYZCLI5zBmOIcghW9ZIuFipSPaLBUJB+aG7E6ztsNpLUVpHDZeIzYH+5UKRAAD8xW+en6PPsBTl9j4NWly/Ce3Btl3hhP19+ICDMV11+uaGz3LsvBNajzJwATQ4JWOrwR+x1PSqQIHc3ev2fXjQnzw6/gf0wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILzDiJBY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbSVGLn6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ILzDiJBY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbSVGLn6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQN1htj2121989
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 07:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jRaC4UT+8oo90y5kJoTIxCo2
	v0dcG7S2LAtxYy6qX4E=; b=ILzDiJBYyYhujT65maNTAFYQxxqLo9wyB1gVf+4p
	pxmwBLClqBtzM0cD/6ZwkjnxkqAKovzcWjbeqwD6AwG5TfxVUmhFWFfHEiauscwE
	iLr5Vk/iZjYzUdGHWKHvoNg8Wt20uMOw60HLZmA0RtZyU7HePdVbBrqHHh+/mwO4
	+gGey6Qew543SQyw8u9zyrxEzQkFhd0vIQ+xSlK2MH5DKwL8Wrmrr7M+guXzmVZH
	LqasP/d9jtwWtzxbf5sAdhC/+NMnGCFg0cCEnYJPt1A1G2dTFbcemROqavDeTXEi
	AI4wNCPaCmeICT3LkFeZrMZ5ktZxmegfWB0tfVmdg7K7sQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0b32v0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 27 Nov 2025 07:23:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3436d81a532so970557a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Nov 2025 23:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764228213; x=1764833013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jRaC4UT+8oo90y5kJoTIxCo2v0dcG7S2LAtxYy6qX4E=;
        b=GbSVGLn6YS5jv1ygo8GE1GNwMdy9mQNjgtRS4u7QVT/2/jgq0KMblPPw5sJe5a/ah6
         3U6TAveL71uI9/J8Tks9MM6iL+UxRbkDMJmkU7c6if77a5d4DAVVO+KxE7ui1PFV5ol9
         aOcF/jkqLddrnduuAszOj3gJK3LdrAxd5x1BvOgfiV55cpfU864w/Fq+tQBHMl7LtGjR
         OVQHDNdaSt3+K40u3a+qBpTFtqvtruALa4ScnVGvVYVnaXEDjfIuwyr9MEJtCpt6vFjj
         8jpgHouZB+GYkxX55ktUjFNSn8cB/QfNPVeU2mwVgxp1tRJGcykFpbrgt6lOqTa4YYsa
         xoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764228213; x=1764833013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRaC4UT+8oo90y5kJoTIxCo2v0dcG7S2LAtxYy6qX4E=;
        b=pvnuCi3igIVbf2w1S073I27V6+JmiQfa0NRApbAoH0sTjjqsC99t5NKLeLULGAeK8H
         2wyUUozVl8YJ+DAXEuDp3yFmdQWDVnr+DHCXGUYpkfgLujRhBHN+fsONluka9V3JrDAo
         NWi7cuXNWp9wt4mCC7OZ+qpkDMkiMtEWYZKeoXuqfmPN9ODwDiZZ/IUD41lLaEivei26
         6gOKJ17dZ6negPhjSohZEYHKioI0/n7gTQlJZD3zocsRJCfsQVPeOcnU42bkG4UlfQi5
         yblRbxwgh781L/5fitwXlKyEysMMnr9Tdjd5WrU/HjEFEJFQ0u2AwublbbUxsyrXchcz
         BHbw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Jog3PXxAQzGikdEMlwWUTHX8/MSb1b2cnlCfSEU6cw4EGoBqqca3AyLoJLk2N0ew6pGjFe4fmGKDI/XAgC4i@vger.kernel.org
X-Gm-Message-State: AOJu0YwX7I+eZ1p1YO9g1SM9ZRWzlAR3D7C3WVlaN58u7kUt5ZogsV0m
	ANCMwmDVHk5iNbkajOhmILbmFTrrUo6jvAQ9uIAQ77EdifJzMUY8sj1eSiLOTGwGglwBPymYkBh
	s8DTz1KSTmWa/uK0nBOqqZ0Z6WknPkslzvC8IgQkCMk2BWy7kfanaVekmwQkDZc0gYrx9e1ky
X-Gm-Gg: ASbGncuDq6Dhq+SN+CBRxJCEpPxL2SnwKxpHbX8FNZ5JxaHyiuvJSqSj+gjEKsjsp7t
	QzKypoQDw+B96b49r67/rnBl9ZUYGxrHKXjZs6SMxh/KcLBUcmKYJ18bqfiCAE1dkldeveYr03T
	FEMZweiJES55E/QTWUmUqSoOhhLA1Mf7IXow1jfEfn1SpYDgJKXjCDSEljUI7hwJUaafDPkJZaB
	UV0cTfQ3SjgRzNFuA2+0sppu3aBDnRrRiQmu1WdJ5sNTB2wzELQUjzRsicXipvA4nGN0pL5xYJD
	jhbYqY+yrnWhxfnE4sjvpNa/uciJ2TgRakr66gcHbxLSlMP2xcv86moMoR6ETThDj3rPBTy/qV6
	ojStABlLa+cb25zduKxN1SrUL6NPIrjse5tSz
X-Received: by 2002:a17:90b:510a:b0:340:f05a:3ec3 with SMTP id 98e67ed59e1d1-34733f5b79bmr21708019a91.33.1764228212742;
        Wed, 26 Nov 2025 23:23:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpvPqiRMEjLXDFiFwkoUZ48jtjGmVRddxdYXeZ0ze/JIT1YPAhzjtrdVERdaf3y1fL9GRwzQ==
X-Received: by 2002:a17:90b:510a:b0:340:f05a:3ec3 with SMTP id 98e67ed59e1d1-34733f5b79bmr21707987a91.33.1764228212016;
        Wed, 26 Nov 2025 23:23:32 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a54705csm4695378a91.2.2025.11.26.23.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:23:31 -0800 (PST)
Date: Thu, 27 Nov 2025 12:53:24 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 13/14] remoteproc: qcom: pas: Enable Secure PAS
 support with IOMMU managed by Linux
Message-ID: <20251127072324.ogy3hlv5k26veqbq@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-13-8e8e9fb0eca0@oss.qualcomm.com>
 <d7342610-c37b-4f5e-a2bc-1a683f9acf97@oss.qualcomm.com>
 <20251124120318.oqq42ndefnxyihfb@hu-mojha-hyd.qualcomm.com>
 <pxddyr7c2o7dmnw4zvrakxnekcn5mssisxldd7dercd6njjkh4@2mwntnirmdse>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pxddyr7c2o7dmnw4zvrakxnekcn5mssisxldd7dercd6njjkh4@2mwntnirmdse>
X-Authority-Analysis: v=2.4 cv=E+XAZKdl c=1 sm=1 tr=0 ts=6927fc75 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=E8HcSpDLYgECe57lXLsA:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA1MSBTYWx0ZWRfXyLrA/qYeQ06u
 Bj3YKJGDJAf/TSG27LVngUEklsPD+Y5dVho9+whm9YhwJEGHMUa0/+4H3nr+/1eKW06wNDeIwcL
 ddYYq3YGuKp91Cf0UpN3Lt4Atnm72ryVeTrDQy/Yd3MP0UhmLGMSASQ4RCbYZX+bRyNX8Z+uvhB
 92kBcSHHEREReKb4RHuF1QSPqrMKwMBmg3eNMCT1ipYBU4AntMJKtdR9rWJ3cXcl43Er4aDUyZ3
 Az6LATM9gBbd+meb0JL8Ma4AHiY4gxOS2naIHXSnBi/vz9btVm4MCZwqkD6PATfRY6KqVXSv0Rn
 OW/0jN1RUXd5YNClB4POdXE47zzLxmViNBqCMqePt2CNYFyY9jV036CM9kMIM5k1qUFF4fCkgWh
 zjGrAwlUiWEO4eSf+vKNQUskarRopA==
X-Proofpoint-ORIG-GUID: bSeA0f9P7KQytYfu9Q2YYat4wCLK-anC
X-Proofpoint-GUID: bSeA0f9P7KQytYfu9Q2YYat4wCLK-anC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270051

On Wed, Nov 26, 2025 at 10:40:51AM -0600, Bjorn Andersson wrote:
> On Mon, Nov 24, 2025 at 05:33:18PM +0530, Mukesh Ojha wrote:
> > On Mon, Nov 24, 2025 at 12:31:47PM +0100, Konrad Dybcio wrote:
> > > On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> > > > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > > > handles IOMMU configuration. This includes mapping memory regions and
> > > > device memory resources for remote processors by intercepting
> > > > qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> > > > during teardown. Additionally, SHM bridge setup is required to enable
> > > > memory protection for both remoteproc metadata and its memory regions.
> > > > When the aforementioned hypervisor is absent, the operating system must
> > > > perform these configurations instead.
> > > > 
> > > > When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> > > > own device tree overlay file that specifies the firmware stream ID now
> > > > managed by Linux for a particular remote processor. If the iommus
> > > > property is specified in the remoteproc device tree node, it indicates
> > > > that IOMMU configuration must be handled by Linux. In this case, the
> > > > has_iommu flag is set for the remote processor, which ensures that the
> > > > resource table, carveouts, and SHM bridge are properly configured before
> > > > memory is passed to TrustZone for authentication. Otherwise, the
> > > > has_iommu flag remains unset, which indicates default behavior.
> > > > 
> > > > Enables Secure PAS support for remote processors when IOMMU configuration
> > > > is managed by Linux.
> > > > 
> > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > > ---
> > > 
> > > [...]
> > > 
> > > > +	pas->pas_ctx->has_iommu = rproc->has_iommu;
> > > > +	pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
> > > 
> > > Sorry if we've been there before, but I see that IOMMU-mapping happens
> > > before ctx initialization.. can we drop this parameter and just use
> > > device_iommu_mapped(ctx->dev) in qcom_scm_pas_prepare_and_auth_reset()?
> > 
> > You are right and I am not against it, rproc already has variable `has_iommu`
> > which we use in framework and vendor driver too, but what I thought,
> > since this thing we have to do even for Iris or other drivers who are
> > effected, they already have device which are behind IOMMU and if wrong
> > device is passed in device_iommu_mapped() instead of firmware device which
> > could have returned true even when Gunyah is present.
> > 
> > If you feel, has_iommu is not correct name, I could rename it to fw_iommu ?
> > 
> 
> While this does relate to "has_iommu" and/or "fw_iommu" when it comes to
> the current PAS context, the "feature flag" is "should we use tzmem or
> not".
> 
> Further, in the case of the modem, we don't have an IOMMU, but we still
> need to set this flag on the ctx in order to get the metadata into TZ.
> 
> So, I think this should be detached from the "iommu". How about naming
> the "has_iommu" in the context to "use_tzmem"?

Sure, this way it gets attached to tzmem alloc/create API to be used or
not for PIL SMC calls.

> 
> Regards,
> Bjorn
> 
> > -- 
> > -Mukesh Ojha

-- 
-Mukesh Ojha
