Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD1E3CCFDE
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628013; cv=none; b=jR9/ydSp842GvIUn8sp4Eaz6hkkk5Dyy+r0TinRxdy8olM2gcGnBmto3mGELEC5Aj28u/lFPXt8Ch4+U5xzUArytbd2hS/35KvUgCO882kOeBMXnAK8Y5706as0KWPbGWivaR8X44RmtorZYUyZxihOiUiO08flqraVXoIIEFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628013; c=relaxed/simple;
	bh=LK/eB9AmpdkVx3ygCibEBSbpwLFzjBH+wekYBxrfbkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aui/4mvZ6QYc4o5qkJKwC8Hhj9vx3YLPxehQ6BP0ydjB5EQiVXK1J82L/QXb0YhFXdCZN+fBHfao+XyGy2eZ7AD6L5Lv6PZzw4d+lvS6i7H8WslmhA5i9aW0DX3hVI/3208iGi0W1F0XJASNBnTsMe2ZrG/7vFwBQrfeeCTT+A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VWW+aNHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbJF4Zo3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VWW+aNHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbJF4Zo3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L7jqPF043427
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 10:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bsdv14D4IxQYNMax+mx44nCO
	kZw//LLz461u2K+lOMA=; b=VWW+aNHGWqA0/XmozIT5Puye5Zgn7Wpi7l5PVMeD
	ZHdcR8NbuSGHOhh7mEf4vspUoYBiJYy3j2xlcZTiWNNs2g0MYvNTxgxHnXTsLBWT
	3N+MgwOsmMvDJF428V8R9ohtkEF87ucLk6lVAUy8UxPHe4fi7b4qaTW27VH84BNz
	PxJScPlxLDSobJRFFhBu7qR5IZZBk+C6VU37et3BvtTYdgsVlte7W4tj68PnV9/w
	WVOVAOYxRXLPHM0xTf4qhSDQOVzPSNR6Or1FpDtkyLRgo8chMjZjEipgePIAu5rx
	EJbjCXmEcfzG69hZC88jcRHe8zIWkq8w3OcJqr+Y2HJFUg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as1yg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 10:00:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-904ee4473a8so182668776d6.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 03:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784628009; x=1785232809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsdv14D4IxQYNMax+mx44nCOkZw//LLz461u2K+lOMA=;
        b=RbJF4Zo3bJ/2z8agefDHfjNku6cyyoz2+Rsgxr6zohCHaRX1TG8msEp8tRcJlU+Q8c
         HgHkeLicpUdJfAHSEUa/xrcVP58gF1wrEFhz8l156rNrOqK4xyc9M4p/JW6cs3dFnk5Q
         X0s4MOAm/SsZzktS6TYnA0MNVR7BjpiSOIa89jaLApg2Jvo1/EEYC7JWVNJacUmEbYli
         fQ1ZWxenw1Ge0pQJA9SSbdTzXt2lwsOuxVFJA5VTIJJehVeQAppdY3qPedtIqSWwjjCF
         6oOKiMnSrXa8hVvyAju41DqLnhlY1fDlv36Pgf+rbojFODGXIFWudu/vqFfwtv2E9QR8
         mtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628009; x=1785232809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsdv14D4IxQYNMax+mx44nCOkZw//LLz461u2K+lOMA=;
        b=bJoI2DUDW8ogWrOvmi4ISok5Qe5VZShwmW0qnLqevZ53rzT+WoszR34qgzh87sBT39
         bY3tzCZnE2uNjjmWMJZnI5nnJHcCfz8oEPW+s07yt/RaovI3Ayxfj2LDOTq+NQYCxN0E
         LcJCjAWGUbv9fJcHEencZRAF/ttpdFj8jF47hEYWlErGSPhh8OPaJ3AUAVgh9QdgjO9H
         R170BhiBQ08N/WW+0k7iVQ0L3dn5jJ1zJrSrMR8R46TPv0Ykdj0Jo4KHBd3HG1slpfRX
         ro71gyMqBHtOB0bBNqpiSeJERsLG05P71ivvvOqTvOavttzU1d2SvRb5T8zNbggmizL6
         KG8A==
X-Forwarded-Encrypted: i=1; AHgh+RpPHyLBe6JEEqsdz760vODshFyBqu5XzKeZ7NBYJY7maUwUBJfdKGU03ALhpLwHir+EWhsdOibSHFWfjoFz+oe4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/185V7sWHAL1Uq8vU1OL1XWFD12G9TP6RRsMkqOd8n/sOpXXS
	58KjRB39596IQiRL0qvejSnTV6Dlhd6inW+Whpeibb4gl4jQvgB2du9PZe06CBRxGLPZ21/EnQK
	l1ykIKMF45GZvrWS4NjTH/yCuOVi1/JzPPGpbw7Jytse1ZksYKWFdgp1Voa0OpE/a4Pd9uVhV
X-Gm-Gg: AfdE7cl5o4rh23W3vyAZveAzkMpMMIYgw7k8ScGhqXMpisD53XHvp1et26nKAnmiR6L
	hpwAUuoGiLhdzT1u8zONlgasemkt/b1U9ZvIa5TEY9uSOkFbEw2/qFnU9HJpR0NjFPNUfMsOq1M
	bu9gQWmZ0iD80KN7KKzblQ63gSoCzXm0thqhOw97OZ1RyHOkLbdF5c1+EKgS4UYOtyj2RTfQr+X
	XJDzJLa/VjMOvN9ZPahn18foQo8IhBhKCrfrBAnFSdBAsC8ISv1Ld3/7LYdk6pvz/9b1XCIRpDW
	BapDB3hSudwIJK4C2TOy+NgIB1gxPmdWi1nZMfJnTHCx7IpsTfv1lRkbD/f7wzrGVXQMhsRqThU
	a
X-Received: by 2002:ac8:5893:0:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-5213eb800b4mr163985951cf.78.1784628009011;
        Tue, 21 Jul 2026 03:00:09 -0700 (PDT)
X-Received: by 2002:ac8:5893:0:b0:51c:7b13:62f8 with SMTP id d75a77b69052e-5213eb800b4mr163985441cf.78.1784628008427;
        Tue, 21 Jul 2026 03:00:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f7feea1cdsm5601633f8f.32.2026.07.21.03.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:00:07 -0700 (PDT)
Date: Tue, 21 Jul 2026 13:00:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eliza
 CDSP compatible
Message-ID: <47fumz4dgsszwcvmrktf6soebwscquk4tofvszj4grukimahgu@kj2vn6vsiydm>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
 <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
 <20260721-benevolent-wonderful-kakapo-ca8c2c@quoll>
 <6tmbpelyk2ngvrfmcpb5owli7oo54u63i4w46jxbbj5g3fppv4@4amnegv2u3bs>
 <985af176-362e-4408-987c-dcc8d49d04ff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <985af176-362e-4408-987c-dcc8d49d04ff@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwNSBTYWx0ZWRfX0BjtqY7VROYE
 Pz8CLkZJKyol3XqZBkjS3Fz32ZRnEaCT7niICnL5FUw39EASSIuuclsKYfDXaRW44EXx+cm169G
 WZvz4ycyP3zDnoZMJupLGDWkqT40/LJBigN5WCo+iS5vNoA5reprbcJSMhgwzgJGOgUpg9uqVWw
 V4Vup6BO0M9Kq7dgmp8JRpBZpYDP1RutFZeZLxsrjmGzvUx3bNg47hMLV8W1DfEOy2gcPRPRXdJ
 V8xJv9QtXe/hXXuMl7BBh9EcjmsgCxq+EziPfdZgZ0Y06xNF53EsRBZqOc01Ox5rsEtcWgnd5KU
 dqw8nCBbaqqWhTkfjyF8C6/gXWSek3A4T8DNrnxLHLp2QjJ+9r4VHWX5GzufKN88XzdtnnaokYk
 Q23fPnPWbOpKqX1xj15IrzJ/5P5GnO3jR/6gT3u74QXlXNeAgXKV8kjeaE9oj5d1f7ha6tALT3+
 kg0NltIQKanCa4Ge7Cg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwNSBTYWx0ZWRfX+KqUACPScm3D
 6yTu8dcDL0aBAn8Bpixda/hFF/KMbL11suqXnLUFez/HAXTYpldXPp4Foop/GWmMnHK76ik91/d
 vJL+a0pzPGeOYZUftsf7syJgrVdoecM=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f432a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_SLZKor84fVAIWECWX8A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: OxGGWiHjMQyPlUjuKRX_8g8KLn7r4CT_
X-Proofpoint-ORIG-GUID: OxGGWiHjMQyPlUjuKRX_8g8KLn7r4CT_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210105

On 26-07-21 11:45:57, Krzysztof Kozlowski wrote:
> On 21/07/2026 11:42, Abel Vesa wrote:
> > On 26-07-21 11:22:52, Krzysztof Kozlowski wrote:
> >> On Tue, Jul 14, 2026 at 03:24:01PM +0300, Abel Vesa wrote:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          enum:
> >>> +            - qcom,eliza-cdsp-pas
> >>> +    then:
> >>> +      properties:
> >>> +        power-domains:
> >>> +          items:
> >>> +            - description: CX power domain
> >>> +            - description: MX power domain
> >>> +            - description: NSP power domain
> >>> +        power-domain-names:
> >>> +          items:
> >>> +            - const: cx
> >>> +            - const: mx
> >>> +            - const: nsp
> >>
> >> No, do not grow the ifs. Eliza belongs to class of SM8750, so I don't
> >> get why it was and it is being added here.
> > 
> > I'm assuming you meant SM8550 here, right?
> 
> The SM8550 binding file, but Eliza is SM8750-based in general thus I
> would expect it will be documented along SM8750.

OK, will move it in the SM8550 schema then.

I'll move the adsp one as well as a fix.

Thanks for reviewing!
