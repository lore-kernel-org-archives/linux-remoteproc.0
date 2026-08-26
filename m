Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83C42D949F
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 02:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712141; cv=none; b=nbTmmpaiXHuFrJyrsP3HXvZLp7LJK1Bl3xJlAS7ZGs0reGeJXP0MYoqTBDJarOfghgvq60lQQr+drTfF/BEqeuW+DjK0HIBY35aH9iwl3RC7MD35wR/F+b+MJyW75jyXyO7H/l2GtK1JR9yp0d+DolwddrCjhGljAabJS4INtU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712141; c=relaxed/simple;
	bh=MK2sz8rhggG8cCbmuFgTlkrX3wHAnXA2sf+rDggNIsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ig/clc4qkZXcSQ1EFq2Jw2DrKxOgO1o4Dn9mTeEXCI21VoUJf/8F0FXyXKStwJ05ew1POb6U9GwmYggL90f0AcJNrX8kwty6nT7JOl95oUOSdE09QjqAqEz6NwFNnuY7hP3JWDH659ZhQ+zznagED5O7I7cYwnHUk97xOqIHJE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPCJvolR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBtGXrnM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPCJvolR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBtGXrnM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q076rs2962804
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 02:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g7YJVDPj8WToA4pt+4ykVGH2
	7m0lY/z7+T+UCmN3BYc=; b=SPCJvolRxNsgh7RWZAA8Ea0GlE2FwwseljVsf/dq
	3FFvuxZ6W7oifGUl9hReHyein9Hd5pGnvSu6Aq33bFkdb/g8eHsfayq+heMPfYR6
	RSU2SE1QII4a5Hc7TvIG+6BObIKI4N7HRqsB5+Tmtk1yQ5WtIt8RB1OPMnwzKEHi
	HixaysAhUFiBIHUg71wK6Jm07MJ6JD5jyMZX09raRy9iPdBwc0YQkHeNt/B/SzkF
	xHE0sbi0Lau634x5eF2O/QDnx9PAAId9l58iHwIMCvoeQ3qoArUEBPq+WBAmez0m
	pC13ZDUv/R47TGHOuXZhifrUCMAMgufDpQGtNI+ZSEuP2A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgu2jcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2026 02:42:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d04908139bso7698375ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 25 Aug 2026 19:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787712138; x=1788316938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g7YJVDPj8WToA4pt+4ykVGH27m0lY/z7+T+UCmN3BYc=;
        b=SBtGXrnM15u9hWJoncYTYCAQzFGlqaK1lIb1pRgcvuv4Xs8Xiy3HVWQOgO2aIZmDFC
         IR00SjrDbSV/hX+Qm1VjyhAMdJdUQSBIZrlHdV2HZtCChL8LRoIcDMWKZosktzXOBljZ
         KcsVy4IEAa3PofYmy30KroOPGf1M+g/S6PAM5vglNXKgBmnWVuZIos8aacfX9jTe1ZRr
         BhVkFS0h/y26a+2g7SNhaLYQ5usvK6ZiXUpiorxrDLAe2xJlwhSxXNTdupuA8LMeo5zT
         4BmNzTMExDJYT7vak7lGK2ploIv7xPC2Pbad1av+H9qdeFRAJvR/c8MAI04nNeVE84XL
         ekJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712138; x=1788316938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7YJVDPj8WToA4pt+4ykVGH27m0lY/z7+T+UCmN3BYc=;
        b=Nh8w1bl1+Gat2lxsRsdYCVuMU8uKIfWjyrfNngYYRapW8LIdGwLbhqMR0hNdxTDF5I
         6J0ZTBaTQDukiu/9dQGLuR+tr56BwmQXH1p8WAYb9iO/Ys0q7s9ntoDUl3ThHCwPEPe1
         bHQH7Pyku9mmR5fDxzd2yJYGXfdLfPaqzOcG4+c3MwZUqmaBRtWXHh4GU6N5UaklXKrf
         TyEZ4g79IqFfFTbMwDrqbG786a4EEv5dehIFDqUe+q7yAcLCmuMpvFLjHtxo+Z6gCIrg
         lcE+MShzjuFwhZo7AdNhVV8gA2BXdlZNvL+fQyT0zBl4R1LLtIEJqmgP6TthDLDit6MS
         Xsfw==
X-Forwarded-Encrypted: i=1; AHgh+RpcXR4WXEdbXg2DLQ/XANysxI5q1LC054Qi3gl964lWC0mez9U4TRWeIWpZs2o832zWBNy/a2EMquVHyuvmXWJM@vger.kernel.org
X-Gm-Message-State: AFuF++nx9pfDlvu/VrzYJp4nqTF2+FO66MUsyU9gTg3sLH7xRIQlAbws
	r/5LI+V4bjCd3VX989qMf4bbjCid3tdu2IOzI5Zy/yrhUeT1/i6DuJV9gE62QiLzbgtRahVBRF+
	N6iuC1FveJ8jZkmKnDugvpFrHT3UkPKUEzYayKxCl8tWwKMdUBig28Zen+rdmOfQ/+nfL64gB
X-Gm-Gg: AR+sD12tzrEpMqrJY6irbCFtNYtNT/FQDc7gXGtZ+hmIOsNRqq9fqRRxvo/HnZhyylC
	YTD8dcUhFYMNcb1HxelYPGFzbwcyChWsOPQXksWApP8wFAAGErpR3vbRBkO5dDV9htQQ3zBTtCS
	8Mmr55b4SJPRbPoRym++/TwzDrrzR1zg1Oob9txC7Xhlnte23BV26gH+0PYJRXc4UdLvcX7/ZUK
	UAlJQIONMpq/wUH2PYuVBKLYM73hqDwJ7iq5KesI7SLFc2M2oJKNnmTqyEkxwlRoM/K2AB1im3c
	gQ9cLbVtMMRpbVxkYblKUsLhlKJLvyNI/MY+I1iWUZiUMXo60Rmq3MvtWGl8VXU2anvfFPqBzSq
	pA2wkJH/Ea8+2B/pK8bJexmScShEHBCBfCjR0yxgJYLw=
X-Received: by 2002:a17:903:19ed:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d7079ffa9fmr55063925ad.6.1787712137683;
        Tue, 25 Aug 2026 19:42:17 -0700 (PDT)
X-Received: by 2002:a17:903:19ed:b0:2cc:864b:539 with SMTP id d9443c01a7336-2d7079ffa9fmr55063225ad.6.1787712137255;
        Tue, 25 Aug 2026 19:42:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d730c57sm3775785eec.12.2026.08.25.19.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:42:16 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:42:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: remoteproc: qcom,nord-pas: Add
 qcom,cluster-root property
Message-ID: <ao5Sg6QE9NN0P2zk@QCOM-aGQu4IUr3Y>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <20260815132541.1575121-2-shengchao.guo@oss.qualcomm.com>
 <20260820-controversial-mussel-from-vega-aaba16@quoll>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-controversial-mussel-from-vega-aaba16@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyMSBTYWx0ZWRfX7viQExzMczMz
 prbkPTUsYXUYeGRUfBxMtqBCUraz8UscxT/++LBbUOr8Bmep7k7Qu/CTbHJTeyv92wEMXj+4ial
 a19tUZWvakSvLpr2nxuqkG8N9nl9y1s=
X-Proofpoint-ORIG-GUID: iwOx_8uwClaSxwYeIYBSwJPxUR0wWBXW
X-Proofpoint-GUID: iwOx_8uwClaSxwYeIYBSwJPxUR0wWBXW
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a8e528a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0bSYeviQ84LFTGsDHmkA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyMSBTYWx0ZWRfX3oJY1u2S7r2U
 oFl2qYMQ8A9O8NI5YaidHXEYCKDnjoakX28zc8dYoi2kJc84zwGWocPw3ekWymWdl97K8WgyZeB
 hU7cvwC7OWmZrrZHUWQgv66e00hBn3wsEBXzY9gKWV8lkKYXGc4VHLc3bE8KW8VdVzf4wg9RulB
 YcHwNfR41qIzjdogdmNVJojipKx5M2zjCuZQ0SRDwWmsGEA3tIU6WdqIn7PjsXtXnsVq2KikHpF
 ofK9SUFaO36wjkRUDaOVkYij2qNfCf4IYPyoK5uUCFQum0PAvwu/W7LqtNWOMA+YGqIzpxYKg6V
 eaNaiEQkaRolnW1DcOh3+n4wsh0dyYhOGl9duMz05OV8zehWcTogH6e++lQKP2XTn8cXdRFT0QQ
 QKbUr+PeYdZ7yYlnZZN1YvxWKwDksVTmWJu8ctJLF0mhiJfNSMjYzkmbgqulyg4CJKRQG70y8Nc
 YlUVZAEGhFB0nFafAAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260021

On Thu, Aug 20, 2026 at 08:59:48AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Aug 15, 2026 at 09:25:34PM +0800, Shawn Guo wrote:
> > Document the qcom,cluster-root phandle property used to describe HPASS's
> > ADSP0/1/2 cluster relationship. Every member of a cluster carries the
> > property, including the instance owning the shared resources, which
> > references itself; instances referencing the same node form one cluster
> > that boots in order and is torn down as a single unit.
> > 
> > The relationship is described with a phandle rather than by containment
> > in a parent node, as ti,k3-r5f-rproc and xlnx,zynqmp-r5fss do, because
> > the hardware does not express it by containment either: the three QDSP6SS
> > blocks are register-independent, with no shared register window for a
> > container node to describe.
> > 
> > Also add the qcom,nord-adsp1-pas and qcom,nord-adsp2-pas compatible
> > strings used by the non-root cluster members.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../bindings/remoteproc/qcom,nord-pas.yaml      | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> > index e90d2953ba69..58d88cb07e52 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
> > @@ -17,6 +17,8 @@ properties:
> >    compatible:
> >      enum:
> >        - qcom,nord-adsp-pas
> > +      - qcom,nord-adsp1-pas
> > +      - qcom,nord-adsp2-pas
> >        - qcom,nord-cdsp0-pas
> >        - qcom,nord-cdsp1-pas
> >        - qcom,nord-cdsp2-pas
> > @@ -89,6 +91,19 @@ properties:
> >      maxItems: 1
> >      description: The names of the state bits used for SMP2P output
> >  
> > +  qcom,cluster-root:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Reference to the Peripheral Authentication Service instance that owns the
> > +      resources shared across this DSP's cluster. HPASS shares clock/reset/NoC
> > +      resources between its ADSP0/1/2 QDSP6 instances, and the owning instance
> > +      (ADSP0) has to boot first to initialize them before ADSP1/ADSP2 can cold
> 
> This feels way too much SW. We design hardware resources in
> owner-independent, meaning each device is the owner. Most of Linux
> frameworks, including listed clock, reset and ICC, support resource
> sharing for multi-owner case.

It's my fault. I should have made it clear that the shared HPASS resources
(CRM_COMMON clock/reset and the AG_NOC bridge) are not visible to the OS.
Instead, they are programmed by TZ, on the owning ADSP's behalf.

> If this is not SW related, then I claim that compatible defines whether
> services is owner of the hardware or not.

Good point! I will drop the property and try to derive from compatibles.

> Also, unresponded Sashiko comments.

Yes, just wanted to get human/maintainer's view first.

Shawn
