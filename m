Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D732FFF89
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Aug 2026 07:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212072; cv=none; b=sKPganp1pir5X7YLMmFM79GoMjZKNTQWtiqsOjBREXiJE/vLAMuIdY1cMMb4HQlrfEMbl1nTKxtLdJL6G4oWYxmipN/YWXpdJgn2pue/uL0FEQdW3iX9Jtb2bpI9plWFe1C0PnxltrpUHviZZY8WDMnjQg+TkVC70ELqOp9rqYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212072; c=relaxed/simple;
	bh=dyoha8dpk++8RF2C9T4lFV6Pmg1VpR1S32nduflGSsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PC4PPdBSdhT+ZL+78s62x6+0gmsuf43ms7QHcUYL9rbaU8ziinHVNgFZCphu8kSUzPzxNYTsH9vCzyfHKvO8wmI9/3zb2NJ8vZVVJMcuLdks3XqKhQVHtGTuqM7ZHlCDJ5DEfqiFhLKWaMNY3rYIIzlis/XSzVKyNpeehkHRuqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRW1Xv8j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzhfC6R1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRW1Xv8j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzhfC6R1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6NHAB490435
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Aug 2026 07:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	//kT4S659YrxCLxrC89SElD2a6l456qXua0Jo1L5E2M=; b=nRW1Xv8jqppNtn/z
	0p+mTcDyP103xwzfRZtPJdozyRYtWQr4z8dUfJDVJRxWBuKv3D2uSV+ElmX1FEOG
	39xua+7a+Fz/gIjVaEg7eJooDo+vPQkJnDSv4K4PfK/gjjMdryoRYRDBWkX5QwGb
	Ph84XEVYMn23hdhIzLmKz3qNGkTPSRPJW6p37/UFmwdZQQ29x8x0dL+VSSHAu9Yc
	z3t9v+DZackWu+TONl3NAsFYQ8kfRRA78TvtQWw2OEzw2HJOlrjzRJKROWtjMA+R
	niwNVaBgNgH52l8wF1Wi1cMNhgx5feR3yI7OihPzsDn5V9OQDZnIXWcbSl2vLoHW
	pcZ89Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervku1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Aug 2026 07:47:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so252323485a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Aug 2026 00:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787212069; x=1787816869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//kT4S659YrxCLxrC89SElD2a6l456qXua0Jo1L5E2M=;
        b=TzhfC6R1XPtlajIqHLHrSpY8hAlhtG2akUOG75R/JuICv5QBN3Hs3VwGOlCRdufxEL
         MPo9BTQTBMEZWDBMV2VHuLo8MPeigJzz5d55xB/snUS730KlOMz1bFa6z7d+cx2HGNw5
         7iI6LKn87GWuJc7J2qSftzfLUmODTB7sDVTG7OpizBwNgSxrZhtyX3fLmHe6sEB/g9pY
         ynUj1xJloXUNq1BR+GcHThDw48jP/6py6XNDZ9CfZ99jHxdQ4YbdXHuHyc5kQ6sS0CZ+
         cpaDzsIUHf6Ief8PY65nOi3i/F2ZK7URpYsYyh63/sgWC+LJrgWgspv0P2arFeBTznI9
         itQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212069; x=1787816869;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//kT4S659YrxCLxrC89SElD2a6l456qXua0Jo1L5E2M=;
        b=cq78KDx1noEGg6Ic28HI+7RjtrC0aGnWM1enxry4p2kWCqzfXrI1734eMxTkRIdddx
         JcgS0yUkDtdbnNVdGNlzJtcTaFEnQ15JRsQgACJ2WMGNCCGbsDoiR5Q+87A+79ZsgFWO
         CBgIqtYKq9nBekBCCNVQKzLPHw7UFMFkr54jp7oT0pb819dwZNhxGaW9feh+7Gl7pu3V
         h7kSGkf0U+dC3SVT/SzEKLnUAd3I3TWorWCkGhaCSW2VKjUK7foqCWGLRg7wEIIQfsR5
         fuHdxJLg46K81T5lmU+0epEy0MX/oj003SkBdLQQ6SWeQCrECwDoqn6IPV7idrwqQtoT
         24sg==
X-Forwarded-Encrypted: i=1; AHgh+Rrsix/imnonGecf7c9ke8pI7DjFTHZB0L5NrQLw2cDh4Bd+1fUV4c/mDDyht/3q6bUoCN9OHxadeoDc7T7qaU8r@vger.kernel.org
X-Gm-Message-State: AOJu0YwqeBdr/9W5+anbq6yiWpfkkzEbEDYwD785GmJmokvZRl44aiHy
	upnuvPpZT2fzGXRlPTFLPeJprnHbnDonm40RDMZa5PSlt3FdoROld/XLD0yEeYmR2Pq36m6zVnU
	yinKC+u/BVrqkJkqMguU9e+Nkv8w6BF2R1YC1oAPjBgrBwUl6Kx2xejwfXhs/7cQqkcuwKafo
X-Gm-Gg: AR+sD11zz9b3pNe5XEMdqcIP1bnpN+5/k0OFvSHuxbUCbRrzNFwmAdzwRMP5EHLrJ3C
	XrhxKwatnlcRYHOlozuFryz/6a+dor5Lepv+jCoHFKpMmtz+2K3KSoU9r7ItyWG8K1th1GpXERy
	QuVUfdqzlHph0Pu2KUR+ewjwKDspTqOLIYiYnqW9nR6oVXtFeZqHiiQDDYk6Fr8iQXozZmF36RR
	nWaEiNgRoqE1Xs7nWAXsBy5D6cSz9iQoaZZelLjl9XdiZ+TD8GIr3kKdrmK7eRqAPDO+pUZlzAI
	ASFJQe28SmdfO7VycGLlFqyy72Vfc3ZizHYYg1jcU8TKYMxTxL4Y6GjB9sK2hr1TNKIXCrfhXw7
	o9sZxvOYsiG3c5ZvfXz9JyQIsLBfW
X-Received: by 2002:a05:620a:4415:b0:915:5cbd:1d96 with SMTP id af79cd13be357-9371e6ee08bmr938306285a.33.1787212069374;
        Thu, 20 Aug 2026 00:47:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4415:b0:915:5cbd:1d96 with SMTP id af79cd13be357-9371e6ee08bmr938304285a.33.1787212068889;
        Thu, 20 Aug 2026 00:47:48 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b212fc11sm20514795e9.1.2026.08.20.00.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 00:47:48 -0700 (PDT)
Message-ID: <edb61715-a676-402e-a269-613bede12639@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 09:47:44 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] Add support for Qualcomm remoteproc subsystem
 cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Casey Connolly
 <casey.connolly@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <9eb142ae-9f79-4f7f-91ae-6a49a7103dfd@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9eb142ae-9f79-4f7f-91ae-6a49a7103dfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bFzvPUHIcGlEGv3qJXrXPIvB3r6H1uXD
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86b126 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=dTLPQwhzsRM4EjPZVQoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1NSBTYWx0ZWRfXy81jS0VnwtJE
 V5ax5FWCFzsCHKroC9WmNoAxKQq5P8kTB1Ab5tJ6K8l+MsGHVlmnHx6COTE2sJfeZmdJf9AwHEM
 OfpVSZqQk4/KFLk8gN0Q3iscQ86cPhV6wDfGe4mk0Fl/6Y3jrVlCoqOKheJrY6IbzbReTCPjzOZ
 D5XEYLzi/4bosyPocpkt1ga/VVBxYNw29morpQFa846rNVAwkkwj0kLP+k4kmtqrATdxpObe6iU
 3xVYcS8R10tlFDBkD8vL2AX/crLOFHVt/sax15gg0JTQ1RTHjYbiJicoGJG/ovb/lcUpDpW2dc9
 hgcJcErjNy5HMYDbmu0/PuDyN5xe7bUjFTRR6VHWCk6Ru8ZFvtc1LcD0mwALaRPDpfOGwx7F/m7
 E1O/+kHoKAQxGWSOptapUw0yTcn8K+GZoyl8KBwbgRxefZ4bvll2h3tu61R1N6apcaXA4n2LRDO
 1WtQE0UzCgHtyNlxHOQ==
X-Proofpoint-ORIG-GUID: bFzvPUHIcGlEGv3qJXrXPIvB3r6H1uXD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1NSBTYWx0ZWRfX+3BVf536/+Xp
 8zHTVjGITGK5+kvwWmiwHxOKp3/f6A6rgnsJeinQsYimbgq4YjnG24vV+EuAcUT0WL8H9vwMBMA
 kp7GWRFrB1ZacQN4SuFRS3HwHCzmtFM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200055

On 20/08/2026 08:32, Gaurav Kohli wrote:
> Hi Bjorn, Mathieu,
> 
> Just wanted to kindly check if this series can be picked up.
> 
> Patch 1 has Krzysztof's Reviewed-by and Daniel's Acked-by, and the later
> patches carry the review tags received in previous versions.
> 
> Please let me know if you would prefer any changes or a resend.

What not to do during the merge window? Ping.


Best regards,
Krzysztof
