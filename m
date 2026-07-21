Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C387446067
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784626984; cv=none; b=NOp1O3a/t06V8BttdjSD7rY9UhdZtQ8ORHuUdiqs9LU2E0dl2M9LZcX0ejEQqCibvUX4baikM42x1jjLjRmXLnNk2hu/6S8GTm7lrTMNaYH0Heqjz0/9MIOABlO5dPBPCMIEzHr0P7vke1vyiQ9vCz8QQWLbXW22C/pHfhCso4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784626984; c=relaxed/simple;
	bh=382s2GHsbvemZhVH0WPznSW6AFhA4JiuqW98dHEwEH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hm2YH+2GtSeuucF+rbUTujQgkPsEUhEGZgp4GxEPMuTk1t3nQJtmWoIUYepyM2sXdJEx9fyfnp1/7sq8YBBT6MKA/Ly4tve2SF6ZKhUHOJvGquZphuLkK6KXra/UD61Olv8gJsZAoDf5etXJIbjsAz9igB9DgvaGVHnEYIf6O04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ge3RaMSv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLeRQE/l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ge3RaMSv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLeRQE/l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L86X99043254
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 09:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RB2W/6cFo1kyrM8hohHMIH1y
	Ve7PnX0DShuvEwbYNg4=; b=Ge3RaMSvTCjW/GSrDtUCeAP5TFYkvoh9NIKJRry3
	+mvsEwRRSmuMXUrc+ckGaHvYznTUQjSxteGj3KwqJrLBaIIUfJPaTPika5oyQpjy
	96sVMDKmpnfJDry0v3YQzTWQ3YDkkVtNpb2bgnJE6+Di8qJVS/xpxsvDIkddIgLK
	b1r+4a8c27aNlA8PxEcaW3DshlQKVKb9KYyZsh4nSroSZwAill9kz2Vp434hrXDB
	sdHddggerM6uJQCjrrTyHBdZtRMEDpkbF5imB5i7iCyqHT9ammdBSG/HBuG1mHN1
	abkNM2VEXaeuLQSo+5s8s2qUsavWcxNc2PMkzlz+5n++rw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as1w6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 09:43:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so216145691cf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784626981; x=1785231781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RB2W/6cFo1kyrM8hohHMIH1yVe7PnX0DShuvEwbYNg4=;
        b=iLeRQE/lqyvssgQ5uH9NHfW/krCORcDqTfQ95ShykkWvHbIl1ES6Y75rLerl8hqafP
         ouBu7Ez9xJfdubwK5LQQ0fZ/tiWu20toU3zFi1rYmC19IexRvOt/iNLsTb843+MCF+EV
         NmYz+wMaI14V+8wtq+TRWC7loiurGyrhdnWbL9bQQzVpOPVQvSv2WEDwN/R0Qu9+DDLI
         r9rTvDFi5ZsC7ZUr6hi8QlSpzB42ykZm8QA7aYBzW53lIExqDSMNuWWTzvpBhjD6JQe+
         f5tJb2pVhRfW6JliRBMMbsCmOseB5o/QobHell5YCqK0FCDoguO9O0JdYPZqEwqJuX27
         k6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626981; x=1785231781;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RB2W/6cFo1kyrM8hohHMIH1yVe7PnX0DShuvEwbYNg4=;
        b=mpyaiTnQ7Du+bGgWUFxqCcSUZ/F+9ymXPIm9axoFDmHwMYQV1ID0Y2PaGTi8yOtDdf
         8La7SFXLPnry6baETisplPjxau7Sx4uomXrWsrei066jNc4EZvK/JM3TmLCSSTeTzHff
         4gcStASizv6L774uPvXf1Uoa8B942kBHB4bS2SRGDh8ByGNTTCqcToVOd9guzp4X0UIi
         /5BnSwEsu3Oe1t+DcBPQe7i5mv6BXheMTq1ClLO5iZ/HG9JrM+4Rb1CgLS+otymb1O11
         jPcquc8+caP61iNbwR8K20i3o2BStNPdznZ7ko0QMve+hO/VD8WxbTo4Pg/tCIBPurwq
         YIfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpialdJEg11wivVpfCEtkPSOjKOucozTjbejUIX7ho1Io50PH3LQinNUYHuc5yBu2+HDHOOD4LB4slHNKKtMkGK@vger.kernel.org
X-Gm-Message-State: AOJu0YxxG0CehLQPLiJ9dL2E5W7II8cZ5ScOceUW725hNI/i5pHlQfRX
	qLiSVCkI6uUqZHt03BEc8Rbfkm1pz83UkEE1bfMYVum6FAjLOYwYSLOeRQWFsEsR74HUxRAbDnM
	WqNXGP5yOLcT8f4Mo/etGSfY3Lated5EEZ8GqYiMQHZ/lKP1ClEJ82xZjnmilLHHrqZHAdRDx
X-Gm-Gg: AfdE7cnwXbp2gaqKFLcFPZ5yxe6BK2K2gQjJ/VwBnpkOdNXeK2eZNqLLollnOlYEhpN
	HaNg/08kFLl5kbbdunhmN5KXIHlyz+Uj+jSEdtN51XbIdXTQcO+KzlHT5sqbcFoc7VP5hXQSzq5
	aOZDRY0U4ItPBUPRcb3x1medWQ+S7z4NEoD+BYD73HYEdKDFou/nnOvAfGqIXThXIAvmFvDxYFY
	8hRoZLmfgSYwli3DZ3u/JBZrEVrhqtsXHln2PTsv+H7GsFygIHGeyu+Z8Li1XMV5q9w2lq90Z9l
	D5RRURKOqkQ05PDXcUIfunwkZ2M+K2gRH842/fjgY5R/MPIUkspcNwClAZHBMACWzwqZERXE+2v
	nbQJLXzMgqulFyKg=
X-Received: by 2002:a05:622a:49:b0:51c:7b13:62f6 with SMTP id d75a77b69052e-5213eb7b75amr168662201cf.76.1784626981111;
        Tue, 21 Jul 2026 02:43:01 -0700 (PDT)
X-Received: by 2002:a05:622a:49:b0:51c:7b13:62f6 with SMTP id d75a77b69052e-5213eb7b75amr168661901cf.76.1784626980305;
        Tue, 21 Jul 2026 02:43:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f6980582csm29681062f8f.13.2026.07.21.02.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:42:59 -0700 (PDT)
Date: Tue, 21 Jul 2026 12:42:57 +0300
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
Message-ID: <6tmbpelyk2ngvrfmcpb5owli7oo54u63i4w46jxbbj5g3fppv4@4amnegv2u3bs>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
 <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
 <20260721-benevolent-wonderful-kakapo-ca8c2c@quoll>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-benevolent-wonderful-kakapo-ca8c2c@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfX52AT/L2QXkuh
 PtYOg1ii2xeAqfWNdOjV3VuvXDLwOPBc0/kR+Xe6GrvdEceeazayhz/UAtljaPEyN06v54Ip/J6
 fjExVJH8XR7dsWyzXJOQTxYc0K7xzhqd9k6rUNKr+hIPpFlwBBHNDw0N4XtJydop0UjN5ZBj95A
 JJN7/oOYn0+4IlVlrXWSNiP/KM8YI3Zi/QpXIcVKxdwpKXX7hdVxdEkUNqCX2pYuxCCQca1gFek
 yzvFzwJLEjlTXCHPnf1cp3UYrHSrVSZGlX7wX3pjFjMgJzTJgTUxmriEJc5Oc7YwvmsOzg74ZvE
 1bm2XpibGR5TQCadV5uyisk6aXehaEMmy9iJAcDnKAcwDSnjJ1ixbcQSRUG9RFNxGLjkJW2IkaC
 I3KuOI+OANQlIeV0PoJVFqtoj3GGaQUy63Cas5bPaDkGntSE6wsktRJ2zk2qK6KkKV3aPrrJRID
 o585fEeQPDSdCCLmaEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwMiBTYWx0ZWRfX472TTseZkaWy
 kctQK/kOfck4N82cPW6YSWDWtHmX4LSIj7De9W0XGv1HSyAn2FpXKAZrkOfXHGTygDp+32e9Itg
 zGYcShCmObGz7m2BuS+Uyzp3t24N8mY=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f3f26 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8OKT1r-RFD2mjBG_JK0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: r6o44_lhoKLythKWe-OADiM0ZIXOjsQI
X-Proofpoint-ORIG-GUID: r6o44_lhoKLythKWe-OADiM0ZIXOjsQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210102

On 26-07-21 11:22:52, Krzysztof Kozlowski wrote:
> On Tue, Jul 14, 2026 at 03:24:01PM +0300, Abel Vesa wrote:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - qcom,eliza-cdsp-pas
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
> > +            - const: nsp
> 
> No, do not grow the ifs. Eliza belongs to class of SM8750, so I don't
> get why it was and it is being added here.

I'm assuming you meant SM8550 here, right?

Why does Eliza belong to SM8750 but Milos doesn't?

Was Milos also a mistake?
