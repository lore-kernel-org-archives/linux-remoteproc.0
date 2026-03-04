Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ED636CDF8
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Mar 2026 23:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665877; cv=none; b=qxgiJR6qRhCVJW2kZUA9RMwvWJ6VMoE4iXLsIVmnNLuWFH6Q5OpY4k9VkVyTwXmn0iBW+ZMD9VamWphNz50p+ZexzbM2bJ8i4ad8/yGfvp/RN5eU0Vl8bFuo6zV6SRFrTUZwlC2A9sH4EbIKk8jUfIXh+L0TvPxU9gP1LFzrfdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665877; c=relaxed/simple;
	bh=vOce/JE7LG1p+RGaZuWGSx2EqyEUcANfT1wKL237NiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dq+qIoOAAlxdMNim6a5QRAdcYX1p11wxLZpCBnx7nE0Sk3lKh9h5pnc/D90a7Yh2Nvuu5OroCpxyBpQokwyNxXk5uod4xv/WdesNKMwd5CkYtd3RU6sH+vMTE+ez/hr05gLzldA7NS8CL+TpAxMLKo00v4RI7xtXgw1PaVchvss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgJfvyip; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WV7wi5xl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgJfvyip";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WV7wi5xl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHib72611969
	for <linux-remoteproc@vger.kernel.org>; Wed, 4 Mar 2026 23:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NNcYfHKnBv/HC5azm5P6gSUdX5OWno2quQz5/K2vsTs=; b=RgJfvyip2L6F/WAQ
	OWmicuy3GoCjE8kfmR6Zz4nxthsmx8dloIhN8Jtxp974jtkVtfb3ZueOxGaGeFT1
	Yv9L7/94yduQfQwSZfxi3FA7AxolU9trR+2OvbKCzItt2+NYgzYhP9Ir6c/Q88l0
	pmB8bUBgv1nEBDsYh/ip8kctCk5Cz/oJrMkuGvu6qqZlBs0aXcgGVTl9jFQvdxbC
	mdPXBJiubYK/lWSuMY0A4Y8sGzI0PNmKXiy47XX03kBU0Gq7hhxok/RLGWVw72tx
	3g3iADk9I6wW/JLCC1bMBtNJgIgq4a8nWgFfqrUDfy1G+mFT6KSjIyynfCvWUa0K
	IxHRMA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0w8xwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 23:11:14 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d18d6e6541so35952472a34.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 15:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772665873; x=1773270673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NNcYfHKnBv/HC5azm5P6gSUdX5OWno2quQz5/K2vsTs=;
        b=WV7wi5xl3fNk1PIKpuyMrbkAmtbt3UpC/EX9LzdCytln8SO0JfkcdeRv3CFv7t1cy1
         7rYUYBxCYPJpLvieBEpQQbbVRvxGPwvBTsA21PMEGo3ZkINKTHEv5WAxXrA4zvXOvqOF
         2TuqG++AwTlmfqo0jqHKE+wm4IjcfatEQ+kbBRqAbH+jQcWw4wpdFMK49DdpkKqA0RyE
         AS0vFVyGFnaev3WU5OgfrkIJNDYUXrzmaBHaGv1hMJROzra1Usctk7M7eqAsUNJ5lFQL
         DHoBvn3OXwuLYtPDfNWTClbokVyOPJvqcNrfiOccKhyGYvbkea5hU4epL3AEQAoJfkwV
         enAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772665873; x=1773270673;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNcYfHKnBv/HC5azm5P6gSUdX5OWno2quQz5/K2vsTs=;
        b=Ma5RaqrIVwPH2Oh2+MPRmQzzEWvpN+4Db1Tz9nHaqMnoV1yZYnNbQfO1cvHRorSgHj
         bIZbNGYkpizZImcq4LV6NBA1kJBabMBSok72CSwFneTpQxgFaY6ls+1YpnJasS4SfhOO
         MiNP/cmwBZvboSJ74Rj7EqwBPpaPtxFQ7iOcsMgjCGLsc070NmjH5rPPk6SXBD2Gkx6f
         67YsJ/77PNC51mIYb1psVPWJVhBgd3rzq2dlgKTG0x+k4JwMsYFE5kA1cE3xGiLQr72Q
         k9eDJ29Wf9T2ffGVFumFSF+YJvLqn7fh67y5GVnzJFyLGOTdUyZwRpDW79kDPYGOJand
         E7hA==
X-Forwarded-Encrypted: i=1; AJvYcCWwP93nqyoXyNjnNmHoKpi7Z4mLfne+qYdHIpvqzq2xqxXPCgmdDHE8mBiailQu1wYN2uAYdpNsMLVQihln8z5L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/3sgvtJmj1c8oo9gLP4hPmrtceTfj8RWlQvLhWrAXsB2BAtHH
	TFOlet5iHjbTmpEl5RHbfteLxQ+C6DOT7OtT3XMP6u5Erj61xWLr5rLsMS1odMy1d8eBI9byIy+
	p5QPqA4dl4TrRCwce1Lqv+OCp5s2jGeWUXvx2ZIZxsNoC7T8sVUEQFsZiYEKqxUk/14LIs4n1
X-Gm-Gg: ATEYQzyL90D5ZvPZUp+q2JWD2uaD74wHrf1XWv80cO357R0bTy5SEWPkRe0cVQ+hKiG
	wsf203XNo8nyCy7kPE1soyQQ6WOxIR8sdqqmOIa1IQCREhnv230SLt3KPv5wdW+gnzn/QA3IQCW
	V+Pgzzb0H/PunlWknUn4p0/++1sC5nD3TidpTX3ersfhSjgX/1jD0CZZt5PF7UK2Q6uBcOpPmW6
	DPlV0kyRuMantVKMP6NneJAapcdtii5EqoWUcoD6PE+EbVEdyO3baG67wtPKxlliYgS3jufvoNq
	JVWOFjgI/lRqBDOBr6mjGnoa1sUCpUxRFK8l8rr0GTfJCbacFdUij5tfMxTxoy5ff7qakBGnYd3
	65WoykHwnAh3F/h+HtLgQzqbCRWyKAgCNnSrg/TUpmtPBpeusoHzCtLb9JqoiQMf/nzK0SYAUrX
	6wr/Mqwd8GkuT57A==
X-Received: by 2002:a05:6830:2782:b0:7d4:5341:475b with SMTP id 46e09a7af769-7d6d13a5653mr2326954a34.22.1772665873542;
        Wed, 04 Mar 2026 15:11:13 -0800 (PST)
X-Received: by 2002:a05:6830:2782:b0:7d4:5341:475b with SMTP id 46e09a7af769-7d6d13a5653mr2326940a34.22.1772665873171;
        Wed, 04 Mar 2026 15:11:13 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644dd3asm16651056a34.4.2026.03.04.15.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 15:11:12 -0800 (PST)
Message-ID: <726aa68e-ef1d-4446-95d7-2d31e867a593@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 15:11:10 -0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: remoteproc: qcom,wcnss-pil: add WCN3610
 compatible
To: Kerigan Creighton <kerigancreighton@gmail.com>,
        linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, wcn36xx@lists.infradead.org,
        andersson@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260304192409.927562-1-kerigancreighton@gmail.com>
 <20260304192409.927562-3-kerigancreighton@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260304192409.927562-3-kerigancreighton@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sv6l6Iciwh9xBbTHpPVXULcpPLnMWDgu
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a8bc12 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=qgblvH2Zgt1UI0Rk3qUA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5MSBTYWx0ZWRfX3HymBTZWDQkI
 dDDEcmBR5TdOOSBp429TY/KnrER5r2mrxCu0+o7TqPzXqGQH3DvaVc70lIKtmNE+hrF9kdq8qog
 0W8NbSFuWJYnv3S2y45slVa28uoYjeT+GZcjL1yIKPpcb5BLJs858Qc2994BPXN7OmVvM/78m0h
 VzKg9Zk9qnMiSfHWb7szNJrEGBvJ5X9vIU8TR6uXognfyV0z68vrTuq0jsE7sBUBPfPV8LY+DHl
 J1z2S89GEEt80rApheN/ts9mjJOTsBnS0nRjTFAAIow+wHIk+c0nqkkpoVR8Qs4TopPCJTT+N3K
 Prsa4MCXplyDA14eVSi98K1tL8Hut6tL5e4R1wPf3eQ8ld84WyUB0UYS6+THAwG6Hz+fuQg9QGR
 V2rXpsqPIcXZw2VUCzcevf+v0MGog9sEzb20IFjaq7rICl4dpeNPk4Ht8Ha6TyAD6NXAfvB6nV8
 aWQkpJ3A490WA30LGJw==
X-Proofpoint-ORIG-GUID: sv6l6Iciwh9xBbTHpPVXULcpPLnMWDgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_08,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040191

On 3/4/2026 11:24 AM, Kerigan Creighton wrote:
> Document the qcom,wcn3610 compatible string for use with
> the qcom_wcnss_iris remoteproc driver.
> 
> Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>

https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html

"The Documentation/ portion of the patch should come in the series before the
code implementing the binding."

Also ideally for any multi-patch series there should be a cover letter.

