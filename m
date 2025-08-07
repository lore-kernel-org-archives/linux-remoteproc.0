Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903CD207A18
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 Aug 2025 05:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754544982; cv=none; b=JKa2ua95L7NOFkS1DoIqTNqSWJW6VDwfrWSEmpP/DZ+up9hIbT7QSfUt0UsIRTHAXenNIj5HVImPinSG8JhEyfv0tJnpOt8c8NwxotmhwW8/87ThjbDRvSsMM4M2BTaaMA4UYyzOmLxF5MlyjkWE7O5pMSQo9LPx9e/3aWqJIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754544982; c=relaxed/simple;
	bh=hBdkyxc+SMi+zWG2hEQIQ7ioQV7w1x6uk/Zx2DS+uKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tq7z4s8qPfQkPDPzzCYAi36NUvzIhJCcPsVHouZD2u4dnR9FaNtRAddk5ZXDRKXdwsMSWaqYgjtZvQSiDjHsyo1LdvvPni0VFuXztry2ckVIOe2cjA2PxU3KRe6n7GQjg+0+CJJxba8o/G5ewSaa2GuLKUpBvV8nZrej3UfmddU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ED7htlSd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ED7htlSd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5772JIM0003805
	for <linux-remoteproc@vger.kernel.org>; Thu, 7 Aug 2025 05:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UxZeQQVAmBavdpLJSCBxurMh
	Vns7iRlr3w0iJRJhDDw=; b=ED7htlSddzgYdLewfK9+dghQeRB9D2fcgN5QpsGR
	7itCFpfsule34dfad4JJ4K6XQOHfQkq2xltTUXrvZPnwFbSF4DF0drY4xKt1UoK2
	H/dkcBBV0uBQqOn2hxkHb8cloOFvHIVZXODYG5BnlK2lwfawPpAk65IZ8+gW4HBx
	IV1wenqR57x1BMujGnfZATPk+SLkF0T2+7CGEUM9Y4MH4l3osJ23YZBd4Eihmmjc
	fPo4AW+xNOW2JwplaUPzHgRvAVwPRbxMxe8n42baslouNkaD0ODlbfwlTSCW9r4B
	6WwVnVqM5NHa7fFKiVeQq2eHqeQk1S/Y4Oj33Y+1byatSA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u22467-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 07 Aug 2025 05:36:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2407248a180so5700005ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Aug 2025 22:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754544979; x=1755149779;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxZeQQVAmBavdpLJSCBxurMhVns7iRlr3w0iJRJhDDw=;
        b=gvTZ6RWYeBIE2QmH+AV3jzbnYy9Xm+gWm5jHMBXyKJI/d4gtJhGBGvjqmBgfl5DCWU
         l1HQCH6yVE/q32LzvUBY+eqFW42cn6zB/6VPY83RG9vBu5fKhBlIHWBSROypPdulYohe
         JsFhqWR7Z3yiiaOzh9aJoVRggFdYXJEIZCcE2h2hXc4/BbuVIQQFkcXP0M/Fx8QB1cce
         HDm1fGoQv/kOHTm1SkDg2zPqyoeiHP6pclS9tNVsb6aEpO1YHk3ngv3pQC0m/vjo2I+F
         B2GwY0bIXY8M6PGJZwOe6nMuXGhAhKmqpcNnthR71wA8KWv0g4a3i8jYhaVlGYYebfGb
         YzJw==
X-Forwarded-Encrypted: i=1; AJvYcCXlz9NzF9ItcwYITUjbg72ZoOia9zcvUFb9+IB1h9ssl0YinbuR7wgdZzfP2IbgTsNl5ezmrCzea4LZQNjPkmFo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5gIjvO3h0HokONi2HkpYeypoV+oZefwtrg7CN2jZj+W7d8arO
	FgBVy4+kcOJq1FMzkzziZCGj7sirG078iCRWB/bjpoSS4USQ1je5UdYtNr66mJjNTj6wkpLHhod
	Y6cbTLMRyr9W/eZRMGYNWlq5ilL78SuqkhpPTb6jol5x17RvtGlz8VrWMYr+ZGjm76lXwrA06
X-Gm-Gg: ASbGncspyDNOBoPBgC3kzQeGgRx8x6wOwC3pU+EfRW670pCN7n21CxamnZ3J1DnZsyH
	1fkRUnAcXppRmtREWGiHjnmSEZ6ajxSKjpWZotRwJohSE3OulymUIqvT+XKs00tT4raTvgjt41W
	V9xmczrPJMbb0sHijw74Ws1y3kwEaeKRLNGrXH3qJ4jIDD/aXAppaL0R5MY5xXLlYrtayxp9oqy
	6d8O2wCxNGdDBQFZ+D54dwK1CaaUdFAVp9cI/DdoQ4muOqVAS4r48NaviYNDTZWtxTLVmF8dawH
	SRWZQBwM6u3E9VaTGC5dXP4IDgkkRAf0SIwzYhKljRE7bKVhL1C8a/fbfrWV1uX4Hac=
X-Received: by 2002:a17:902:cecf:b0:240:3dbb:761c with SMTP id d9443c01a7336-2429f6256acmr95522265ad.32.1754544978879;
        Wed, 06 Aug 2025 22:36:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNnNfGxhuNTArtU5/L07BRaCZPrejbjIclynuCefSVipf8dv9sFPtvjvfNzygxX8GedWQ6Nw==
X-Received: by 2002:a17:902:cecf:b0:240:3dbb:761c with SMTP id d9443c01a7336-2429f6256acmr95521815ad.32.1754544978443;
        Wed, 06 Aug 2025 22:36:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89768fcsm175372765ad.82.2025.08.06.22.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 22:36:18 -0700 (PDT)
Date: Thu, 7 Aug 2025 11:06:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <20250807053610.siel2gsvl2igc3ga@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
 <c9d761a2-7121-4ce6-84c7-232a6c4ce976@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9d761a2-7121-4ce6-84c7-232a6c4ce976@oss.qualcomm.com>
X-Proofpoint-GUID: SqWoepEFHjDBbjorV3KWUCDY4Iu82eiW
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=68943b53 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=6krb5mtG3PrLwc7-ycAA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: SqWoepEFHjDBbjorV3KWUCDY4Iu82eiW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX2zaRPetSxWdD
 cSvWc8ta/4PaHneXnCe07MxUDAoIsZwh6ytTUSqakZ72uLihYuKetnqM6DuYTU3hv++AZE7z7cr
 MAG/FabEY5ibDEACBd7tM6WOSpww/h77sbs4q3cf2P5JtRofK+O4OTLCz7focY0yLeHiYxDmFih
 qat969Pm3GGF3xaAwnB19BEgNJlbOHKY8EP7YMZjDq4g158n+3RXUeF3Dn1ojibf3J65G1XciVJ
 L5exGa8Y8aQ7YbIMfndHAF+/+7vwTo9V4YhvFrEh0122Sgz/fFFbXEFwA4EX9AEZJPdFDe4jIeV
 4B52gliFQLrCfTKNGNmZBAm8YOna1+zTKxKq8alWRUA3IFabrtB9gq3PwL3cGQn8MkogR/UTdGS
 sr7a38gY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090

On Wed, Aug 06, 2025 at 12:07:05PM -0700, Jeff Johnson wrote:
> On 8/6/2025 10:25 AM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> ...> @@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const
> struct firmware *fw,
> >  	if (!mdt_header_valid(fw))
> >  		return -EINVAL;
> >  
> > -	is_split = qcom_mdt_bins_are_split(fw, fw_name);
> > +	is_split = qcom_mdt_bins_are_split(fw);
> 
> this should be in the 4/4 patch
> 

Rush to send patches!!

-- 
-Mukesh
