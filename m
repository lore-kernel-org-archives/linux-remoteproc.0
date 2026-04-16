Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1C93BF680
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776346353; cv=none; b=NRoc5HZl4EuKN47nupCdWPiuHaeAeTHWfvOYw4Xi8Jf7AIa2eXaObSPKfBWPEkNzh8/qKw/WzG60WKy1Wqh6icNUSghRPlUxc7OdC1YWNr07Fjq6getxhPf2bau2a8NyxoxAyEIhkioekPVJdMj8AeW80oVQiVdAyJQ/4p4yBVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776346353; c=relaxed/simple;
	bh=ykQtwldpahujIM1r6rCPoMYUWz+ENJXFV+25TcjTMkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jR+xKJHO+ztU1/KAFZwnC5O5Sa6+hizFDT2Z7TLrgSZ30FKq/CD/B1qG2ThsWMQJQGH5pW7BD9MK0ywGBkuhzYx0Q71rACEnnY+oDuvJgZRO9gc174Bpu7qmAgvLwn8Rm1NX2b+rIrf6Hv9GJGfog/a/s3vLsL5c713q1EMwGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwS/ZaMf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SdSQCvP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwS/ZaMf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SdSQCvP2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8GJW4862379
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/vnzQBX53QqlFQ/E/rAKt7Rwv6wfq+aRZ3MY1sgtbQ=; b=WwS/ZaMfw8WY9u/2
	EstjN+0VRmjmnDK/3eAFbgMYrmm6u1aO/OZUnqKTD5aYACajFnlyPnn6MjHtJ7I8
	xAc20P/aJuJcxIkI0UIrp5v3P39PeQNGMbyw/guFeHtZwsG4f0UN8UTrSRjSKs0+
	FxYoDPH79ASNTfN6jp9G5ukHDubwXzglH4i+3pu7xS8NUKB9qbwjJESoZsVz0vKF
	aG15wzxppoNxwzq/s6cVxbnMRghpMr8l8mDVHUifhgdB9OMSbNDVo2StCLCfEFvj
	wHRCvYwiIlpwalnLTmtU7xh4pFSR0dxIgEeEqFbYseYy0SSWtdBXIMhVvO8LTAWc
	sYmcAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djd0ec21f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 13:32:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d63aeaaedaso207466285a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Apr 2026 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776346351; x=1776951151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/vnzQBX53QqlFQ/E/rAKt7Rwv6wfq+aRZ3MY1sgtbQ=;
        b=SdSQCvP2IBJph8THQUoLo+9YV+w1SninywXZ2k/rV432p8DPOzlaZympTzUUdPz8xC
         gUoQ1LdocjIXvooOjHXaebPrynQVtKyV2Prj5yrkLsjTO4OZe8gc20Lm19QVpCp2xNJP
         J66bTagnILR6KIT7SggK+Tw9dFCfG49FSI6b3pyMTO4jFMk6qpIqBKNV8gHhgFE6Nnyq
         zzJzRZVW5BzX1yV/kK9+yMtibeAOUOujjM94t21LWWgQ8zUJWDVuMKjc9D6qcgPT/Q7p
         4AsbimV/P53XkdFt4ZhR7dsGAK3cBJC61n/dmHJzbCfuJ34ZE39hCHypT0nB5QmOM2W/
         r/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346351; x=1776951151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/vnzQBX53QqlFQ/E/rAKt7Rwv6wfq+aRZ3MY1sgtbQ=;
        b=n5ewSalhzjd9HpmXEXuHRB7JmUhY12zz+d3NQpc/GG7DSQDWoeJw2p3yuPdHuA/A8X
         kz5HYWWRtYU8h8zgeZY18aN3mK7W13YhtNJHKNu/gQAOOrMuaDqStd8fZCactqEgtRSh
         Mwas3eFYEEC6ysZKKYlkotBVh2hE5elvB3kYk8eGmqWx7wsL2kofCeP9GhKV18wKSG1s
         TurV/QGf+iBmeXyZk9DoY0ccIE0lM641u88PmHzEcIs5fmAIGOhY9AhKSNYBRspQQ5St
         iJmIHQT/aJ/p/w4hPSqtB4Ezba/QiwlvAAx2iSqetsprd32TY7OeOVtah//cq3RSTnOY
         XBHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KTrnX3wc8JWSIiJ96HNQk8bpVqk3Z2VnNaetZhLI9nZ9jQlDDJCBALF8LniXw+XisXhr+UXwca540jWJUPukN@vger.kernel.org
X-Gm-Message-State: AOJu0YxX7mY6oWZPfXFw18E0QVcHBrJrN8aGnv8lK46WawJ61T/0H+EW
	gzGNw9cNvdLm/ufVstr7mdQqXotK9Z/8WzKAAYWO9UALpp7DSBafampBER+rlNZskbEcewOfj0e
	PcmTk6weWPbnj50XksAyleCw0jgL04YC3PEFBSvD2ekqs0OmbevP4OtFRJsAv97u+pDoIuwMd
X-Gm-Gg: AeBDiev8nI7neTvng0Ywx6z6kvVvkhhAKb9TQICOl0ZehDsojXB9WYCSXaT8Pioa0Ox
	4RoHxj1Vi+t19qLzGS+a6qlmSqSLDEAFy1VbgtN5XLxeotK+SIx55hUxjnPvGDgMJyJpuz3UlAx
	cJp33gTI4U1Tn8G3cYXeLKSIlq9ClSWqIpB95fxikbBNotc7vC22XsoOq8JsQAJ3G5PLZGp5Bb9
	xn3g33J0qYim1/t0OHYykXTD3sb5GtCyHDyi08x/bPhc2n+cY3vOJJ/C5ct8a36rKX2yeX5Bnqb
	AIE9wyhjtlZ3YtZRUQcpQSL7JhzQlgaZGT6rJYGnhlB14KQ23BOBPNrNnlQiQ7r0rnR2dPeeGmF
	oIfryfBNxH+q7y6TGc4HrqSquxMMakLYmBMaDH2piF8Mso5zrC/ZedtvF2pisiK5xSP3YAefo15
	9V/oeFKQthf0luRw==
X-Received: by 2002:a05:620a:448b:b0:8cf:d68a:9aa2 with SMTP id af79cd13be357-8e6353855damr250663385a.6.1776346350918;
        Thu, 16 Apr 2026 06:32:30 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:8cf:d68a:9aa2 with SMTP id af79cd13be357-8e6353855damr250659385a.6.1776346350447;
        Thu, 16 Apr 2026 06:32:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d7899esm1201511a12.1.2026.04.16.06.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:32:28 -0700 (PDT)
Message-ID: <35e8f654-214d-4e8b-843f-87fa8cc1a782@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:32:25 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] remoteproc: qcom_q6v5_mss: Use mss as regulator for
 MSM8953
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
 <20260327-sdm632-rpmpd-v1-3-6098dc997d66@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-sdm632-rpmpd-v1-3-6098dc997d66@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D-OaFXRFj-C3WgomPHJ9UzQ3wWUviMAl
X-Proofpoint-ORIG-GUID: D-OaFXRFj-C3WgomPHJ9UzQ3wWUviMAl
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=69e0e4ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OuZLqq7tAAAA:8 a=_svnvpbr5Yy232N8lfMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyOSBTYWx0ZWRfX+eHheVKChE4G
 XQKYxnw8pCGtNRa5Y1QqG74bZSZhFyuKiPWSij7I4Z7iIsu5SJNzf3iBZWeAPuvLokMBHjy5xfv
 y8d5ss95x/hPrdm74ZKdPxxwmk0qJygx9P4fTGevwjXntp/zp+XPpCf2iQut2NS+mg8znAY5Zn7
 A3DFomCOR3aK5BZlQhHFyVdbktgKmBs4yPAP5NjP0zQMMMFd7Kab60YInBgZ+zuKCJU2MrdvPjA
 ofdrP+ol+pQGot6f+Tj0oEwLysw6iSnajFz936YW7E44pl8UiH123QbEDakuUmkmYO9/6I76T1D
 ylLqxCUSDDcOom7OzToP/PrmXTEnbOT45Chyfby1gdivKjR6TXjLYAphFkzW+1EfCw6h5RHWNbX
 UaSu52Q6nRl/F0BStXdyy8/6SINx03xMUwW69taF+7Dd9SO16OFssTWb7z0Qhh59rYhjxPAGyLq
 0EJx2CUpbudq/TXUarA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160129

On 3/27/26 9:11 PM, Barnabás Czémán wrote:
> MSM8953 MSS is using mss-supply as regulator what is usually pm8953_s1.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 4e9eb5bd11fa..86edd826ede8 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -2705,6 +2705,14 @@ static const struct rproc_hexagon_res msm8953_mss = {
>  		},
>  		{}
>  	},
> +	.active_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "mss",
> +			.uV = 1050000,
> +			.uA = 100000,

I don't know if it's a typo, but msm8953-regulator.dtsi on msm-3.18
suggests one more zero

Konrad
