Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709144BCAF
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Aug 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849046; cv=none; b=t4X/3Qkh3ZFBq0pogppG4g4iuRURssEo0uPLVsodwXB+/ONZV+Pk0VNzuVhNtnaW/zpcRmnCeUHXKMuYiZutqCSvcWC4A9IT/hflJcesiPjFIn8ftGutKEI5RBcKKgP2NdbVQco7WgvV9jeumXs3uhg7szQcymn4pR8iy4aoj20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849046; c=relaxed/simple;
	bh=gFRH7CXmJkXs0z91+LpyQOy87BWUCJy9mgzdjT6U6EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNJ9TBpwPzA9fmy0SalCVzXxnTkW1zI+2vJT9B1uNTZdIiwR4CoPknhaFEUQxYesJymAK/s7yfBZP8+ZjQQ3G89sJ+vjBDTeb6oyW6W75MBiN44REsUEOa5X2AiRhEHCDwW3Ge3WnfbGSP1JI6p8mbubts3b8WYcVKvadVJFs/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0R7WbgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuX91nlz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0R7WbgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuX91nlz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXVXh3617873
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Aug 2026 13:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U92DREcn/XIrZyp1jQCi8J62
	md6LueH/tnK1yoQ59vQ=; b=m0R7WbgPrBmcU10qkAgmdHUYigmldLllqmdhWMWP
	5ErLEM6lhFN90kMkDk/xrOI6a5EFvROFiqzzkaSrf5jyArLWQuJ6xvv1+UAQZF+O
	FJxEuGIBTF2W1dbsZvX7Y+9xZPvkGCpFHOeMU5DtDVVfWKHdyR8VOjyJB4cLFgBQ
	ewhnfTjdYULPyo8AX214VxGhuf1NSr9GOniCm4WnYpUlUHXSC71q97kGCtvYcu71
	jCXZLVGMG8/2MYdkloN+60vtW+s4vDvb3PtEJF7nKMHIW7zmmLwOlU80hfOTRSmL
	TPqCtUHxxijfY4VrY5WAg8HaTxcBDvsU3M2exhddK0u4/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu7272g4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 13:10:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52cd0374265so25693161cf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 04 Aug 2026 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785849043; x=1786453843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U92DREcn/XIrZyp1jQCi8J62md6LueH/tnK1yoQ59vQ=;
        b=EuX91nlzqgxnHvVL7h3DHZ1XKyjCZnUkSslW5oDPT77UuTOl16a9nMLDbYXsu1aOmu
         Fi6S+L8IwAm1zeQICHKa8QSzxFfe3cIiSY99SYsBhoaab22UE5/tqwanVY3sgqVowxiP
         /wfMJH26Eiov4h5EL98Jlx4n1BJb4suQK9pBGKwSB4sWq/o6mi56zOcrFJiyBgbr8usk
         qFwuoCzWxQN1sIIZvzvoty+yMUSdhqfOjxh8wAQBZ9ENBJhQiXSkZLvSK/YHOxa7CpKz
         /xu+zzEE0uC9KCtK1T9YdAzgY9xJ/WtU78rKcOhSQdAgPWpMcyIcrzj1hA9+x+QVSNf4
         slgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785849043; x=1786453843;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U92DREcn/XIrZyp1jQCi8J62md6LueH/tnK1yoQ59vQ=;
        b=EHszFUur3MANqbGn5fj8QfeJTGJwdZ/MLRgW6/tGZmVuZYv4ZKUE6tJWf7ejR5+aHZ
         Eb6BIU7eE3IyOI9rK2L7z4J7ddC5MxP87RY2XmMUOwqLn/emabfTusf6YCr4UdL+Ikjn
         BsYT1qdQdYjYflMGnJDeNshUV4x56lDjKC5zvmshTrUPmMpBgZyKXVdfV7edYgll/hWa
         XYryfomX/Rt/32WUK1kIvEfN5ZCIAri/oODI2M5P0oHCY5+nR869IaVvu0OOGqqScC0s
         rR98hc3l/kCgqjG2y9i+z/qz2/clbybyJA/qc4AQjS590cf+f3iAQ5HXCtZNWpItPI67
         Ge8w==
X-Forwarded-Encrypted: i=1; AHgh+RoMZXTAbAtqsQyPHP9r73otC4UQ+9mCxNote78Tmv9lMQGC4s241o8iWNZsf4KJtOZa7suR8sMNzpzYTy0CG168@vger.kernel.org
X-Gm-Message-State: AOJu0YwUk0CaKSTHVVmb9YR6YxQKiAzFSITCaw6Iv3FO4A5b9nu0L/g4
	jEC2H26M2b6GunxfULZHtEullgON0cqNunvwThjwqTm/e2sjz64oQZXOK/aysjmhTeIi7pAowtd
	D1GzAORDoBHG4sQPhExqKwqWXLSKZ01j/DMscjqUE7m9sKkur1efy+3Md1+lUidMo9uKYAdcM
X-Gm-Gg: AR+sD10+PTyEfl8KrYtOUSCjBugWUhyAJ75sD8Jg6cSIa8NEAbNpao5ZTR1wouKZAQT
	wzxOHfztPXMdOem0Q8K3RzF5szDzcWWS/k+VdDMTal2FeyNSVWUVA+z7LalB1ymkP53aSWzYpp/
	muPRqB9hmoReUpxN3vLJdWN66toHy+TD5vDlCTFg0Ah7tcSJfhhK4IfwFd2UE/AxO0z1s6l/F8F
	sBsGLGkX0WD0zySSnS8sNLRfO3zhy25OUwYOiW1BsRHvt8cJ83NQs+mh0uZLdwUo49dPdWXRbyu
	/Rgw3V4EzwXQGo7U+KQ+SdzbhXcRMFN0wl1HzPY/u29hEYLxTEJ9wSFUYC2l2bkTcw99dgAc+/r
	Sj5cLfG7U2JHIurN1Wog6Mztyr50=
X-Received: by 2002:a05:622a:181d:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-52b5666c0ebmr256188421cf.8.1785849042624;
        Tue, 04 Aug 2026 06:10:42 -0700 (PDT)
X-Received: by 2002:a05:622a:181d:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-52b5666c0ebmr256187501cf.8.1785849042073;
        Tue, 04 Aug 2026 06:10:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4e7edd06sm82496911cf.2.2026.08.04.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:10:40 -0700 (PDT)
Date: Tue, 4 Aug 2026 18:40:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v14 3/9] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Message-ID: <20260804131029.ol3zk5sbyfcmzh5t@hu-mojha-hyd.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-3-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803124442.krqtw6si4ujsnuul@hu-mojha-hyd.qualcomm.com>
 <de961a11-71ab-4642-9ced-5b97f47d7110@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de961a11-71ab-4642-9ced-5b97f47d7110@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwNSBTYWx0ZWRfXzD9rWswPOfKd
 4v5asXbpILRuWNNEfMc/jIStfdg2uEGOFOnnL9CfuRV9bt4McllggPCs7iMQboTlvaJESnXFNyQ
 aXXTRGoI3YnyMEoAY9KxaZH9P0E/gQ8=
X-Authority-Analysis: v=2.4 cv=Z6Lc2nRA c=1 sm=1 tr=0 ts=6a71e4d3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f5OQM1LZqQncRT56GpgA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: XYhbETQ8vYCIMPBYZCVCrsOBp4rrk3Ov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwNSBTYWx0ZWRfX000CZC4YUUov
 D0qmH22vypN3hysbw2991PzYpBoO/bKk1tw4Fq44d0OXbyN2ccZNxC1/rYqiGIkpOCcPLG5I6w1
 v8Y2QGV07FpGwPVyQCZUSSheELcqmQeGKpzQ1Gdj1WqkEJ6Q3rPcmPWdd51fSKpob+6+bhq64Bu
 zByW451k7ZCs5D0Rek2xfiUixyz4PqCqRzj8TBsdOQ/AlGWvlwFSI817kYG/m7JqXP5dhh1+xvg
 PcBplW8O+ClwbwwOgdmGTDYvIeuPwUmsIJiD14ETKxHh7YdrcpR9kE9CzNw0X/mqSAFVTena5nv
 PirI8vw8OmjFzCWJNc1r0mEOEo9AFI+le2WMQ5I3K1r/NK7xHzxQR6u8cEqNEy5TkfaUl99uShl
 0GukWmZEF07uruqKKhbt27Y+wEOKx+o1ZCUMM9nPkWGqLLEelLaSlyd6oIFXx9fwI+bpEt7/ttG
 5qLdyflWxDldn+Xt4Jg==
X-Proofpoint-ORIG-GUID: XYhbETQ8vYCIMPBYZCVCrsOBp4rrk3Ov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040105

On Tue, Aug 04, 2026 at 04:49:17PM +0530, Vignesh Viswanathan wrote:
> 
> 
> On 8/3/2026 6:14 PM, Mukesh Ojha wrote:
> > On Mon, Aug 03, 2026 at 04:16:09PM +0530, Varadarajan Narayanan wrote:
> >> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> >>
> >> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
> >> SoCs support secure Peripheral Image Loading (PIL).
> >>
> >> Secure PIL image is signed firmware image which only trusted software such
> >> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
> >> Peripheral Authentication Service (PAS) request to TZ to authenticate and
> >> load the PIL images.
> >>
> >> In order to avoid overloading the existing WCSS driver or PAS driver, we
> >> came up with this new PAS based IPQ WCSS driver.
> > 
> > Can you tell why you need another driver if you are using the same PAS
> > method and it is using more of everything what PAS already
> > supports ?
> > 
> 
> Hi Mukesh,
> 
> We just use pas_auth_and_reset and pas_shutdown APIs and do not need
> the entire framework provided by the PAS driver for IPQ WCSS.

But you are using qcom_mdt_load() in wcss_sec_load(), which internally will
call pas_init and memset SMCs.

> 
> Also, feedback from Bjorn in [1] was to have separate driver
> instead of overloading existing WCSS driver.

That's a very old thread, 5 years is a long time. We can still revisit why
you need a separate driver. If you already have all the stuff required to
be a PAS driver, why not use that?

> 
> [1] https://lore.kernel.org/all/YFK1VpP74rQH2Z72@builder.lan/
>

-Mukesh
