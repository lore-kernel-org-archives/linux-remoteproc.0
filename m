Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F0B2EA731
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759915179; cv=none; b=RJkFllB6MYYRwtLJRGezGOszDS4cEo3BxuKbb5EFDvh/Z5gBL/mwnGS6hVlbygFBC5qDk4G7t+SDKRPTULB2NwztBFvz8ZLNz9zlOnb9eMXgJEGXF+JvvkozZO03ssldxw/azLgfj+npPWRrBMOkMm2fZVW1ygHwB2hg52QAUkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759915179; c=relaxed/simple;
	bh=7QRpahmcmOdw5PQH5i1we5xeffs7vinNRUO2Yk6g8rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUHnb3et3vG1Um88wpvcafbW/t114gi6bCTmaxrNsV3ynuZfKEUygzF5sp1FynIe0QrMD6PNO+IhPxRmOGpP22IEd5EIamLDrZOIBTI2lYGLBNZzLayC5VMf1hK+BhOIBZxIAVPPTwzBWFhQ/oXUiII/qmXaNt9WxOh4ozwz+Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCXeKTrg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCXeKTrg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890eil010088
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 09:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDebG30uzC8d/gzatvcnaoRcwyzXptUm9ibGKb8H8Lw=; b=WCXeKTrgFRUsUMWM
	vKLcmY3fLjkDW8xAjUmfLuR67jar8W60WZJBTMzWqK7rKvz6srdwR0qTsnaDwbrQ
	Tjg4RRzSMnHlp03SoV1ZkLUwbK6SE89t056abEGJ43s19o7S3Kw25oSPjjdlKLRf
	p7L/E0oj3X4vF4w2PQLm1DvpX75ltYIIwF+rwGlb1PAl30FsBkgd4dtR1rEYsLKa
	BbayXb9YO3/vznh7hM0k2fdbBBRWxwuSYNseDKFw+sDMwDaTC5BPlzfODLsAPXtu
	mUMfOlRs+YIqoU+O6hafIu/V81eZtZSQWA0AJfKlt7rfYfUkXc4H4eGDG7Z6zrxE
	HbfoOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu9x6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 09:19:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-853f011da26so238440585a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 02:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759915176; x=1760519976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDebG30uzC8d/gzatvcnaoRcwyzXptUm9ibGKb8H8Lw=;
        b=DeR+tmTVGl4pg5ogDj3UxiEF8JHdSPfF0f+e25TCaQwdKGKBB1WinuyHoY6UdCAWzW
         gQrbrNfzriZIxo2WNMynrsTvRbjnNOHITdtvpqmFpUBID/xxElp9Vh3LyUkoq9iyHTPT
         2svQRaMpi/aLWRJlRbJ+9Bs05mownn3V4hgN8z3hkn01RKrVJIHuyR3ePExBwEYbj4BU
         LhAOKGHOACqqWXqM1u6JtPUC1rw+xqVIJ5nnWyQC7OON09qGFfEvlSxtAToesIEKIQqA
         s2yAw4qXiv/wRU1U9gRO9kbqiAx8vt0tAPC58EHUPZJ47HluFbj7Qc3gqSqt80nCCBWK
         Wk1w==
X-Forwarded-Encrypted: i=1; AJvYcCWA214VebEsLegtgByZ5lg1HAGx4tbgyNbK8E9wbn0EiPrwpY93I+FkyyAS/7P8DEfK0W7clEsX0p/uifLkbuUT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2ZtH+5kWVj8y0rrDzkgnGRIrsQ9438eVa+mEGD1oMEVTa8goc
	V8bJD4T5oTw19j2qt4tgDdM9KGDBKY1N1NH106CvbhHHwmkcakoeGUOfGc0dJVA4ftMTDCKYUg/
	Qy64gVYR0/tSsncKV6ABoNqAg3tExXkeqMc22WTShNrzYMctsBo6/6Sdo2jgCK9JcbQ04GkxG
X-Gm-Gg: ASbGncsBk3YCwr+7Gok5kTKbYOO+3GKuuKmq/3DFF+Cv8DBQ5t3gId4fuQvrKXy9Ezq
	KV7QMqCfKwynq6andcDC357decGZC0GDK6mX4qnUrCIYcHbVtKHDCMJCEtkuyDaQRKKwD37zEoj
	lQITWpBO5x3EPerYkrihE7X4bUc9RQ1dGyE5MTHkdTEEmUvPKoR6KXCmodp/6WYcxf7EkarOQZQ
	Bnxu9LVdjS/kleIYF5YDaA2Ij83n/2PbrVnhVvOi0NUJrGHgjXT1XfudcjteEnEpvT8yZZ2fjVj
	f+393hH4DDxdBrrjSUVRQvXaMPUC6Oix5CV8aUAvtO7AKCr4WTMlY5xrMnYyvUijIshCWWqtdFa
	nj8FZUQFfr/2vi/c/wxZarcSwbXk=
X-Received: by 2002:a05:6214:20e1:b0:798:f061:66bb with SMTP id 6a1803df08f44-87b20ff97f9mr21368926d6.1.1759915176075;
        Wed, 08 Oct 2025 02:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9AtoSWRycJFNeyXgDRo0UkanPNUKvhGlX9n3GDw60mCueMa0GPqxCfk2qdRytGJj+xJFElg==
X-Received: by 2002:a05:6214:20e1:b0:798:f061:66bb with SMTP id 6a1803df08f44-87b20ff97f9mr21368696d6.1.1759915175560;
        Wed, 08 Oct 2025 02:19:35 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639773d4d8esm8542528a12.30.2025.10.08.02.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:19:35 -0700 (PDT)
Message-ID: <65e6d61a-7648-4125-8550-8a8c6d476b0a@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 11:19:32 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zFB0X1TrKbp6dZpn49mQIZHbyzv69A-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX2x/XcES+FzZy
 h6+CdgSQLpmv0UqeqUlYjsAqhsn8D/EzayfbuopsFjr6ocVy7DqLRLClsLmLqNdDSEdn6hXbYLY
 UpW3jSfT7k6Kn66A+F6vfVu+VQNRaP6D4Ljb272VHGNQnuOqQ5Nz755pnAn/BNACOW8cFlb4frr
 oubK8G9krERPhThdNxdZLudQ176fHq7z8ORNQvYRuVB0LbLvkVqXfhWMRzocCJhSYSYwqbwZ/zr
 clNvRph1+Qra8QNJDTca4a2aX1xfCngpHrdv0cJa7c2RseG2H2DSWRpteTFXVeZtEgK9ojipIk3
 j2DwMUn3Dye4bvGHAKSHyN/YX4dZx3k/VPZaMSxV0Y96L3/3SwV57/q+/TtlUiiQGM6VtVjscuK
 DDWVfvlMAKGbmd5sS52Xq2yEXw7CEg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e62ca8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=XzL6S5KsqyWbBsQ6UhUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zFB0X1TrKbp6dZpn49mQIZHbyzv69A-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On 10/7/25 6:48 PM, Mukesh Ojha wrote:
> Most Qualcomm platforms feature Gunyah hypervisor, which typically
> handles IOMMU configuration. This includes mapping memory regions and
> device memory resources for remote processors by intercepting
> qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> during teardown. Additionally, SHM bridge setup is required to enable
> memory protection for both remoteproc metadata and its memory regions.
> When the aforementioned hypervisor is absent, the operating system must
> perform these configurations instead.
> 
> When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> own device tree overlay file that specifies the firmware stream ID now
> managed by Linux for a particular remote processor. If the iommus
> property is specified in the remoteproc device tree node, it indicates
> that IOMMU configuration must be handled by Linux. In this case, the
> has_iommu flag is set for the remote processor, which ensures that the
> resource table, carveouts, and SHM bridge are properly configured before
> memory is passed to TrustZone for authentication. Otherwise, the
> has_iommu flag remains unset, which indicates default behavior.
> 
> Enables Secure PAS support for remote processors when IOMMU configuration
> is managed by Linux.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> +		struct of_phandle_args args;
> +
> +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
> +						 "#iommu-cells", 0, &args);
> +		if (ret < 0)
> +			return ret;
> +
> +		rproc->has_iommu = true;
> +		of_node_put(args.np);
> +	} else {
> +		rproc->has_iommu = false;
> +	}

I think the above is a little heavy-handed..

rproc->has_iommu = of_property_present(...)

should suffice.. if the developer puts something that isn't a #xxx-cells
-marked provider in xxx = <>, that's on them

Konrad
