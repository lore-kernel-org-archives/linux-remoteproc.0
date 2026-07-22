Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBDA4C6EF6
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715514; cv=none; b=td+l4lUCKZdUDqfZJkrKt83Qg0PVrL6rLmVShALH6xIgVwHcS+qh6/9koSWYt4fzvV092Gs4Vd9zI6ihLvEPHCEgojdYYMaITq1oF5wLix8PxWLV+ohHNyvrVg7nSjPto3f9+qtLenFkfWKnUDwPAxO0xHWIKgQKkFoWvH3yGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715514; c=relaxed/simple;
	bh=2OpnObbZ+yYS4acBPLR9goYNnnsvxntZ5oAVlEqq9Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzlYbSOdD3BkSLdQiLUNRRY2qkkYnlRNq4/v3heBmA68BQtGeS/POvBF4ioDugyqMgNszH4p8K6mDqVARNXu7DFhFxUMiyQGFLMUsjPUneUUy782gnY4zXba9bbgHjizNWZRQMP8hFVO0+BkE02M/zLhlTcgrN5I3pBKx0b7Zq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6NGWOAs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTdem7uR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6NGWOAs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTdem7uR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xV7S4018610
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 10:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ICPnKmyXidtgXgnGiWiEmFW6
	8sC3uYWpUKk2gDorxzc=; b=p6NGWOAs/cjxZIYTgcy9YErLZaZvIjVYnsAavuUr
	q28lrRdgUKG8dj9DMrqFFzlhPWxdnaznIUlpFELBZT8QlNEZGBUbhOPVpRWARMa1
	mAQDQq0bke0h7h31GbJtLq1OM42tU8ovJpa2M8iZUjHLonu4Tgfmq1mClcf7S12o
	ZUi7aAE3Sz6uXGa+Qa0P3SMfgBI2z8dkDaQ1U8cYVwDJDVdS1Oue8EZt1C5HiFRo
	4FIq7+7FIcbwQR398cx1AnRssbiI1qBPR0Ds24aEnW13gClAtYI81Cm90Uf4xdrk
	Rn7CVXG3wwtpxaDKxQvTucTh8btRmKN/nVqbufL94RejTA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6fuhxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 10:18:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso252684251cf.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784715512; x=1785320312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ICPnKmyXidtgXgnGiWiEmFW68sC3uYWpUKk2gDorxzc=;
        b=JTdem7uR53JwYTKsoKxij3JkdcoM31sINpl8ZsmjpUxViHYqgjcf2nb24Ii4aS2cZn
         g8yF6QRuYcplM0MOMSNxlSl5UIAbhKx6cxXMToVAMwZN78O7G/1h+TLMlQdYARVz3+K2
         8y9j9xgXBNQXzC2kX7mxH8oVkIfa0BuB5GXWdq62LuP+FpcnTTKd2NvZJccWPgY4Umhq
         ePM4yt35gS+KeR/633YIRbXJ3rXmBYseFlZWZKYWurYOc5BKbk/EqQAX8tbrhWt8iuci
         mdDLIQjOg+QzLXfAvNkJKAYFAIcmvBqWDE6thfwEN7Erlc7nsSpLb15Bove/+xViE5cF
         eSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715512; x=1785320312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ICPnKmyXidtgXgnGiWiEmFW68sC3uYWpUKk2gDorxzc=;
        b=YV9WaN57hyqNlXWcDo15qOdcp5exe3ceAL28u9fwH11HzU2+2lTEABhtuO9PV7Kxwc
         XXzoUpXV3lvuO6ZCN6dqhRXWLWI6QEa2hXTHlPsqshnUHKy4L8g2gbsaiFtOlW4gGc+4
         AZD6t4o9VcQAe5JUJXyKWYlHmz19/Hh4TG1kuy6ZMVJqMp0bEI5BCIw2wYillyLUaVoA
         6P8Hp65KuSsI6RTbGynktUR29noNu1pOkQeeD+r6h5LIJWaC2u78tAoHuIxU/fmq2Gz1
         oGHyEryWDd7Jw2FmU8rnzPFzcDbwU4PM/KRGadDHTtCzSSXETo5aOKqgyzHDqtkIZokE
         Eavw==
X-Forwarded-Encrypted: i=1; AHgh+RoMZ0x1Ty8ivFFUpPJaftvE3z6EjeN1jOq0LlfTz4cYU+xcJfslTRh9IrFeizGPFEvkVwWGPGW+bflpBL6QrXNW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+hb71f1JX8ZRCDgNvGGKH+uPdhNuxWLWYJwzAGq+S+9HAJ7hW
	HKBceQ4wSPHFTqjs93rf2jnDvqFAusmPUjtnYDwtco3vk/snVvro4sZUvn2xy5fWXhMD4s73Y8g
	dLrON4DCT9fmiTEGIZ1NzN61LQO5sFl+FltLm4giwzUU+lZQ6XT+1wuRWS5mYRzxPYoMOrKhi
X-Gm-Gg: AR+sD12VpGTAVV2ZgDtrJ8l3iBriZ/ENUwPx5uI0ZXyPeQ+CUzNubomMxv9aM0Dwe/w
	+s3D6dP+amdWJMTkg0YMtMe3VqqcsuO3Aa72OK7aU5u7ZUgx1kYb9zctd9UxnFSzDkcrzKMXnfd
	y6TpxxB0ioj+7uO2L7+IP9SFsQF8ZS7Vp3ohsVrw20foeaYHAu+wCHKvdLUGs3larXe/HUk3z5j
	s7xCIfIkFqIe3NCoSOQNwmurZsfxtAJ9f0j7NL+0H7wZORedoxizsvS1QchPNJHLMjLFK+Uq+yH
	Bu+eBCv13t9BTz4KEc4/XoC9U7Qo1K/89AfeY4iCGjzGA9QfDji4GxSBXjEACzltq2BjC3hB66l
	ZxAtZMvOuZlffH28=
X-Received: by 2002:a05:622a:c85:b0:519:e020:6087 with SMTP id d75a77b69052e-5213c013438mr216631241cf.11.1784715511673;
        Wed, 22 Jul 2026 03:18:31 -0700 (PDT)
X-Received: by 2002:a05:622a:c85:b0:519:e020:6087 with SMTP id d75a77b69052e-5213c013438mr216630771cf.11.1784715510905;
        Wed, 22 Jul 2026 03:18:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c66cebsm4541447f8f.30.2026.07.22.03.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:17:50 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:17:48 +0300
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
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Eliza CDSP compatible
Message-ID: <gm4ebdzddpk5mbmz2zxxfefzq66gvjlmyn2vuqamzqelu6hvrc@7qu3cxieth43>
References: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
 <20260721-remoteproc-eliza-cdsp-v3-1-557b5d02fdd9@oss.qualcomm.com>
 <20260722-tunneling-perch-of-completion-779399@quoll>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-tunneling-perch-of-completion-779399@quoll>
X-Proofpoint-GUID: rwOKythYtAaK1K2N4pJkMnHVVm6aFm4P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5OSBTYWx0ZWRfX5XHfaPawbvgc
 /e9e8JxRU2PoMqMfR6WXOtRYW/KTAnx9/FQjMM9fWtKSEissZFuVga5yxEoVqXGRB4gUgwS8tXB
 xrzGnKhW02wODqmTgryfk2tK8jntNHQcLjBHfF5X68Cb8jDQs5NKWrFduGN7xj4fpiobkcU4dtE
 FwAEsXbUNdfpLaP5I8dlnsEqXyONxgaET0rLdnpB9vX2TnCcxHkArbLkIAnIDU+kK5C5g4dlzKS
 w+4SgMyiwWUeTYyVGiG+7eoL73xPtQBetD5SMWEHv5rq6PnmJdCJcQxCGL+d+jp4J+oAZuIqgPq
 5qLemS70mcvITXofIJRlhapQDJ4rSjvPqPmdP6YqB/M8wz7mSm76EIumpnKIXNMBOEI4vM4rpvT
 PSNrXZuU/7wKA3c6MJ/HZBhJRZhb7xsbcLJ+UCrNiyN8El2aWWjDuFaBDumRxhJ4go2ZmtRl92T
 9Fs6PNFd6s9yMXUyvAA==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a6098f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=foOWgHpZz-4kEb_SVvIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: rwOKythYtAaK1K2N4pJkMnHVVm6aFm4P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5OSBTYWx0ZWRfX/oxQEa4528wz
 Yjv5sk80UwCxxT3RRuXVC8v8AqI4kE3hGP34n4U3Npw0SD9Bcb8fZS2cwJnSaa8sGSmiMDGktR/
 8NMrT52kN85ChQhRgqa/NfaX7j3/DXk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220099

On 26-07-22 10:01:18, Krzysztof Kozlowski wrote:
> On Tue, Jul 21, 2026 at 05:19:57PM +0300, Abel Vesa wrote:
> > Document compatible string for the CDSP Peripheral Authentication Service
> > on the Eliza SoC. It is not compatible with any other.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  .../bindings/remoteproc/qcom,sm8550-pas.yaml        | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > index 019db91be7fd..5492a88bb100 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> > @@ -17,6 +17,7 @@ properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - qcom,eliza-cdsp-pas
> >            - qcom,sdx75-mpss-pas
> >            - qcom,sm8550-adsp-pas
> >            - qcom,sm8550-cdsp-pas
> > @@ -173,6 +174,7 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - qcom,eliza-cdsp-pas
> >                - qcom,sm8750-cdsp-pas
> >      then:
> >        properties:
> > @@ -288,6 +290,25 @@ allOf:
> >              - const: mxc
> >              - const: nsp
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,eliza-cdsp-pas
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          items:
> > +            - description: CX power domain
> > +            - description: MX power domain
> > +            - description: NSP power domain
> > +        power-domain-names:
> > +          items:
> > +            - const: cx
> > +            - const: mx
> 
> We need to stop using here provider names. This is the same as mxc of
> other generations like SM8650, because it is for this core a VDD_M or
> VDD_M_2 power domain.
> 
> Using provider names causes unnecessary bindings bloat and possibly fake
> driver differences.

I agree.

> 
> Well, not a problem of this patch.

Will try to send a separate fix.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for reviewing!
