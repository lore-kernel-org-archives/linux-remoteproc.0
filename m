Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07D92EACF2
	for <linux-remoteproc@vger.kernel.org>; Sun, 19 Oct 2025 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760889618; cv=none; b=WH0KWpL7u+Ji2Cs3+hwcnd3oqzzA/KdyyIRYBdlrDL31hLmPGBzdfJtqmo+2U2PmaSoYdKHhw6Hu6dPlUXlfHmSiISiE9Vw1GGs40Zb/MN6sGISQlb+7IRyPADZ0I0x9Ca2UlpKnJjEcd2mM1qPGn4j2xc2gjDVSknOlzjol6uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760889618; c=relaxed/simple;
	bh=xzkqNwARdbLPvZgk1OAgS7gX8Y2Q8ThSI+Q8n9mJvko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwqSHTiQdMWjmVWyFnLXQn1wvCMD8TQwE5PUD14s3EM4pv+xKTVRlV4/rvLU3X8eGvUIJYiAazbGsXPZ4E65HY1mV/vr8b9ZGGM0G0MgMztxhfHDJChLCbfhDPUXYiRZUZrkmeI2V1ATArRk7+LTDAKakT9wYn63QdfRdI4GgBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feI+pIQ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feI+pIQ3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J8hGLp004476
	for <linux-remoteproc@vger.kernel.org>; Sun, 19 Oct 2025 16:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAnCrH43ey70zMSRTiR6RqBTO1JA+aVfzw+gy4a88is=; b=feI+pIQ3/fGt1CMW
	xD2FBpeiwuud94vB6kvK3eapY/ygA5ChHpQGrj2eUE9ybAlkpT/N3aXXNm8Vtjfh
	5EMztP3cxfAyqI5mL/IMxJPr0BmfBX/CvEd68Fuq14i+W4jMsoIykAK9fxbJYASz
	ZYCThos0pyHwgHsxOIblxv+g/GozptCjh5sv9U6Q69LPl+zK7N4tuqNY6HMqxPdj
	qGn7bnq1glwaA2uZ5rC8qLAhk6hA3rZYYK9SAjplX0vHN+KdzJDGakLC4Mh3HFHg
	OG3hp6mW1AZr0kNkalPZR7U48ZKdKcXd8s+kq8mtI+GEBPoWVkOXP6nC9PeLSe9U
	9hIfow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469ah5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 19 Oct 2025 16:00:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88fec61f826so1122577885a.1
        for <linux-remoteproc@vger.kernel.org>; Sun, 19 Oct 2025 09:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760889614; x=1761494414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAnCrH43ey70zMSRTiR6RqBTO1JA+aVfzw+gy4a88is=;
        b=rJRMMqCu2rNh3gKTz88oYLFWD0p1tf2qCHrXxrdCrAIZ+H2kCUoDDDF3Ohtbo7Wmir
         ZeoIqKwKpE/4NMjNLHUUbalYSvUXe0Zj65T9TuhEYaidw9rNSvtmvXQ+9fFDkMTwBvnv
         bPLefCafFd2li/o2ZmIE9/JTkSNgCZLgi1lvXr6YJxeYyJkS1pVIKcKLv0vZP12fhzRl
         n1HzhxCHUE3TxyC21iT8gWQxJ0udSHhVM0h1Trci9z0kExtDXoBbpI6v7LLj6gyWIH1a
         k6fkFKYc5yF/lbIFBZ89GvssmHM9ThLuDJe0Nl8lbqlCYdj2B7y3vLHgjLOv48K3Y9jX
         gA5g==
X-Forwarded-Encrypted: i=1; AJvYcCVnT3N4DbD5mafAd/nORQQ8RtMfqvw02qJ1hnkeYSTz/FRSc9wmt+8pBFOwD2fOgvbF8cwphXPPsCSgVuvytlyo@vger.kernel.org
X-Gm-Message-State: AOJu0YyhYhjfCsfWrkmYWegXHogijUeH98R7yfVcfUxMdMPGqlORWjpu
	Q5avTBt+kLNnJm0k44bPLiMYb6C1snUInOGffMjQtzyIRcjk4aXAEewLHCSNigjYXb9riixDwpy
	CKcON7pnmGBbfMwn1xdIRm7/BDKRNPC0QMTYIyCmqqAgmFFYbnq9jQdlYEe896R3zW6Ep4TH1s9
	8sCeAc
X-Gm-Gg: ASbGncsVHuQXbusKT8Uoh7lA46C8ul1Z/oEKI/nCl9DY1Nsz3qhcXYjBZf8gDNy2JIt
	HvKS1/ALzVgK+Hg0q1h2yDlbXlFBjPD+G185Nvr1tx00nZntwbUYJ9X3U2LoqzoppK1Fdvn2e2Y
	Au96FlU5pchFf6A22HKYfhgvBhZMfGc7wP2EeO+jdYwzDkLQotNYix9O7fhMaYBhNVFAHYG6TPg
	HszRAZkj2DHACAoEMgD1gTgSntqdHZLV/dL/PVPFWH37Y/EwSO1bKWJnyevAInVW58Tg9M7jyc2
	GHaWvdJNGfR8IFFtMhSp3K+3/PeT7PxwdPYZ7EBvtmfJo4HkHXxbZsWbuEo3m1sMCOC/7FTLy4u
	4KTf9XbPkPsMjgeooVTh7amCZ4sn5f1LC1lXnx0dslbqDE9T7hUEwixY/n3S+hczK0ZOSmBejaA
	MTSFdCaFs/uRc=
X-Received: by 2002:a05:622a:28b:b0:4e8:a54d:cce0 with SMTP id d75a77b69052e-4e8a54dcd87mr102910101cf.53.1760889613600;
        Sun, 19 Oct 2025 09:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCrJXyG7fI27LwTBfN2BGJKRA1ASFutxhuVWs+afd3DWD5EMMDTDstaSi4ip0vg9wyDkDPdw==
X-Received: by 2002:a05:622a:28b:b0:4e8:a54d:cce0 with SMTP id d75a77b69052e-4e8a54dcd87mr102909491cf.53.1760889613076;
        Sun, 19 Oct 2025 09:00:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def16b3csm1658498e87.72.2025.10.19.09.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 09:00:12 -0700 (PDT)
Date: Sun, 19 Oct 2025 19:00:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: pas: Add support for SDM660 CDSP
Message-ID: <nv2lsvuzrgoepr376gghk2klm7jqtmpcg6auairl6zzm2hks5s@z5kohfm6orn6>
References: <20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org>
 <20251019-qcom-sdm660-cdsp-v2-3-0d3bcb468de0@mainlining.org>
 <sasjgm6pua77syu5qjbr5zxl37jorvhs4dx75lbiqlisr5aq4h@zjxu4k2wcfye>
 <596771dc-1564-4f46-ac07-ac0e9c6c80ab@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <596771dc-1564-4f46-ac07-ac0e9c6c80ab@mainlining.org>
X-Proofpoint-ORIG-GUID: TyUfudLC_1bVuPB_uBQy9ux9C91Ff39R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX56iM8kuOoy4a
 x6KJehQuf8eeVSOnc6uStdG7QGveb99w7a6UybrZAorFE0hmWunLlSnnW6lU0Hn4raXGkNJIyVc
 kyMVph6FOYHf7L+mDIMH2JZZmbLX5zbkjCHdEVBklIKP7xrGy/RV1kzoHR8rppI2sHv4OBHogdj
 5mQQEcb+FYSjJn4H991VlMvdYN6eX87TCu3esYxNj6W/VXRj4AMefotTAfiZVso5JxNeeEuIyou
 z/docuYJINDfqpv80FdiFOIwRk7V0GlhiQdZiO3nCCs7lid30E2e8MWsOYd2k/T6aJLZaGZpNtN
 GrDalGNphbYGBpVMm+s3D0Mp3UZsgiFbX/jr8S0ctd/tksPuRmhifWpWAEJLnxjViO9Jp3bv69a
 48rn2LNEVtBsh8XbP8CzGySs1nUVTw==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f50b0f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=JmBaj7UERdyy7ZS9UVoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: TyUfudLC_1bVuPB_uBQy9ux9C91Ff39R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On Sun, Oct 19, 2025 at 06:38:01PM +0300, Nickolay Goppen wrote:
> 
> 19.10.2025 18:37, Dmitry Baryshkov пишет:
> > On Sun, Oct 19, 2025 at 05:20:21PM +0300, Nickolay Goppen wrote:
> > > Compute DSP in SDM660 is compatible with generic cdsp_resource_init
> > > descriptor.
> > > 
> > > Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_pas.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # ifc6560
> > 
> > Please send DT patches too.
> I can send them separately

Yes, please

-- 
With best wishes
Dmitry
