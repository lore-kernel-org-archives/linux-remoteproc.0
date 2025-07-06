Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8EF1B4F1F
	for <linux-remoteproc@vger.kernel.org>; Sun,  6 Jul 2025 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751796500; cv=none; b=EyjcwHs/gHXW1MljJlv2bGOAZLJN/yr3hicC5SdbQXabYvhH4vAhlupQ3AEVON2mJ8wLgM8q01Y8sS+OYjfP9ovqxYaHhn3CDi+01mA2ePrKDAt9uKcgkpy1cGKKKna0W+/t+jdA/dPS+tGQxgplD0w5OLuwoaNFQVZlzWosunI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751796500; c=relaxed/simple;
	bh=pGpR/Ul2mRfthu6duxkNeXnC1ePuVsMucysS7cKrgws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlHJNoNkc6h0+sSbkUp2IooDBjTGnMn0v6I+fdG3MurbkikInQjuRoFCecJHJBa27/w7zKuGLc0B6oysNlQth4rAgO1V8gXZi7LP5/qY5wvzDHFIoEzQxq9XEmWH8nXcq0P4m+na7fAnkfrXzm8r+DKcPPHZgykcM40prm0bhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHOfC2aT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHOfC2aT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5666XqWs026076
	for <linux-remoteproc@vger.kernel.org>; Sun, 6 Jul 2025 10:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9rxBrJduKA1XwbX2eE5GJB5p
	6Vs6GBgukIccWci1vVo=; b=RHOfC2aThtEopI6kYtLUc0I9R0KIMEy4qxzqLTCs
	+gYKgunR6tDHrZHICQ1FFvs8UEcA0x4Q89gVlNHYegiYruLxX6FG6Kfpg9zbiwu4
	vBU9NgOGCkIMeGD5QMuz5rl/iqSzuBhah4b2Zervl6Hz3oRTP/yp1AgET+OqetpW
	BAGnToSn+YiIV5cyI3Yn7wht35AGcZokpvd9OuPxyEfRIkehKfU4FHjJn2i08oF0
	rrEEzuj1oGagJv9SzqU16LvAtR7f6oB0Nv3rCnYc/i9eLPvKKUiUoIIxHM+i2S1t
	lR20uCS/O4e2uK3T2z58C3Lwz5Tc0TCwPCaLkxQxFqYz4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk3ggv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 06 Jul 2025 10:08:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d099c1779dso335508485a.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 06 Jul 2025 03:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751796497; x=1752401297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rxBrJduKA1XwbX2eE5GJB5p6Vs6GBgukIccWci1vVo=;
        b=nyxiJmVtlvf1gCFyMOsLmHWrt8y8p2JgvbCXw14TdQsNzoZA4kM/Al4xEt1F7VtKwL
         4gce+owac3TdZvwgXUUaUXRBA2dRd60viTeba4jZcJ7tsOWUl7bK/8HHYBm87n4GoBOc
         R4TMlpmE0pMieDkLVE9Ee0rXfaaWZMb7eMmN2aikK8zTL7L5MzCdR0fF4bJhxubLoPk3
         Zp+HGdRrXfB6xqzl5h5rNZFYUIFIG9h+K5G+Y60EwFXy5KPMQASyZy7EEQgQKq1XZMxX
         A/LeWuy5gZEfn2WyGgawJxPDbnfoMyvAGXjQpKKqFZWMhIwerxtujvyXxGooJyOc7YJu
         Th4A==
X-Forwarded-Encrypted: i=1; AJvYcCUUIhvrzw2nKWRSrr8z9wDmN0MYLmNyR95xmQD8Os8ln+2xc+omiazoUxVzoI9ZQ1r3kDO921+gyBtssAutf3Jv@vger.kernel.org
X-Gm-Message-State: AOJu0YxMHbZxEJt6D/aS6x549o83krRIW09CpVF/lbXAZiMMvEyeL2KS
	/AOgYOjJWOQNIpW6rCG64fzx4zDW1nzdqSK2HlhLup16Y76ccP8Ovi5AtV5VMQLL7Nl+zn4GcjW
	XE0VXmSTXYKEguqFayo1sFeshvAtLkP3cjyr3d/NhBKL6ZggRSBfMTdaC937D2+4yAvUlLz9O
X-Gm-Gg: ASbGncvSfAbsFOL/r47an9sxNP1eU/9Bu/DNaAXa17NCqjDMUE5VOLCxSyyBSz6tfbk
	jAGl9lLxefoL7q7SLhIDR4nZ5EeBjQSaUEC2jpr0wwcpt8slwg0TSf9ITHuCAtBfVGrXzRJhVQ4
	R/ynPPGwunJqgpJkci90hzosNJsAYpRFuVnRUxZdxdXjQLvAp8OAZjvzofw5IgK1vos5FwpAbEh
	4jxB1wqEMjDppCDm0qUzb7nqM4r506kyXkg4IEl85TlwKhjnWiR3i233k3+LCIZjgTQFVOlNOXP
	INL8CoWJZm+fbl2Rdi15ep3U6vRofF0HUNDWwCsGVvIMpEdNg7G3hP43CeY5wQJa2Tv3cygw0xG
	1WMcgt/pCIT2agHWQe9601bmqx2Wd/J8YyO8=
X-Received: by 2002:a05:620a:6884:b0:7d5:bfb1:db0f with SMTP id af79cd13be357-7d5dcc9de63mr1158835985a.19.1751796496850;
        Sun, 06 Jul 2025 03:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2rJKIVCI6vY82Px1cq0ub41yacho5CchNwdzf/+6nXejkmotjHKGVY5YMkNYBSccOGLqJZA==
X-Received: by 2002:a05:620a:6884:b0:7d5:bfb1:db0f with SMTP id af79cd13be357-7d5dcc9de63mr1158833285a.19.1751796496410;
        Sun, 06 Jul 2025 03:08:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb162sm911052e87.15.2025.07.06.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:08:15 -0700 (PDT)
Date: Sun, 6 Jul 2025 13:08:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8974
Message-ID: <znv7ish4ufkgnzfwyxjt2ercdvemxh644zwpqthj7rtf5gb4fe@auvbeemdlbtk>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
 <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
 <226fd16c-8071-43c7-9ecc-9bd95e319aaf@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <226fd16c-8071-43c7-9ecc-9bd95e319aaf@lucaweiss.eu>
X-Proofpoint-ORIG-GUID: eeZbwPoYmuhTk02Fj2WJ4bCwNlF_zBP8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2MiBTYWx0ZWRfX16jP10FkkkVA
 wxvLObaZYdCfmhmb45de8eDXe50e9mUC10+fluOUqBNHTJ+eYTkqFYrtHVxYLgf2g+CEQpU4YrQ
 HoAw9blclZnFPJDFMsq8zZLU0Ev2WQrIe3AaxBT2M7mAaKTBug80XvVvEYfQ6uYlLE5tcX7tdtn
 9a9bzS59I3fDjN9iB1bqch7V/rugVgO5gnVG14NRkGOlRYZs9Dn7ZRsNH7cwl6sSO5yhV4yPY3s
 z8yU8QdvAiiD+30W6C1IL8iWaQ6LFWZqc5wMNtrW0tCSuuXM06eQxJ5coJ43XmmjsQPEIw/Jeko
 UB6bErs26sLRmMe5ihF0knFYJ1c3qaykW1CAAS4MlmbeLT3zS2Eif1XO0qqQibdXi+nSiJGB5ug
 WgISBW9jl1EP3h/YzT6gEKOXD7zo3X0P01ERZn0N7RNKHlxIi9xBOskxhsBg2XK4gsOJPs9r
X-Proofpoint-GUID: eeZbwPoYmuhTk02Fj2WJ4bCwNlF_zBP8
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686a4b12 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=dlmhaOwlAAAA:8 a=H2ulDEPk4kSp5EVQF9cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060062

On Sun, Jul 06, 2025 at 10:31:38AM +0200, Luca Weiss wrote:
> On 05-07-2025 10:57 p.m., Dmitry Baryshkov wrote:
> > On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
> > > MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
> > > which has cx under proxy_pd_names and is otherwise equivalent.
> > > 
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Hmm. You are modifying the ADSP configuration in the driver, but at the
> > same time you've dropped CX supply from the MSS remoteproc.
> 
> The qcom_q6v5_mss driver has this support for .fallback_proxy_supply, which
> are used in case the power domain is not specified.
> 
> So no driver change is necessary in the mss driver for both old and new
> devicetrees, but the adsp driver does not have this fallback, so that's why
> the adsp config is updated.
> 
> Does that make it clear?

Yes. Would it make sense to implement fallback_proxy_supply for ADSP
too?

> 
> Regards
> Luca

-- 
With best wishes
Dmitry
