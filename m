Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D93F1AA8
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288919; cv=none; b=oTMNBy3D1y/69zHUmJbPKrG1j6TAWBnQri8UNXyt//IYubzIFrGspLsg/3dG9CH5YwGE9HGw/xlo7IHe2iSwCrruC1PXWhGX85Xsj54FM3aBldv1lNjqd4V9MVh4LosRG3hu3EUVsimkj3jNWH/4072y53OWgbc0bVtAoXO5s4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288919; c=relaxed/simple;
	bh=bsKrfT19/Dg39eGI2fJEyocjyeUDqPaBoUeZKAlTGTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LS9Wx+pjpZPRWwukWDKjXEgD4sNezwOK5fD7eianAtawZW1pERaN3CfdOvgzimaIkM3X2VaFgUpqs+PnKttqGYpEkjF+0Ttz2DCJ56NDJWWRe5ocjCgyZfNDZXM0LICXcomNiTbbw8GzfDhFsUENYYWsK867uarP9cBbVVzhkt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QL7ttgxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfyR3Ch5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QL7ttgxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfyR3Ch5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nYDG446942
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 14:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8EfUowemClkkBeFHarqbGwft
	5gIE1tGNjeNlEZjZHi8=; b=QL7ttgxpY7pVF73M2MCwtN7yEXbvSuwEzZlxb54c
	/cg71F2TdDRUT4fTm6azGpHHsdgrhIIfzcMqZ+ho5HAKvZR5mcnTDNSyLFAZyEPl
	8Pql3vy8gNiG0rOrAIojYEENSZLpQEhv35qX0R/e+e3IVBkC3eOGfY0dagNSCWPo
	9xPXuQI7dzI1dSjQ4erb+9yoEXh9HQ8U5TfYwh9iTFj9btPRK22Y8+WDaxa5Ltay
	TLNUf6gTfU+GTcC8ila+ss5KN+nPFp7YZORRiyb+iAODxjCZa9R/bYNl4mYzYmZK
	9R5cL4AiZAoLqi4NuP8F9wyK1iiUKptZ+473xJ/r4lv35Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9anrh4xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 14:55:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51009190feeso155331681cf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 May 2026 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288915; x=1779893715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8EfUowemClkkBeFHarqbGwft5gIE1tGNjeNlEZjZHi8=;
        b=XfyR3Ch5JOnFvcDnxHpuUqe2yb6d235zQTgbVUy0Rs5laTQgifQJyYMO+MNXDzu0mi
         afsg0D8Wg1sq3chMWVuDZaK/DaupxPCyCAAS4gf4DXCm25585QKEanrbLkRpOAuSXGtE
         rZh+lEkUs+VNsqO+r6OD5jhe1sQSYDARkBfnLjZT/Uk3subFNxDEfhZ+O5UthCHh4Qff
         X7fX4UJTTrPS3R5OYIFVpmIHq4UAbLUGL+uknQLIz+/dmoSaDdQkJphv8FofUTO5nbks
         hiFymGhBOTukYFfhNZgTjezQyxuedySUMZAUl/DzsQnK7bQUSOG0SIgtom2Av+5/EKrm
         f/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288915; x=1779893715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EfUowemClkkBeFHarqbGwft5gIE1tGNjeNlEZjZHi8=;
        b=FYPfgh6MS+vcrKR3YkswFRJ3OidCt5n5SMQN8NdLRswYlR420GbNQHTO9K1fPy2PvC
         wAwziZUSOKXDSfDdmuzbjf2nTlz8rr2yHimExSpIyENjcfX4aspaQsFfn7E0OZflU81B
         itqcc/vu8UG9/WPfNSqsWSzcEBLctjdXppOQvZZMVg7hnGsdwKyCgJPPHwC/i40oL8lo
         1a9aCa63kNrn2omOiVp0NjQtnuVNeW1KJA+Ag1Mhw3SW/s83wyOpQoc5WnqiQe2hI79g
         T6FvA1c4j4Mtv+sM1a24tTfed7mdYipusWEwcJtZL1a3lk/s8J5p1FWAttSTLYHBsvGM
         dUCw==
X-Forwarded-Encrypted: i=1; AFNElJ/VNR2YTK4ollpYqDxB5Upr6dhilaskea7uLzBFIj+IAdLXDcw91+u6L6rG9HLRMW60TeEZm4jnl+TyF9cPZ59S@vger.kernel.org
X-Gm-Message-State: AOJu0Yx21NFEpbfunidIHhCiOAkGseZbUwWrxnZQtt7JoiTCgJJBML7J
	nayDnOmAx5uiRjaxX2a+zopaAxaZJvxFD4EKDzbnxItLN+g9wyYpffq4UiCpipTI4uq0uTuLtsw
	4lRtqvbcCEuRLOEfmjlrKIIcIdRZ0DWEd+XeLrzLDI6nWU7MYKBaWXPSdZczSLcmbqO8Gz/Nj
X-Gm-Gg: Acq92OE6XG9Ub9R/Y8xpGzplVcvvgQUhjYeVjMFvUHDAH5OzdJUr+nxq5EqXGd8fQAF
	lEXFePVEQ1RnvwVJmX+nfJ0PUP68x+b8Rjd0gJ6INXaCuF9neOA3yqYGEt/LAKeFGCTP6ioB1rH
	Xx70/FJ5GBw+h5MJXmBNe4AG8oDZMvIVIZI2VRtda6BXyZWn75dn7rGqWlUR3W7WaGf9guR5bSV
	fFjWuuMENX4zMpUBbDNFLaJHZ1k0BTn574bEu7nMqtR8xVtCh66PAkQ+4y/5aZWiMzdNUG76CHE
	xsH6gD+unB9UAtToSeYe4n9daP02mByiyBrEwGR4wYRZDLNOK3u02yKrto8wPJaAdC5nIeF2kRI
	NTD6pFsBR3CuUpV5hzAEbY2tOv2Emz/TuvFjfb0fMfkhP1lbhJu+bi07m422NZ0gOHe5fg6Wt1P
	zPjyk536wNKEZmTK4L5SmXdHYlvi3nfu/NvQfMgw0uSQr/4Q==
X-Received: by 2002:a05:622a:180e:b0:50f:be4f:465d with SMTP id d75a77b69052e-5165a234758mr353075241cf.46.1779288914875;
        Wed, 20 May 2026 07:55:14 -0700 (PDT)
X-Received: by 2002:a05:622a:180e:b0:50f:be4f:465d with SMTP id d75a77b69052e-5165a234758mr353074691cf.46.1779288914396;
        Wed, 20 May 2026 07:55:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc0ccsm5049114e87.41.2026.05.20.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:55:13 -0700 (PDT)
Date: Wed, 20 May 2026 17:55:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add Shikra remoteproc
 support
Message-ID: <gkawm2psopuodlmv6kw2e4hdud67ahgnpha6jxmyp2bvwob5ph@7uv2jkopp7z4>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
 <20260520-shikra-rproc-v2-2-583a2e413a3a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-shikra-rproc-v2-2-583a2e413a3a@oss.qualcomm.com>
X-Proofpoint-GUID: jszZw_rUkZ9Tyx7orH0bOJdipJfhhLL2
X-Proofpoint-ORIG-GUID: jszZw_rUkZ9Tyx7orH0bOJdipJfhhLL2
X-Authority-Analysis: v=2.4 cv=UuJT8ewB c=1 sm=1 tr=0 ts=6a0dcb53 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=CtAqrJV6yErwifH23rQA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX0oP77uftm5HU
 VuD5kJuzdW3Ju67Ko38W5Y8yUOGSbS8PQ6W+loMwaCqQ8pCY8fpYv6O4smTcqIhF7Zzl31BHuSv
 Bh3wAQ2WlTdISVoOGaPeRKodpTAuDSrtNUcSLfbA/uZX1asYzkDf/lG+1qirqoBVp/fWXRbhWra
 oiwL65oYQugHqTIUQc5KT3k3wSYi3o5FLPYYNhvftvDS6MLXrNtEEgiGIWeGkU17NaMbL9HuEpB
 99cyEWqb/imK0AIIl6i6yi6T2j/jwvL1AtN2qOupycfOwgaEhmA3yLujq75wjDoigGkS8t1WYm3
 CekvpMpo9ucPcRT+Rr7N5/ifspTPgDHkndg65xSlBv+jXNtYlLhI7UjCZpIu2WbbYgIi1NCZwJu
 kgwoROzi7/PH3VDG9s4XbL8HeYVLNF4TyZDbxw1DUftcDZfizJNm6Q1c0DMtbm85FtEJcH5Pw3s
 h1FUsWlUeelE5XrII7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200145

On Wed, May 20, 2026 at 08:08:06PM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add the CDSP, LPAICP and MPSS Peripheral Authentication Service support
> for the Qualcomm Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 48 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
