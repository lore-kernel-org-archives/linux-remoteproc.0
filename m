Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89242F879
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Sep 2025 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420408; cv=none; b=jbo5x3SoaDVK2DFER0DL3U+pCaMJBL2jYTzERPLSYNVMrOIdHRFbYQL5W0wxnoAOIbbL61Jqdr+rvJ/tsmTCLwsdyUEI93ge9kxBfTQxKapZFfl4TJMBjJ5ZW5iNEMYuTp0A+HSqwzr6ymQjhwJP4o67hCIdxgklLkL+UQLu130=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420408; c=relaxed/simple;
	bh=KBdu4aE7FCwLwjhgeBIHOejKq8DdFEOTeiqyFznUIXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9nVpXVN38zbQBSRfCFItbE1Kc0HTDRZkQ50hurmk9a4jqB7Ocalxf3Myho7nD+zapXZmzWhuuIknrOYLAqpi6KqFqYLmcYdNdWDDPDnVSbUib1mNhueiYIpZTRLNN9f+pOIrWFP5f4V7+Pifbmag7HSJNdQhJUxss3HEjHIlIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEvssZ38; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEvssZ38"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQIr020107
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Sep 2025 12:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W2I82qsif+R6mSRK23g85rRg
	suF/7dpihmilL84Dv1Q=; b=HEvssZ38qax3hAhvrTfglX5pj9Vv0mwlvTPQidxN
	6cWZWeLfBYRFbQJwBYZdj2mvfeXHFleEkbhdnUwEJgrDkGunivmQQpuHQ1gu55QS
	FY7d23iteCZeHXAOd8faX3K9gzsAbeNt78L1Ib6YZcPAo9okgIseSeRBuTBQ5cdf
	ZNmY9jBj66Or/eJCQUvixefbtiHtb5N9Mqbv8DMp55TqBQ/cT6JaEPgNdqsFbH/6
	BeSflVGHYSoc3orX2CWycJctGn9xhx0YlidsKNx3qKAG16/5MPp6BfAXrQiPS25I
	dFVa3thBwKwjwnfN2oYnGyLnSHD/oXXDeY5FisgNudj25Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a82qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Sep 2025 12:20:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24b2336e513so83259825ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Sep 2025 05:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420405; x=1758025205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2I82qsif+R6mSRK23g85rRgsuF/7dpihmilL84Dv1Q=;
        b=rBAAxcmGkzTdU3zDdubKSQfKKGMfmI2wl+AfEUMJihGE+2AZ28S0jfYiGnhCGBPxhf
         aF+1qlXpMbV9e0fiKlzdSvvdwLxUq0yTToCjzLKpK4yr+mhSDpP+4CUbdSEr7UZgfjmM
         XfdvDyhI9dWd3OhgnNMNFZd7w3n/CcEtCdku1aNDBjT54jZEA/Cvd4ddYKo59uJMzUaQ
         Lhp26ugD42zNe0A5i5gaKRWvs90ucyGmCq2Mp3BXXDFqPdjADG7DE3mEo0PfcvT4cJVK
         5F/QxklVEc6ET6isNKnoYNus6kBT23OrSthNHwQRuVO/f1vofbXW1S/YeE03yaAzwjGQ
         m7qA==
X-Forwarded-Encrypted: i=1; AJvYcCXhxyEDB3UQYR2ouFuxs6HAMpCs5lmOkzPyaaxavP5bkuceLWk95woIuQd9TZ0wrwkUFIO7M89Z6CldzMTs3V6L@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpT143HeXH4i1eNEvWJaW/98Ep1GI5/4ReR8FZyCENZOOwnjs
	RJlD1p+iNfKcheR8wi57UzHw/bznTRJWsRsDCzqsI4c4qeFVnhz5crM6gsGEvi05sMFFEgp49NM
	JqlP8BHt9JTPRA47IE+e4CyPAqTfBKfTYU0XZur5tM0M0+1LBYBZXJlCcHDl14JdqYK5U9fPk
X-Gm-Gg: ASbGnculoq6zRccaMT4wXlsPu077CgbD0jrobr6PUs/hWmoJ1uyMdUSDxciECL5+eMz
	SoYTK8qqV76R7rwkMbzSMb33sqEJdtGYEd7rbg/JKwUffeIZmlRe/65lbRAuXkYXsM3WayjRiWc
	e/nvOCcH+IFpEkQeXWUmUbJV2tcoAu9bABg7H0Ji5D67EVia2rocA9uXTqcZnFLf4I6ahAtcWLh
	ZPskkf1DYgPDxCO7I7ilndX6p5DGc7V1kdkS2iKjAzuQHYAf6F8jVPLct1sOCNRmeLv+OtidI+R
	ox+2nVQSgA0z09Z5FcZWjQn9FXkzcMAgA+8l+b4eXVQ8b/sFA8AzlT5QTVPXT7kEyKI=
X-Received: by 2002:a17:902:c94f:b0:24c:bdbe:cc90 with SMTP id d9443c01a7336-2516f04ef6bmr175426515ad.1.1757420404416;
        Tue, 09 Sep 2025 05:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYM1kluKh6L36vgfhf8HwE/ASmDkm9X+H9amBji9OAfd8UZp+wP9q4y/MziC9K/zHrUgWhCQ==
X-Received: by 2002:a17:902:c94f:b0:24c:bdbe:cc90 with SMTP id d9443c01a7336-2516f04ef6bmr175425685ad.1.1757420403490;
        Tue, 09 Sep 2025 05:20:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25125d76218sm93324665ad.119.2025.09.09.05.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:02 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:49:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20250909121956.rjbysoylwybgsago@hu-mojha-hyd.qualcomm.com>
References: <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
 <aKiaKwkpdKHSH9YS@linaro.org>
 <20250822164030.6gubbs24raeg6kbx@hu-mojha-hyd.qualcomm.com>
 <aKooCFoV3ZYwOMRx@linaro.org>
 <20250825111956.5x4dn3uguo4xmtss@hu-mojha-hyd.qualcomm.com>
 <aL6Sg9dExKfepRKM@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL6Sg9dExKfepRKM@linaro.org>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c01b75 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=KJKTIJMWTiPkF6hFbBcA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 5463LqxoJ4MSnSXhCR1JpzcABLCt_ZL4
X-Proofpoint-ORIG-GUID: 5463LqxoJ4MSnSXhCR1JpzcABLCt_ZL4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX9YmYmgjPx/2q
 aBoRhQ73FKrF7RT2lQcTQIy42Qc/rzDXryUF8lqeyzm1L9QyjpBKC2L4GmRgfudnG8ZHTPvFemN
 xTRq+pFFYZcajynFFp+8XKFC6Y/BPvi6thtq9qJVDaXExHKoGsHzD0RnliutS4ID8CcsEvv9iXx
 gdU4CH5jBGOKbpg01fLFZ3Rq+UIEz5y+GM2soW8r7jRYi6msZnQsn2L0ZfVaPWxAwcfxhHP12gf
 5xbVfb5iHgI7SUSYrgzlNSE+0velKRg3gVLO//pB0Ba1Sc8S7aC2ANTL2dYNU3rCAcac9oIiFjo
 ABZOjC2M9lQFHzq1RsoXaxtt9ucHA2pk1Lz6EOWR1ZtUV1EpqwjT0d4GbO+f8h9UU77yVlFhsiS
 WomjP8+h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On Mon, Sep 08, 2025 at 10:23:31AM +0200, Stephan Gerhold wrote:
> On Mon, Aug 25, 2025 at 04:49:56PM +0530, Mukesh Ojha wrote:
> > On Sat, Aug 23, 2025 at 10:43:52PM +0200, Stephan Gerhold wrote:
> > > On Fri, Aug 22, 2025 at 10:10:30PM +0530, Mukesh Ojha wrote:
> > > > On Fri, Aug 22, 2025 at 06:26:19PM +0200, Stephan Gerhold wrote:
> > > > > On Fri, Aug 22, 2025 at 08:36:11PM +0530, Mukesh Ojha wrote:
> > > > > > On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> > > > > > > On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > > > > > > > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > > > > > > > >>>> +int iris_fw_init(struct iris_core *core)
> > > > > > > > >>>> +{
> > > > > > > > >>>> +	struct platform_device_info info;
> > > > > > > > >>>> +	struct iommu_domain *iommu_dom;
> > > > > > > > >>>> +	struct platform_device *pdev;
> > > > > > > > >>>> +	struct device_node *np;
> > > > > > > > >>>> +	int ret;
> > > > > > > > >>>> +
> > > > > > > > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > > > > > > > >>>> +	if (!np)
> > > > > > > > >>>> +		return 0;
> > > > > > > > >>> You need a dt-bindings change for this as well. This is documented only
> > > > > > > > >>> for Venus.
> > > > > > > > >> You are right, wanted to send device tree and binding support separately.
> > > > > > > > >> But if required, will add with the series in the next version.
> > > > > > > > >>
> > > > > > > > > You can send device tree changes separately, but dt-binding changes
> > > > > > > > > always need to come before the driver changes.
> > > > > > > > 
> > > > > > > > Do you mean to update the examples section[1] with the firmware subnode,
> > > > > > > > something similar to venus schema[2] ?
> > > > > > > > 
> > > > > > > 
> > > > > > > Sorry, I missed the fact that the "video-firmware" subnode is already
> > > > > > > documented for iris as well through qcom,venus-common.yaml (which is
> > > > > > > included for qcom,sm8550-iris). I don't think it's strictly required to
> > > > > > > add every possibility to the examples of the schema, since we'll also
> > > > > > > have the actual DTBs later to test this part of the schema.
> > > > > > > 
> > > > > > > I would recommend to extend the description of the "video-firmware" node
> > > > > > > in qcom,venus-common.yaml a bit. You do use the reset functionality of
> > > > > > > TrustZone, so the description there doesn't fit for your use case.
> > > > > > > 
> > > > > > > I think we will also have to figure out how to handle the old
> > > > > > > "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> > > > > > > registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> > > > > > > handles IOMMU from Linux). Simply checking for the presence of the
> > > > > > > "video-firmware" node is not enough, because that doesn't tell us if the
> > > > > > > PAS support is present in TZ.
> > > > > > > 
> > > > > > > I have been experimenting with a similar patch that copies the "non_tz"
> > > > > > > code paths from Venus into Iris. We need this to upstream the Iris DT
> > > > > > > patch for X1E without regressing the community-contributed x1-el2.dtso,
> > > > > > > which doesn't have functional PAS when running in EL2.
> > > > > > > 
> > > > > > > Perhaps we could check for __qcom_scm_is_call_available() with the new
> > > > > > > QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> > > > > > > or directly with the registers. I don't have a device with the new
> > > > > > > firmware to verify if that works.
> > > > > > 
> > > > > > You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
> > > > > > but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
> > > > > > used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
> > > > > > video-firmware's iommu property is also important.
> > > > > > 
> > > > > 
> > > > > Yeah, this sounds good.
> > > > > 
> > > > > > > 
> > > > > > > I'll try to send out my patch soon, so you can better see the context.
> > > > > > 
> > > > > > Are you saying that you are going to send patch to support IRIS on
> > > > > > x1-el2.dtso in non-secure way i.e., non-PAS way.
> > > > > > 
> > > > > 
> > > > > The background is the following: I have a pending patch to add iris to
> > > > > x1e80100.dtsi, but that currently breaks x1-el2.dtso. My original plan
> > > > > was to disable &iris in x1-el2.dtso (because the PAS way seems to be
> > > > > just broken), but then I saw that e.g. sc7180-el2.dtso does have working
> > > > > Venus with the "video-firmware" node. Copy-pasting the "no_tz"(/non-PAS)
> > > > > code as-is from venus into iris works just fine for x1-el2.dtso, so
> > > > > disabling &iris in x1-el2.dtso just because the "no_tz" code is
> > > > > currently missing in iris doesn't sound right.
> > > > > 
> > > > > As far as I understand the approach you use in this series does not work
> > > > > without the TZ changes for older platforms like X1E(?), so adding that
> > > > > code in iris seems to be the best way to move forward.
> > > > 
> > > > Yes, this series has dependency on firmware and will not work for older
> > > > platforms.
> > > > 
> > > > > 
> > > > > I started working on a patch for this a while ago, it just needs a bit
> > > > > more cleanup. I'll try to finish it up and post it so we can discuss it
> > > > > further. I think the IOMMU management in my patch would even work as-is
> > > > > for you, you would just need to toggle a boolean to use the PAS instead
> > > > > of accessing the registers directly.
> > > > 
> > > > Sounds like a plan.
> > > > Thanks, please cc me when you send the patches; So, I could test along
> > > > with my changes and make dependency on it.
> > > > 
> > > 
> > > Krzysztof raised the concern that we shouldn't model the IOMMU specifier
> > > for the firmware using a "video-firmware" subnode [1], similar to the
> > > discussion for the "non-pixel" subnode recently [2].
> > > 
> > > I mostly finished up the cleanup of my patch, but I don't see any point
> > > in posting it without an alternative proposal for the dt-bindings. For
> > > this case, I think a simple property like
> > > 
> > > 	firmware-iommus = <&apps_smmu ...>;
> > > 
> > > instead of
> > > 
> > > 	video-firmware {
> > > 		iommus = <&apps_smmu ...>;
> > > 	};
> > > 
> > > could perhaps work. (XYZ-iommus isn't standardized at the moment, but I
> > > think something like XYZ-gpios would make sense in this case. There are
> > > many other possible approaches as well though.)
> > > 
> > > Unfortunately, I won't have enough time in the next weeks to fully
> > > implement and propose an alternative. I'm assuming you still have
> > > ongoing work for supporting the "non-pixel" IOMMU, perhaps your new
> > > approach can be adapted for video-firmware as well?
> > 
> > I believe, non-pixel case a bit different and thats not depends on whether
> > it is PAS or non-PAS.
> > 
> > However, I liked the idea about introducing something similar to -gpios
> > for -iommus as could pottentially solves at least this issue. Here, we need
> > to create a platform device and its domain based on firmware-iommu
> > property.
> > 
> > So, its required change in device link to put supplier/consumer dependency
> > and addition of firmware-iommu binding for IRIS and little of changes
> > over your existing changes.
> > 
> > But I have doubt, whether @Krzysztof would be fine with it ?
> > 
> 
> Krzysztof isn't on Cc here so I wouldn't expect him to reply. :-)
> I'm not sure if it's helpful to add him in the middle of the discussion
> either (at least without proper summary of the problem description).
> 
> I think it would be best to prepare a patch series with the motivation
> properly described. If making the actual implementation (to create the
> platform device etc) is too much work it could also be sent as RFC with
> only the dt-bindings.
> 
> Have you continued working on this to unblock adding the IOMMU needed
> for the IRIS firmware?

We are discussing on this internally and if this can be taken along with
non-pixel case or not, will come back on this.

If it takes too much, will drop video support for now in next version.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha
