Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4FB2D12F3
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 05:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008793; cv=none; b=CiQOuKDUWTp4OZ3UmTUBoZYWIKsLgTJvLSnUj70vvf/9SipgFbce5TQ17MkhSaLQvGT83vDzZzuUvtPtpspbkV+v7JYGS7X/ONT1JmbxK40sYbFOWvN6rYdgDZjm6yXrHzrgum9mRv3veUVDCgM0aglGrFU8RJjOtEkkXoy8VMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008793; c=relaxed/simple;
	bh=HkumCUVbEM+FuIoAvK4ol7dslBReB0TDdKD9LW/ntog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDvS4LDBIQSgmVbtMSdUbZsqggGJn3JyRKWDAsX8bwInEXAnK6TaAT6zOSuc7KryuPwDkei2tD79qSIg7JFwqUnBskY2oMoXKpL37YaAIkPGNI0+h6vQ/l8M15XcGyELnd+0yFI9Z71n/pAUGQJh+V6vXShOhaVhSG65rB053BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXPJ/Tp6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3EbI5LI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXPJ/Tp6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3EbI5LI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E5H9HQ3750524
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 05:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HkumCUVbEM+FuIoAvK4ol7ds
	lBReB0TDdKD9LW/ntog=; b=oXPJ/Tp6/ShKP6DS62y1kTOGHUouVgAVjVGD5hn4
	9g03HuRAI6hfN8orHUmyR0/c1rI2FB5c47KqTa+FFgsdaqgqZ6yWOd2hpNUJEPgL
	okz4XnbsJlzS/SOLui5Gs0cfXwUMkdu4mfbJBrH9G3UGvyq2896EnqeZ9KixhAIa
	+jOGDMUUTsLqw7b6e6ijxJZA5CqwXSYXA0MAToK8Y/ortUy+XxlZKuVBGU3xwADT
	4ddTeQ07Nb4wvZY6ufkfe8ZIG8APD7xzR8kEopPEeJu+LIVkzSMKI24pF1OjsGgq
	cAHEItiZ3DjB0+eG5m9oOiyFvZgIa/INTc0slxAhFzms9A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdeu4g45q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2026 05:59:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so1468385a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Jul 2026 22:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784008791; x=1784613591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkumCUVbEM+FuIoAvK4ol7dslBReB0TDdKD9LW/ntog=;
        b=Q3EbI5LI5VuUerzTNQrrnuUFmiyPDnyPFFQ7oPMqEADtReowueI3mqM2o/6/9S9xAU
         sa1O0h8KS6hyp1i40um1/BZ22MTcP3zf1JYMP7uaTi4kEj/u2Z1Y2oLnF9nJYEenT6dP
         ANqgPXZthmZsLPYrzEBdVayLnw8GAqopfDWvFTORTyuv0h95yGfhKFicsFem/mHJCB7R
         FLH1DL4ZZJfUDkWzfLe7WFTTg9fBp0471BzYTfVJhdir7VHrQWgeQYXnFgtGbmMRo32+
         exapHfrTKl+jH4fe3hu4B4KWpZzfGDYYGheyPwx9TQzGro8uB8JdkG/aYAqKphaHUcZ5
         Y0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008791; x=1784613591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkumCUVbEM+FuIoAvK4ol7dslBReB0TDdKD9LW/ntog=;
        b=jGvkD9peVG1p1nL2HWur1BrqFOB6N8QnZCIK+syFB/s9ekXmj+4pJSpCWTbkmpRrby
         wcfx+pCuqTwVtTIuOloMzaI/JwlWueru5pvrgShOtJ2PLRHnUCnzMOhDN3j4JXRXFcjK
         Sv7KHjz5T2I5iezJuiOozzdlMrUVBCveVn/EP7R86kEfhygO+BTlAplCNxgvArNaPDsc
         UXkOoo1jJbyX5KKea+4dqF4e57afUEkynXe0UcwEkeq2A+Uo5tRPeVyyBJzDcezPkdu0
         My4bAQgWyuPyURJTZy0AmpuKCvhs9dhwPFL4miffJm1YEfXOKeNfVZ3416vuoPNeo5bF
         reQA==
X-Forwarded-Encrypted: i=1; AHgh+RrY11XUKIXVsgFkF4zDhPLnzST0mNSx2qk5ODczPZM83GHk6D74aIN2hKMnz5hOyBZ18CRUER6RMn05hjk1JlkM@vger.kernel.org
X-Gm-Message-State: AOJu0YzvELwIoE8OW93Cu2yrCPZnnD8Hdtmt1MbfHULl2sQIGU+m+gFn
	frMY/hCWq1UV4/vENy/lgNf0iPoWyQwtWnuElmel6ITkMF23oc19Z0dRDdS+I4lpw2YvuHak62u
	/G9umw0nRUoZPRnMBmqcrFNVgtyVAsPVuIwRWIiPZfSWrSaL6caIGEPOOYLxoWRr2syH3Bn34
X-Gm-Gg: AfdE7clb8cfh2N4+KG07PkpL1wm6tpoWsbW71Xrx07/JJaBtT05NfGFmircn76YGjCV
	xYJrISPwDw2RX2jQX6is+0hfXeQ1WgB4rm/L97xm2PS7Hcuq3YCL2kFce1AJmGsoXJvfgO78m8/
	31o19/voQOocx0KQHOkIAYADY57moKrKeuEdPeMxRiiUXXDPW4nNgRA1gUKWDI7NteR3nWXpGMN
	71e6GFp/RPRPPr1mYaE6/IgA88OecMRvA1JW0wfbk9JflG1vdai0eG8vHRwns08uxiPZUJa+X/l
	VQJ4G11bi/kOu1hADTtrEwI8YsWwQ4FlMrrj6O8j1qnkQ68tLwiNVNXqY0zh67Ks+d5bULaAX8P
	5Qy0leEpeyC6IaON/rgbOUkyrmd0wkbSluExqQsd8BVCFgF0lLfyLpbiSWk2Jmw6xrJqCrwVxHX
	ANKjk/P+6Fur6WFbKaY4EB7EukDPY8YEbGRn7Tgm6G
X-Received: by 2002:a17:90b:180d:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38e120de0a5mr3507990a91.25.1784008790658;
        Mon, 13 Jul 2026 22:59:50 -0700 (PDT)
X-Received: by 2002:a17:90b:180d:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38e120de0a5mr3507957a91.25.1784008790175;
        Mon, 13 Jul 2026 22:59:50 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm42435539eec.15.2026.07.13.22.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:59:49 -0700 (PDT)
Date: Tue, 14 Jul 2026 11:29:42 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 0/6] Add new driver for WCSS secure PIL loading
Message-ID: <alXQTswtedKG8FOR@hu-varada-blr.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
 <e6311e97-0a26-4412-bcf0-d0313bf52c01@oss.qualcomm.com>
 <4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com>
 <alAEKQzBXqjESAbo@baldur>
 <alSIffOraVCzfboW@hu-varada-blr.qualcomm.com>
 <2ddadbc0-0d67-4b1d-bb49-87c08172b442@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ddadbc0-0d67-4b1d-bb49-87c08172b442@kernel.org>
X-Proofpoint-ORIG-GUID: bOdFWQGqB8ojzZhAHuevvETkW-BCYXt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfX1l2frv6CO4V0
 kDIOHewLHz3YDYbcJZ+LuN0FKDmVIXxzeZ/ua3QuIb/9oht26uiuyVCtPWTGEHt2jjryLF0f47h
 9mQTCTnKwk7fScxrcFGmZ7/b31tbZTnVgS+ceCa7+P3ZW4WACLimgQHPJGCApuutGBMLULj08TJ
 KiOO/VkcbHY3M7FIebC5oA5Of5gDdjl/kHZLp33zUtn6U+BF7PqLLLZv9TQaLF+wHgGACB9gEV2
 FrccpVdHOmFz0zLf9lphyPUG2iAtZkQuXSInJ5L/rS0KYvQuScuImfIwhxJEmRLzIkFhLlUR7w+
 Zad2kYA7ERPka5qPgM5YwErueNCTL2obP+fs2Hp85bqBQAI/Jf9mfEZiqAVm135LbdsBm/WNPyc
 btJS3BKnAwE66+lYHFtB7FIiJUYncSXmNWxxyyVk34DbF7izK8icU4be53ReZ9MPrPt62OJYoDy
 8cioC/SFE9P055Rjf1w==
X-Proofpoint-GUID: bOdFWQGqB8ojzZhAHuevvETkW-BCYXt4
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a55d057 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LGtRe-3Fl8CQACRa6QgA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2MCBTYWx0ZWRfX1PLjFOxeTUp5
 Z6IowlAz1O0KFiZJGN9aTW9bWSMl6Ne+aLNMA8lmNxHHHn+19HyfoHxXC0ETLfNT/oayuV1ADkQ
 mPaG/Hfe5gRn+E5YWQ+uQHvx9H+vc+I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140060

On Mon, Jul 13, 2026 at 09:57:16AM +0200, Krzysztof Kozlowski wrote:
> On 13/07/2026 08:41, Varadarajan Narayanan wrote:
> > On Thu, Jul 09, 2026 at 03:31:15PM -0500, Bjorn Andersson wrote:
> >> On Thu, Jul 09, 2026 at 11:25:17AM +0530, Vignesh Viswanathan wrote:
> >>> Hi Bjorn,
> >>>
> >>> Could you please help review and pick this series if it looks okay to you.
> >>>
> >>
> >> Sorry for not keeping up with this corner of my inbox.
> >>
> >> Series looks good, please rebase on the PAS changes that should show up
> >> in the next linux-next.
> >
> > Have posted v13 - https://lore.kernel.org/linux-arm-msm/20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com/.
> > Please review.
>
> And v13 caries fake test tag and FAILS the test actually. What does such
> test tag mean if it was not actually tested?

v13 was tested to ensure the rproc functionality is working. Missed the
dt-bindings check as that file hadn't changed. In future will check
bindings for every post.

Thanks
Varada

