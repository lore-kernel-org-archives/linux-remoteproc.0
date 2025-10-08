Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2843FCC
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924645; cv=none; b=sIp2WK1/j/uDMxvpK6Y0IzP8fMIhigCun/zF4yNbJOz0bVjDyFI8cDn0x8XJyYJ/ym3x1c8Aed/llU9/oE5BNEszWTdTmYFnQv6V7AakL8kbKYMnVHAvqHlSnDyKCqFeGvGe4PbEnn0GQYgqObKTyzl/ZmTjCZzto9S4itQMvmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924645; c=relaxed/simple;
	bh=+VNqlLUrL2S0F8q0NhWGsHgRy8Zk0dmY4dvSjl9E7xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMyHyNqp40G7HUGLskXz8eMKNPNSpRzOK95LIi5VmK3oAJ/1nkYSPO+WXD0+HeIQmy31lhM1NcKKfdhaf0glu57qunyBTkmRBBhpeOJv8nc6ZICC9gWr/RkpLis/hosSoJeX8Z1bflkpmJbQ3tdqORrs5305TkVbfeCOu1vyVTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7dl0iAC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7dl0iAC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890SYl009627
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Oct 2025 11:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IvIqdTOEMlOB1aUq+P90kmaq
	VRrdMXHPXR0BptFOObI=; b=B7dl0iAC0ebQmS4RvC+0fQwC+ny7v9BhIiF2VS6m
	dF4eGP/oq3zr1qFXymAVGczqv7LfBj737K2g1uEjHKYLasujp++gGomWTbuHbqvd
	/bFgUveBUOtPciAKPK0zkrsVzQUu0mulhBusrAIgy4rvbOlDvj5R/uUjaHXYZ/Jo
	KEtcMgFNSq9sV3U/iPsb0ntw7VV93DxkUGcRJFul7chATv/Rsn8pkfr8Oc5H3Gp4
	Gxq6trVLQ0g2H5Eu8k3CoL9bpqwc1VRSOyuayswpVnDe9lfXP93KaFVwYZijVekq
	E7D9/zbyoob+BHI6GLQ+OStxjdyqRkS1yVgAvv3sziF7og==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junuaaft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 11:57:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2e60221fso10996710b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 04:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924641; x=1760529441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvIqdTOEMlOB1aUq+P90kmaqVRrdMXHPXR0BptFOObI=;
        b=wK7ZvAXGEUNhnmuoUr453vir2KbMOUgEQz/n0HDbdhP8iFaW6SqC+c6yKLsuHEl3ki
         zuciBh5zRrrt++Xi9aLYiMv83hefNctMD+hUD6L4ToXryAy5HwrNbCqwKQRlNeS80/IY
         IAlTWGnOrn8DBeemLRmzuQXlTo9adj+XlUVTkmwiJrWHY3mPIxE5Bf2m04g2O0XcvQPn
         1UA167qLEWlWwMrCYK2rJ4E7+vpgzOCEuINhBRIAe8AU3CEJuKTYUqX+9s33EeohdOLc
         CBpu9pjAL8PKkoEEIPRwK29L89TIdOUSC2/rsQvm+T8UJmbdVCvxA6JlbgUWodBRN0vh
         a4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUZwsIEqK4vveQE3O7LrzkvSc+oZ70ffq1SffM+25bOoWoMHo6BK5vKuMsPKmtZHVoENpLYJf7MUPRbt2J52muE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1PAIZXm+Va7gwayzlnHKGLJ60kACssvb+/2juXVAL2yWq8Xl+
	KNBBP28c7WkR+qm9VzmAiRIbPl4uytuHWZT0iFkUuDRFs/KlcyZQpTMidH7v2z93prqLp2rbJq4
	IfF4fhbWvd3nlgoQCH9+AzoccS3Dqd4smWawIs0UtlOd4rxQmAdCyEs4AxwpV/zKMyt0fAyQH
X-Gm-Gg: ASbGnctVhhSJpHbxREG8fnRNAcTFWTrM1MmeKXRj++Sn4oZh+fMDFdx8JF7Kbbw8QVe
	GLjm86z+fHfvz1SGZfqYZNcVqJRmQ9wBvqnjHASO9bBf9sXoL05SWoKO71PqMQ7pUa0g31vrW0N
	FjLJAvruoQgrZC2hhPNCFWwHTAE6GlPewMhWC41DBS6SBIgM1/iN/2lP3D/t/JbJcnbySJBqK35
	/Xn+9W7Jb0BtfkAz/P6p+IEx5VpHborafl2WmgmCxNo9sDCnPQV7UoT+i/evK/BpqsYYar1p2Ic
	9xZ+VKKxxxuK3epC9bo6VJRZKVbFhZof/hSPOhiAO+oZ51t9KV0/Mq5z1kK+LeMIOO+zhHtO
X-Received: by 2002:a05:6a00:2384:b0:781:455:df62 with SMTP id d2e1a72fcca58-79384f488a2mr3750607b3a.5.1759924640972;
        Wed, 08 Oct 2025 04:57:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaaV0CNad2Np/BckgB4G9x2kyiSi6m3pXTtlqh/eBx1lGlL/DyqmRyKBbMygqe5tJdC1PP1Q==
X-Received: by 2002:a05:6a00:2384:b0:781:455:df62 with SMTP id d2e1a72fcca58-79384f488a2mr3750434b3a.5.1759924638126;
        Wed, 08 Oct 2025 04:57:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e809sm18617848b3a.71.2025.10.08.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 04:57:17 -0700 (PDT)
Date: Wed, 8 Oct 2025 17:27:11 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 01/12] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Message-ID: <20251008115711.hi6uby5ivbxbsjgw@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-1-de841623af3c@oss.qualcomm.com>
 <ce03d7e7-9342-465b-881b-50aad29fd9d1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce03d7e7-9342-465b-881b-50aad29fd9d1@kernel.org>
X-Proofpoint-ORIG-GUID: 9uM4ihidCAcyrCsGweW7pbniLyk_iKim
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX9HKdoZsIUZhQ
 c70UBK57wMXa1r3bQ0ZT28CBKe6x5fECuFaOk8aDyJvbDB3EJGzqalax3h8S79WReZtt6HFPx6l
 4NrkzrnznRbl9GkKMdm4zQWGQ0GUIip6lLhx0gD5D3T4eQC4ofERVy5Bb/ePaeeqBYBVNJdvMvx
 5hPZIBPL4vFbNonv+nKx8dpf4UcwagpsUYJ00BSq6QbhMfZ1vCXQhJutYRA7Q6t7S4VfwLmRk5T
 nGrIkzzAydBfjoN0qASuWrXO9b97u7T4cUvK1oOHf1kjjNDS/EjAHegnlU0wCj4rEp31gsSzaIt
 jj8bNRkSAuoc1CMNgXbhy7e73e+Mqf7BEF2XmRTslo+NCFQLWM/tbJigw5KtRxQYyjQIN3v0MNP
 UkysxUQA97JSxU25iBDjymhF861j+A==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e651a2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Nb9z0baHQhIVdLoCI4sA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9uM4ihidCAcyrCsGweW7pbniLyk_iKim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On Wed, Oct 08, 2025 at 05:09:32PM +0900, Krzysztof Kozlowski wrote:
> On 08/10/2025 01:48, Mukesh Ojha wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
> > configuration for remote processor and when it is not present, the
> > operating system must perform these configurations instead and for that
> > firmware stream should be presented to the operating system. Hence, add
> > iommus property as optional property for PAS supported devices.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > index 63a82e7a8bf8..8bd7d718be57 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> > @@ -44,6 +44,9 @@ properties:
> >        - const: stop-ack
> >        - const: shutdown-ack
> >  
> > +  iommus:
> > +    minItems: 1
> 
> 
> Incorrect constraints, this must be maxItems instead.

will fix it, thanks.

> 
> 
> Best regards,
> Krzysztof

-- 
-Mukesh Ojha
