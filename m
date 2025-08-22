Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BEF20E011
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875637; cv=none; b=bKqbfs5vbB7S8PvGI86xLcUMahyjpcrMxM2Qkz/M3xvqZ/vEp/k4Usl69kfpw0hiVn2a9IuGjJmrcZQmKgOxCB2c7YBYf7abub++YsXIQag2tnO3L6l/sHwZl+TjL8XLm3dSp6OM1lATzBHlW9tU/BVm/5V5MGm1NegPnJuI4Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875637; c=relaxed/simple;
	bh=eG/orwKFQd1AjY3A8QCa+7dXaRile+fE60M6k3sicdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CI+8eaqmGBRuenVVcOENyVon68c6eQzwyBdI7k5TptG3cVerKduMBkH6ah+yJibXKV9APblUjYkRbL2b5sWxg3GplsaysgeN4H5X/rcytFtEtKAi9zD9zuVYa15FcjAyDRBChmdxhaiH/fyY0IdCmwH75I1QBmYGz2+MiZ7s7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUpcF0lo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUpcF0lo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UHct021755
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 15:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btt2DyzNMiZ+hzGRt3lGD/YX
	b5NjsYZqPLvyhJlPzp8=; b=AUpcF0loBdg+2hN2wj1mTQszGXeQ5mgzuKDd9etU
	85AGUMVg1Dm7Afnh2OqxLo/0rljJTyq63lapDWjPA1xKeati3rbGhhguaeVWQ6M3
	+UK44FPqkpT9dqXN+NvYloX6Va6Gm2h35aJMHFbwk+hcm3ToNm/ruMrTJR3jmjrx
	Kv8dNervN8YgkPoIkpcq0mH4Zch+TdypeDsLJh3neu663JlMcwmJpQ5+8H+MqyJE
	6Z6dsuZdtyTIenbGnd98QU9xKxsO1f4rFfC9MJM7ehFbWkBzuZHkR9BYX70Pn5nt
	wYFbm/1/l3rSGvH8WQcSFqs4/uYAxZHC966EnDhyO2/wsA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a9p48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 15:13:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32326e09c5fso2281832a91.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 08:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875634; x=1756480434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btt2DyzNMiZ+hzGRt3lGD/YXb5NjsYZqPLvyhJlPzp8=;
        b=YQy2LPMViLnJxMIiZcB9Y45Ann43HKTbYg/u9v9MXTAt6gLryCt58waZ5ZOoqFv081
         GG9R7GFzGAFv32BSd73RJvl2+oFTs3hwsCBloFRfl875xkCnmkwKoQPmUIR5uqHPojqC
         f9Wx2HvrRjPgw6EKghZ4NeKmozZCZguZx6XucLDHcOppX+uj050LszAkltWR8Ib7j/Nb
         gBV/9jsCoJI++tl6CJelnizw8DuXhCglFAA85paMl98APYCqj8pvu5Z9sAJRHid2xfZL
         ChQv4bGbpRHR1vxq9V2uolOwglMTMEUPGzNdAXozL1Ty9z/uv+FLd5/O4K3s27EY2brW
         yDoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxpHU7IecPY/fhxDEZMT6N6iFWk1n/tFctYxiApJsPxl94M1hgxNR9CmPx/CzmY4Rb15l1dvYuzox4YNVbtOi+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0ZyuznWpyE5pfNtIgAR0EQamz7buVllzFp+y+MPZSXjisMn6
	nm88dqMOzAz4a1HxOMzOJrBZcwlOV3crJw+tx6xLRogiVfPl01BuiuidMM4htXqw0zo72A1rG3y
	BD2aCtkXfZkJcLSOMg7CyTSrph8GCG7tpDPFx0m16Vr7JvkxCMB4YLwe1byVsUp9jSP3TqNtw
X-Gm-Gg: ASbGncsvLCjpERurywZB09ImYEJS3I1f2gpB3H0HEUUnWZyTVh5qmSe8PFNIAQ9bzEC
	SDMXx9+uHltQVUtncncDA/ekOjFjdDJxWOAHgTaNqwQSwaJ6+Lt/aAr9oFpmo49+Wqo5IOaOdL4
	aO3yvaDxddjG+fG7js6ivEql1C/OxoYuE+V6HXusAaxUO2TnBYWXOfEFAaomX2Z2j50YgcOQzuJ
	opTWkWBwlwYS30VBrvWKjkiV4mDelo6TVWrVD1iuO9qdMNkrQhqmWmOtPlkj7mqYiKa9PpD5p7C
	bAEzmsbnUq9ucJgZjp6+x4pvGI7NcUvoBp3Z6pYXGTLFNgmoj3CnUHCI+fRKdeeu1Lk=
X-Received: by 2002:a17:90a:d2c8:b0:31e:ff94:3fba with SMTP id 98e67ed59e1d1-32515ea1368mr4981994a91.24.1755875633774;
        Fri, 22 Aug 2025 08:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErVfxzrJPOTigg78RZW9N+FXdSqfUm7MGCIOMf3eK9WaXKtIbmqRfkb5E1AROeKKMcfEPdvA==
X-Received: by 2002:a17:90a:d2c8:b0:31e:ff94:3fba with SMTP id 98e67ed59e1d1-32515ea1368mr4981906a91.24.1755875632892;
        Fri, 22 Aug 2025 08:13:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f3d37c51sm2122053a91.5.2025.08.22.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:13:52 -0700 (PDT)
Date: Fri, 22 Aug 2025 20:43:46 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20250822151346.skwtsh5abr3tmrjz@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <e18ac460-dcbb-4ac0-9c5e-3aaadf3485fd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e18ac460-dcbb-4ac0-9c5e-3aaadf3485fd@kernel.org>
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a88933 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=LBsFnih5B16vKGK3eWEA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: FKgK1AHreslDw0EjeNZew4Sa5KhvslpQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1gt690d/yX9x
 WqSBuoPTXdxyHrJDNQ8eEIOwDJRs/qxHFiLamNz68ZFNAtuT8JcvJav3G6IxkoK5MJSXS2VQcap
 pmj6cYBolrdq2vylD2C3mh+H8TxGkwAYGrcFuJZ5Fjr10wcZaEtBFX97bctMs2JiPk31vU0K0bs
 aso5Q/OqVGhax491zoKK/jbEFR+hImSTjPOU1VnIVegCe9HMfmINJjZwyOf7UBi5DWJAmnf6wn3
 UGlIjFKDKxX9sOUThEY0DS7BIExAEQ21ln1sl4CiiUnTUCI5tPATy2TlGWgIAfeSpklDp1lbCq/
 GLTJbz6HW4MGVD2BQ4/eY0rkKB58MimyGrED8c6GmxNBpccgebbcKzxKtD9rRYHeHRXDh7mCfFd
 VSTl3O2Jpg5fima/8diDY/l5PQtBTg==
X-Proofpoint-GUID: FKgK1AHreslDw0EjeNZew4Sa5KhvslpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 10:45:50AM +0200, Krzysztof Kozlowski wrote:
> On 19/08/2025 18:54, Mukesh Ojha wrote:
> > +int iris_fw_init(struct iris_core *core)
> > +{
> > +	struct platform_device_info info;
> > +	struct iommu_domain *iommu_dom;
> > +	struct platform_device *pdev;
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> 
> Undocumented ABI.
> 
> If you tested your DTS, you would notice warnings.

qcom,venus-common.yaml is documenting video-firmware and getting included in
Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha
