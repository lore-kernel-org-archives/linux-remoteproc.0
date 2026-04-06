Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5AC3976A5
	for <linux-remoteproc@vger.kernel.org>; Mon,  6 Apr 2026 19:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503807; cv=none; b=nH9t6D5P7VLKXU0hBt0cj3WWZwoJjJgXWLSI1xpebpwCcE5aBZQMo0iELkQtjl4MactmuTj46AMo/xN4c73kQR5PGN8CvZWJ34fgr5zzn0gwXDbV7+lVHadX7kUzramtmjvSomQqcmAMI7misE34Hfxw98PEh2RyNihHrkufkCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503807; c=relaxed/simple;
	bh=bdTEcQjj1gH1U+L8RU/U+V/DFqPQ30OwOaUs79vlMFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4nn5M/UQ2UPKtPMXJb7v0xAcmTqyFYd8zMATbfG3bdwUGGZUszcyoz/Sy/qiRtAF/DAxwBslm3r3qMUHQZflL7dkH4BcqWvtPfrTpuzPI0U3UfInlLmTzoq/ad+KVXAWAlndIgJoXmozASHzimJco3K4shLGaSfjcy+X1FoHRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CH90Yzay; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNjOHgE2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH90Yzay";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNjOHgE2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636JONiq3562168
	for <linux-remoteproc@vger.kernel.org>; Mon, 6 Apr 2026 19:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=weepYdGIuw7wfXvrgsrZhxyW
	byT3XjFd9OAiFqiXTWQ=; b=CH90YzayVXYgR2A9BWq5UG5HybS+gSC6a/NDTSsp
	cORwoExc04yFw2xtNFWjww1opEmBF7TT3DJEx6H0vtOWShcHCT7x8zsXTqeOp1A2
	Jk/Ac45/SCO6BAOAlK7KbiweM7TxhACyL8vXFheQo+1Qdo+1Y/TWWL4Yum2jLtTr
	3HYosuCXH0MafWEr/DVemS2ytqkecXdCfWnVFdmE07/9LIsa2vU9F9DO1EGkbgYN
	8uU7Py3jWZHcbVhl/1Y1YcJLsL2Mve6jogTCvYWmpZKVjnLMS9MwTPLPprKH/TPQ
	j2bI/lTS9OR8N6v6VAspZX93rwjROAnsEhIp6bOrFIPK0w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcehwh1qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2026 19:30:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so200079911cf.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2026 12:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775503803; x=1776108603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=weepYdGIuw7wfXvrgsrZhxyWbyT3XjFd9OAiFqiXTWQ=;
        b=VNjOHgE2TrxXpzf3gowk9RzMgoRYP1bmKojR1yLmG6/KWCjkiIOhbrNuxzTVPh9HoY
         IFm8IbzACPE3wR7zz/tUuQbfUgpksAD5jSblID19zyvNEiJOMKSOPKr1XHYmoH9Rexdf
         5OSUSQpqdD6vy7ZHfgIuc1YpQVEiJEC/ucZWHHVr00X34h5U9txIjhyQ2dsQI5MXZWPB
         sEw7AxExXXfSEK0rKGfLQo7ipM3C+Q5POQsfUihg1jxdfKnxeQ6OSteyJm9wma09H1SK
         qpDVJtIgiEB9OVV8fiiDyS9RbvKZYlf+uEzro5wrjt+/w+1Pv6C216wRPnxt8bD6mfmQ
         Crpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503803; x=1776108603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weepYdGIuw7wfXvrgsrZhxyWbyT3XjFd9OAiFqiXTWQ=;
        b=YCdynWdUGzuXB96pZZUUwQc0JT4xLpjTiPnIfG0xL3jp6kuXKUOCaZMjTxEsCW8vVG
         JPl6MJUpk7kYEbtSH0WdgWif2vilfIfV+vvbvAf8yY4ypPid0zzW3DRQbIRD2nWAvdCe
         V21nITDI4+p+bJQ46eAXYnpHwxLAU9YDzacFW9sJvKNyg4zgcrEVKm1LXdYY6wC2jmHP
         F+Sym6aCggqp8I1itYcE98uwIKQpWl6GLCaSO1gLh2HwDmMvNlniEHHh+tfiDD5cj8ZX
         zoX5JbZ5zBl8bw5g+rRsR+qwXkwctXPHEFGmVdJznME0rt9DF8s6fFue60iDkxfpqiTT
         WO0w==
X-Forwarded-Encrypted: i=1; AJvYcCUNVT6rP2deX+Q0k0NChndgCZflKc7V1exrPu2MqC9tb5pgpOXh2K1KhzXGTcBee6b50fnG70lYJ2i359zfEecO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/G0iU5BZd4CPpZXF3XLrtkFo2r/JZJIx9Ap+oj5x+FYqvPi/X
	APXiJBB2SGDMiJnfUlatk0YdTu1o2uYDX22Bxwxb3G4j0Rgl0iuO635qV+e5mUvgk7vFPx3u5VP
	cYa87IyM5EnGOSnAajCyX8oic6N52hUic51ZE1pAs21UOKmmnUcTNlq+noGUvBTlEnC4Wq1BQSU
	7A5zhz
X-Gm-Gg: AeBDievpq7GzzOapM75LZJnWB6mkDd2rwLa/YUwnzm+lwLpGu033iPfbuBENO9anDkT
	TTVWQdcm0jvGwqCc50oC+PO4oVMgHYSIWOk0F3ceBUinFJ6V4xgPU/KNPcySphHvXudlb155MGB
	0ZwwktJqv0VjIhrxL4YkKuQq8WuhMnI4S3n9iNVdcyGgQh2HE63H80x5Pig6wh8IAS/xU0IGhYi
	mKstNc4CsnEB9t1ubmABLMvu4i3ITPI7uAGShId6YCIe47QQc12dgO3w11JbuePONU55nhiyREK
	hz2OyH7Dbk/AfPBEs5+vGYXxnk41bUAHbA1cHIzG27DiIBrSVSFGxIR2W/pHicIgKgYrj3W/tbx
	dlsMaz6mWlCuZhAnx3cLztMG/Y47XnMdxmZiTrs+Hz0Zk2tg59uhWW1HybBEDQL0R54pNBVFtor
	rtPsuVU/HsEI7sW6hi+/yDkMuJ0FlMH8mwUTM=
X-Received: by 2002:a05:622a:514d:b0:50d:9033:f2ec with SMTP id d75a77b69052e-50d9033f8a2mr75248691cf.50.1775503803366;
        Mon, 06 Apr 2026 12:30:03 -0700 (PDT)
X-Received: by 2002:a05:622a:514d:b0:50d:9033:f2ec with SMTP id d75a77b69052e-50d9033f8a2mr75248231cf.50.1775503802773;
        Mon, 06 Apr 2026 12:30:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd15f8sm3507743e87.69.2026.04.06.12.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:30:01 -0700 (PDT)
Date: Mon, 6 Apr 2026 22:29:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when
 doing rproc_add()
Message-ID: <4e7pymsle2tqbdferfxcdawzlujzp53qf6ta33tc3scloaqakp@3mizwzicjopl>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
 <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
 <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
 <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
 <ymo3kf4bsaz5yh4uwpk6dapfuzujepru3szaa4ujge7vtv43ka@skc5xgejj6aw>
 <9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com>
 <c6qnvfiknlaofts2kdahbaweiufqitnuni6bhqoxznhxp5zdto@m4i5thd57wx7>
 <ef36a946-ba7d-4588-b94f-4287f3ea6105@oss.qualcomm.com>
 <adPLDWz6_QmBa8w1@baldur>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adPLDWz6_QmBa8w1@baldur>
X-Proofpoint-GUID: z0ECehHKxOvQmo6CWraC4r-k3TOwjs7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDE5MSBTYWx0ZWRfXy36MwJIZmJHT
 lLejdFTEkgzNSk2Y2F6jvoZ+8Z2oUIPTf65SLhXUCBJJU1qkLjSW+i+e8/7GKF+p/nAmX2QSjh5
 gAvIxZc/oftbh4M86pgHWVZyGrHXZHDk59nCRiOGP8Nf3YdvJWnZTo3n8R6WVL5QV5XYRwuuE6B
 Z3IpQnPEXI3TpgXqGRcdTsB/iuY5YvoMFpKPilIVSxAGW75mt05X/uv75iFzWixv26HxAOlB/Hs
 e61cW7jN3V1py9girTt9HJk+sJs2VNspSEu0N9Pv8tWNt13gtkCWgDnMvFAMrrDFvusmXbYn8wS
 Za/3VrBnqDuH2DSSvPQn6s/BDbzkN3R0zBOTa9+VwRA/VqXfYbFWGpWaAND0YiRGJVNM39kkhc9
 sMd5CByobFzRZjF05OigeN/eDDqgPfDF4ZPIr+OAGq7uLNkkdJY/TXBbIGv3JCmhfiWSjD13Ajw
 RjLwIm9OvFgQ17uN/IA==
X-Proofpoint-ORIG-GUID: z0ECehHKxOvQmo6CWraC4r-k3TOwjs7n
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69d409bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=IGH2JOvre0YMyb4CrocA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060191

On Mon, Apr 06, 2026 at 10:04:03AM -0500, Bjorn Andersson wrote:
> On Thu, Mar 19, 2026 at 01:44:48PM +0800, Jingyi Wang wrote:
> > 
> > 
> > On 3/19/2026 1:23 PM, Dmitry Baryshkov wrote:
> > > 
> > > Isn't this patch necessary for SoCCP bringup? If not, why did you
> > > include it into the series?
> > > 
> > yes, will squash to soccp patch in next versoin.
> 
> I'm sorry, but that doesn't make sense to me.
> 
> The SoCCP patch adds support for attaching SoCCP. This change tries to
> address a generic problem shared across all remoteproc drivers (that
> does attach?).
> 
> I think you should interpret Dmitry's comment as "why is this part of
> this series, please fix this problem in a separate series".

Exactly.


-- 
With best wishes
Dmitry
