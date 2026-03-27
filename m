Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2F37EFEC
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 20:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643758; cv=none; b=DFGu56atZnnga09C/urysML1PW2ksy4EtassMPL8SPp4nh2qJquv7/TkG9zWFs4bTdSAhv6tZMrNoWuB47rYE1iF88Uj8J5P5aTqgo18YeswtdS2J0maGUG6MbUyXeUFSx+NsaD4+Bmov7QX7zOq0o2HRDzaf47GeNd9JEwmdy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643758; c=relaxed/simple;
	bh=da90JW4sgTJrBt5zyplbOUxv2GSn/957efQJW5/vBVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiA/av//z6+cJ40on7anT53UGdPVeGVHZFwWvhs9c03jY3IInq4RLry7zUcmTIIu+buj2NniuEekRy1/Ld7+BWyvAcIyIfdz9YoefH1pUHjl4H02h4snw3HsSd8eMxWM0SZRwF1OGUXjufQUy0agGmAZ6n2TkEgSMso9CWYD7Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LaJGQxb8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0reVqGC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LaJGQxb8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0reVqGC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKWImm1334770
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 20:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNV01vD0V3ksspIAVQk7842j5z/hrGjFE28fF4qUPxo=; b=LaJGQxb8XRA8vQpL
	+n3cWnY5Toaxjpi2hdGe6oD8ptpe09lx86GXtqAo9Zd64BpbWEzteO7SQuU258Yt
	Ykr4JQ4OCk8DY0GMHtHz2yW6hQf0hEYIUyFyegfTNNXt9I336ZX/rPJgCJz1Ft3N
	sZu4VRAOJgDWNS2WsfFzw0zuol3FythKGZtmDBXelraMRODJEwSIcWYe7bIb2tbb
	x90juQJtaXEqBQ2ni/4efgWwPFFA0x8x0QeoRzA6CfArmRYx6xN6HumzkqWKaXBr
	quRDIfxtJE0umSfm/+UMFziSfQktk0nGhRqqvyBmn3LKLEfYMW9yJNcR7q4e2vi+
	2QLeBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6111g0as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 20:35:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b92f327so56934331cf.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 13:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774643756; x=1775248556; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNV01vD0V3ksspIAVQk7842j5z/hrGjFE28fF4qUPxo=;
        b=C0reVqGCUC/vG70n8TAU9V7hvxImp/1pXkxn2AaZnPIMPfkdeqczLeDTd3z6RNHQWm
         xqDF2BtDOc32plTlxevR7hoAlbcyyxjcJuA4hsiQvcNFRypxIJCdWkfQp+1RAK9x87n5
         zfOtSkt3zqWBm1Fn/p+WcjTrvfOy8EFWIg0CU4DWXpl+kIzoujgVU6igZ0w+WB7XZbAM
         c+C+r+EiDR6+LIYo9Ob7LkxtVflyIrL3500AEHP1Y5UZuGOQVduLUqAzfyNQs/BMwOkX
         LvMCsBjXRK2gTnhX7dvwJQxUwxns1lqv6K6dETeIouaZPIcoZMHxnudoM80xgs1B8vIB
         hnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643756; x=1775248556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNV01vD0V3ksspIAVQk7842j5z/hrGjFE28fF4qUPxo=;
        b=cNGtizYfAIj4oiqsEBHeBk4lBA9OHIFs/5NGfO3SKeZOytHcwgmJ1hdO4Xuc1soLt9
         LGF2c1Sn5ajoTpL8FKqGB9HI6W0F1RxHezE+Us/pFtD9il/dkDXldbypVcVN4/3F4r4c
         2HgmeOr5QO5IS+28Wj20EjHghJrmUvpYxdFKBkD2gLmIx1PBh11kAG6TsFKe03nhjjAC
         E+gYyOXVGWaA0cHDMmGQcN3eR4WQO7s6/MRv6KdRefk3NKKP8DvDjyN0rNxAX9Jgn5fH
         SvnuaA3l7oHhn5+O3eS/YU5pcQ/WeLQqLr9iPzUmFMIR/esDpJHhjJ8WoB/dhSuqNUPl
         FIog==
X-Forwarded-Encrypted: i=1; AJvYcCXZwssll3Y+nvdWy0Fnh72xJUCEh4shqUaS4FWMbrZwh/uQKpNPkXpGUiqZm+AycCcEvOzRaEZchoM0V9C82k6g@vger.kernel.org
X-Gm-Message-State: AOJu0YxLKSdf+BXggd3EokKPTJPns7c7RrlynvnjPzZZMNvFhMM0SKGE
	pClbN6e75lzA/j3pyzWNWJxnGUXHsaslww7qkfgXdgtHMk4UGewLuNOI7Szc86SZV8dDTNeng08
	5IkzLxUkKQuRq9ynAJdDAu0jR6MglnbywGYWs4/V/5dOCPAPpb+VBpVFk/x9PGvIcBu73uBG8
X-Gm-Gg: ATEYQzzkNrPBYghXMWAPm2LGneRuDhli2KWSWeiK+bt48fj661+WhQBuluy06/GfZFG
	L+QQ8TPlX9z7EuPrnoPEL8fc0tdDWOOtTVzeH50rQNYd2lxylwhm6pBXN2/BBzc5GW4L8Tm8jkn
	8cnD6J3Vn8LE4PYUTUIB4HNTbqut8OktruAq5RUUrNkwWBZmpPN/AaVg0pWAp0XML8z0fCYxN4/
	w5qDEN2I9hP8mcZtl2QRli1t9f8c88ZFZvuteCu3uIIRdxOisJ6GlM6zZGo1wNG8mY5eN6EY2Vj
	tSmzqXIGKB180UaW+vICyb7B8s77VvYd0q+vrsPxSfEpKFE6TivmAEvO/D0kD3UR0LR1L6NVkK1
	nW9iVW8Wzu4V2pP/M5vgN9pr9PyFAX3mehirfZpfoNFk5kW/0qvWVY9eiXwDX0sPQhUfIxicde1
	4IvbINoAQ4FyLu1CdLkojAu2Xi3CBdJI6a1DI=
X-Received: by 2002:a05:622a:295:b0:50b:22c2:d7ec with SMTP id d75a77b69052e-50ba398f23fmr51862291cf.59.1774643755749;
        Fri, 27 Mar 2026 13:35:55 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:50b:22c2:d7ec with SMTP id d75a77b69052e-50ba398f23fmr51862021cf.59.1774643755311;
        Fri, 27 Mar 2026 13:35:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389202asm560111fa.24.2026.03.27.13.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:35:52 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:35:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: qcom: msm8953: fix modem pm domains
Message-ID: <i6lymgal5c62ud3aas3qvzv6fjnjrzuncguwechraahmflr45l@5t5qli3k7npu>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-4-6098dc997d66@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-sdm632-rpmpd-v1-4-6098dc997d66@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MyBTYWx0ZWRfX8mik5qKogXfF
 IFHl0fYobKURXoi08+ieko2PDtRv0XJ5GAw5CwUc/048v5VTd8wqOvK09DdXpk62RC48btH//QU
 YaIYtbQgiIbBWIq4wICQBIPmz7Z0a2CxwwAbXz4mSuXiQMblHegZirYJeAiJjLV55UUSYjTLodm
 UPmB2/RgxtS05XzsM7TsEU425YU0voeJH87cnaZdUwNBws0mHoNZ+mAMZBL+jv8Tze774ydJ4/I
 XkWFdCr6GSb6Z4996AOdiN2l7XHZIt4b1EAznDUFx36wrBNOFZi4e9CJ/i6UFac0ZBUcwCEgPL1
 Bcne01OukosbhfhY8I7PNlOQoiETJd/xDbrN58BxQiTgOqSgJIVfB/DwQmW9+cuZClDPVW6Ll6h
 stw5nKvqvEnzQLCI0Da4SeOjoBjAXxAnWshfnGBYdUIib+g6fMlUC4IMPzH0EXMro+HicMGK73P
 kA5PtdXswmnR2IIm7DA==
X-Proofpoint-ORIG-GUID: g_KIyFiTGD7IR8SCPbE2rujUFN_Jwovm
X-Authority-Analysis: v=2.4 cv=aoW/yCZV c=1 sm=1 tr=0 ts=69c6ea2c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=OuZLqq7tAAAA:8
 a=4EqJN26lZN6HTI8qya0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: g_KIyFiTGD7IR8SCPbE2rujUFN_Jwovm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270143

On Fri, Mar 27, 2026 at 09:11:46PM +0100, Barnabás Czémán wrote:
> MSM8953 MSS is using mss-supply as regulator.

"On MSM8953 MSS regulators is controlled using the voltages rather than
performance levels. Correct DT definition and model the MSS as a
regulator rather than a power domain".

Also please squash with the changes actually making use of the
regulator.

> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
