Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC219393DC6
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 15:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875182; cv=none; b=gOC/o2vZw7BJCICuoP67klARLL+oIh2TY9DzM0RNcxjrLAW7aX87zIihaahTnf1nDEloViTbl1RjrUsUTzg7QYiSaLc5d9jn20S3ErSISYWbPc2tS4oODa+fRWcwfjKu03HeTCZ4Rv1ixp0lcskaBMn0PI/mw76eXyOgAFdAiNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875182; c=relaxed/simple;
	bh=TaGjZVBNjqzB9wouC54FD4GU1xyQRprfFDBycdH1uMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owHI2AzVl+ZAaXJsky5XcbC5KQOF3XpD3m7A/Ke4lE8tDzu4K8qKtA0r3KoVOzclm/8eIVVUTNgbpE9zKQ88pyEtN8SDcyokigrcb+fkQTx49IBDaJS2rNyoU+Fhawg03lR/2PhChlwcefhDOr3jLYrTOluH6cOKhEB7SI1PG1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mS8tqQ7w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mS8tqQ7w"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UIZB024070
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 15:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BwpqZ61LBFwlqjVSb9xTIEnN
	VKZalQo+jXTMu0ZiAnc=; b=mS8tqQ7wS1ddBiYsTugAgpdhJo5uNPAiqiFAwwHF
	aAayN9gBy82wTn+F1PwaTkQd7RrgRDK1Kd5ZCV3tgK16/AysfoTPfVfHJc0kTsz3
	PpkZ9BigV0t9qWYU1fzHimnyhdwrp8EZo6F3hOU1N79GT/8Mdz5zAbVti3gQylkh
	dt2gpohCDS73Qn1OlocDCyYzIamZQswjvt7cFq+7MUbPElhggF+bwdXDyI2y4H8y
	Kd1hzXAc3z62iPKXYrG/VJEe3Uln0uuL2aSpkErR+7bBnqtAvtJd9jzlxgjOLyQ8
	v86K6VZkDKPMFTHYnlmL8kqGZuF6sIPSYJrjcoyG5Nqo4g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ahpfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 15:06:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458274406so52351725ad.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Aug 2025 08:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875179; x=1756479979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwpqZ61LBFwlqjVSb9xTIEnNVKZalQo+jXTMu0ZiAnc=;
        b=NxFhqUD1iAOJI/d8C+b0hP2QXQyPwUFGesMRuLh4GBve4hpmtezRQ8vfUDLFHzWVlG
         SjWMmZe0aYOPBwDogp//a5UVWni5afsNbnUaVKk4SPqPDIsltP6Fb4dKw22kkkn5FvVH
         w3aHfGYFGBW1d3/8IjIus2D4Mg+Z1XL7Hs+97B+viNk/14DFmrLgTlkXbvED+0kzo9+I
         MHyMJAfHMcXVmdez9/C85nRS64ZZFDSS0/dUi+OcMvpQ9/Wgp0v9jNWI4xekTE0ce7bw
         3Gr8qfwmjiTvZ22GS6hDkrvZsF/D5QxviOBG2y13sUcwt441TH3LGkrv1QIK+gkAuFCJ
         ovcw==
X-Forwarded-Encrypted: i=1; AJvYcCUED0aORF/VwbZkDGFqFK2pjDjrgT0gJVe/z32LSFcpiNNB9/0HCXXHuMj/QiKNc8kfsGk1Co8VNRDFAoulb5EY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2QLiJbGFY+Yl6lA0sOoH7hu6RAjEeeg6a8S4ytovmH0cR/KDu
	+A0frm5LzdMC9sdxK/T09m1JX/sixq/Sq+GRnQigl0hOCo/ehI7eueCvESwg50erRHCnsrJJ6Y5
	GNwTGzAYoccjIHfqgpUd7jo5QuEe7Po+OnAc7x44SoMUTjvagM/TwRIIO449Lb43bbRkzSKZq
X-Gm-Gg: ASbGncuL7fV86BzatTUN4DPYPv6R6T2tIRzOOgyBsu+/ogJ8s1PvvZM2amh91GZG8mH
	KVVKTq+ozsdoVMSLa6Ww5iuX6If/SYyEs6g3ETsyZzYMTfdQH3s7jnb91dleXrwVB4BPU8dStxV
	Who0JD2xTDviOvnennuRmDtUgVxo6Uyfjxjd8VytonvobOirnag13ggFZG26Ed9zEqQJ4CiCvBb
	7KIqdjhGi883N+I2lZb/qf1/6S5FdZ85RMK4is3hbmHRhd6KLvKWAryjmHFIMjSHtThyLT6dQWQ
	AvZM6mXLGUKcpDHxoN6TcpU9Xt6ZnROiBZyxpoe5RNtNaOuj31/6x4SL/PL0UO+mb9o=
X-Received: by 2002:a17:902:c402:b0:246:570:2d9a with SMTP id d9443c01a7336-2462efca0femr41628175ad.59.1755875179154;
        Fri, 22 Aug 2025 08:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBa7+NR/UqARzf3gLr4vrEuhT70rpF/eoP4nZO8thtakTCqhfzCPBBCTNxi6EQ2bmua/KKwg==
X-Received: by 2002:a17:902:c402:b0:246:570:2d9a with SMTP id d9443c01a7336-2462efca0femr41627505ad.59.1755875178605;
        Fri, 22 Aug 2025 08:06:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245fd335ea1sm55029105ad.110.2025.08.22.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:06:18 -0700 (PDT)
Date: Fri, 22 Aug 2025 20:36:11 +0530
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
Message-ID: <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKguXNGneBWqSMUe@linaro.org>
X-Proofpoint-ORIG-GUID: AKJAtTnwHxWPx6vKMepnl3W3MkaIEld9
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a8876c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=QS3pIwUUYRx7lZdHfBUA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: AKJAtTnwHxWPx6vKMepnl3W3MkaIEld9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXz/d1xdr+Xrj9
 vG1yfOFTZ5Onlgwyrt7nAblCNwvNFHlKXkTA1xojos2pl7C3xU81RIhOln7RYkJcZqeTji6Etc+
 Qo91s+DpJB3Pvri885upbA/57tzQWSfdrd0ic2kDN6GZgsEF2AZy2rjlIplTtMPdXXrdtqJF6i5
 //R78GJYISCM7sZ19vEbOmd5oua0bUkKwSCicXOKVjzULiS4/tr3Bak8CW2cmy/jEeqXEsTm6H9
 hVXVUMHxqBZLSNT7J3w3w46E4RuGOZPiZhqnkb/NkUX/FMTldSSUuwINGQjPpVUtXoX1UOz6rHc
 M3vq7HbdS2K8bxlhigY6rohcj0A7Qjl1o/O3FgYub5/NIfPidbDUTZNY7DA5O5qDEyXxW1f2IGa
 +j5O8Mi+PHfBc2wWUb+XsOMUWQuzEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > >>>> +int iris_fw_init(struct iris_core *core)
> > >>>> +{
> > >>>> +	struct platform_device_info info;
> > >>>> +	struct iommu_domain *iommu_dom;
> > >>>> +	struct platform_device *pdev;
> > >>>> +	struct device_node *np;
> > >>>> +	int ret;
> > >>>> +
> > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > >>>> +	if (!np)
> > >>>> +		return 0;
> > >>> You need a dt-bindings change for this as well. This is documented only
> > >>> for Venus.
> > >> You are right, wanted to send device tree and binding support separately.
> > >> But if required, will add with the series in the next version.
> > >>
> > > You can send device tree changes separately, but dt-binding changes
> > > always need to come before the driver changes.
> > 
> > Do you mean to update the examples section[1] with the firmware subnode,
> > something similar to venus schema[2] ?
> > 
> 
> Sorry, I missed the fact that the "video-firmware" subnode is already
> documented for iris as well through qcom,venus-common.yaml (which is
> included for qcom,sm8550-iris). I don't think it's strictly required to
> add every possibility to the examples of the schema, since we'll also
> have the actual DTBs later to test this part of the schema.
> 
> I would recommend to extend the description of the "video-firmware" node
> in qcom,venus-common.yaml a bit. You do use the reset functionality of
> TrustZone, so the description there doesn't fit for your use case.
> 
> I think we will also have to figure out how to handle the old
> "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> handles IOMMU from Linux). Simply checking for the presence of the
> "video-firmware" node is not enough, because that doesn't tell us if the
> PAS support is present in TZ.
> 
> I have been experimenting with a similar patch that copies the "non_tz"
> code paths from Venus into Iris. We need this to upstream the Iris DT
> patch for X1E without regressing the community-contributed x1-el2.dtso,
> which doesn't have functional PAS when running in EL2.
> 
> Perhaps we could check for __qcom_scm_is_call_available() with the new
> QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> or directly with the registers. I don't have a device with the new
> firmware to verify if that works.

You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
video-firmware's iommu property is also important.

> 
> I'll try to send out my patch soon, so you can better see the context.

Are you saying that you are going to send patch to support IRIS on
x1-el2.dtso in non-secure way i.e., non-PAS way.

> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha
