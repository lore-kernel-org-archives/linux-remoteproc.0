Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774BB25DB0A
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924823; cv=none; b=lIlmeSqYFtKnrWtJHNf8VyHBRMgXxvzCwxlmuHi3NnIxIJSsgp1Vo2Sd351NG8uyRfyamzupEmaQHQoJKtHqU+NLaftrlpl7ZLuhfHAcizMrP7/TtjZTimTppkz/nGq+NuvVQXzt2HLh4dnTTQaTZK3HA4gBiBRv6Y9J0+FbcRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924823; c=relaxed/simple;
	bh=4vMQxz8vJDFJ7PyFDHhD7SxqVaewjjy4uYlnHVW2M4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoTEIU4UHnLElkCNXcWQ4QLwgK6MaSJkiJEekTY3FXy2dI2SLaaA7KnYer6c6BlesqjYd97AZuhP2oJEc/7jpg5z8ddj6NBa08AhuEyVYczDfQzS/BIfg6c7V56MPedJcnUkwZ/1QCGHZ0Q64H72hJKHQZ5WST2ywOmtDExRknk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D17arv5Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D17arv5Z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890PDf028805
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 12:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uLhdPwh176J3u3H4+MR9RBj7
	7/mlh5xjbvtuKbEqChI=; b=D17arv5ZdJZ6Qh4h4YtBT5rktlFlwB5RSg50OzLx
	bo/10mGSmD5ZOMtheohUoQA+x0+u/sV0Yi6R/oOBu2F+2C3jyC3foYN58xopGVJU
	L+Cx87wWk36FxetmlWo+ZAvoR12AxPWfEzaGoxBzCihmbJeqLRrFV48ru0Hv89yW
	yN9PiOdTRkKUKvIEz9vAR7yeZc3K1jo2sh++w1hMu7YH7Y3r0q1KPr5LMoz6fl4Z
	tOI40Cg6mSnqXD9AQId5wYlO9y1Gfv4FPgeeuTbliNQwrDmdDSnIeRx3cI7XEEQS
	cDZg4kmbMKp3w2FMkKXNEI3pz9Xjn/8ocd5lb7oZ5Clv2w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgtb2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 12:00:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f82484faso5449560b3a.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 05:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924819; x=1760529619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLhdPwh176J3u3H4+MR9RBj77/mlh5xjbvtuKbEqChI=;
        b=O8NkXpqPe/zii+raKAhZ2xTd8saptMe55eB4on9Y46m9qxYu8EU6Ey4CSc37IWNpuu
         kQlajDv7e69WuAt6T4gDJwbEFXz+Oa7LbrQ4ixxL+9ziRHCIDs/TH6zbsP6y1xLN+xAE
         q/quw4oC9PV58X7303TTXWr9oEldQQsAbjT2xvz2KULqy3k8O0rT8XT0DwMZ1/UBwbZz
         kB5hm31iQKeZCZmsHDrQqlJebtffD3+q0hgxiRbRTsMFs+7KsXflpWKpoT0OYTwJtmGE
         kmozWm/CyHF/NpjhBZ9D2CFZHk3Er50IkstUvl4NloPSKB6b/2ygTTFzDVOBpPYQXPf3
         +WNw==
X-Forwarded-Encrypted: i=1; AJvYcCUoWogB8i9XCAkVMYeDImkZ9kerCbfuJ+7HSi3496PXUhadW1X3yoOZJ7ZgfgdLQkhhgOZOoI07sSqENHmeld4+@vger.kernel.org
X-Gm-Message-State: AOJu0YwjmePQSb8m5pJoaBo4gy1hMaZxsfkectI00A5K3xykWQanCEcd
	QuRQGJgyen8nPN14BLIjCK+iusbvPLrxPScJxI0PuCb1R/91+ENL0eUqt9uANL+05wn6aHoUaW6
	mO0zP744LBEpM25aWIiJdy4VfUfjRftYgeIvxyupY6aTZ95/IwUSHwFQAZXrqi69OglMboKyx
X-Gm-Gg: ASbGncvr06GejxmsuWWC67TVQLMzLQhUeYoHbTIOOZ7smHh+/NEbzM9Qw1VS2bhVkgT
	paMxDvMguDRXHFckmS16x6vxLwvKXc2tmf7y22rLth7R9DQlruTOIEfIwlC9xAzXfG4ai70xA7t
	PO5KIvxr3nHbzQ0blNUjwCzOn4NyObN2+i6nNjPqakRfwvS7dFRRcUlzPGr7ydD2ryp8vkpUeqL
	lNTMXKMoM+WcGRrHX+ycY7FNuiRp102k7aBL5qHAapqQIk/IAURsG6W2pE89QLGWfQ6/v4fLBcv
	NeH1K3Sit1lfP1PYHyPvA5JW1XclNyME5VfjgVj22vazODtpgysOVzimfNUAfBVwJePMhBdA
X-Received: by 2002:a05:6a21:e083:b0:2fa:52a0:e838 with SMTP id adf61e73a8af0-32da83e39ddmr4358396637.36.1759924818351;
        Wed, 08 Oct 2025 05:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKO7wqlSvx59P2vS6UzWzJ//dvnD3o/iZtvddrv03NuT9ONGsnUOVru90lpyPYje4cnIJpKA==
X-Received: by 2002:a05:6a21:e083:b0:2fa:52a0:e838 with SMTP id adf61e73a8af0-32da83e39ddmr4358306637.36.1759924817502;
        Wed, 08 Oct 2025 05:00:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01faf086sm18623699b3a.23.2025.10.08.05.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:00:16 -0700 (PDT)
Date: Wed, 8 Oct 2025 17:30:10 +0530
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
Subject: Re: [PATCH v4 11/12] remoteproc: qcom: pas: Enable Secure PAS
 support with IOMMU managed by Linux
Message-ID: <20251008120010.kygbso4vw2ouwlzu@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>
 <65e6d61a-7648-4125-8550-8a8c6d476b0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65e6d61a-7648-4125-8550-8a8c6d476b0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX3daoh6vkRsvO
 oV7egym+SUCUxW9GaUOmIVTrm4bYe6o3mpIZPI9bc4X6L9uVA6hyizClf7kurMNpd0JgGxtqQpx
 PZFR+aTLWkG/yjyfGfSwNkIzXo7PdSYShH9gNJQvR1xCuzOe5zXzXeYzKMZogHtIsHqo/Kx83uj
 Zy/fDp9PKVyWDGJrlfQtwCbIK1exCF0Mu/mxD3moIXWRVT6VsP65qrt5YEeWIC9BEK/TEeyOZP1
 GeDB41J8ZOQomzUHEJwQdx22JVbJJBgunnoTo7DNa+slL4IJyiL+4fRStvaXAyOXDbqIosV/Ci2
 aZ4IMWu+3eZlWBRcY4TCLyCTC08pbVrZagLWPfBkWd5ytoFq/L/JaizQSD25iKuaihPTHpDYIBx
 4Xhz0eVclmAlXKwqpCOOTeR7H2kJCw==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e65254 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=qxcRfBPHBTAMjdSr2WsA:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: jCym81e7vj07JQFmIm8GtS9F2T09G6cu
X-Proofpoint-ORIG-GUID: jCym81e7vj07JQFmIm8GtS9F2T09G6cu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On Wed, Oct 08, 2025 at 11:19:32AM +0200, Konrad Dybcio wrote:
> On 10/7/25 6:48 PM, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > handles IOMMU configuration. This includes mapping memory regions and
> > device memory resources for remote processors by intercepting
> > qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
> > during teardown. Additionally, SHM bridge setup is required to enable
> > memory protection for both remoteproc metadata and its memory regions.
> > When the aforementioned hypervisor is absent, the operating system must
> > perform these configurations instead.
> > 
> > When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
> > own device tree overlay file that specifies the firmware stream ID now
> > managed by Linux for a particular remote processor. If the iommus
> > property is specified in the remoteproc device tree node, it indicates
> > that IOMMU configuration must be handled by Linux. In this case, the
> > has_iommu flag is set for the remote processor, which ensures that the
> > resource table, carveouts, and SHM bridge are properly configured before
> > memory is passed to TrustZone for authentication. Otherwise, the
> > has_iommu flag remains unset, which indicates default behavior.
> > 
> > Enables Secure PAS support for remote processors when IOMMU configuration
> > is managed by Linux.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	if (of_property_present(pdev->dev.of_node, "iommus")) {
> > +		struct of_phandle_args args;
> > +
> > +		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
> > +						 "#iommu-cells", 0, &args);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		rproc->has_iommu = true;
> > +		of_node_put(args.np);
> > +	} else {
> > +		rproc->has_iommu = false;
> > +	}
> 
> I think the above is a little heavy-handed..
> 
> rproc->has_iommu = of_property_present(...)
> 
> should suffice.. if the developer puts something that isn't a #xxx-cells
> -marked provider in xxx = <>, that's on them

Sure.

> 
> Konrad

-- 
-Mukesh Ojha
