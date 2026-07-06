Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729F62F5491
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jul 2026 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361284; cv=none; b=HdX5rN9jmaQNt13/5GfX52Hl7O4BU7wyaPAVewWDsH4Kc8pavVIbn7pOTqyZ40GSt1VsokkMcOFW5QeWemwOOZCwivXiPv9y9y0aT8iy7/YL4UhVD06U2jHpZ5HnN5vsIAyfMUogsYNKNrxR2A6pWU6EntoFXQxOQNMDiz/Pok4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361284; c=relaxed/simple;
	bh=ScF1ZsN/3p1a7WMakTdPmE7DXNb9ruzMuYE6+2BJJ1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOCQp4G/r2wvz20jmKbOOgcXOtHMPD8at8SSxw7s8xClODTTOmettpf8HVjlkGajYjnvZqO01Oj5UXp+93mSEhmlMM3ir4saZkQ2y6RIFcWBgBgrJM4CBy16bEnm+R+bGgNzv8eCvLhgZb6gjd5iYhmV028KpWyKLat756gda4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGuy6TPF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gh7Jl5oW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGuy6TPF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gh7Jl5oW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF5PQ981539
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Jul 2026 18:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DBczducbIXTUza0JpGU1lh9x
	H6Udtg+ESPxTMWCTd78=; b=BGuy6TPFuN3g6+YbhBgpL1RRU1rDzXW/RBdeko9u
	/kKrLsPvy8h9WEf3dLwR2MOHCHYj0EUs67bnTLxXiRW32SCtzfVG8lsPdiSjDq+j
	as0tAxm7di0Mc9vEPXgdTN4bJMhMdH/ZvOoWuCNvIfcPH8HwRerOmdRl4uUI4+SV
	ESVKSL7418F0y0Za98vhY/av/zzHMRB4Lpyub+uz1s1ZzNoVXvga/9iZltmD9EFH
	8O3uBeahhB8cBcXNFtNDZfc1Q3CcEv/0CL9VkdHlOFz6/aPSROnUV4lz22k1IkQz
	jK8QpSIIh0X9NYm6ct3iqRfsh03hUkFTvb83CwU5vc74Fg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgtdys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 18:08:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915d3261c5cso292974985a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jul 2026 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361280; x=1783966080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DBczducbIXTUza0JpGU1lh9xH6Udtg+ESPxTMWCTd78=;
        b=Gh7Jl5oWJ31i3AZfTtaJ1TdHo4b4Bp2ax5sp1GuiykxONPzRwdOLP7+7z8KMPa4VWH
         btiAcLml8axvM9SAaygqf6KSBa2cyMIy7IoGNyBOrhHaRBFAa06l8TYR8YXFC78VE4Mr
         89sdJ6m3Cc6/enALcEFCVdhD1kjFZtLf4XNdLK2mnquf/5tLDY1dCqYMHIfwTFBTO0OY
         8bMHA69wLuwfNKTeVJ97OlF6jVmjZbsdaA8PtwiEE+XCxgE9zj8BKWbn876JAatPTk8M
         QBCFtCQyrqHE62gizW68yN1HMlS9srtDzQ8XVfzetirAjVBGdwfw2AdOSR00676eDF5/
         vWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361280; x=1783966080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBczducbIXTUza0JpGU1lh9xH6Udtg+ESPxTMWCTd78=;
        b=bQEdkxEcthOQlp5KvPxi9U9d7GQggvuaD2p//rQOjY1W7I7F+ed+vPJ1UobNO/9w9t
         NULzaqBvbia3V63PI5LO8sJoonmww5TceEEZr+3cp1bq3eg4ocZlnLBojOxA7cWsWMKd
         rcmIjdoPGespUp4JxW/g86PcLqU9xQ8KfJ3bClb1kA1pdEwrYHPD3JMjLczl9uooBZmK
         Dyq+ZBJWcirvmUOaF5+ZeKRBD9C5w5jgJlyRSpdVXROzjPbvAsMGDRFlRfTPxEdi96Cs
         xEfWbsdvSFASI1fKZugdLsKTbKqSlXNly9ftFux/zNb71UAeVv3MRSjhY6poXbCfTYqP
         fZYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcBnxwN6zNuJs72b0qoP9bITMhr96LnXVx3CN/yJaa0LA41ViJWmTjgd4ZL4dVOchvuiAwpCdjlcHC8v1Pxfft@vger.kernel.org
X-Gm-Message-State: AOJu0YxDcIRiXdcs2oa8pygKT5K3rmRNARtZTEzYQnuU+j5ViylDiDvP
	c6M3Dd8t1z2slEzSlHyjVmZxiqmXxdFlUKo85InACuWRAkKzqte7r1giwDMuss4BQlHCm6IFA3N
	vQamw3zZSgdLVHYaUOOq1/KDAqIihBsiNQjEtsgEi3G4XeujFUIFVk/K7PL/KjAqDDs6dSUf/
X-Gm-Gg: AfdE7ckEpGB4GR1QkG2JHwFD4e/VVIftqStUGadUFfaHsJpimJQ00RFq+Xo2nI8beMV
	oz3+mTLMYBMbJY1m2Q13xfdqrHsG+6HKFdeSnGlytXD+o8Mq/Kt5/LkZnm2Rikg4LKJ1S6cmZlT
	FaRhGh5J0WQzMuPp+giLn59Rj0NCbknZ7K5GDs8VnC3o4IaXfGpjfiwM9U8Z90wJltKu5/ViJ39
	4lQO/5XVZWxe79hD0K1qRWiudpfeFYsC39mkXSQ2ooX7OnwMG+4sKjnpokA0TpVDeFaHVla3Ay8
	DJzpNm0NAq/x0IZCu63p69i3fDRIF1x43CA6cjef6v989L6Hct7HYaq8pM7chjibVdUs/rtjM39
	V0HDszddrwBP4Rpu7lymkt11plv6/b6dibx5aefrOrrrnqsn5vWjygi5YQ3Hqz11tzCqGpL9K7a
	XtR7Z9nzqRODRjnrxyONwWPbaj
X-Received: by 2002:a05:620a:2725:b0:92e:6637:db5 with SMTP id af79cd13be357-92ebb4c7b4bmr236543485a.16.1783361279735;
        Mon, 06 Jul 2026 11:07:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2725:b0:92e:6637:db5 with SMTP id af79cd13be357-92ebb4c7b4bmr236538485a.16.1783361279265;
        Mon, 06 Jul 2026 11:07:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1890asm20599981fa.3.2026.07.06.11.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:07:58 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:07:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 4/6] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <5uniamhlwdbnyjs4looanxy5i6pqcbj7r5r7dw7xjrfs2tqs3w@ggvgojc3ummv>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-5-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430191253.4052025-5-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: c4LHhVNFXtD3_xY6A_gDlVGdDzjx8Ydf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfXwkrILoYtyv/h
 HgBPFeHqHL6bDnLlv5ZwsE2uy9pWc+oqSCKICMRQQ2McwzGUlK1btIFYyhoO1kbn5yo4jNy+VPF
 kY4j6eJI+DSLzNrM33tH4j/5UF/nd6EOqavMXrRrn1g90n5Z99LysuofIny1Fkns5M30AtBYIIN
 MEAFCaU1lusjaMegL+nhpcFE5shMUwh9L85nWxBBXV2eKZt8BCcG4b2pQMZAvDLnKoQnl1H4cf/
 fFVD2bBlG8oREpx6VgISxlOse6yoaTClhztLC051Plr1pHEnuKZlTNCfW7PbbnmKJ0hJnm0NabJ
 5730HEnPapR60aB1Bk3hLMHLapQTnjYGWKmGTyPX+vmUEGOIn2nRmXL+Jyr6YDmQluw+zPuhOxf
 NrTNJHTSTuJGYGC+ygVqzkTUOva/bq+jcroV8JznTpUgCVolo/W0RySj8+ZG4YDtRax7nuk99iD
 iu58HfYG+FS3/c3+Vhw==
X-Proofpoint-ORIG-GUID: c4LHhVNFXtD3_xY6A_gDlVGdDzjx8Ydf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MiBTYWx0ZWRfXz3Q+7LNGh0qs
 +yMvzBHfdHrtUTZkA/cp7kdhpHhStJXozxgwJI5ZmcTIsUEaideN1Iz7xO9DM0ab7BfEXIoSyh4
 QVYLGwfDa44LdYI1gjH3QbA+Dl/Qdy8=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bef00 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=SXALPXzt-6fgG3gb-dIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060182

On Fri, May 01, 2026 at 12:42:51AM +0530, Mukesh Ojha wrote:
> Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> Peripheral Authentication Service (PAS), always map the MBA region before
> use and unmap it once the usage is complete. This behavior was introduced
> to avoid issues seen in the past where speculative accesses from the
> application processor to the MBA region after it was assigned to the remote
> Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> before handing control to the remote Q6.
> 
> Currently, most Qualcomm SoCs using the PAS driver run either with a
> standalone QHEE or the Gunyah hypervisor. In these environments, the
> hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> violations cannot occur.
> 
> However, when the same SoC runs Linux at EL2, Linux itself must perform the
> unmapping to avoid such issues. It is still correct to apply this mapping/
> unmapping sequence even for SoCs that run under Gunyah, so this behavior
> should not be conditional.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c  | 45 ++++++++++++++++++++---------
>  drivers/soc/qcom/mdt_loader.c       | 18 +++++++++---
>  include/linux/soc/qcom/mdt_loader.h |  4 +--
>  3 files changed, 48 insertions(+), 19 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
