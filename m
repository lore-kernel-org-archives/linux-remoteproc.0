Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5ED320A34
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Jul 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783413985; cv=none; b=tMp71wrAlS5pRLSRKwjVglVQCCtkF5EXUDBSftR6WF/JQVdT/eSYkdJDJm9d7f4AMmxInqmL2wQulk3dA+qEtbOcwv3JcGGdxTYnu3OATwO75OihNO0kk91eZM8piwuQFkoP/pnKrHstcJlYKB5Jmm0ftLBTH4zxcy2gN0WWpKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783413985; c=relaxed/simple;
	bh=bo4/wCTEDBoLszco8H2NWkjSXPYk2AxUnpKUQ1Gp0J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jV/n4o3ceV4PdGJvxe3c3UzBCLH4MI/4uacpYU0OC3VUO8Y/XsO3YN0RyQaLMtnabrb0Srw+xtT5SxEFOYmcB5uR2hU0/xUo+GjHMBpXNJfehTiO60o0G8zTWb4TO6rBRABYaAz0JzwodIKRItqo1qGAoex+JWxY5bUEsbkICVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkJ2Gry9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xyi0n2nh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkJ2Gry9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xyi0n2nh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DncB3182215
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Jul 2026 08:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PwC0y/t4PA5BTm75kzF4PtT2
	bwZ/6+nW2XeYw/+I+xc=; b=TkJ2Gry9andR9MXSQ+z+BedC4eDQJUHGEM4cpmXi
	2m0fAkY0dg3SrGDYT95ft9iL3xdoirGK4syJT2FbAICNe7gWMJQB2qH8E+vxle1A
	ijakzvrycnyJlIJV3NPZRl7Ffe8reYtsDLNKDN00JHmg5loEv70UqfAXV+YMucHV
	0K0nT9nUL3/s+U4b8LoOua6APuh3QiBGe+fVFWgr4rnx+7O9NPXIET+n45ZRcfC6
	NaNH8irXcvnthCYPR8ZOaX6z8U0l57VW1WqrEWIHYFcRaHrscHpKC9yoXOnNHp2X
	gBnj37LTGesR7R+kNdc/fsnIYwVFmBkIlxvOcMWprbhOYw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8k1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 08:46:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so2956962a91.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413982; x=1784018782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PwC0y/t4PA5BTm75kzF4PtT2bwZ/6+nW2XeYw/+I+xc=;
        b=Xyi0n2nhOBvhVnsyIgDb5wT2k/2SiPtslT0wFlYbF90woGrqXy7MNG4Y8EjkrfC+nK
         vhPC1nbUoPtJsGlo07B0ZEcojKy+xcOa6sfKVBWm4WVln9U/gqnKwxUIVPpuEZ6ycdx/
         nM5Yaj5XJE9QZSCmXKsxs21H4Oz9arqeDIkeJG+OzoyjqpbSMiO8Gf9gitPv6YdQzjgA
         RoFpGr/SQV8YtIv6L79Q6AUgPWLmikUph77JHh1C2gE+pOUDsCtJG/rr1yyvNRFEamGt
         CFmXmXL6c30zae6Fvkt/agYf8zKF6wVhi58SRzLW+Cycl9dsdKaN42Aie/CKlY65CZ1m
         qNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413982; x=1784018782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwC0y/t4PA5BTm75kzF4PtT2bwZ/6+nW2XeYw/+I+xc=;
        b=NLImyhH4AWUM1RgF/A9BI668euaCIRBLS8BapNnqtGUO7nb64Ioyby6WZNb6vjpXIk
         dO++7bdUfTiMRpgovtn4pqdnAGx1txv19gqf3YfU/KD203vCFhsLq3Hym2acLGBfo2oh
         IhnJJC0+OgwVaCLwwld5IUFR+ls2huQH4BwgslSeN2/YS5iK4JlC67w/vLt2YNYRuz8p
         WKnuHA6a+9NCTGbASACgL+4eRK2qd2Tb7Rung5jUwMDbJg6sR+SL6GzPKNh50v8h1u4Q
         D8f+t95LOKdyQwR7jw+3IgAOqM5Iwv0ppulCS0KWmd08dmo5KqxOAsu9c1VRx3cBfJqI
         m3Ug==
X-Forwarded-Encrypted: i=1; AHgh+RqvM9GQWF1oOUujnvj6Jtr4HyE8edINVzPa9msUpfoPAM+7EjAtcg1mfPDLarzXHjiAdHTQvHh0zU6kNMzI7i/a@vger.kernel.org
X-Gm-Message-State: AOJu0YxKmXtzmBMStfZ8QdEMleP0ry7Xc9Hw9GcHo2Dc7LTZ7pFCONlz
	H+hXaClxb1Tl9c+K4n6HKwbBcye1YYWZwAof9lxXWDUfDzhx1NXofg4VpH5WU5SX5KE+FvtDetm
	6Y14CT8lNOCQTZ7W/YNtj0WX3ETB2opwwf6f0BXHN3nW/zP0slW048JdgIZ5fAEnATxy2+aR7
X-Gm-Gg: AfdE7cmucw3AGAn9bH3T7bu0hFxFfwpUWiDWliSN2QtFOj7NVxl0bPa9saTlEthJ/Aq
	YRrmadA7bw9vvSd9jIkCQMqfeWyUi3sqDf0dOUYdraB3OzTUBJW3k0WnBaXpkVVhKkpZQT82OZ6
	3Yo16iGYfoquLs8rXa526iBAOUjgsD+iaDaPPiVs43xJTtJEFpNwyw8bkeUxB5EvWTC/ML7cZoI
	NGPpsYXdEEqER0O8gHR0uEjKCZFWPR6XcZCwAQKTBwHkCGBrOJlRs4cvy0v41EFkkKdUePpKwdv
	d2HMZhXOUzvMzHXMxJ5VhFleKbcrOHgAV5xEH0FrYIPQ4blT3ZUpZiu1JNrEOg4P5HWsrEx5MFm
	vsQ3KUDhL4xaUDrWfDCZTzyAMkwS/W/otkfWTgfc/kvEc/YJFBiXT8uibnu5K
X-Received: by 2002:a17:90b:3c01:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-387e0dbbda0mr1639649a91.40.1783413981607;
        Tue, 07 Jul 2026 01:46:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3c01:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-387e0dbbda0mr1639626a91.40.1783413981095;
        Tue, 07 Jul 2026 01:46:21 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a5b26csm5823228eec.15.2026.07.07.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:46:20 -0700 (PDT)
Date: Tue, 7 Jul 2026 01:46:18 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <aky82v5nWhamDRUO@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-2-b706c4c9b3e2@oss.qualcomm.com>
 <akraIZWuQlYvPW8v@baldur>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akraIZWuQlYvPW8v@baldur>
X-Proofpoint-GUID: 6Rj1nylMAcsT3TkaPyfqvUgO86PmeZ3w
X-Proofpoint-ORIG-GUID: 6Rj1nylMAcsT3TkaPyfqvUgO86PmeZ3w
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cbcde cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bfxUIGayu0eRWlMeD5MA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfX+tJTvD+Jgl9e
 69qQVua/s5MzdPKqaT0hzfItx0SEQW8ZLtFW0o84J4tS6W1IbFWFTSMkJkOljS2ylx+5deMImx6
 hbn2BXB4rPnuZSrm8aDkFhw1ZqlBymMH2A44HWuoYCPc3Ss0bwLFH3XRX8dM9+t7DQTso0gxaJH
 PAVMc3Pd01K41IIPy/H4CUDM/xm9I3U5pS4TVZuYudxDmwJmRgX+H3E55Sc4Bv0lrY+Nqxj738q
 +ajvlrOCMwUcXRU4pOArB+qeUfWfsdKmkp7NgqSBkhnKNZYANfvl9tUB2D7x8wEmpLP1VbWRCTL
 6S0Y9gQ+PfsimBpykFQ7EsQLmNZwpYoBUfTP4l2cgK8YRCoBy+0Y2oy9w02ChdloQnegVVd2G1s
 S47KL1RS4SpdNZHSt3lNkXzrN0CnRgTmjCZ1khWCZrrm1qznKADcXzmubs24wyRDaTBikBA+jrU
 /n51PyBIHCvh40Sv91w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NCBTYWx0ZWRfX1xesyTyWm7a0
 J0VWwwIt4A/A84xpTAa1Msk6PhxSelTaTGWAV+0erUTtvGF+UrEiB6b9C2BA7jHYw4pY5nffgHO
 l9e1k92Nyu+tNfcxn1+QXLp2C+OZeTk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070084

Hi Bjorn,

On Sun, Jul 05, 2026 at 05:27:50PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 03, 2026 at 05:31:12AM -0700, Ananthu C V wrote:
> > Fixup the SoCCP/SoCCP DTB memory regions to reflect the memory
> > region requirements of the SoCCP firmware, as described in the
> > Glymur v21 memory map release.
> 
> Please change your commit message to start with a problem description,
> not the action taken by the patch.

ACK, will update.

> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 20b49af7298e..5f44f68efde2 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
> >  			no-map;
> >  		};
> >  
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccp_mem: soccp@88e00000 {
> 
> Now the sort order is wrong.

This also will be fixed in the next revision.

> Regards,
> Bjorn

Once again, thanks for the reviews.

Best,
Ananthu
