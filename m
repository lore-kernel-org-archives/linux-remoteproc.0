Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632CC2E2EF9
	for <linux-remoteproc@vger.kernel.org>; Sun, 29 Mar 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777878; cv=none; b=YO5n65fZQLqs1M333DXJhaF9vWDw4Xln5HyBYqKodl3ob/4Heoh278Aos0Zy2MYVuZ3nCxkdBvykZfn2oIpGwPZVm6U5avMifhhgoDqjYtyIHqZZmLHWsxfuZuphuRqZIuFtrpDgKqqTp+tvodFdksk3yM86itrs+BiY0iO2smQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777878; c=relaxed/simple;
	bh=EoIlLCuH+f8z+tfvoMn08R3g/gglMpb45Zl3/azitG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dj9bugmB/3vDvSjM24oBuFOucDX7GUEPEZ2NCGCZtEPCHMYzaSXT/u9uptR+B9V81HCuQdcfnwO3OJPvet30I4eGrtyztVbMHApWRp2utSuHsAoe8SLSzX1TyraPssKa7xtWo4DVbft2C2VhrlVqGJwyjNMvRvXefaSUoEgNxfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5gucdRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvrxuLnj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5gucdRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvrxuLnj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T5C8Kt2291590
	for <linux-remoteproc@vger.kernel.org>; Sun, 29 Mar 2026 09:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6XyR0Uy7o6/R7QNu7UQgnyIeyNsHlWE4yA9TO/BPOA=; b=A5gucdRyVOyb9YDX
	vqOfnOPP10Q3m4zxyIwBITB27ZS6eskfQA9ivlOWadCI0QqMi4Fr1bZ09deHyK4A
	ewrCV6c90DJo6qdsAzK8bm+BtA42UNzH4V3oeAPuhkDv27pTeR9CnzPsc79lsgiK
	00mV0EFlm4INxbxKr3l7Cm9LU+MqVrFAnGdqbufit8Gmhbn7qjDgk5Fl6q7KJkhU
	4VwfRf8Xp35EUAtdUz07jBA1/KkDd86+e2S0NEEUXILIk6RW7Zmzt4P/zTdVlPpi
	zGYZlVvcN7Uo6cx6voEL4JNXrQKBUnn2QQ9Dwm/w1lV/b/ADDK5ym6eIEP2tRjcF
	zSIBWA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqegbvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 29 Mar 2026 09:51:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b6f869676so67818441cf.2
        for <linux-remoteproc@vger.kernel.org>; Sun, 29 Mar 2026 02:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774777876; x=1775382676; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p6XyR0Uy7o6/R7QNu7UQgnyIeyNsHlWE4yA9TO/BPOA=;
        b=KvrxuLnjUaUpfQIVnbafNZuwns961ZnzalEP8BfYoWiyP7lZcsiwZ2zDv3mKpv2WM1
         C1kDQVT6gqZesx5vFw7Ir81jNzuhLEnNuEGORz6SOfWIZs9kpse7Ruqne+QoMzyzeYaz
         7MRbOxJr59I22RTvzv+sM01HpVu+stEQvlGK5ITBFFDVgGWKCBiF5cQkG8z/9Ae807nZ
         eSDQG2Am/gLGR++AHc0CHEDGr56eMkruqGZrPjVcOGLLCbAXBpGZas8AQwcSbZ0txLcy
         TmrM9F67y9eSuaAa7a8pNnGeUzRzDHumwHmjrjZhpqzjAAdWugNo5f7lnMP3nvYat1Uu
         Hp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774777876; x=1775382676;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6XyR0Uy7o6/R7QNu7UQgnyIeyNsHlWE4yA9TO/BPOA=;
        b=YaVBz8/XlwCH8ICghuLbbjZ6ATjSSDzsN/IAeek1NYKzrZH9NZRyfGrshhY2GY2W44
         0UJO9wT5RREhEfrLTxYZMzyNpSeziq38BXz3gM2uH/OsRRlk+fyU1dkAYSH85flK7tsf
         vTrzRyUYt0w4SNfbezv4fniF6qs2ON3HZ7ZlCtr6ZwPeRKHPcIEYtJ7Dapt2KwLn5zyr
         C27IEoqpQl6PKXE6V1PpRfq/W+kHZPbqVHAk///NBiewmcjyGWEpgT93TTN/L/kDUIUP
         dYSL1xFWBOCs7hxIkH3LvZRCCZ6BVSlmevkIWGthSrhCFzCnW1BL0jPiTrTU2QzXqHKr
         Vzyw==
X-Forwarded-Encrypted: i=1; AJvYcCVNhnbgvPfJHU4gbBRZ3Ke1ho9FkdwuevxxCyZ0XQkdejnW3ZBgm27CST7WMjvcS0fN0w6oZz25U+4dnKeaLxat@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7tP4+KjlrfaT/3krJILCiALG8NnOysVcQ7Ijs0RjbgG9qm12
	61E/v9jW23GMkLcndLpkPCIz80Aoyps8iEzMAJPjtZYsUFy+GdIpS5NH5zxS2TM0w/Tn9t6ULMl
	yZRqlroCpiBBPYd8sZ0EP3rYhp8BUzipNtIRjC+YnIaGKMY/IvSeclaBPMBi9VsJi97O6yns6
X-Gm-Gg: ATEYQzz/CtRo/gtRc8L7VwxTEyn47lz21IcUj0x4TrtktJi8X//Ae+bGoEkh6eLxgLC
	sY8ykCYYG4AdzEZ0Kay/Fo4eR3WmLZO4pUGYuZlZv/jyxjA6tV8vetrxtAqRtnPrWjh2uBYdkfR
	xeoaC/gE4zPRxBqnZ8cMoYKax4K2IKtGBxAfvmHeSGWYuZxQO0h3QvjgVzG7n+LNtKoBrL8cMFi
	Cz/ELHcx6DDwvqZs4XYzMWALJ9udxJl0N3CvaxbPhBMkSy8HGBp/YCyUPClct6fKWHR7jgGhXaE
	uaqXpQ3ghkZTnAEKU2Pt1cRKZhZ2SFVxAkIorEhzR80rNGhIDJliSZhItN++QGy1cekM9bU2xpL
	IeqcMCIFKE2JB0UyGUol7p5SJPeHxXUV0KxrY3Se7/srMqirbIWNIc6WMBjiv+l6cdf+HDn7dtv
	ha5Q61l46PT4rcoQ65zSzm758G6pYy3lSd8HA=
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr112004541cf.30.1774777875620;
        Sun, 29 Mar 2026 02:51:15 -0700 (PDT)
X-Received: by 2002:a05:622a:180b:b0:50b:6b39:4df9 with SMTP id d75a77b69052e-50ba387aaacmr112004271cf.30.1774777875105;
        Sun, 29 Mar 2026 02:51:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838db4b3sm8282291fa.33.2026.03.29.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:51:12 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:51:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: power: qcom-rpmpd: Split MSM8953 and
 SDM632
Message-ID: <44t5nsdwy25ildzk5czpeidjxrelfyz346thwddsi5k5wo4pj7@2or46xbuo5wd>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-1-6098dc997d66@mainlining.org>
 <ocrzwxmr256h3ef7ifwx3z6jgtzubiha3forfi7nao6gakb6wu@recertxxhlip>
 <39a320e472ddc6d44c950a995b577e77@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39a320e472ddc6d44c950a995b577e77@mainlining.org>
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69c8f614 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=OuZLqq7tAAAA:8
 a=xFbSPXw9NCUfqnV0eHsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: kS9n45e4Xj0Qb3BaUzbv1HPyoTv_t5AM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NSBTYWx0ZWRfX8wponAnMB1dg
 rx7BNYeUvzx+1uLTUcOSQVoB82VS5gjysouJsfbVUnEBnXOPa86t7XBmEg2RiYCp6tyfoJ0XAYV
 /4KGv9cTQJw4vYnoa7KobYlZEqS7BRfbouMtWtHjMUppy7KtihJbLOnynWNSeXKZM2VO00pQLQF
 aGl/KV9iIxJ3SZKIcTs39dBJEnOrFXd6cyiOEgFdX0uN3FsRIKrRT4LTXR/vC99MUptRPcF1Di3
 C/ibRZjBGzgWCRIfM1imWeSXu+/TB6I7IcQHLKgnp3NeO+C0ViKQhW+6JaQMqTZFWcb7Eef0Pvx
 6jLUL31K7T4sbe9/tDKAglr5THQY8H622ye86pTysAYAcIYMQt2I6ypi/b7NC4NQDkY9VIyjJKR
 8sqByLHStrdI6RL5oFqnJ45gqXHQuV1GUEzeCvwEdb9K/t3D2JwiziA3wLdNtnJR7gvJSJlW4ql
 mSkPb0W50WxdMt7oYng==
X-Proofpoint-ORIG-GUID: kS9n45e4Xj0Qb3BaUzbv1HPyoTv_t5AM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290075

On Sat, Mar 28, 2026 at 09:22:19AM +0100, Barnabás Czémán wrote:
> On 2026-03-27 21:26, Dmitry Baryshkov wrote:
> > On Fri, Mar 27, 2026 at 09:11:43PM +0100, Barnabás Czémán wrote:
> > > Remove modem related bindings from MSM8953 rpmpd because MSM8953 MSS
> > > is using mss-supply as a regulator usually it is pm8953_s1.
> > > Split SDM632 bindings from MSM8953 because SDM632 is using mss-supply
> > > as a pm domain.
> > > 
> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > ---
> > >  .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
> > >  include/dt-bindings/power/qcom-rpmpd.h               | 20
> > > +++++++++++++-------
> > >  2 files changed, 14 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > index 8174ceeab572..659936d6a46e 100644
> > > --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> > > @@ -48,6 +48,7 @@ properties:
> > >            - qcom,sc7280-rpmhpd
> > >            - qcom,sc8180x-rpmhpd
> > >            - qcom,sc8280xp-rpmhpd
> > > +          - qcom,sdm632-rpmpd
> > >            - qcom,sdm660-rpmpd
> > >            - qcom,sdm670-rpmhpd
> > >            - qcom,sdm845-rpmhpd
> > > diff --git a/include/dt-bindings/power/qcom-rpmpd.h
> > > b/include/dt-bindings/power/qcom-rpmpd.h
> > > index 4371ac941f29..2d82434b993c 100644
> > > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > > @@ -84,13 +84,11 @@
> > >  #define QM215_VDDMX_AO		MSM8917_VDDMX_AO
> > > 
> > >  /* MSM8953 Power Domain Indexes */
> > > -#define MSM8953_VDDMD		0
> > > -#define MSM8953_VDDMD_AO	1
> > > -#define MSM8953_VDDCX		2
> > > -#define MSM8953_VDDCX_AO	3
> > > -#define MSM8953_VDDCX_VFL	4
> > > -#define MSM8953_VDDMX		5
> > > -#define MSM8953_VDDMX_AO	6
> > > +#define MSM8953_VDDCX		RPMPD_VDDCX
> > > +#define MSM8953_VDDCX_AO	RPMPD_VDDCX_AO
> > > +#define MSM8953_VDDCX_VFL	RPMPD_VDDCX_VFL
> > > +#define MSM8953_VDDMX		RPMPD_VDDMX
> > > +#define MSM8953_VDDMX_AO	RPMPD_VDDMX_AO
> > 
> > Well, no. This is an ABI break. It will make previous DT to stop from
> > working. You can drop unused indices, but you can not change the values
> > used by the existing domains.
> Do these indices never can be changed?

You can add new indices and you can (with some care) drop existing
incorrecr or unused ones. You can't reassign indices though. The rule of
thumb is that old DTs should continue to work without rebuilding.

> > 
> > > 
> > >  /* MSM8974 Power Domain Indexes */
> > >  #define MSM8974_VDDCX		0
> > > @@ -156,6 +154,14 @@
> > >  #define QCS404_LPIMX		5
> > >  #define QCS404_LPIMX_VFL	6
> > > 
> > > +/* SDM632 Power Domain Indexes */
> > > +#define SDM632_VDDMD		0
> > > +#define SDM632_VDDCX		1
> > > +#define SDM632_VDDCX_AO		2
> > > +#define SDM632_VDDCX_VFL	3
> > > +#define SDM632_VDDMX		4
> > > +#define SDM632_VDDMX_AO		5
> > 
> > Please use RPMHPD_* instead of introducing new entries.
> I do not understand completely, should I use RPHPD bindings in rpmpd driver
> or
> I should use rpmhpd driver for SDM632?

Sorry, I meant RPMPD_*

> > 
> > > +
> > >  /* SDM660 Power Domains */
> > >  #define SDM660_VDDCX		RPMPD_VDDCX
> > >  #define SDM660_VDDCX_AO		RPMPD_VDDCX_AO
> > > 
> > > --
> > > 2.53.0
> > > 

-- 
With best wishes
Dmitry
